<?xml version="1.0" encoding="UTF-8"?>
<!--teiAppToCsv-->
<!--Extracts a table of substantive variant locations from a TEI encoded apparatus  -->

<!--TODO:
    - +: gérer witStart/witEnd, lacunaStart/lacunaEnd (en fait, pas vraiment nécessaire).
    - +: serait chic d'avoir un paramètre "negative-apparatus", defaults to false; [EDIT: pourquoi faire?]
    - +: Créer un template intermédiaire entre 'TEI' et 'app' pour éviter la redondance au niveau du template 'TEI' ;
-->

<!-- Racine de la feuille XSL ; deux espaces de nom sont déclarés et préfixés, xsl et tei-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs tei" version="2.0">
    
    <!-- Feuille XSL permettant de générer un tableau csv à partir d'un apparat encodé en TEI -->
    <!-- On commence par définir le mode de sortie comme fichier texte, et non pas XML ou HTML ; 
        on supprime la déclaration xml et l'indentation, qui n'ont rien à y faire-->
    <xsl:output method="text" encoding="UTF-8" indent="no" omit-xml-declaration="yes"/>
    
    <!-- First global parameter: what types (@type) of variant locations should  we retain (defaults to 'substantive')
    To retain all variants, use the empty string ''-->
    <xsl:param name="appTypes" as="xs:string+" select="''"/>
    
    <!-- Second global parameter: wether if we should display text or just the number of each variant (defaults to false) -->
    <!--<xsl:param name="withText" as="xs:boolean" select="false()"/>-->
    
    <!-- Third global parameter: should the resulting  csv file contain variant type as first column  -->
    <xsl:param name="printTypes" as="xs:boolean" select="false()"/>
    
    <!-- La feuille est constituée de trois templates, le premier pour chaque élément TEI 
        (c'est-à-dire une seule fois, sauf si l'on travaille avec des corpus),
        en appelle successivement deux-->
    <xsl:template match="tei:TEI">
        <xsl:variable name="filename" select="base-uri()"/>
        <!-- Le second, qui écrit la ligne d'entête à partir de la <listWit> -->
        <xsl:apply-templates select="/descendant::tei:listWit"/>
        <!-- Le troisième, qui traite les lieux variants proprement dits -->
        <!-- Ajout d'une boucle pour gérer la sélection des types de variantes -->
        <xsl:choose>
            <!-- Soit la chaîne est vide, et on retient tout -->
            <xsl:when test="$appTypes = ''">
                <xsl:apply-templates select="/descendant::tei:app"/>
            </xsl:when>
            <!-- Soit elle ne l'est pas, et on teste les différents types -->
            <xsl:otherwise>
                <!-- On crée une séquence à partir des types séparés par des virgules -->
                <!--<xsl:variable name="tokenizedTypes" select="tokenize($appTypes, ' ')"/>-->
                <xsl:apply-templates select="/descendant::tei:app[@type = $appTypes]"/>
            </xsl:otherwise>
        </xsl:choose>
        <!-- For testing purposes -->
        <!--<xsl:result-document href="{$filename}-varText.csv">
            <!-\- Le second, qui écrit la ligne d'entête à partir de la <listWit> (N.B.: on utilise // car on ne sait pas où sera la listWit (dans le front ou dans le sourceDesc?) -\->
            <xsl:apply-templates select="/descendant::tei:listWit"/>
            <!-\- Le troisième, qui traite les lieux variants proprement dits -\->
            <xsl:choose>
                <!-\- Soit la chaîne est vide, et on retient tout -\->
                <xsl:when test="$appTypes = '' ">
                    <xsl:apply-templates select="/descendant::tei:app"/>
                </xsl:when>
                <!-\- Soit elle ne l'est pas, et on teste les différents types -\->
                <xsl:otherwise>
                    <!-\- On crée une séquence à partir des types séparés par des virgules               -\->
                    <xsl:variable name="tokenizedTypes" select="tokenize($appTypes, ' ')"/>
                    <xsl:apply-templates select="/descendant::tei:app[@type = $tokenizedTypes]">
                        <xsl:with-param name="withText" select="true()"/>
                    </xsl:apply-templates>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:result-document>-->
    </xsl:template>
    
    <xsl:template match="tei:listWit">
        <!-- On commence par construire la première ligne du tableau, 
            avec les étiquettes des colonnes (les sigles des mss) que l'on récupère
            dans le xml:id de chaque witness du listWit -->
        <!-- Le premier point virgule qui marque le début de la ligne d'entête (première colonne vide) -->
        <xsl:text>;</xsl:text>
        <xsl:if test="$printTypes">
            <xsl:text>VariantType;</xsl:text>
        </xsl:if>
        <xsl:for-each select="tei:witness">
            <xsl:value-of select="@xml:id"/>
            <xsl:if test="position() != last()">
                <xsl:text>;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <!-- Et on termine par un retour à la ligne -->
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:app">
        <xsl:param name="withText" as="xs:boolean" select="false()"/>
        <!-- Création du numéro de la variante: soit les app ont des xml:id et on les reprend comme identifiant,
            soit on crée l'identifiant à la volée (numéro d'ordre avec xsl:number) -->
        <xsl:choose>
            <xsl:when test="@xml:id">
                <xsl:value-of select="@xml:id"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- Sinon, on utilise xsl:number, pour créer un identifiant de la variante (car il n'y en a pas dans la source)
        mais cette fois-ci sans spécifier de count (c'est la valeur par défaut de count qui s'applique: 
        on compte combien d'élément du même nom précèdent dans le document, 
        ce qui équivaut à un numéro d'ordre à l'échelle du document -->
                <xsl:number level="any"/>
            </xsl:otherwise>
        </xsl:choose>
        <!-- On sépare par un point virgule -->
        <xsl:text>;</xsl:text>
        <!-- On teste si on veut le type des variantes -->
        <xsl:if test="$printTypes">
            <xsl:value-of select="@type"/>
            <xsl:text>;</xsl:text>
        </xsl:if>
        <!-- On stocke l'élément courant (app) dans une variable, dont on aura besoin lorsque l'on bouclera sur les witness -->
        <xsl:variable name="app" select="."/>
        <!-- On boucle sur les witnesses-->
        <xsl:for-each select="ancestor::tei:TEI/descendant::tei:listWit/tei:witness">
            <!-- On créee une variable qui correspond à la réf. que l'on va chercher dans l'attribut @wit-->
            <xsl:variable name="wit" select="concat('#', @xml:id)"/>
            <!-- Pour éviter de fausses correspondances, j'ai besoin de tester si le sigle est suivi 
                d'une espace ou est à la fin de la chaîne.
                J'écris une expression régulière de la forme (<monSigle>\s|<monSigle>$), par ex. (#A\s|#A$)
                N.B.: je pourrais aussi utiliser (comme plus haut) tokenize: 
                $wit = tokenize(@wit, '') 
            -->
            <xsl:variable name="witRegex" select="concat('(', $wit, '\s|', $wit, '$)')"/>
            <xsl:choose>
                <!-- contains pose problème quand il y a bcp de manuscrits et des sigles exotiques, du type A et An ou M et Mod, etc.
                    Du coup, on a besoin d'expressions régulières
                -->
                <!-- Une difficulté: gérer les correspondances exactes entre sigles.
                    En XSLT 2.0, soit on tokenize, soit on utilise des regexp
                    Pourrait être possible de le faire en XSLT 1.0 sans expressions régulières,
                    en singeant tokenize avec un template récursif:
                    cf. http://stackoverflow.com/questions/17936957/iterate-over-the-elements-of-whitespace-separated-list
                -->
                <!-- Soit il n'y a aucune correspondance               -->
                <xsl:when test="count($app//*[matches(@wit, $witRegex)]) = 0">
                    <!-- Test qui prend désormais en compte également les niveaux inférieurs de l'app-->
                    <xsl:text>NA</xsl:text>
                </xsl:when>
                <!-- Soit il y en a une, let's go  -->
                <xsl:otherwise>
                    <!-- On boucle sur tous les sous éléments d'un app.-->
                    <xsl:for-each select="$app/*">
                        <!-- on pourrait dire lem/rdg/rdgGrp -->
                        <xsl:variable name="position" select="position()"/>
                        <!-- Celle-ci est nécessaire par contre -->
                        <!-- On définit une variable position, qui correspond à la position de la variante ou du groupe de variantes dans l'app-->
                        <!-- On commence par s'assurer que la variante en question concerne notre manuscrit (i.e. que son sigle apparaît à notre niveau ou à un niveau inférieur)-->
                        <xsl:if test="descendant-or-self::element()/@wit[matches(., $witRegex)]">
                            <xsl:choose>
                                <xsl:when test="@type = 'lacuna'">
                                    <!-- 2e test, on s'assure qu'il ne s'agit pas d'une lacune.
                                            Coder en dur les lacunes avec des rdg @type='lacuna' n'est ni économique, ni une bonne pratique, mais on peut envisager que certains le fassent…
                                            -->
                                    <xsl:text>NA</xsl:text>
                                </xsl:when>
                                <xsl:when test="@type = 'omission' or not(normalize-space(.))">
                                    <!-- 3e test, on s'assure qu'il ne s'agit pas d'une omission: élément vide, éventuellement un @type='omission'-->
                                    <!-- normalize-space() est nécessaire pour éviter que des nœuds constitués d'une série de retours à la ligne, espaces, tabulations… ne soient comptés comme des nœuds de texte -->
                                    <!-- Pour le cours, peut-être s'arrêter à not(normalize-space(.)) , pour la feuille elle-même, 
                                            not(node()[not(self::comment())])
                                            -->
                                    <!-- Tester si un élément est vide (d'après Michael Kay)
                                                Michael Kay
                                                Contains no child nodes: not(node())
                                                Contains no text content: not(string(.))
                                                Contains no text other than whitespace: not(normalize-space(.))
                                                Contains nothing except comments: not(node()[not(self::comment())])
                                            -->
                                    <xsl:text>0</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <!-- Si ce n'est ni l'un, ni l'autre, on affiche la position dans le <app> (correspond à la variante) -->
                                    <xsl:value-of select="$position"/>
                                    <xsl:if test="$withText">
                                        <xsl:text>(</xsl:text>
                                        <xsl:value-of
                                            select="normalize-space(translate(., ';', ' '))"/>
                                        <!-- Version plus complexe, peut-être pas à intégrer à la version du cours -->
                                        <!--<xsl:for-each select="text()| .//tei:rdg |.//tei:lem">
                                                <xsl:value-of select="normalize-space(translate(.,';',' '))"/>
                                                <xsl:if test="position() != last()"><xsl:text> </xsl:text></xsl:if>-->
                                        <!-- Si ce nœud descendant à un attribut @wit, on l'imprime -->
                                        <!--<xsl:if test="@wit"><xsl:value-of select="translate(@wit,'#; ','')"></xsl:value-of><xsl:text> </xsl:text></xsl:if>
                                            </xsl:for-each>-->
                                        <!-- Fin de cette version plus complexe -->
                                        <xsl:text>)</xsl:text>
                                    </xsl:if>
                                </xsl:otherwise>
                            </xsl:choose>
                            <!-- Traitements supplémentaires pour toutes les variantes-->
                            <!-- Gestion de la virgule si le $wit apparait encore dans des noeuds suivants (cas de plusieurs mains) -->
                            <xsl:if
                                test="count($app/*[position() > $position and .//@wit[matches(., $witRegex)]])">
                                <!--test="count($app/*[position()>$position and matches(@wit,$witRegex) or position()>$position and */@wit[matches(.,$witRegex)]])">-->
                                <!-- test="count($app/*[position()>$position and matches(@wit,$witRegex) or position()>$position and matches(*//@wit,$witRegex)])">-->
                                <xsl:text>,</xsl:text>
                            </xsl:if>
                        </xsl:if>
                        <!-- fin du "if ça concerne notre manuscrit"-->
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>
            <!-- fin du xsl:choose "le lieu variant concerne-t-il notre ms ?."-->
            <xsl:if test="position() != last()">
                <xsl:text>;</xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>
</xsl:stylesheet>
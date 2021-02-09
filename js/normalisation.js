(function ($) {
      $.each(['show', 'hide'], function (i, ev) {
        var el = $.fn[ev];
        $.fn[ev] = function () {
          this.trigger(ev);
          return el.apply(this, arguments);
        };
      });
    })(jQuery);


$(document).ready(function() {

    template = `
    <div class="note" id="note-">
        <header>
            [<span class="note-id"></span>]<button type="button" data-target="#" class="close pull-right" aria-label="Close"><span aria-hidden="true">&times;</span></button>     
        </header>
        <section></section>
    </div>
    `
    $('#note-container').affix({
      offset: {
        bottom: 50
      }
    });

    $("#note-container").on("click", "button", function(event) {
        event.preventDefault();
        var target = $(this).attr("data-target");
        $(target).remove();
    });

    $("[data-toggle='note']").on("click", function(event) {
        var that = $(this),
            contenu = that.find('.app').html(),
            note_id = this.innerText.replace("[", "").replace("]", "");

        if ($("#note-"+note_id).length == 0) {
            var new_elem = $(template);

            new_elem.attr("id", "note-"+note_id);
            new_elem.find(".note-id").text(note_id);
            new_elem.find("section").html(contenu);
            new_elem.find("button").attr("data-target", "#note-"+note_id)

            $("#note-container").append(new_elem);   
        }
    });

	$("ol, span, h1").removeClass("norm");
	
	$("#fac").on("click", function() {
		that = $(this);
			$("ol, span, h1").removeClass("norm");
			$(".orig , .abbr" ).show();
			$(".reg , .expan").hide();
			$("br").show();
		$(".btn-success").addClass("btn-default").removeClass("btn-success");
		that.addClass("btn-success").removeClass("btn-default");

	});
	

	$("#reg").on("click", function() {
		that = $(this);
			$("ol, span, h1").addClass("norm");
			$(".orig , .abbr").hide();
			$(".reg , .expan").show();
			$("br").hide();
			//$(".metamark").removeClass("information-hr");
			//that.removeClass("information-hr");
		$(".btn-success").addClass("btn-default").removeClass("btn-success");
		that.addClass("btn-success").removeClass("btn-default");
	});

	$("#seeWitness").on("click", function() {
		that = $(this);
		$("#seeWitness li").toggleClass("wit");
	});

	


	$("sup a, .information-hr").tooltip();

	$(".orig , .abbr , .reg , .expan").on("show", function(e) {
		if($(this).is("span")) {
			//$(this).css("display", "inline-block");//
		}
 	});

 	//change le contenu du modal (vide fin html) à son affichage
 	// Pour l'element #app, quand l'evenement show.bs.modal est activé (evenement mis en route par bootstrap quand on veut afficher le modal)
	$('#app').on('show.bs.modal', function (event) {
		// Je recupere la source de l'evenement, aka le lien
		var a = $(event.relatedTarget);
		// Dans le lien, je recupere le noeud DOM .app dont je recupere le contenu html
		var a_apparatus_contenu = a.find('.app').html();
		// Je recupere le noeud representant le modal
		var modal = $(this)
		// Dans le noeud modal, je trouve l'element a classe .modal-body dont je change le contenu html avec le contenu precedemment recupere
		modal.find('.modal-body').html(a_apparatus_contenu);
	});
});



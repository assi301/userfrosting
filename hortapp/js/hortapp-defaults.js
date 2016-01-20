$(window).load(function(){
	//set default options




	//modify dataTables language
	$.extend( $.fn.dataTable.defaults, {
		language : {
			"sProcessing":   "Processant...",
			"sLengthMenu":   "Mostra _MENU_ registres",
			"sZeroRecords":  "No s'han trobat registres.",
			"sInfo":         "Mostrant de _START_ a _END_ de _TOTAL_ registres",
			"sInfoEmpty":    "Mostrant de 0 a 0 de 0 registres",
			"sInfoFiltered": "(filtrat de _MAX_ total registres)",
			"sInfoPostFix":  "",
			"sSearch":       "Filtrar:",
			"sUrl":          "",
			"oPaginate": {
				"sFirst":    "Primer",
				"sPrevious": "Anterior",
				"sNext":     "Següent",
				"sLast":     "Últim"
			}
		},
		"sPaginationType" : "simple_numbers"
	});

	$.fn.datepicker.defaults.format = "dd/mm/yyyy";
	$.fn.datepicker.defaults.language = "ca";
	$.fn.datepicker.defaults.todayBtn = "linked";
	$.fn.datepicker.defaults.todayHighlight = true;
	$.fn.datepicker.defaults.clearBtn = true;
	$.fn.datepicker.defaults.autoclose = true;
	$.fn.datepicker.defaults.orientation = "bottom";








	jQuery.extend(jQuery.validator.messages, {
	    required: "Aquest camp és obligatori",
	    remote: "Please fix this field",
	    email: "Introduix una adreça de correu electrònic vàlida",
	    url: "Please enter a valid URL",
	    date: "La data ha de ser del format mm/dd/aa",
	    dateISO: "Introduïx una data vàlida(ISO)",
	    number: "Deu ser un número",
	    digits: "Deu ser un número",
	    creditcard: "Please enter a valid credit card number",
	    equalTo: "Els valors no són iguals",
	    accept: "Please enter a value with a valid extension",
	    maxlength: jQuery.validator.format("Màxim {0} caràcters"),
	    minlength: jQuery.validator.format("Mínim {0} caràcters"),
	    rangelength: jQuery.validator.format("Deu estar entre {0} i {1} caràcters"),
	    range: jQuery.validator.format("Deu estar entre {0} i {1}"),
	    max: jQuery.validator.format("Deu ser menor o igual que {0}"),
	    min: jQuery.validator.format("Deu ser major o igual que {0}"),
	    maxwords: jQuery.validator.format("Màxim {0} paraules"),
	    minwords: jQuery.validator.format("Mínim {0} paraules"),
	    rangewords: jQuery.validator.format("Mínim {0} i màxim {1} paraules"),
	    alphanumeric: "Només lletres i números perfavor",
	    lettersonly: "Només lletres perfavor",
	    letterswithbasicpunc: "Només lletres i els símbols . , ( ) ' " ,
	    nowhitespace: "Sense espais en blanc perfavor"
	});
	// TO-DO. override additional methods to allow accents, dièresi, eles geminades

		// jQuery.validator.addMethod("letterswithbasicpunc", function(value, element) {
		//     return this.optional(element) || /^[a-z\-.,()'"\s]+$/i.test(value);
		// }, "Letters or punctuation only please");

		// jQuery.validator.addMethod("alphanumeric", function(value, element) {
		//     return this.optional(element) || /^\w+$/i.test(value);
		// }, "Letters, numbers, and underscores only please");

		// jQuery.validator.addMethod("lettersonly", function(value, element) {
		//     return this.optional(element) || /^[a-z]+$/i.test(value);
		// }, "Letters only please");

		// jQuery.validator.addMethod("nowhitespace", function(value, element) {
		//     return this.optional(element) || /^\S+$/i.test(value);
		// }, "No white space please");

});
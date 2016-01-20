//$(document).ready(function(){//USER & SESSION
/*formLoginValidator = $(form).validate({
	debug: true,
	rules: {
		login: {
			required: true,
			minlength: 2
		},
		password: {
			required: true,
			email: true
		}
	},
	messages : {
		login: {
			required: "Tu nombre!",
			minlength: "El de verdad..."
		},
		password: {
			email: "Correo????"
		}
	}
};		

*/
function setRulesEvent(form){
	$(form).validate({
		rules:{

			parcela:{
				required: true,
				digits: true
			},
			titol:{
				required: true,
				alphanumeric: true
			},
			data:{
				required: true,

			},
			detalls:{
				letterswithbasicpunc: true,
				maxlength: 2000
			},
			realitzada:{
				// required: true
			},
		},
		messages :{}


	});
}

function setRulesCultiu(form){
	$(form).validate({
		rules:{
			planta:{
				required: true,
				digits: true
			},
			data_ini:{
				required: true
			},
			parcela:{
				required: true,
				alphanumeric: true
			}
		}
		/*,
		messages:{
			planta:{

			},
			data_ini:{

			},
			parcela:{

			}
		}*/
	});
}

function setRulesBancal(form){

	$(form).validate({
		rules: {
			nom:{
				required: true,
				alphanumeric: true,
				rangelength: [2,30]
			},
			superficie:{
				required: true,
				digits: true,
				range: [1,100000]
				
			},
			ubicacio:{
				required: true,
				alphanumeric: true

			},
			detalls:{
				letterswithbasicpunc: true,
				maxlength: 2000
			}
		},
		messages : {
			nom:{
			},
			superficie:{
				required: "El camp es obligatori",
				digits: "Indica la superficie en m2 (sense decimals)"
			},
			ubicacio:{
			}
		},
		submitHandler : function(){
			alert ("submit Handler de formBancal.validate()");
		}

	});//fin validate
}

function setRulesParcela(form){
	$(form).validate({
		rules: {
			nom:{
				required: true,
				alphanumeric: true,
				rangelength: [1,20]
			},
			bancal:{
				required: true,
				digits: true
			},
			superficie:{
				required: true,
				digits: true
				//falta range: [1,supLliureBancal] //afegida dinàmicament al carregar el formulari
			},
			detalls:{
				letterswithbasicpunc: true,
				maxlength: 2000
			}
		},
		messages : {
			nom:{
				
			},
			superficie:{
				
			},
			detalls: {

			}
			
		},
		submitHandler : function(){
			alert ("submit Handler de formParcela.validate()");
		}
	});//fin validate
}

function setRulesPlanta(form){
	$(form).validate({
		rules: {
			nom_comu:{
				required: true,
				lettersonly: true,
				rangelength: [2,30]
			},
			nom_cientific:{
				lettersonly: true,
				rangelength: [4,40]
			},
			grup:{
				digits: true,
				range: [1,4]
			},
			familia:{
				digits: true
			},
			sembra_ini:{
				date: true
			},
			sembra_fi:{
				date: true
			},
			marc_llarg:{
				digits: true,
				range: [10,300]
			},
			marc_ample:{
				digits: true,
				range: [1,300]
			},
			produccio:{
				number: true
			},
			cultiu:{
				letterswithbasicpunc: true,
				maxlength: 2000
			}

		},
		messages: {
			nom_comu:{
			},
			nom_cientific:{

			},
			grup:{

			},
			familia:{
			},
			sembra_ini:{
			},
			sembra_fi:{
			},
			marc_llarg:{
			},
			marc_ample:{
			},
			cultiu:{
			}

		}
	});
}

function setRulesTascaPlanta(form){
	$(form).validate({
		rules:{
			id_planta:{
				required: true,
				digits: true
			},
			nom:{
				required: true,
				alphanumeric: true,
				rangelength: [1,100]
			},
			dies:{
				required: true,
				digits: true,
				range: [1,1000]
			},
			detalls:{
				letterswithbasicpunc: true,
				maxlength: 2000				
			}
		}
	});
}

function setRulesfamilia(form){
	$(form).validate({
		rules:{
			nom:{
				required: true,
				lettersonly: true,
			},
			noms_varios:{
				letterswithbasicpunc: true,
				rangelength: [1,100]
			},
			detalls:{
				letterswithbasicpunc: true,
				maxlength: 2000
			}
		}
	});
}

function setRulesGrup(form){
	$(form).validate({
		rules:{
			nom:{
				required: true,
				lettersonly: true,
			},
			noms_varios:{
				letterswithbasicpunc: true,
				rangelength: [1,100]
			},
			detalls:{
				letterswithbasicpunc: true,
				maxlength: 2000
			}
		}
	});
}

function setRulesPlaga(form){
	$(form).validate({
		rules:{
			nom_comu: {
				required: true,
				lettersonly: true,
				rangelength: [2,30]
			},
			nom_cientific: {
				lettersonly: true,
				rangelength: [4,40]
			},
			descripcio: {
				letterswithbasicpunc: true,
				maxlength: 2000
			},
			tractament: {
				letterswithbasicpunc: true,
				maxlength: 2000
			}
		},
		messages: {
			nom_comu: {

			},
			nom_cientific: {

			},
			descripcio: {

			},
			tractament: {

			}
		}
	});
}

function setRulesRemei(form){
	$(form).validate({
		rules:{
			nom: {
				required: true,
				lettersonly: true,
				rangelength: [2,30]
			},
			descripcio: {
				letterswithbasicpunc: true,
				maxlength: 2000
			},
			preparacio: {
				letterswithbasicpunc: true,
				maxlength: 2000
			}
		},
		messages: {
			nom: {

			},
			descripcio: {

			},
			preparacio: {

			}
		}
	});
}

function setRulesTascaRemei(form){
	$(form).validate({
		rules:{
			id_remei:{
				required: true,
				digits: true
			},
			nom:{
				required: true,
				alphanumeric: true,
				rangelength: [1,100]
			},
			dies:{
				required: true,
				digits: true,
				range: [1,1000]
			},
			detalls:{
				letterswithbasicpunc: true,
				maxlength: 2000				
			}
		}
	});
}

function setRulesTascaFixa(form){
	$(form).validate({
		rules:{
			mes: {
				required: true,
				digits: true,
				rangelength: [1,12]
			},
			nom: {
				required: true,
				alphanumeric: true,
				rangelength: [1,200]
			},
			descripcio: {
				required: true,
				letterswithbasicpunc: true,
				maxlength: 4000
			}

		}
	});
}



//});//fin document.ready
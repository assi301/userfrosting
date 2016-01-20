/*hortapp.js is the javascrpit part of hortapp application. manages users requests, navigation, data storage, forms...*/

/**
*
* GLOBALS DECLARATION
*
**/

	var tplh; //html templates. {'index.php' -> "<html content>" , register.php -> "<html content>"}
	var tplForms; //html forms. {'index.php' -> "<html content>" , register.php -> "<html content>"}
	var entities; //user objects, like plantes, bancas, events...
	var rootURL = "http://localhost/hortapp/"; //contains web adress: http://hortapp.org,



$(document).ready(function() {

/** 
*
* USER (login, logout, register...) 
*
**/
	//done by anonymous user

		anonAccess();
		

		/* user access (login) */
			$("#loginForm").ajaxForm({
				beforeSubmit: validateLogin,
				dataType: 	'json',
				success: 	login
			});

			

		/* user register*/


	//done by autenticated user

		/* user exit (logout) */
			$("#logoutForm").ajaxForm({
				dataType: 	'json',
				success: 	logout,
			});

			

		/* edit user */

		/* remove user */

		/* remember password */


/**
*
* FORMS (creation, filling, validation and submitting)
*
**/

	$("body").on('click',"[applink-form]",function(e){
		e.preventDefault();
		//remove previous dynamic modals
		$(".applink-modal").remove();
		

		//add gif loading...
		//TO-DO

		/**
		* form 
		-arreglar composador de noms
		- problema etiquetes d'error en camps amb glyphicon-addon
		- set sizes for all forms in formXXX.php, edit js code to load modal size from form applink-form-size attribute

		** formBancal
			- OK

		** formParcela
			afegir una regla per a editar i crear que limite el màxim tamany de parcel-la, des de 1m2

		** formPlantaPlaga
			-

		** formTascaPlanta
			-

		** formCultiu
			calcular cuantes plantes caben

		** formPlaga
			-

		** formRegister
			-

		** formTascaRemei
			-

		** formDrop
			-

		** formPlagaPlanta
			-

		** formRemei
			-

		** formEvent
			-

		** formPlagaRemei
			-

		** formRemeiPlaga
			-

		** formImg
			-

		** formPlanta
			-

		** formTascaFixa
			-




		*/


		//capture variables
		var type = $(this).attr("applink-form-type");
		var id = $(this).attr("applink-form-id");
		var action = $(this).attr("applink-form-action");
		var parentId = $(this).attr("applink-form-parentId");

		
		//make modal
		var auxTpl = $(this).attr("applink-form-size");
		switch (auxTpl) {
			case 'sm':
				auxTpl = tplh.tplModalSmall;
				break;

			case 'md':
				auxTpl = tplh.tplModalMedium;
				break;

			case 'lg':
				auxTpl = tplh.tplModalLarge;
				break;

			default:
				auxTpl = tplh.tplModalMedium;
				break;

		}


		var tplModal = $("<div/>").html(auxTpl).contents();


		$(".modal-body",tplModal).html(tplForms[type]);
		$(".modal-title",tplModal).html(action + " " + type );
		


		switch (action) {
			case 'create':
				switch(type){

					case 'formBancal':
						//nothing
						form = $(".formBancal",tplModal);
						setRulesBancal(form);
						break;

					case 'formParcela':
						$("input[name='bancal']",tplModal).val(parentId);
						form = $(".formParcela",tplModal);
						setRulesParcela(form);
						break;

					case 'formPlanta':
						form = $(".formPlanta",tplModal);
						setRulesPlanta(form);

						$("div.grup-select",tplModal).append(desplegable('grup'));
						$("div.familia-select",tplModal).append(desplegable('familia'));

						//data ini and fi
						$(".input-group.date",tplModal).datepicker({
							format: "dd / MM"
						});
						break;

					case 'formPlagaPlanta':
						form = $(".formPlagaPlanta",tplModal);
						//setRulesPlagaPlanta(form);

						$("div.plaga-select",tplModal).append(desplegable('plaga'));
						$("input[name='planta']",tplModal).val(parentId);
						break;

					case 'formTascaPlanta':
						form = $(".formTascaPlanta",tplModal);
						//setRulesTascaPlanta(form);

						$("input[name='planta']",tplModal).val(parentId);
						break;

					case 'formImgPlanta':
						form = $(".formImgPlanta",tplModal);
						//setRulesImgPlanta(form);

						$("input[name='planta']",tplModal).val(parentId);
						break;

					case 'formPlaga':
						form = $(".formPlaga",tplModal);
						//setRulesPlaga(form);


						break;

					case 'formPlantaPlaga':
						form = $(".formPlantaPlaga",tplModal);
						//setRulesPlantaPlaga(form);

						$("input[name='plaga']",tplModal).val(parentId);
						$("div.planta-select",tplModal).append(desplegable('planta'));
						break;

					case 'formRemeiPlaga':
						form = $(".formRemeiPlaga",tplModal);
						//setRulesRemeiPlaga(form);

						$("input[name='plaga']",tplModal).val(parentId);
						$("div.remei-select",tplModal).append(desplegable('remei'));

						break;

					case 'formImgPlaga':
						form = $(".formImgPlaga",tplModal);
						//setRulesImgPlaga(form);

						$("input[name='plaga']",tplModal).val(parentId);

						break;

					case 'formRemei':
						form = $(".formRemei",tplModal);
						//setRulesRemei(form);


						break;

					case 'formPlagaRemei':
						form = $(".formPlagaRemei",tplModal);
						//setRulesPlagaRemei(form);

						$("input[name='remei']",tplModal).val(parentId);
						$("div.plaga-select",tplModal).append(desplegable('plaga'));
						break;

					case 'formTascaRemei':
						form = $(".formTascaRemei",tplModal);
						//setRulesTascaRemei(form);

						$("input[name='remei']",tplModal).val(parentId);
						break;

					case 'formCultiu':
						form = $(".formCultiu",tplModal);
						//setRulesCultiu(form);

						$("input[name='parcela']",tplModal).val(parentId);
						$("div.planta-select",tplModal).append(desplegable('planta'));
						/**datepicker**/
						$(".input-group.date:first",tplModal).datepicker("update",new Date());

						break;

					case 'formEvent':
						form = $(".formEvent",tplModal);
						//setRulesEvent(form);

						$("div.parcela-select",tplModal).append(desplegable('parcela'));
						$(".input-group.date",tplModal).datepicker();
						break;

					case 'formTascaFixa':
						form = $(".formTascaFixa",tplModal);
						//setRulesTascaFixa(form);

						$("div.mes-select",tplModal).append(desplegable('mes'));
						break;

					default:
						//error
						break;
				}
				break; //end case create

			case 'edit':
				switch(type){

					case 'formBancal':
						var bancal = entities.bancal[id];
						$("input[name='id']",tplModal).val(id);
						$("input[name='nom']",tplModal).val(bancal.nom);
						$("input[name='superficie']",tplModal).val(bancal.superficie);
						$("textarea[name='detalls']",tplModal).val(bancal.detalls);						
						break;

					case 'formParcela':
						var parcela = entities.parcela[id];
						$("input[name='id']",tplModal).val(id);
						$("input[name='bancal']",tplModal).val(parcela.bancal); //parcela.bancal == parentId
						$("input[name='nom']",tplModal).val(parcela.nom);
						$("input[name='superficie']",tplModal).val(parcela.superficie);
						$("textarea[name='detalls']",tplModal).val(parcela.detalls);
						break;

					case 'formPlanta':
						var planta = entities.planta[id];
						$("input[name='id']",tplModal).val(id);
						$("input[name='nom_comu']",tplModal).val(planta.nom_comu);
						$("input[name='nom_cientific']",tplModal).val(planta.nom_cientific);

						//grup and familia
						$("div.grup-select",tplModal).append(desplegable('grup'));
						$("select[name='grup'] option[value='" + planta.grup + "']",tplModal).attr('selected',true);
						$("div.familia-select",tplModal).append(desplegable('familia'));
						$("select[name='familia'] option[value='" + planta.familia + "']",tplModal).attr('selected',true);

						//data ini and fi
						/**datepicker**/
						/**datepicker**/


						$("input[name='marc_ample']",tplModal).val(planta.marc_ample);
						$("input[name='marc_llarg']",tplModal).val(planta.marc_llarg);
						$("textarea[name='sembra']",tplModal).val(planta.sembra);
						$("textarea[name='cultiu']",tplModal).val(planta.cultiu);
						$("textarea[name='collita']",tplModal).val(planta.collita);
						break;

					case 'formPlagaPlanta':
						var plagaPlanta = entities.planta[parentId].plagues[id];
						$("input[name='planta']",tplModal).val(parentId);

						//plaga
						$("div.plaga-select",tplModal).append(desplegable('plaga'));
						$("select[name='plaga'] option[value='" + id + "']",tplModal).attr('selected',true);

						$("textarea[name='detalls']",tplModal).val(plagaPlanta);

						break;

					case 'formTascaPlanta':
						var tascaPlanta = entities.planta[parentId].tasques[id];
						$("input[name='id']",tplModal).val(id);
						$("input[name='planta']",tplModal).val(parentId);
						$("input[name='nom']",tplModal).val(tascaPlanta.nom);
						$("input[name='dies']",tplModal).val(tascaPlanta.dies);
						$("textarea[name='descripcio']",tplModal).val(tascaPlanta.descripcio);

						break;

					case 'formImgPlanta':

						break;

					case 'formPlaga':
						var plaga = entities.plaga[id];
						$("input[name='id']",tplModal).val(id);
						$("input[name='nom_comu']",tplModal).val(plaga.nom_comu);
						$("input[name='nom_cientific']",tplModal).val(plaga.nom_cientific);
						$("textarea[name='descripcio']",tplModal).val(plaga.descripcio);
						$("textarea[name='tractament']",tplModal).val(plaga.tractament);
						break;

					case 'formPlantaPlaga':
						var plantaPlaga = entities.plaga[parentId].plantes[id];
						$("input[name='plaga']",tplModal).val(parentId);

						//planta
						$("div.planta-select",tplModal).append(desplegable('planta'));
						$("select[name='planta'] option[value='" + id + "']",tplModal).attr('selected',true);

						$("textarea[name='detalls']",tplModal).val(plantaPlaga);
						break;

					case 'formRemeiPlaga':
						var remeiPlaga = entities.plaga[parentId].remeis[id];
						$("input[name='plaga']",tplModal).val(parentId);

						//remei
						$("div.remei-select",tplModal).append(desplegable('remei'));
						$("select[name='remei'] option[value='" + id + "']",tplModal).attr('selected',true);

						$("textarea[name='detalls']",tplModal).val(remeiPlaga);

						break;

					case 'formImgPlaga':

						break;

					case 'formRemei':
						var remei = entities.remei[id];
						$("input[name='id']",tplModal).val(id);
						$("input[name='nom']",tplModal).val(remei.nom);
						$("textarea[name='descripcio']",tplModal).val(remei.descripcio);
						$("textarea[name='preparacio']",tplModal).val(remei.preparacio);
						break;

					case 'formPlagaRemei':
						var plagaRemei = entities.remei[parentId].plagues[id];
						$("input[name='remei']",tplModal).val(parentId);

						//plaga
						$("div.plaga-select",tplModal).append(desplegable('plaga'));
						$("select[name='plaga'] option[value='" + id + "']",tplModal).attr('selected',true);

						$("textarea[name='detalls']",tplModal).val(plagaRemei);

						break;

					case 'formTascaRemei':
						var tascaRemei = entities.remei[parentId].tasques[id];
						$("input[name='id']",tplModal).val(id);
						$("input[name='remei']",tplModal).val(parentId);
						$("input[name='nom']",tplModal).val(tascaRemei.nom);
						$("input[name='dies']",tplModal).val(tascaRemei.dies);
						$("textarea[name='descripcio']",tplModal).val(tascaRemei.descripcio);						
						break;

					case 'formCultiu':
						var cultiu = entities.cultiu[id];
						$("input[name='id']",tplModal).val(id);
						$("input[name='parcela']",tplModal).val(cultiu.parcela);
						
						//planta
						$("div.planta-select",tplModal).append(desplegable('planta'));
						$("select[name='planta'] option[value='" + cultiu.planta + "']",tplModal).attr('selected',true);

						$("input[name='parcela']",tplModal).val(cultiu.parcela);
						
						/**datepicker**/
						//$(".input-group.date",tplModal).datepicker();
						//$(".input-group.date",tplModal).datepicker("update",new Date());

						$("input[name='data_ini']",tplModal).datepicker("update",fromLocalToIso(cultiu.data_ini));
						$("input[name='data_fi']",tplModal).datepicker("update",fromLocalToIso(cultiu.data_fi));
						$("input[name='data_fi']",tplModal).removeAttr("disabled");
						break;

					case 'formEvent':
						var event = entities.event[id];
						$("input[name='id']",tplModal).val(id);
						$("div.parcela-select",tplModal).append(desplegable('parcela'));
						$("select[name='parcela'] option[value='" + event.parcela + "']",tplModal).attr('selected',true);
						$("select[name='parcela']",tplModal).prop('disabled','disabled');
						$("input[name='title']",tplModal).val(event.title);
						/**datepicker**/
						$(".input-group.date",tplModal).datepicker();

						$("textarea[name='detalls']",tplModal).val(event.detalls);
						if (event.realitzada == 1)
							$("input[name='realitzada']",tplModal).prop("checked", true);
						break;

					case 'formTascaFixa':
						var tascaFixa = entities.tasca_fixa[id];
						$("input[name='id']",tplModal).val(id);
						$("input[name='nom']",tplModal).val(tascaFixa.nom);
						
						//mes
						$("div.mes-select",tplModal).append(desplegable('mes'));
						$("select[name='mes'] option[value='" + id + "']",tplModal).attr('selected',true);

						$("textarea[name='descripcio']",tplModal).val(tascaFixa.descripcio);
						break;

					default:
						//error
						break;
				}
				break; //end case edit

			case 'drop':
				$(".modal-body",tplModal).html(tplForms['formDrop']);
				var title, msg, formAction
				
				switch(type){

					case 'formBancal':
						title = "Eliminar bancal";
						msg = "S'esborrarà el bancal i tota la informació relacionada, com parcel·les, cultius, events, etc. Vols continuar?";
						formAction = "dropBancal.php";
						break;

					case 'formParcela':
						title = "Eliminar parcel·la";
						msg = "S'eliminarà la parcel·la, els cultius associats, els events, etc. Vols continuar?";
						formAction = "dropParcela.php";
						break;

					case 'formPlanta':
						title = "Eliminar planta";
						msg = "S'esborraràn la planta i la informació relacionada: les tasques, imatges, cultius, etc. Vols continuar?";
						formAction = "dropPlanta.php";
						break;

					case 'formPlagaPlanta':
						title = "Eliminar afecció";
						msg = "S'esborrarà la relació entre la planta i la plaga. Vols continuar?";
						formAction = "dropPlagaPlanta.php";
						break;

					case 'formTascaPlanta':
						title = "Eliminar tasca de la planta";
						msg = "Vols continuar?";
						formAction = "dropTascaPlanta.php";
						break;

					case 'formImgPlanta':
						title = "Eliminar imatge";
						msg = "Vols continuar?";
						formAction = "dropImgPlanta.php";
						break;

					case 'formPlaga':
						title = "Eliminar plaga";
						msg = "S'esborrarà la plaga i la informació relacionada: quines plantes es veuen afectades, amb quins remeis pot tractar-se, les imatges, etc. Vols continuar?";
						formAction = "dropPlaga.php";
						break;

					case 'formPlantaPlaga':
						title = "Eliminar planta afectada";
						msg = "S'esborrarà la relació entre la plaga i la planta. Vols continuar?";
						formAction = "dropPlantaPlaga.php";
						break;

					case 'formRemeiPlaga':
						title = "Eliminar tractament de plaga";
						msg = "S'esborrarà la relació entre la plaga i el remei. Vols continuar?";
						formAction = "dropRemeiPlaga.php";
						break;

					case 'formImgPlaga':
						title = "Eliminar imatge";
						msg = "Vols continuar?";
						formAction = "dropImgPlaga.php";
						break;

					case 'formRemei':
						title = "Eliminar remei";
						msg = "S'esborrarà el remei i tota la informació relacionada: preparació, tractament, quines plagues pot combatre, etc. Vols continuar?";
						formAction = "dropRemei.php";
						break;

					case 'formPlagaRemei':
						title = "Eliminar plaga tractada";
						msg = "S'esborrarà la relació entre el remei i la plaga. Vols continuar?";
						formAction = "dropPlagaRemei.php";
						break;

					case 'formTascaRemei':
						title = "Eliminar tasca del remei";
						msg = "Vols continuar?";
						formAction = "dropTascaRemei.php";
						break;

					case 'formCultiu':
						title = "Eliminar cultiu";
						msg = "S'esborrarà el cultiu i tota la informació relacionada. Si el cultiu ha acabat abans de la data prevista, utilitza l'altre botó per indicar-ho. Vols eliminar-lo?";
						formAction = "dropCultiu.php";
						break;

					case 'formEvent':
						title = "Eliminar event";
						msg = "Vols continuar?";
						formAction = "dropEvent.php";
						break;

					case 'formTascaFixa':
						title = "Eliminar tasca fixa";
						msg = "Vols continuar?";
						formAction = "dropTascaFixa.php";
						break;
				}

				$("input[name='id']",tplModal).val(id);
				$("h4.modal-title",tplModal).html(title);
				$("p.applink-msg",tplModal).html(msg);
				$("form",tplModal).prop("action", formAction);
				$("button.btn-primary",tplModal).removeClass("btn-primary").addClass("btn-danger").html("Eliminar");
				break; //end case drop

			default:
				//print error (nor create, edit or drop)
				break;
		}
		//show modal
		tplModal.appendTo("body").modal({keyboard:true});
	});

/**
*
* WEB NAVIGATION SYSTEM (applink)
*
**/


	$("body").on('click',"[applink-nav]", function (e) {
		//prevent default
		e.preventDefault();
		
		/*
		var attr = $("button",this).attr("applink-form");
		if (typeof attr !== typeof undefined && attr !== false){
			//has form ATTR
			console.log("is FORM+NAV");	
		}else{
			console.log("is NAV");
		*/

		if (false){
			//has form ATTR
		}else{
		
			//capture variables
			var page = $(this).attr("applink-nav-page");
			var id = $(this).attr("applink-nav-id");

			//add gif loading...
			//TO-DO

			//capture requested page and load into primaryWrapper
			$("#primaryWrapper").html(tplh[page]);

			//if (this.has(applink-nav-id))
			switch(page){
				case "inici":
					//nothing to do
					break;

				case "bancals":
					var tpl;
					var bancalsRow; //dom reference to row where bancals (or advise) will be placed
					var bancalsList;
					var bancalsAdvise = "Encara no has creat cap bancal!";

					bancalsRow = $("div.bancals");


					if ($(entities.bancal).length > 0 ){
						bancalsList = $("<ul></ul>",{"class":"list-inline bancalsList"}).appendTo(bancalsRow);
						//print bancals list
						$.each(entities.bancal,function(){
							tpl = $("<div/>").html(tplh.tplBancal).contents();
							$("a",tpl).attr('applink-nav-id',this.id);
							$(".nom",tpl).html(this.nom);
							$(".sup",tpl).html(this.superficie);
							$(".ubi",tpl).html(this.ubicacio);
							$("button[applink-form]",tpl).attr("applink-form-id",this.id);
							bancalsList.append(tpl);
						});
					}
					else {

						$(bancalsRow).html(tplh.tplBancalsTip);
					}
					break;

				case "calendari":
					$("#calendar").fullCalendar({
						events: {

							url: 'hortapp-core/getEvents.php',
							type: 'POST',
							data: {
								user: '0',
							},
							error: function() {
								alert('there was an error while fetching events!');
							}
						},

						//style parameters
						aspectRatio: 1.8,
						header: {
							left:   'prev,next today',
							center: 'title',
							right:  '',
						
						},
						eventLimit: 3,
						views: {
					        month: { // name of view
					            titleFormat: 'MMMM YYYY'
					            // other view-specific options here
					        }
					    },
					    //timeFormat: 'h(:mm)t'
					    allDaySlot: false,
					    allDayDefault: true,

					    //events & triggers
					    dayClick: function(date, jsEvent, view) {
					    	$("#hiddenDiv").empty();
					    	$("<button/>").attr({
								"type":"button",
								"applink":"",
								"applink-form":"",
								"applink-form-type": "formEvent",
								"applink-form-action":"create",
							}).appendTo("#hiddenDiv").trigger("click");

					    	/**datepicker set value**/
					    	$(".datepicker").datepicker("update", new Date(date));
				        },
				        eventClick: function(calEvent, jsEvent, view) {

				           	$("#hiddenDiv").empty();
				           	$("<button/>").attr({
				       			"type" : "button",
				       			"applink" : "",
				       			"applink-form" : "",
				       			"applink-form-type" : "formEvent",
				       			"applink-form-action" : "edit",
				       			"applink-form-id" : calEvent.id,
				       			"applink-form-parentId" : calEvent.parcela
				       		}).appendTo("#hiddenDiv").trigger("click");

				           	//fill input date 	
				           	$(".datepicker").datepicker("update", new Date (calEvent.start));

			            }

			            /**
			            refetchEvents()
			            Refetches events from all sources and rerenders them on the screen.
						*/
					});
					break;

				case "enciclopedia":

					break;

				case "plantes":
					var table = $("table.plantes");
					var row;

					if ($(entities.planta).length > 0){

						$.each(entities.planta, function(){
							row = $("<tr applink applink-nav applink-nav-page='planta'>").attr('applink-nav-id',this.id);
							row.append($("<td>").html(this.nom_comu));
							row.append($("<td>").html(this.nom_cientific));
							row.append($("<td>").html(getNomGrup(this.grup)));
							row.append($("<td>").html(getNomFamilia(this.familia)));
							//buttons
							editButton = $("<button/>").attr({
								"type":"button",
								"class":"btn btn-link btn-xs",
								"applink":"",
								"applink-form":"",
								"applink-form-type":"formPlanta",
								"applink-form-action":"edit",
								"applink-form-id":this.id,
							}).html("<span class='glyphicon glyphicon-pencil'></span>");

							dropButton = $("<button/>").attr({
								"type":"button",
								"class":"btn btn-link btn-xs",
								"applink":"",
								"applink-form":"",
								"applink-form-type":"formPlanta",
								"applink-form-action":"drop",
								"applink-form-id":this.id,
							}).html("<span class='glyphicon glyphicon-remove'></span>");
							row.append($("<td>").append(editButton).append(dropButton));

							row.appendTo(table);
						});
						table.dataTable()
					} else{
						$(plantesRow).html(tplh.tplPlantesTip);
					}

					break;

				case "plagues":
					var table = $("table.plagues");
					var row;

					if ($(entities.plaga).length > 0){

						$.each(entities.plaga, function(){
							row = $("<tr applink applink-nav applink-nav-page='plaga'>").attr('applink-nav-id',this.id);
							row.append($("<td>").html(this.nom_comu));
							row.append($("<td>").html(this.nom_cientific));
							//buttons
							editButton = $("<button/>").attr({
								"type":"button",
								"class":"btn btn-link btn-xs",
								"applink":"",
								"applink-form":"",
								"applink-form-type":"formPlaga",
								"applink-form-action":"edit",
								"applink-form-id":this.id,
							}).html("<span class='glyphicon glyphicon-pencil'></span>");

							dropButton = $("<button/>").attr({
								"type":"button",
								"class":"btn btn-link btn-xs",
								"applink":"",
								"applink-form":"",
								"applink-form-type":"formPlaga",
								"applink-form-action":"drop",
								"applink-form-id":this.id,
							}).html("<span class='glyphicon glyphicon-remove'></span>");
							row.append($("<td>").append(editButton).append(dropButton));

							row.appendTo(table);
						});
						table.dataTable()
					} else{
						$(plaguesRow).html(tplh.tplPlaguesTip);
					}
					break;

				case "remeis":
					var table = $("table.remeis");
					var row;

					if ($(entities.remei).length > 0){

						$.each(entities.remei, function(){
							row = $("<tr applink applink-nav applink-nav-page='remei'>").attr('applink-nav-id',this.id);
							row.append($("<td>").html(this.nom));
							row.append($("<td>").html(this.descripcio));
							//buttons
							editButton = $("<button/>").attr({
								"type":"button",
								"class":"btn btn-link btn-xs",
								"applink":"",
								"applink-form":"",
								"applink-form-type":"formRemei",
								"applink-form-action":"edit",
								"applink-form-id":this.id,
							}).html("<span class='glyphicon glyphicon-pencil'></span>");

							dropButton = $("<button/>").attr({
								"type":"button",
								"class":"btn btn-link btn-xs",
								"applink":"",
								"applink-form":"",
								"applink-form-type":"formRemei",
								"applink-form-action":"drop",
								"applink-form-id":this.id,
							}).html("<span class='glyphicon glyphicon-remove'></span>");
							row.append($("<td>").append(editButton).append(dropButton));
							row.appendTo(table);
						});
						table.dataTable()
					} else{
						$(remeisRow).html(tplh.tplRemeisTip);
					}

					break;
					break;

				case "altres":
					//nothing to do
					break;

				case "compost":
					//nothing to do
					break;

				case "reg":
					//nothing to do
					break;

				case "semillero":
					//nothing to do
					break;

				case "about":
					//nothing to do
					break;

				case "contacte":
					//nothing to do
					break;

				// elements with id
				case "bancal":
					var bancal = entities.bancal[id];
					var parceles;
					var tplParcela, tplParceles; //fitxa detall de parcela
					var li; //elements for tablist
										

					$("span.nom").html(bancal.nom);
					$("span.superficie").html(bancal.superficie);
					$("span.ubicacio").html(bancal.ubicacio);
					$("h2 > button[applink-form]").attr("applink-form-id",bancal.id);

					//parceles
					if (parceles = getParcelesBancal(id)){
						tplParceles = $("<div/>").html(tplh.tplParceles).contents();
						first = true;
						
						//map variables
						var mapWidth = 600, mapHeight = 600;
						var superficieBancal = parseInt(bancal.superficie);
						var superficieParceles = 0;
						var parcelaWidth = 0;
						var parcelaDistHoriz = 0;
						var parcelesSVG = {};

						var paper = Raphael("map",mapWidth,mapHeight);
						
						$.each(parceles,function(id,parcela){
							//map draweing
								superficieParceles += parseInt(parcela.superficie);
								parcelaWidth = (parcela.superficie / superficieBancal) * mapWidth;
								parcelesSVG[id] = paper.rect(parcelaDistHoriz,0,parcelaWidth,mapHeight);
								parcelesSVG[id].node.id = id;
								var svgname = paper.text(parcelaDistHoriz + (parcelaWidth/2), mapHeight/2, parcela.nom.toUpperCase());
								svgname.rotate(60);
								svgname.attr({ "font-size": 16, "font-family": "Arial, Helvetica, sans-serif", "font-weight":"bold" });


								if (parcela.ocupada == 0){
									parcelesSVG[id].node.setAttribute("class","parcela_empty");
								}else{
									parcelesSVG[id].node.setAttribute("class","parcela_full");
								}
								parcelaDistHoriz += parcelaWidth;

								//link svg with tabs
								parcelesSVG[id].click(function(){
									$("a[href='#tab"+this.node.id+"']").tab('show');
								});

							//tab creation
								li = $("<li>").attr("role","presentation");
								link = $("<a>").attr("data-toggle","tab");
								link.attr("role","tab");
								link.attr("aria-controls","tab"+parcela.id);
								link.attr("href","#tab"+parcela.id);
								link.html(parcela.nom);
								link.appendTo(li);

								//tab content filling
								tplParcela = $("<div/>").html(tplh.tplParcela).contents();
								$(tplParcela).attr("id","tab"+parcela.id);
								$("span.superficie",tplParcela).html(parcela.superficie);
								$("span.detalls",tplParcela).html(parcela.detalls);
								$(".parcela-buttons > button",tplParcela).attr("applink-form-id",parcela.id);
								$(".parcela-buttons > button",tplParcela).attr("applink-form-parentId",parcela.bancal);

								if (cultiusPrevis = getCultiusParcela(parcela.id)){
									//te cultius previs
									$("div.cultius_previs",tplParcela).removeClass("hidden");
									tableCultiusPrevis = $("table",tplParcela);
									$.each(cultiusPrevis,function(i,cultiu){
										fila = $("<tr/>");
										$("<td/>").addClass("nopadding").html(cultiu.data_ini).appendTo(fila);
										$("<td/>").addClass("nopadding").html(cultiu.data_fi).appendTo(fila);

										var tplPlanta = $("<a/>").attr({
											"href" : "planta.php",
											"applink" : "",
											"applink-nav" : "",
											"applink-nav-page" : "planta",
											"applink-nav-id" : cultiu.planta,
											"class" : "btn btn-link nopadding"
										}).html(getNomPlanta(cultiu.planta));
										$("<td/>").addClass("nopadding").append(tplPlanta).appendTo(fila);
										fila.appendTo(tableCultiusPrevis);
									});
								}else{/*no hi ha cultius previs*/}

								if (parcela.ocupada == 0){
									//lliure1
									$(".cultiu_nou button",tplParcela).attr("applink-form-parentId",parcela.id);
									$(".cultiu_nou",tplParcela).removeClass("hidden");
								}else{
									//ocupada
									var cultiuActual = getCultiuActual(parcela.id);
									$("div.cultiu_actual",tplParcela).removeClass("hidden");
									$(".cultiu_actual .data_ini",tplParcela).html(cultiuActual.data_ini);
									$(".cultiu_actual .data_fi",tplParcela).html(cultiuActual.data_fi);

									var tplPlanta = $("<a/>").attr({
										"href" : "planta.php",
										"applink" : "",
										"applink-nav" : "",
										"applink-nav-page" : "planta",
										"applink-nav-id" : cultiuActual.planta,
										"class" : "btn btn-link nopadding"
									}).html(getNomPlanta(cultiuActual.planta));
									$(".cultiu_actual .planta",tplParcela).append(tplPlanta);

									$(".cultiu_actual button",tplParcela).attr("applink-form-id",cultiuActual.id);
								}

								if (first){
									li.addClass("active");
									tplParcela.addClass("active in");
									first = false;
								}

								//add to DOM
								$(".tab-content",tplParceles).append(tplParcela);
								$("ul.nav-tabs",tplParceles).append(li);
							
							

						});
						
						//if has espai lliure
						if (superficieParceles < superficieBancal){
							//print zona lliure en mapa
								superficieLliure = parseInt(superficieBancal) - parseInt(superficieParceles);

								lliureWidth = (superficieLliure / superficieBancal) * mapWidth;
								parcelesSVG[0] = paper.rect(parcelaDistHoriz, 0, lliureWidth, mapHeight);
								// parcelesSVG[0].attr("stroke", "#000");
								parcelesSVG[0].node.id = 0;
								parcelesSVG[0].node.setAttribute("class","bancal_empty");
								parcelesSVG[0].attr("title", "Espai disponible");
								$(parcelesSVG[0].node).attr({
									"applink":"",
									"applink-form":"",
									"applink-form-type":"formParcela",
									"applink-form-action":"create",
									"applink-form-parentId": bancal.id
								});
								svgname = paper.text(parcelaDistHoriz + (lliureWidth/2), mapHeight/2, "LLIURE");
								svgname.rotate(60);
								svgname.attr({ "font-size": 16, "font-family": "Arial, Helvetica, sans-serif", "font-weight":"bold" });
							//extra tab to create parcela
								li = $("<li>").attr("role","presentation");
								link = $("<a>").attr({
									"applink":"",
									"applink-form":"",
									"applink-form-type":"formParcela",
									"applink-form-action":"create",
									"applink-form-parentId": bancal.id
								});

								link.html("<span class='glyphicon glyphicon-plus'></span>");
								link.appendTo(li);

								//add to tabs
								$("ul.nav-tabs",tplParceles).append(li);

						}


						tplParceles.appendTo("div.parceles");

					}else{
						//no hi ha parceles
						//tplParcelaTip;
					}




					break;

				case "planta":
					var tplTascaPlanta, tplPlaga;
					var tasquesRow,plaguesRow;
					var planta = entities.planta[id];
					var tasques, plagues;
					var tasquesList, plaguesList;

					//fields
					$("span.nom_comu").html(planta.nom_comu);
					$("span.nom_cientific").html(planta.nom_cientific);
					$("span.grup").html(getNomGrup(planta.grup));
					$("span.familia").html(getNomFamilia(planta.familia));
					
					//compose
					strMarc = planta.marc_ample + " x " + planta.marc_llarg;
					$("span.marc").html(strMarc);

					//butons
					$("button[applink-form-type='formPlanta']").attr("applink-form-id",planta.id)

					//compose
					strSembra = "Des de " + planta.sembra_ini + " fins a " + planta.sembra_fi;
					$("span.dataSembra").html(strSembra);

					$("p.sembra").html(planta.sembra);
					$("p.cultiu").html(planta.cultiu);
					$("p.collita").html(planta.collita);
					

					//plagues
					plaguesRow = $("div.plagues");
					if (plagues = planta.plagues){
						plaguesList = $("<div/>").appendTo(plaguesRow);
						$.each(plagues, function(key,detalls){

							var content = $("<div>");

							//link plaga
							tplPlaga = $("<a/>").attr({
								"href" : "plaga.php",
								"applink" : "",
								"applink-nav" : "",
								"applink-nav-page" : "plaga",
								"applink-nav-id" : key,
								"class" : "btn btn-link nopadding nomargin"
							}).html("Veure plaga");
							$(content).append(tplPlaga);

							//detalls plaga
							$("<p>").html(detalls).appendTo(content);

							//buttons
							var editButton = $("<button>").attr({
								"type":"button",
								"class":"btn btn-link",
								"applink":"",
								"applink-form":"",
								"applink-form-type":"formPlagaPlanta",
								"applink-form-action":"edit",
								"applink-form-id":key,
								"applink-form-parentId":planta.id,
							}).append("<span class='glyphicon glyphicon-pencil'></span>");
							var dropButton = $("<button>").attr({
								"type":"button",
								"class":"btn btn-link",
								"applink":"",
								"applink-form":"",
								"applink-form-type":"formPlagaPlanta",
								"applink-form-action":"drop",
								"applink-form-id":key,
								"applink-form-parentId":planta.id,
							}).append("<span class='glyphicon glyphicon-remove'></span>");
							$("<p>").addClass("text-right nopadding nomargin").append(editButton).append(dropButton).appendTo(content);


							popover = $("<a/>").attr({
								"href":"#",
								"class":"btn btn-link",
								"data-toggle":"popover",
								"data-html":"true",
								"data-content":content.html(),
								"tabindex":"0",
								"role":"button",
								"data-trigger":"focus"
							}).html(getNomPlaga(key));


							plaguesList.append(popover);
							
						});
						$("[data-toggle='popover']").popover();
					}else{
						//print NO plagues
						$(plaguesRow).append(tplh.tplPlaguesPlantaTip);
					}
					//new plaga button
					$("button[applink-form-type='formPlagaPlanta']").attr("applink-form-parentId",planta.id);
					


					//tasques
					tasquesRow = $("div.tasques");
					if (tasques = planta.tasques){
						tasquesList = $("<div></div>",{"id": "accordionTasques", "class" : "panel-group"}).appendTo(tasquesRow);
						$.each(tasques, function (){
							tplTascaPlanta = $("<div/>").html(tplh.tplTascaPlanta).contents();
							$("span.dies",tplTascaPlanta).html(this.dies);
							$("span.nom",tplTascaPlanta).html(this.nom);
							$("p.descripcio",tplTascaPlanta).html(this.descripcio);
							$("a[data-toggle='collapse']",tplTascaPlanta).attr("href","#"+this.id);
							$("div.panel-collapse",tplTascaPlanta).attr("id",this.id);
							$("button[applink-form]",tplTascaPlanta).attr({
								"applink-form-id":this.id,
								"applink-form-parentId":planta.id
							});
							tasquesList.append(tplTascaPlanta);
						});
					}else{
						$(tasquesRow).append(tplh.tplTasquesPlantaTip);
					}
					//new tasca button
					$("button[applink-form-type='formTascaPlanta']").attr("applink-form-parentId",planta.id);



					break;

				case "plaga":
					var tplPlanta, tplRemei;
					var plantesRow, remeisRow;
					var plaga = entities.plaga[id];
					var plantes, remeis;
					var plantesList, remeisList;


					//fields
					$("span.nom_comu").html(plaga.nom_comu);
					$("span.nom_cientific").html(plaga.nom_cientific);
					$("p.descripcio").html(plaga.descripcio);
					$("p.tractament").html(plaga.tractament);

					//buttons
					$("button[applink-form-type='formPlaga']").attr("applink-form-id",plaga.id)

					//plantes
					plantesRow = $("div.plantes");
					if (plantes = plaga.plantes){
						plantesList = $("<div/>").appendTo(plantesRow);
						$.each(plantes, function(key,detalls){
							var content = $("<div>");

							//link planta
							tplPlanta = $("<a/>").attr({
								"href" : "planta.php",
								"applink" : "",
								"applink-nav" : "",
								"applink-nav-page" : "planta",
								"applink-nav-id" : key,
								"class" : "btn btn-link nopadding nomargin"
							}).html("Veure planta");
							$(content).append(tplPlanta);

							//detalls plaga
							$("<p>").html(detalls).appendTo(content);

							//buttons
							var editButton = $("<button>").attr({
								"type":"button",
								"class":"btn btn-link",
								"applink":"",
								"applink-form":"",
								"applink-form-type":"formPlantaPlaga",
								"applink-form-action":"edit",
								"applink-form-id":key,
								"applink-form-parentId":plaga.id,
							}).append("<span class='glyphicon glyphicon-pencil'></span>");
							var dropButton = $("<button>").attr({
								"type":"button",
								"class":"btn btn-link",
								"applink":"",
								"applink-form":"",
								"applink-form-type":"formPlantaPlaga",
								"applink-form-action":"drop",
								"applink-form-id":key,
								"applink-form-parentId":plaga.id,
							}).append("<span class='glyphicon glyphicon-remove'></span>");
							$("<p>").addClass("text-right nopadding nomargin").append(editButton).append(dropButton).appendTo(content);


							popover = $("<a/>").attr({
								"href":"#",
								"class":"btn btn-link",
								"data-toggle":"popover",
								"data-html":"true",
								"data-content":content.html(),
								"tabindex":"0",
								"role":"button",
								"data-trigger":"focus"
							}).html(getNomPlanta(key));


							plantesList.append(popover);
						});
						$("[data-toggle='popover']").popover();

					}else{
						//print NO plantes
						$(plantesRow).append(tplh.tplPlantesPlagaTip);		
					}				

					//remeis
					remeisRow = $("div.remeis");
					if (remeis = plaga.remeis){
						remeisList = $("<div/>").appendTo(remeisRow);
						$.each(remeis, function(key,detalls){
							
							var content =$("<div>");

							tplRemei = $("<a/>").attr({
								"href" : "remei.php",
								"applink" : "",
								"applink-nav" : "",
								"applink-nav-page" : "remei",
								"applink-nav-id" : key,
								"class" : "btn btn-link nopadding nomargin"
							}).html("Veure remei");
							$(content).append(tplRemei);

							//detalls plaga
							$("<p>").html(detalls).appendTo(content);

							//buttons
							var editButton = $("<button>").attr({
								"type":"button",
								"class":"btn btn-link",
								"applink":"",
								"applink-form":"",
								"applink-form-type":"formRemeiPlaga",
								"applink-form-action":"edit",
								"applink-form-id":key,
								"applink-form-parentId":plaga.id,
							}).append("<span class='glyphicon glyphicon-pencil'></span>");
							var dropButton = $("<button>").attr({
								"type":"button",
								"class":"btn btn-link",
								"applink":"",
								"applink-form":"",
								"applink-form-type":"formRemeiPlaga",
								"applink-form-action":"drop",
								"applink-form-id":key,
								"applink-form-parentId":plaga.id,
							}).append("<span class='glyphicon glyphicon-remove'></span>");
							$("<p>").addClass("text-right nopadding nomargin").append(editButton).append(dropButton).appendTo(content);


							popover = $("<a/>").attr({
								"href":"#",
								"class":"btn btn-link",
								"data-toggle":"popover",
								"data-html":"true",
								"data-content":content.html(),
								"tabindex":"0",
								"role":"button",
								"data-trigger":"focus"
							}).html(getNomRemei(key));

							remeisList.append(popover);
							
						});
						$("[data-toggle='popover']").popover();
					}else{
						//print NO remeis
						$(remeisRow).append(tplh.tplRemeisPlagaTip);
					}				

					break;

				case "remei":
					var tplTascaRemei, tplPlaga;
					var tasquesRow, plaguesRow;
					var remei = entities.remei[id];
					var tasques, plagues;
					var tasquesList, plaguesList;

					$("span.nom").html(remei.nom);
					$("p.descripcio").html(remei.descripcio);
					$("p.preparacio").html(remei.preparacio);
					$("p.aplicacio").html(remei.aplicacio);

					//butons
					$("button[applink-form-type='formRemei']").attr("applink-form-id",remei.id)

					//plagues
					plaguesRow = $("div.plagues");
					if (plagues = remei.plagues){
						plaguesList = $("<div/>").appendTo(plaguesRow);
						$.each(plagues, function(key, detalls){

							var content = $("<div>");

							tplPlaga = $("<a/>").attr({
								"href" : "plaga.php",
								"applink" : "",
								"applink-nav" : "",
								"applink-nav-page" : "plaga",
								"applink-nav-id" : key,
								"class" : "btn btn-link nopadding nomargin"
							}).html("Veure plaga");
							$(content).append(tplPlaga);

							//detalls plaga
							$("<p>").html(detalls).appendTo(content);

							//buttons
							var editButton = $("<button>").attr({
								"type":"button",
								"class":"btn btn-link",
								"applink":"",
								"applink-form":"",
								"applink-form-type":"formPlagaRemei",
								"applink-form-action":"edit",
								"applink-form-id":key,
								"applink-form-parentId":remei.id,
							}).append("<span class='glyphicon glyphicon-pencil'></span>");
							var dropButton = $("<button>").attr({
								"type":"button",
								"class":"btn btn-link",
								"applink":"",
								"applink-form":"",
								"applink-form-type":"formPlagaRemei",
								"applink-form-action":"drop",
								"applink-form-id":key,
								"applink-form-parentId":remei.id,
							}).append("<span class='glyphicon glyphicon-remove'></span>");
							$("<p>").addClass("text-right nopadding nomargin").append(editButton).append(dropButton).appendTo(content);


							popover = $("<a/>").attr({
								"href":"#",
								"class":"btn btn-link",
								"data-toggle":"popover",
								"data-html":"true",
								"data-content":content.html(),
								"tabindex":"0",
								"role":"button",
								"data-trigger":"focus"
							}).html(getNomPlaga(key));


							plaguesList.append(popover);
							
						});
						$("[data-toggle='popover']").popover();
					}else{
						//print NO plagues
						$(plaguesRow).append(tplh.tplPlaguesRemeiTip);
					}
					//new plaga button
					$("button[applink-form-type='formPlagaRemei']").attr("applink-form-parentId",remei.id);


					//tasques
					tasquesRow = $("div.tasques");
					if (tasques = remei.tasques){
						tasquesList = $("<div></div>",{"id": "accordionTasques", "class" : "panel-group"}).appendTo(tasquesRow);
						$.each(tasques, function (){
							tplTascaRemei = $("<div/>").html(tplh.tplTascaRemei).contents();
							$("span.dies",tplTascaRemei).html(this.dies);
							$("span.nom",tplTascaRemei).html(this.nom);
							$("p.descripcio",tplTascaRemei).html(this.descripcio);
							$("a[data-toggle='collapse']",tplTascaRemei).attr("href","#"+this.id);
							$("div.panel-collapse",tplTascaRemei).attr("id",this.id);
							$("button[applink-form]",tplTascaRemei).attr({
								"applink-form-id":this.id,
								"applink-form-parentId":remei.id
							});
							tasquesList.append(tplTascaRemei);
						});

					}else{
						$(tasquesRow).append(tplh.tplTasquesRemeiTip);
					}
					//new tasca button
					$("button[applink-form-type='formTascaRemei']").attr("applink-form-parentId",remei.id);





					break;

				default:

					break;

			}

		//remove loading gif
		}
	});



});//endof document.ready


/**
*
* LIBRARY
*
*/
	//getNomXXX

		function getNomGrup(id){
			var res ="";
			$.each(entities.grup, function(){
				if (parseInt(this.id) == parseInt(id))
					res = this.nom
			});

			return res;
		}

		function getNomFamilia(id){
			var res = "";
			$.each(entities.familia, function(){
				if (parseInt(this.id) == parseInt(id))
					res = this.nom;
			});

			return res;
		}

		function getNomPlanta(id){
			var res = "";
			$.each(entities.planta,function(){
				if (parseInt(this.id) == parseInt(id))
					res = this.nom_comu;
			});
			return res;
		}

		function getNomPlaga(id){
			var res = "";
			$.each(entities.plaga,function(){
				if (parseInt(this.id) == parseInt(id))
					res = this.nom_comu;
			});
			return res;
		}

		function getNomRemei(id){
			var res = "";
			$.each(entities.remei,function(){
				if (parseInt(this.id) == parseInt(id))
					res = this.nom;
			});
			return res;
		}
	//getEntitieXEntitieY
		function getParcelesBancal(bancal){
			var res = {};
			var have = false;
			$.each(entities.parcela, function(){
				if (parseInt(this.bancal)==parseInt(bancal)){
					res[this.id] = this;
					have = true;
				}
			});
			if (have)
				return res;
			
			return false;
		}

		function getCultiusParcela(parcela){
			var res = {};
			var have = false;
			$.each(entities.cultiu, function(){
				if (parseInt(this.parcela)==parseInt(parcela)){
					res[this.id] = this;
					have = true;
				}
			});
			if (have)
				return res;
			
			return false;
		}

		function getCultiuActual(parcela){
			var res = {};
			var data_actual;
			if (entities.parcela[parcela].ocupada == 1){
				data_actual = Date.today();
				$.each(entities.cultiu, function(i,cultiu){
					if (parseInt(cultiu.parcela)==parseInt(parcela)){

						if (Date.parse(cultiu.data_fi) > data_actual){
							res = cultiu;
						}
					}
						
				});
				return res;
			}

			return false;
		}

	//date functions

		/*
		*
		*/
		function addYear(data){
			return data;
		}

		/*
		* receive string data like 2015-12-30
		* return string local date
		*/
		function fromIsoToLocal(data){
			return moment(data).format("DD/MM/YYYY");
		}

		/*
		* receive string date like 30/12/2015
		* return Date ISO date
		*/
		function fromLocalToIso(data){
			return Date.parse(data);
		}

	/**desplegable (print <select>)*/
		function desplegable(type,id){
			var data = {};
			var res;


			if (type){
				res = $("<select id='" + type + "' name='"+ type +"'/>").addClass('form-control input-block-level');
				$("<option />", {selected: "selected", class : "hidden"}).appendTo(res);

				switch (type){
					case 'bancal':
						data = entities[type];
						name = 'nom';
						break;

					case 'parcela':
						data = entities[type];
						name = 'nom';
						break;

					case 'planta':
						name = 'nom_comu';
						if (id == undefined){
							data = entities[type];
						}else{
							grup = entities[type][id]['grup'];
							grupNext = getNextGrup(grup);
							$.each(entities[type], function(i, planta) {
								if (planta.grup == grupNext){
									data[planta.id] = planta;
								}
							});

						}
						break;

					case 'familia':
						name = 'nom';
						data = entities[type];
						break;

					case 'grup':
						name = 'nom';
						data = entities[type];
						break;

					case 'plaga':
						name = 'plaga';
						if (id == undefined){
							data = entities[type];
						}else{
							
							plagues = entities['planta'][id]['plagues'];

							$.each(plagues, function(i, plaga) {
								data[plaga.plaga] = plaga;
							});
						}
						break;

					case 'remei':
						name = 'remei';
						if (id == undefined){
							data = entities[type];
						}else{
							
							remeis = entities['plaga'][id]['remeis'];

							$.each(remeis, function(i, remei) {
								data[remei.remei] = remei;
							});
						}
						break;

					case 'mes':
						data = ['Gener','Febrer','Març','Abril','Maig','Juny','Juliol','Agost','Setembre','Octubre','Novembre','Desembre'];
						name = 'mes';
						break;
				}

				$.each(data, function(index, record){
					if ($.isNumeric(index)){
						if (name === 'nom_comu'){
							$("<option />", {value: record.id, text: record.nom_comu}).appendTo(res);
						}else if (name === 'nom'){
							$("<option />", {value: record.id, text: record.nom}).appendTo(res);
						}else if (name === 'plaga'){
							$("<option />", {value: record.id, text: record.nom_comu}).appendTo(res);
						}else if (name === 'remei'){
							$("<option />", {value: record.id, text: record.nom}).appendTo(res);
						}else if (name === 'mes'){
							$("<option />", {value: index+1, text: record}).appendTo(res);
						}
					}
				});
				return res;


			}else{
				alert("desplegable() error: undefined type");
				res = "error: type undefined";
			}
		}


	/**user lib*/
	
		/* anonymous access */
		// load data for anonymous & registered user, like HTML templates, etc
		function anonAccess(){

			$.ajax({
				url: 'anonAccess.php',
				type: 'GET',
				dataType: 'json',
			})
			.done(function(data) {
				if (data.success){
					//set globals for first time: tplh (templates html), and entities (objects from database)
					tplh = data.html;
					tplForms = data.forms;
					entities = data.entities;
				}else{
				//	alert ("Càrrega incorrecta de la web. Actualitzant...");
					//window.location.href = rootURL;
				}
			})
			.fail(function() {
				//alert ("Càrrega incorrecta de la web. Actualitzant...");
				//window.location.href = rootURL;
			});
			/*
			.always(function() {
				console.log("complete");
			});
			*/
		}

		function validateLogin(arr, form, opt){
			form.validate();
			if (form.valid())
				return true;
			else
				return false;
		}


		function login(data)  {
			if (data.success){
				alert("LOGIN SUCCESS: " + data.msg);
				$("#loginForm").addClass("hide");
				$("#logoutForm").removeClass("hide");
				//entities = data.entities //update entities with user workspace
			}else if (data.error){
				alert("LOGIN ERROR: " + data.msg);
			}
		}

		function logout(data){
			console.log("into Logout");
			if (data.success){
				$("#logoutForm").addClass("hide");
				$("#loginForm").removeClass("hide");			
				alert("LOGOUT SUCCESS: " + data.msg);
				window.location.href = rootURL;
				//sleep(2000);
			}else if (data.error){
				alert("LOGOUT ERROR: " + data.msg);

			}
		}

//application triggers*******************************

	//form event triggers (update inputs by dinamically)
	
	//form-cultiu
		//modify click by change on select
		$("body").on("change",".form-cultiu .planta-select select",function(e){
			//get id planta 
			var planta = entities.planta[parseInt($(this).val())];

			
			//change datepickers

				 //get valor input#data_ini as moment
				 var data_ini = moment(planta.data_ini,"DD/MM/YYYY");

				 //get duracio_planta
				 var duracioPlanta = planta.duracio;
				 
				 //add duracio to data_ini to get data_fi
				 var data_fi = moment(data_ini).add(duracioPlanta,'days');
				 
				 //update datepickers with updated values
				 $("input[name='data_ini']").datepicker("update",data_ini.toDate());
				 $("input[name='data_fi']").datepicker("update",data_fi.toDate());


			//change caben
				//get parcela.superficie
				var id_parcela = $("input[name='parcela']").val();
				var superficie = parseInt(entities.parcela[id_parcela].superficie);

				//get occupied space per planta
				var mL = parseInt(planta.marc_llarg);
				var mA = parseInt(planta.marc_ample);
				var spacePerPlanta = (mL * mA) / 10000;
				//spacePerPlanta = parseInt(planta.marc_llarg * planta.marc_ample / 10000);

				//divide sup / space, redondeo a la baja
				var num_plantes = superficie / spacePerPlanta;

				$("#num-plantes").html(Math.floor(num_plantes));

		});
		
		$("body").on("change",".form-cultiu input[name='data_ini']",function(e){
			//get new date set by user
			var data_ini = moment(this);

			//add planta.duracio

			//update datepicker data_fi

		});

	//form-planta
		//set rangeDates, endDate > startDate
		$("body").on("change",".form-planta input[name='sembra_ini']",function(e){
			//set datepicker sembra-fi this.date as start_date
			console.log("bla");
		});

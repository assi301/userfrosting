<div class="row">
	<div class="col-md-6">
		<h2>
			<span class="nom"></span>
			<small>
				<span class="superficie"></span>
				|
				<span class="ubicacio"></span>
			</small>
			<button type="button" class="btn btn-xs btn-link" applink applink-form applink-form-type="formBancal" applink-form-action="edit" applink-form-id="">
				<span class="glyphicon glyphicon-pencil"></span>
			</button>
			<button type="button" class="btn btn-xs btn-link" applink applink-form applink-form-type="formBancal" applink-form-action="drop" applink-form-id="">
				<span class="glyphicon glyphicon-remove"></span>
			</button>
		</h2>

	</div>
</div>

<div class="container">
	<div class="row">
		







		<div id="map" class="col-md-7">
			<img src="http://placehold.it/600x600" alt="" />
			<!-- MAP++++++++++++++++++++++++++++++++++++++++++++++++++ -->
		</div>










		<div class="col-md-5 parceles">

			<div role="tabpanel">

				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">


					<li role="presentation" class="active">
						<a href="#home" aria-controls="home" role="tab" data-toggle="tab">Sombrejada</a>
					</li>

					<li role="presentation" >
						<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Assoleiada</a>
					</li>

					<li role="presentation">
						<a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Pedregosa</a>
					</li>
					
				</ul>



				
			</div>

			<!-- Tab panes -->
			<div class="tab-content">

				<div role="tabpanel" class="tab-pane fade active" id="home">
					<div class="row margin-top-10 superficie">
						<div class="col-md-2">
							<h6 class="no-margin-fix">superficie</h6>
						</div>
						<div class="col-md-6">
							<span class="superficie">2000</span>
							m2
						</div>
						<div class="col-md-4 text-right">
							<button type="button" class="btn btn-xs btn-link" applink applink-form applink-form-type="formParcela" applink-form-action="edit" applink-form-id="" applink-form-parentId="">
								<span class="glyphicon glyphicon-pencil"></span>
							</button>
							<button type="button" class="btn btn-xs btn-link" applink applink-form applink-form-type="formParcela" applink-form-action="drop" applink-form-id="" applink-form-parentId="">
								<span class="glyphicon glyphicon-remove"></span>
							</button>
						</div>
					</div>

					<div class="row margin-top-10 detalls">
						<div class="col-md-2">
							<h6 class="no-margin-fix">detalls</h6>
						</div>
						<div class="col-md-10 text-justify">
							<span class="detalls">
								Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
								tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
								quis nostrud
							</span>
						</div>
					</div>

					<div class="row margin-top-10 cultius_previs">
						<div class="col-md-2">
							<h6 class="no-margin-fix">cultius previs</h6>
						</div>
						<div class="col-md-10">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>de</th>
										<th>fins a</th>
										<th>cultiu</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="nopadding">6/05/2013</td>
										<td class="nopadding">6/05/2013</td>
										<td class="nopadding"><a class="btn btn-link nopadding" applink-nav-id="1" applink-nav-page="planta" applink-nav="" applink="" href="planta.php">Tomaquera</a></td>
									</tr>
									<tr>
										<td class="nopadding">6/05/2013</td>
										<td class="nopadding">6/05/2013</td>
										<td class="nopadding"><a class="btn btn-link nopadding" applink-nav-id="1" applink-nav-page="planta" applink-nav="" applink="" href="planta.php">Tomaquera</a></td>
									</tr>
									<tr>
										<td class="nopadding">6/05/2013</td>
										<td class="nopadding">6/05/2013</td>
										<td class="nopadding"><a class="btn btn-link nopadding" applink-nav-id="1" applink-nav-page="planta" applink-nav="" applink="" href="planta.php">Tomaquera</a></td>
									</tr>
									<tr>
										<td class="nopadding">6/05/2013</td>
										<td class="nopadding">6/05/2013</td>
										<td class="nopadding"><a class="btn btn-link nopadding" applink-nav-id="1" applink-nav-page="planta" applink-nav="" applink="" href="planta.php">Tomaquera</a></td>
									</tr>
									<tr>
										<td class="nopadding">6/05/2013</td>
										<td class="nopadding">6/05/2013</td>
										<td class="nopadding"><a class="btn btn-link nopadding" applink-nav-id="1" applink-nav-page="planta" applink-nav="" applink="" href="planta.php">Tomaquera</a></td>
									</tr>
									<tr>
										<td class="nopadding">6/05/2013</td>
										<td class="nopadding">6/05/2013</td>
										<td class="nopadding"><a class="btn btn-link nopadding" applink-nav-id="1" applink-nav-page="planta" applink-nav="" applink="" href="planta.php">Tomaquera</a></td>
									</tr>

									
								</tbody>
							</table>
						</div>
					</div>

					<div class="row margin-top-10 cultiu_actual">
						<div class="col-md-2">
							<h6 class="no-margin-fix">cultiu actual</h6>
						</div>
						<div class="col-md-10">
								<a class="btn btn-link nopadding" applink-nav-id="1" applink-nav-page="planta" applink-nav="" applink="" href="planta.php">Tomaquera</a> de <span class="data_ini">27/08/2014</span> fins <span class="data_fi">4/03/2015</span>

								<button type="button" class="btn btn-xs btn-link" title="Acabar cultiu" applink applink-form applink-form-type="formCultiu" applink-form-action="drop" applink-form-id="" applink-form-parentId="">
									<span class="glyphicon glyphicon-remove"></span>
								</button>
						</div>
					</div>
				</div>

				<div role="tabpanel" class="tab-pane fade" id="profile">
					<div class="row margin-top-10">
						<div class="col-md-12 text-right">
							<button type="button" class="btn btn-xs btn-link" applink applink-form applink-form-type="formParcela" applink-form-action="edit" applink-form-id="" applink-form-parentId="">
								<span class="glyphicon glyphicon-pencil"></span>
							</button>
							<button type="button" class="btn btn-xs btn-link" applink applink-form applink-form-type="formParcela" applink-form-action="drop" applink-form-id="" applink-form-parentId="">
								<span class="glyphicon glyphicon-remove"></span>
							</button>

						</div>
					</div>
					<div class="row margin-top-10">
						<div class="col-md-2">
							<h6 class="no-margin-fix">superficie</h6>
						</div>
						<div class="col-md-10">
							<span id="superficie">2000</span>
							m2
						</div>
					</div>

					<div class="row margin-top-10">
						<div class="col-md-2">
							<h6 class="no-margin-fix">detalls</h6>
						</div>
						<div class="col-md-10 text-right">
							<span id="detalls">
								Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
								tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
								quis nostrud
							</span>
						</div>
					</div>

					<div class="row margin-top-10">
						<div class="col-md-2">
							<h6 class="no-margin-fix">cultius previs</h6>
						</div>
						<div class="col-md-10">
							<table>
								<tbody>
									<tr>
										<td> <b>Tomaquera</b>
											des de 6/05/2013 fins 10/09/2013
										</td>
									</tr>
									<tr>
										<td> <b>Favera</b>
											des de 2/11/2013 fins 10/03/2014
										</td>
									</tr>

									<tr>
										<td>
											<b>Tomaquera</b>
											des de 6/05/2013 fins 10/09/2013
										</td>
									</tr>
									<tr>
										<td>
											<b>Favera</b>
											des de 2/11/2013 fins 10/03/2014
										</td>
									</tr>

									<tr>
										<td>
											<b>Tomaquera</b>
											des de 6/05/2013 fins 10/09/2013
										</td>
									</tr>
									<tr>
										<td>
											<b>Favera</b>
											des de 2/11/2013 fins 10/03/2014
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<div class="row margin-top-20 text-center">
						<button type="button" class="btn btn-xs btn-link" applink applink-form applink-form-type="formCultiu" applink-form-action="edit" applink-form-id="" applink-form-parentId="">
							<span class="glyphicon glyphicon-plus"></span> Plantar
						</button>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="messages">...
				</div>
				<div role="tabpanel" class="tab-pane fade" id="settings">...
				</div>
			</div>

		</div>

	</div>
</div>
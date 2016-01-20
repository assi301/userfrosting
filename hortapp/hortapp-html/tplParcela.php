<div role="tabpanel" class="tab-pane fade" id="">
	<div class="row margin-top-10 superficie">
		<div class="col-md-2">
			<h6 class="no-margin-fix">superficie</h6>
		</div>
		<div class="col-md-6">
			<span class="superficie"></span> m<sup>2</sup>
		</div>
		<div class="col-md-4 text-right parcela-buttons">
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
			<span class="detalls"></span>
		</div>
	</div>

	<div class="row margin-top-10 cultius_previs hidden">
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
					
				</tbody>
			</table>
		</div>
	</div>

	<div class="row margin-top-10 cultiu_actual hidden">
		<div class="col-md-2">
			<h6 class="no-margin-fix">cultiu actual</h6>
		</div>
		<div class="col-md-10">
			<span class="planta"></span>
			de
			<span class="data_ini"></span>
			fins
			<span class="data_fi"></span>
	
			<button type="button" class="btn btn-xs btn-link" title="Acabar cultiu" applink applink-form applink-form-type="formCultiu" applink-form-action="edit" applink-form-id="" applink-form-parentId="">
				<span class="glyphicon glyphicon-pencil"></span>
			</button>
			<button type="button" class="btn btn-xs btn-link" title="Eliminar cultiu" applink applink-form applink-form-type="formCultiu" applink-form-action="drop" applink-form-id="" applink-form-parentId="">
				<span class="glyphicon glyphicon-remove"></span>
			</button>
		</div>
	</div>

	<div class="row margin-top-10 cultiu_nou hidden text-center">
		<button type="button" class="btn btn-link" title="Nou cultiu" applink applink-form applink-form-type="formCultiu" applink-form-action="create" applink-form-id="" applink-form-parentId>
			<span class="glyphicon glyphicon-plus"></span>
			Plantar			
		</button>
	</div>
</div>
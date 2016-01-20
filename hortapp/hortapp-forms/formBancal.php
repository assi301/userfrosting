<form class="form-horizontal formBancal" action="">
	<fieldset>
		<!-- Form Name -->

		<!-- Text input-->
		<div class="form-group hidden">
			<div class="col-md-4">
				<input id="id" name="id" placeholder="" class="form-control input-md" type="text">
			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-2 control-label text-right" for="nom">Nom</label>
			<div class="col-md-4">
				<input id="nom" name="nom" placeholder="" class="form-control input-md" type="text">
			</div>
		
			<label class="col-md-2 control-label text-right" for="superficie">Superfície</label>
			<div class="col-md-4">
				<div class="input-group">
					<input id="superficie" name="superficie" placeholder="" class="form-control input-md" type="text">
					<div class="input-group-addon">
						m<sup>2</sup>
					</div>
				</div>
			</div>
		</div>

		<!-- Textarea -->
		<div class="form-group">
			<label class="col-md-2 control-label text-right" for="detalls">Detalls</label>
			<div class="col-md-10">
				<textarea class="form-control" id="detalls" name="detalls" placeholder="Ombra, tipus de terra, herbes adventícies..."></textarea>
			</div>
		</div>
 
	</fieldset>
</form>
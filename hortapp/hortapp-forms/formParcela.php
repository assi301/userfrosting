<form class="form-horizontal" action="">
  <fieldset>
    
    <!-- Text input-->
    <div class="form-group hidden">
      <label class="col-md-3 control-label text-right" for="id">id</label>
      <div class="col-md-8">
        <input name="id" placeholder="" class="form-control input-md" type="text" value="">
      </div>
    </div>

    <!-- Text input-->
    <div class="form-group hidden">
      <label class="col-md-3 control-label text-right" for="bancal">Bancal ID</label>
      <div class="col-md-8">
        <input name="bancal" placeholder="" class="form-control input-md" type="text" value="">
      </div>
    </div>

    <!-- Text input-->
    <div class="form-group">
      <label class="col-md-2 control-label" for="nom">Nom</label>
      <div class="col-md-4">
        <input name="nom" placeholder="" class="form-control input-md" type="text">
      </div>

      <label class="col-md-2 control-label text-right" for="superficie">Superfície</label>
      <div class="col-md-4">
        <div class="input-group">
          <input name="superficie" placeholder="" class="form-control input-md" type="text">
          <div class="input-group-addon">
            m <sup>2</sup>
          </div>
        </div>
      </div>
    </div>

    <!-- Textarea -->
    <div class="form-group">
      <label class="col-md-2 control-label text-right" for="detalls">Detalls</label>
      <div class="col-md-10">
        <textarea class="form-control" name="detalls" placeholder="Ombra, tipus de terra, herbes adventícies..."></textarea>
      </div>
    </div>
  </fieldset>
</form>
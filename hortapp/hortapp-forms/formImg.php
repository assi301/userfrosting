<form class="form-horizontal">
  <fieldset>

    <!-- Text input-->
    <div class="form-group hidden">
      <label class="col-md-3 control-label text-right" for="id">id</label>
      <div class="col-md-8">
        <input name="id" placeholder="" class="form-control input-md" type="text" value="">
      </div>
    </div>

    
    <!-- Text input-->
    <div class="form-group">
      <label class="col-md-4 control-label" for="bancal">entitie type (plaga, planta, etc)</label>
      <div class="col-md-4">
        <input id="bancal" name="bancal" placeholder="" class="form-control input-md" type="text"></div>
    </div>

    <!-- Text input-->
    <div class="form-group">
      <label class="col-md-4 control-label" for="nom">Nom</label>
      <div class="col-md-4">
        <input id="nom" name="nom" placeholder="" class="form-control input-md" type="text"></div>
    </div>

    <!-- Text input-->
    <div class="form-group">
      <label class="col-md-4 control-label" for="sup">Fitxer (jpg, png, gif)</label>
      <div class="col-md-4">
        <input id="sup" name="sup" placeholder="" class="form-control input-md" type="file"></div>
    </div>

    <!-- Textarea -->
    <div class="form-group">
      <label class="col-md-4 control-label" for="det">Detalls</label>
      <div class="col-md-4">
        <textarea class="form-control" id="det" name="det">Ombra, tipus de terra, herbes adventícies...</textarea>
      </div>
    </div>

  </fieldset>
</form>
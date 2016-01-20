<form class="form-horizontal">
  <fieldset>
    
    <!-- Text input-->
    <div class="form-group hidden">
      <label class="col-md-2 control-label text-right" for="id"> ID</label>
      <div class="col-md-10">
        <input name="id" placeholder="" class="form-control input-md" value="" type="text">
      </div>
    </div>

    <!-- Text input-->
    <div class="form-group hidden">
      <label class="col-md-2 control-label text-right" for="planta">Planta ID</label>
      <div class="col-md-10">
        <input name="planta" placeholder="" class="form-control input-md" value="" type="text">
      </div>
    </div>

    <!-- Text input-->
    <div class="form-group">
      <label class="col-md-2 control-label" for="nom">Nom</label>
      <div class="col-md-7">
        <input id="nom" name="nom" placeholder="" class="form-control input-md" type="text">
      </div>
    
      <label class="col-md-1 control-label" for="dies">Dies</label>
      <div class="col-md-2">
        <input id="dies" name="dies" placeholder="" class="form-control input-md" type="text">
      </div>
    </div>

    <!-- Textarea -->
    <div class="form-group">
      <label class="col-md-2 control-label" for="descripcio">Descripcio</label>
      <div class="col-md-10">
        <textarea class="form-control" id="descripcio" name="descripcio" placeholder="Descripció de la tasca a realitzar, millor moment del dia, etc."></textarea>
      </div>
    </div>


  </fieldset>
</form>
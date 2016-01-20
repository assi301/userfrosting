<form class="form-horizontal">
  <fieldset>


    <!-- Text input-->
    <div class="form-group hidden">
      <label class="col-md-3 control-label text-right" for="id">id</label>
      <div class="col-md-8">
        <input name="id" placeholder="" class="form-control input-md" type="text" value="">
      </div>
    </div>
    
    <div class="form-group">
      <label class="col-md-2 control-label" for="nom">Nom</label>
      <div class="col-md-6">
        <input id="nom" name="nom" placeholder="" class="form-control input-md" type="text"></div>

      <label class="col-md-1 control-label" for="mes">Mes</label>
      <div class="col-md-3 mes-select">
        
      </div>
    </div>

    <!-- Textarea -->
    <div class="form-group">
      <label class="col-md-2 control-label" for="descripcio">Descripcio</label>
      <div class="col-md-10">
        <textarea class="form-control" id="descripcio" name="descripcio" rows="8" placeholder="Condicions climàtiques, fase lunar adequada, etc."></textarea>
      </div>
    </div>

  </fieldset>
</form>
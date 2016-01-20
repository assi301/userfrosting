<form class="form-horizontal form-planta">
  <fieldset>

    <div class="form-group hidden">
      <label class="col-md-2 control-label" for="id">id</label>
      <div class="col-md-10">
        <input id="id" name="id" placeholder="" class="form-control input-md" type="text"></div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label" for="nom_comu">Nom comú</label>
      <div class="col-md-10">
        <input id="nom_comu" name="nom_comu" placeholder="" class="form-control input-md" type="text"></div>
    </div>

    <!-- Text input-->
    <div class="form-group">
      <label class="col-md-2 control-label" for="nom_cientific">Nom científic</label>
      <div class="col-md-10">
        <input id="nom_cientific" name="nom_cientific" placeholder="" class="form-control input-md" type="text"></div>
    </div>

    <!-- Select Basic -->
    <div class="form-group">
      <label class="col-md-2 control-label" for="familia">Familia</label>
      <div class="col-md-4 familia-select">
      </div>

      <label class="col-md-2 control-label" for="grup">Grup</label>
      <div class="col-md-4 grup-select">        
      </div>
    </div>
    <!-- Text input-->
    <div class="form-group">
      <label class="col-md-2 control-label" for="marc_ample">Marc</label>
      <div class="col-md-5">
        <div class="input-group">
          <input id="marc_ample" name="marc_ample" placeholder="entre files" class="form-control input-md" type="text">
          <div class="input-group-addon">cm</div>
        </div>

      </div>

      <label class="col-md-2 control-label hidden" for="marc_llarg"></label>
      <div class="col-md-5">
        <div class="input-group">
          <input id="marc_llarg" name="marc_llarg" placeholder="entre plantes" class="form-control input-md" type="text">
          <div class="input-group-addon">cm</div>
        </div>
      </div>
    </div>

    <!-- Appended Input-->
    <div class="form-group">
      <label class="col-md-2 control-label" for="sembra_ini">Sembra</label>
      <div class="col-md-5">
        <div class="input-group date">
          <input id="sembra_ini" name="sembra_ini" class="form-control datepicker" placeholder="des de" type="text">
          <span class="input-group-addon">
            <span class="glyphicon glyphicon-calendar"></span>
          </span>
        </div>

      </div>

      <label class="col-md-2 control-label hidden" for="sembra_fi"></label>
      <div class="col-md-5">
        <div class="input-group date">
          <input id="sembra_fi" name="sembra_fi" class="form-control datepicker" placeholder="fins a" type="text">
          <span class="input-group-addon">
            <span class="glyphicon glyphicon-calendar"></span>
          </span>
        </div>

      </div>
    </div>

    <!-- Textarea -->
    <div class="form-group">
      <label class="col-md-2 control-label" for="sembra">Sembra</label>
      <div class="col-md-10">
        <textarea class="form-control" id="sembra" rows="8" name="sembra" placeholder=""></textarea>
      </div>
    </div>

    <!-- Textarea -->
    <div class="form-group">
      <label class="col-md-2 control-label" for="cultiu">Cultiu</label>
      <div class="col-md-10">
        <textarea class="form-control" id="cultiu" rows="8" name="cultiu"></textarea>
      </div>
    </div>

    <!-- Textarea -->
    <div class="form-group">
      <label class="col-md-2 control-label" for="collita">Collita</label>
      <div class="col-md-10">
        <textarea class="form-control" id="collita" rows="8" name="collita"></textarea>
      </div>
    </div>

  </fieldset>
</form>
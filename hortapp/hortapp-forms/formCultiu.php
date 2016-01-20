<form class="form-horizontal form-cultiu">
  <fieldset>

    <!-- Text input-->
    <div class="form-group hidden">
      <label class="col-md-4 control-label" for="id">id</label>
      <div class="col-md-4">
        <input id="id" name="id" placeholder="" class="form-control input-md" type="text"></div>
    </div>


    <!-- Text input-->
    <div class="form-group hidden">
      <label class="col-md-4 control-label" for="parcela">Parcela</label>
      <div class="col-md-4">
        <input id="parcela" name="parcela" placeholder="" class="form-control input-md" type="text"></div>
    </div>

    <!-- Text input-->
    <div class="form-group">
      <label class="col-md-2 control-label" for="planta">Planta</label>
      <div class="col-md-4 planta-select">
      </div>
      <div class="col-md-6 form-control-static">
         <span>Caben  <span id="num-plantes"></span> plantes</span>
       </div>
     </div>

    <!-- Appended Input-->
    <div class="form-group">
      <label class="col-md-2 control-label" for="data_ini">Des de</label>
      <div class="col-md-4">
        <div class="input-group date">  
          <input id="data_ini" name="data_ini" class="form-control datepicker" type="text">
          <span class="input-group-addon">
            <span class="glyphicon glyphicon-calendar"></span>
          </span>
        </div>
      </div>
      
      <!-- Appended Input-->
      <label class="col-md-2 control-label" for="data_fi">fins a</label>
      <div class="col-md-4">
        <div class="input-group date">
          <input id="data_fi" name="data_fi" class="form-control datepicker" type="text" disabled="disabled">
          <span class="input-group-addon">
            <span class="glyphicon glyphicon-calendar"></span>
          </span>
        </div>

      </div>
    </div>

   

  </fieldset>
</form>
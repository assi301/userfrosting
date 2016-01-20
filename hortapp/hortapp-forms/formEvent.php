<form class="form-horizontal">
  <fieldset>

    <!-- Text input-->
    <div class="form-group hidden">
      <label class="col-md-3 control-label text-right" for="id">id</label>
      <div class="col-md-8">
        <input name="id" placeholder="" class="form-control input-md" value="" type="text">
      </div>
    </div>

    
    <!-- Select Basic -->
    <div class="form-group">
      <label class="col-md-2 control-label" for="parcela">Parcel·la</label>

      <div class="col-md-5 parcela-select">
      

      <!--code to remove-->
      
      <!--code to remove-->
      </div>

      <label class="col-md-1 control-label" for="start">Data</label>
      <div class="col-md-4">
        <div class="input-group date">
          <input id="start" name="start" class="form-control datepicker" placeholder="" type="text">
          <span class="input-group-addon">
            <span class="glyphicon glyphicon-calendar"></span>
          </span>
        </div>
      </div>
    </div>

    <!-- Text input-->
    <div class="form-group">
      <label class="col-md-2 control-label" for="title">Nom</label>
      <div class="col-md-10">
        <input id="title" name="title" placeholder="" class="form-control input-md" type="text"></div>
    </div>


    <!-- Textarea -->
    <div class="form-group">
      <label class="col-md-2 control-label" for="detalls">Detalls</label>
      <div class="col-md-10">
        <textarea class="form-control" id="detalls" name="detalls" placeholder="Condicions climàtiques, fase lunar adequada, etc."></textarea>
      </div>
    </div>

    <!-- Multiple Checkboxes (inline) -->
    <div class="form-group">
      <label class="col-md-8 control-label" for="realitzada"></label>
      <div class="col-md-4">
        <label class="checkbox-inline" for="realitzada-0">
          <input name="realitzada" id="realitzada-0" value="1" type="checkbox"><strong>Realitzada</strong></label>
      </div>
    </div>

  </fieldset>
</form>
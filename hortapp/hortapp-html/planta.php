
<div class="row">

  <div class="col-md-12">

    <ol class="breadcrumb">
      <li>
        <a href="inici.php" applink applink-nav applink-nav-page="inici">Inici</a>
      </li>
      <li>
        <a href="enciclopedia.php" applink applink-nav applink-nav-page="enciclopedia">Enciclopèdia</a>
      </li>
      <li>
        <a href="plantes.php" applink applink-nav applink-nav-page="plantes">Plantes</a>
      </li>
      <li class="active">
        <span class="nom_comu"></span>
      </li>
    </ol>
  </div>
</div>

<!-- PRIMERA FILA amb nom, nom cientific i botons editar -->
<div class="row">
  <!-- columna esquerra (image, plagues i tasques) -->
  <div class="col-md-12">
    <h2>
      <span class="nom_comu"></span>
      <small>
        <span class="nom_cientific"></span>
      </small>
      <button type="button" class="btn btn-link" applink applink-form applink-form-action="edit" applink-form-type="formPlanta" applink-form-id="">
        <span class="glyphicon glyphicon-pencil"></span>
      </button>

      <button type="button" class="btn btn-link" applink applink-form applink-form-action="drop" applink-form-type="formPlanta" applink-form-id="">
        <span class="glyphicon glyphicon-remove"></span>
      </button>
    </h2>

  </div>

</div>
<!--end PRIMERA FILA amb nom, nom cientific i botons editar -->

<!-- SEGONA FILA  (columnes esquerra i dreta)-->
<div class="row">

  <div class="col-md-4">

    <!-- FOTOS -->
    <div>
      <div class="row">
        <div class="col-md-12 text-center">
          <span class="">
            <img src="http://placehold.it/263x200" class="img-rounded"></span>
          <div>
            <span>peu de foto</span>

            <a class="btn btn-link btn-xs" data-toggle="modal" href="#formImg" applink applink-edit applink-type="img" applink-id="1">
              <span class="glyphicon glyphicon-pencil"></span>
            </a>
            

            <a class="btn btn-link btn-xs" data-toggle="modal" href="#formDrop" applink applink-remove applink-type="img" applink-id="1">
              <span class="glyphicon glyphicon-remove"></span>
            </a>
            
          </div>
        </div>
      </div>

      <div class="row margin-top-10">
        <div class="col-md-3">
          <div class="">
            <img src="http://placehold.it/50x50" class=""></div>
        </div>
        <div class="col-md-3 ">
          <div class="">
            <img src="http://placehold.it/50x50" class=""></div>
        </div>
        <div class="col-md-3 ">
          <div class="">
            <img src="http://placehold.it/50x50" class=""></div>
        </div>
        <div class="col-md-3 ">
          <a class="btn btn-success btn-sm " data-toggle="modal" href="#formImg" applink applink-new applink-type="img">
            <span class="glyphicon glyphicon-plus"></span>
          </a>
          
        </div>
      </div>
    </div>
    <!--end FOTOS-->


    <!-- PLAGUES -->
    <div class="text-left margin-top-20">
      <div> 
        <strong>plagues</strong>
        <!-- nova plaga-->
        <button type="button" class="btn btn-link" applink applink-form applink-form-action="create" applink-form-type="formPlagaPlanta" applink-form-parentId="">
          <span class="glyphicon glyphicon-plus-sign"></span>
        </button>

      </div>

      <div class="row plagues"></div>

    </div>
    <!--emd PLAGUES -->
    <!-- TASQUES -->
    <div class="text-left margin-top-20"> <strong>tasques</strong>
      
      <button type="button" class="btn btn-link" applink applink-form applink-form-action="create" applink-form-type="formTascaPlanta" applink-form-parentId="">
        <span class="glyphicon glyphicon-plus-sign"></span>
      </button>

      <div class="row tasques"></div>
      
    </div><!--emd TASQUES -->
  </div><!--end columna esquerra-->

  <!-- columna dreta (grup, sembra, cultiu, familia, etc) -->
  <div class="col-md-8">

    <div class="row">
      <div class="col-md-2">
        <h6 class="">
          <strong>grup</strong>
        </h6>
        <p class="no-margin-fix-top">
          <span class="grup"></span>
        </p>
      </div>
      <div class="col-md-2">
        <h6 class="">
          <strong>familia</strong>
        </h6>
        <p class="no-margin-fix-top">
          <span class="familia"></span>
        </p>
      </div>
      <div class="col-md-2">
        <h6 class="">
          <strong>marc</strong>
        </h6>
        <!-- add (tooltip: 'ample x llarg' or 'distància entre cavallons x distància entre plantes') -->
        <p class="no-margin-fix-top">
          <span class="marc"></span>
        </p>

      </div>
      <div class="col-md-4">
        <h6 class="">
          <strong>data de sembra</strong>
        </h6>
        <!-- ¿add tooltip sobre clima? adelantar 15 dies o retrasar 15 dies? -->
        <p class="no-margin-fix-top">
          <span class="dataSembra"></span>
        </p>

      </div>
      
    </div>

    <div class="row">
      <div class="col-md-12">
        <h6>
          <strong>sembra</strong>
        </h6>
        <p class="text-justify sembra">
        </p>
      </div>
    </div>

    <div class="row">
      <div class="col-md-12">
        <h6>
          <strong>cultiu</strong>
        </h6>
        <p class="text-justify cultiu">
        </p>
      </div>
    </div>

    <div class="row">
      <div class="col-md-12">
        <h6>
          <strong>collita</strong>
        </h6>
        <p class="text-justify collita">
        </p>
      </div>
    </div>
  </div>
</div>
<!-- end SEGONA FILA  (columnes esquerra i dreta)-->
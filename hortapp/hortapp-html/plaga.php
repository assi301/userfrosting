
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
        <a href="plagues.php" applink applink-nav applink-nav-page="plagues">Plagues</a>
      </li>
      <li class="active" applink>
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
      <button type="button" class="btn btn-link" applink applink-form applink-form-action="edit" applink-form-type="formPlaga" applink-form-id="">
        <span class="glyphicon glyphicon-pencil"></span>
      </button>

      <button type="button" class="btn btn-link" applink applink-form applink-form-action="drop" applink-form-type="formPlaga" applink-form-id="">
        <span class="glyphicon glyphicon-remove"></span>
      </button>
    </h2>

  </div>
  
</div>
<!--end PRIMERA FILA amb nom, nom cientific i botons editar -->

<!-- SEGONA FILA -->
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
            <div class="modal fade" id="formImg">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Editar img</h4>
                  </div>
                  <div class="modal-body"></div>
                </div>
              </div>
            </div>

            <a class="btn btn-link btn-xs" data-toggle="modal" href="#formDrop" applink applink-remove applink-type="img" applink-id="1">
              <span class="glyphicon glyphicon-remove"></span>
            </a>
            <div class="modal fade" id="formDrop">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Eliminar img</h4>
                  </div>
                  <div class="modal-body"></div>
                </div>
              </div>
            </div>
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
          <div class="modal fade" id="formImg">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                  <h4 class="modal-title">Afegir imatge</h4>
                </div>
                <div class="modal-body"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--end FOTOS-->
    <!-- PLANTES -->
    <div class="text-left margin-top-20">
      <div> <strong>plantes</strong>
        <button type="button" class="btn btn-link" applink applink-form applink-form-action="create" applink-form-type="formPlantaPlaga" applink-form-parentId="">
          <span class="glyphicon glyphicon-plus-sign"></span>
        </button>

      </div>

      <div class="row plantes"></div>

    </div>
    <!--emd PLANTES -->

    <!-- REMEIS -->
    <div class="text-left margin-top-20">
      <div> <strong>remeis</strong>
        
        <button type="button" class="btn btn-link" applink applink-form applink-form-action="create" applink-form-type="formRemeiPlaga" applink-form-parentId="">
          <span class="glyphicon glyphicon-plus-sign"></span>
        </button>

      </div>

      <div class="row remeis"></div>


    </div><!--emd REMEIS --> 
  </div><!--end columna esquerra-->

  <!-- columna dreta (grup, sembra, cultiu, familia, etc) -->
  <div class="col-md-8">
    <div class="row">
      <div class="col-md-12">
        <h6>
          <strong>descripcio</strong>
        </h6>
        <p class="text-justify descripcio"></p>
      </div>
    </div>

    <div class="row">
      <div class="col-md-12">
        <h6>
          <strong>tractament</strong>
        </h6>
        <p class="text-justify tractament"></p>
      </div>
    </div>
  </div>
</div>
<!-- end SEGONA FILA -->
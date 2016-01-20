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
        <a href="remeis.php" applink applink-nav applink-nav-page="remeis">Remeis</a>
      </li>
      <li class="active" >
        <span class="nom"></span>
      </li>
    </ol>

  </div>
</div>
<!-- PRIMERA FILA amb nom, nom cientific i botons editar -->
<div class="row">
  <!-- columna esquerra (image, plagues i tasques) -->
  <div class="col-md-6">
    <h2>
      <span class="nom"></span>
      <button type="button" class="btn btn-link" applink applink-form applink-form-action="edit" applink-form-type="formRemei" applink-form-id="">
        <span class="glyphicon glyphicon-pencil"></span>
      </button>

      <button type="button" class="btn btn-link" applink applink-form applink-form-action="drop" applink-form-type="formRemei" applink-form-id="">
        <span class="glyphicon glyphicon-remove"></span>
      </button>
    </h2>

  </div>

</div>
<!--end PRIMERA FILA amb nom, nom cientific i botons editar -->

<!-- SEGONA FILA -->
<div class="row">

  <div class="col-md-4">

    <!-- PLAGUES -->
    <div class="text-left margin-top-20">
      <div> <strong>plagues</strong>
        <button type="button" class="btn btn-link" applink applink-form applink-form-action="create" applink-form-type="formPlagaRemei" applink-form-parentId="">
          <span class="glyphicon glyphicon-plus-sign"></span>
        </button>
        

      </div>

      <div class="row plagues"></div>
      
    </div>

    <!--emd PLAGUES -->
    <!-- TASQUES -->
    <div class="text-left margin-top-20"> <strong>tasques</strong>

      <button type="button" class="btn btn-link" applink applink-form applink-form-action="create" applink-form-type="formTascaRemei" applink-form-parentId="">
        <span class="glyphicon glyphicon-plus-sign"></span>
      </button>

      
      <div class="row tasques"></div>
    </div>
    <!--emd TASQUES --> </div>
  <!--end columna esquerra-->

  <!-- columna dreta (grup, sembra, remei, familia, etc) -->
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
          <strong>preparacio</strong>
        </h6>
        <p class="text-justify preparacio"></p>
      </div>
    </div>

    <div class="row">
      <div class="col-md-12">
        <h6>
          <strong>aplicació</strong>
        </h6>
        <p class="text-justify aplicacio"></p>
      </div>
    </div>
  </div>

</div>

<!-- end SEGONA FILA -->


<ol class="breadcrumb">
  <li>
    <a href="inici.php" applink applink-nav applink-nav-page="inici">Inici</a>
  </li>
  <li>
    <a href="enciclopedia.php" applink applink-nav applink-nav-page="enciclopedia">Enciclopèdia</a>
  </li>
  <li>
    <span  class="active">Plantes</span>
  </li>
</ol>

<!-- Main jumbotron for a primary marketing message or call to action -->
<div class="row">
  <div class="col-md-9">
      <h2>Plantes</h2>
      <p class="text-justify">
        A l'enciclopèdia podràs trobar tota la informació sobre plantes, com organitzar les rotacions, les distàncies i dates de sembra, etc.
      </p>
  </div>
   <div class="col-md-3">
    <button type="button" class="btn btn-link" applink applink-form applink-form-type="formPlanta" applink-form-action="create" applink-form-size="lg">
      <span class="glyphicon glyphicon-plus"></span>
    </button>
  </div>
</div>


<div class="row">
  <div class="col-md-12">
    <table class="plantes table table-striped no-footer table-hover" class="display" cellspacing="0" width="100%">
      <thead>
        <tr>
          <th>Nom comú</th>
          <th>Nom científic</th>
          <th>Familia</th>
          <th>Grup</th>
          <th></th>
        </tr>
      </thead>
      <tbody></tbody>
      
    </table>

  </div>
</div>

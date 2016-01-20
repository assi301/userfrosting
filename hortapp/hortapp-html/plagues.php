
    <ol class="breadcrumb">
      <li>
        <a href="inici.php" applink applink-nav applink-nav-page="inici">Inici</a>
      </li>
      <li>
        <a href="enciclopedia.php" applink applink-nav applink-nav-page="enciclopedia">Enciclopèdia</a>
      </li>
      <li>
        <span class="active">Plagues</span>
      </li>
    </ol>

    <!-- Main jumbotron for a primary marketing message or call to action -->    
    <div class="row">
      <div class="col-md-9">
        <h2>Plagues</h2>
        <p class="text-justify">
          A l'enciclopèdia podràs trobar tota la informació sobre plagues, danys ocasionats, tractaments, gravetat, etc.
        </p>
      </div>

      <div class="col-md-3">
        <button type="button" class="btn btn-link" applink applink-form applink-form-type="formPlaga" applink-form-action="create" applink-form-size="md">
          <span class="glyphicon glyphicon-plus"></span>
        </button>
      </div>
    </div>

    <div class="row">
      <div class="col-md-12">
        <table class="plagues table table-striped no-footer table-hover" class="display" cellspacing="0" width="100%">
          <thead>
            <tr>
              <th>Nom</th>
              <th>Nom cientific</th>
              <th></th>
            </tr>
          </thead>

          <tbody></tbody>
        </table>

      </div>
      <!-- end col-md-10 --> </div>
    <!-- end row -->    

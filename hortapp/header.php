<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="guirisan@upv.es">
  <link rel="icon" href="favicon.ico">

  <title>Hortapp</title>

  <link href="css/bootstrap.css" rel="stylesheet">
  <link href="css/bootstrap-theme.css" rel="stylesheet">
  <link href="css/sticky-footer-navbar.css" rel="stylesheet">
  <link href="css/dataTables.bootstrap.css" rel="stylesheet">
  <link href="css/bootstrap-datepicker3.standalone.min.css" rel="stylesheet">
  <link href="css/fullcalendar.min.css" rel="stylesheet">
  <link href="css/fix.css" rel="stylesheet">
</head>
<body>

  <!-- navbar-->
  <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" >
    <div class="container-fluid">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand " applink applink-nav applink-nav-page="inici" href="index.php">hortapp</a>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
          <li>
            <a class="" applink applink-nav applink-nav-page="bancals" href="bancals.php">Bancals</a>
          </li>
          <li>
            <a class="" applink applink-nav applink-nav-page="calendari" href="calendari.php">Calendari</a>
          </li>
          <li class="active dropdown">
            <a href="enciclopedia.php" class="dropdown-toggle " applink applink-nav applink-nav-page="enciclopedia" data-toggle="dropdown">Enciclopèdia</a>

            <!--<a href="" class="dropdown-toggle " data-toggle="dropdown"></a>
          <span class="caret"></span>
          -->
          <ul class="dropdown-menu" role="menu">
            <li class="active">
              <a class="" applink applink-nav applink-nav-page="plantes" href="plantes.php">Plantes</a>
            </li>
            <li>
              <a class="" applink applink-nav applink-nav-page="plagues" href="plagues.php">Plagues</a>
            </li>
            <li>
              <a class="" applink applink-nav applink-nav-page="remeis" href="remeis.php">Remeis</a>
            </li>
            <li class="divider"></li>
            <li>
              <a class="" applink applink-nav applink-nav-page="altres" href="altres.php">Altres</a>
            </li>
            <li>
              <a class="" applink applink-nav applink-nav-page="debug" href="debug.php">debug</a>
            </li>

          </ul>
        </li>

      </ul>

      <!--
        <form class="navbar-form navbar-left" role="search">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Search"></div>
      <button type="submit" class="btn btn-default">Submit</button>
    </form>
    -->
    <ul class="nav navbar-nav navbar-right">

      <!-- icones -->

      <li>
        <a data-toggle="modal" href="#formRegister">
          <span class="glyphicon glyphicon-user"></span>
        </a>
      </li>

      <li>
        <a href="debug.php" applink-nav applink-nav-page="debug">
          <span class="glyphicon glyphicon-fire"> <strong>dbg</strong>
          </span>
        </a>

      </li>

      <li>
        <a href="#">
          <span class="glyphicon glyphicon-info-sign"></span>
        </a>
      </li>
      <li>
        <a href="#">
          <span class="glyphicon glyphicon-envelope"></span>
        </a>
      </li>
      <li>
        <a href="#">
          <span class="glyphicon glyphicon-search"></span>
        </a>
      </li>
      <li>
        <a href="#">
          <span class="glyphicon glyphicon-search"></span>
        </a>
      </li>
      <li>
        <a href="#">
          <span class="icon-big">?</span>
        </a>
      </li>

      <!--end icones -->
      <!--login-->

      <form action="login.php" id="loginForm" class="navbar-form navbar-right form-inline" >
        <div class="form-group">
          <div class="input-group input-group-sm">
            <label class="sr-only" for="login-user">usuari</label>
            <input name="login" id="login-user" type="text" class="form-control" placeholder="user" ></div>
        </div>
        <div class="form-group">
          <div class="input-group input-group-sm">
            <label class="sr-only" for="login-password">contrassenya</label>
            <input name="password" id="login-password" type="password" class="form-control" placeholder="password"></div>
        </div>

        <div class="btn-group btn-group-xs">
          <button type="submit" class="btn btn-default">
            <span class="glyphicon glyphicon-chevron-right"></span>
          </button>
        </div>

      </form>

      <form action="logout.php" id="logoutForm" class="navbar-form navbar-right form-inline">
        <div class="btn-group btn-group-xs">
          <button type="submit" class="btn btn-default">logout</button>
        </div>
      </form>

      <!--end login--> </ul>
  </div>
  <!-- /.navbar-collapse -->
</div>
<!-- /.container-fluid -->
</nav>
<div class="modal fade" id="formRegister">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      <h4 class="modal-title">Registrar-se</h4>
    </div>
    <div class="modal-body"></div>
  </div>

</div>
</div>

<div id="primaryWrapper" class="container">
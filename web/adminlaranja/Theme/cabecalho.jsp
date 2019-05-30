<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Início</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/js/fancybox/jquery.fancybox.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <script src="assets/js/jquery.js"></script>


    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

  <section id="container" >
            <header class="header black-bg">

                        <!--logo start-->
                        <a href="index.jsp" class="logo"><b>FACILITASUS</b></a>
                        <!--logo end-->

                        <UL class="nav navbar navbar-right navbar-user">
                            <li class="divider-vertical">
                                
                            
                        <li class="dropdown user">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <%=session.getAttribute("admin")%>
                                <b class="caret"></b> </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="adminlogin.jsp?acao=Sair">
                                            <i class="fa fa-power-off">SAIR</i>
                                        </a>
                                        
                                    </li>
                                </ul>
                        </li></li></UL>


                    </header>
      <!--header end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><img src="assets/img/friends/fr-05.jpg" class="img-circle" width="60"></p>
              	  <h5 class="centered">Administrador</h5>
                  <!-- imagem de perfil -->
              	  	
                  <li class="mt">
                      <a href="index.jsp">
                          <i class="fa fa-home"></i>
                          <span>Início</span>
                      </a>
                  </li>

                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-medkit"></i>
                          <span>Medicamentos</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="medcadastro.jsp">Cadastro</a></li>
                          <li><a  href="medlistagem.jsp">Lista</a></li>
                      </ul>
                  </li>

                  
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-hospital-o"></i>
                          <span>Postos</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="postocadastro.jsp">Cadastro</a></li>
                          <li><a  href="postolistagem.jsp">Lista</a></li>
                      </ul>
                  </li>
                  <li class="mt">
                      <a href="adminalterar.jsp">
                          <i class="fa fa-user"></i>
                          <span>Perfil</span>
                      </a>
                  </li>
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>

  </section>

    <script src="assets/js/fancybox/jquery.fancybox.js"></script>    
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>

    <!--script for this page-->
  
  <script type="text/javascript">
      $(function() {
        //    fancybox
          jQuery(".fancybox").fancybox();
      });

  </script>
  
  <script>
      //custom select box

      $(function(){
          $("select.styled").customSelect();
      });

  </script>

  </body>
</html>

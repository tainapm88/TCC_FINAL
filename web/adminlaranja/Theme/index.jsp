<%@include file="cabecalho.jsp" %>


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
      <%@include file="lado.jsp" %>

      <!--sidebar end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper site-min-height">
          	<hr>
				<div class="row mt">
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
						<div class="project-wrapper">
		                    <div class="project">
		                        <div class="redondo">
		                            <div class="photo">
		                            	<a class="fancybox" href="assets/img/fotos/posto2.jpg">
                                                    
                                                    <!-- imagem quando busca e amplia --> 
                                                    <img class="img-circle" src="assets/img/fotos/posto2.jpg" alt="" width="300px" height="300px" ></a>
                                                    <!-- imagem da tela -->
                                                    
                                            </div>
		                            <div class="overlay"></div>
		                        </div>
		                    </div>
		                </div>
                                            <h4><i class=" fa-angle-right"></i> Postos</h4>
					</div><!-- col-lg-4 -->
                                        
					
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
						<div class="project-wrapper">
		                    <div class="project" >
		                        <div class="redondo">
		                            <div class="photo">
                                                    <img class="img-circle" src="assets/img/fotos/medadmin1.jpg" alt=""width="300px" height="300px"></a>
                                                
                                                    </div>
		                            <div class="overlay"></div>
		                        </div>
		                    </div>
		                </div>
                                        <h4><i class=" fa-angle-right"></i> Medicamentos</h4>
					</div><!-- col-lg-4 -->
					
					
				</div><!-- /row -->

				<div class="row mt">
					
					
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
						
					</div><!-- col-lg-4 -->
					
					
				</div><!-- /row -->
                                

				<div class="row mt mb">
					
					
					
					
					
				</div><!-- /row -->

		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
              2018 - Tainá Morais
              <a href="gallery.html#" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
      <!--footer end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
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

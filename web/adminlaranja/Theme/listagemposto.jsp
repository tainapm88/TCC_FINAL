<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Tcc</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

  <section id="container" >
           <!--CABEÇALHO-->
      <%@include file="cabecalho.jsp" %>

        <%@include file="lado.jsp" %>
        
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> Postos</h3>
				<div class="row">
				</div><!-- row -->

              <div class="row mt">
                  <div class="col-md-12">
                      <div class="content-panel">
                          <table class="table table-striped table-advance table-hover">
	                  	  	  
                              <thead>
                              <tr>
                                  <th><i class="fa fa-cog"></i> Código</th>
                                  <th><i class="fa fa-book"></i> Nome</th>
                                  <th><i class="fa fa-map-marker"></i> Cidade+Estado</th>
                                  <th><i class=" fa fa-map-marker"></i> Endereço+Bairro</th>
                                  <th><i class="fa fa-phone"></i> Telefone</th>
                                  <th><i class="fa fa-clock-o"></i> Horário de atendimento</th>
                                  <th><i class="fa fa-search"></i>
                                  <form>
                                        <input type="pesquisar" placeholder="Pesquisar"></i>
                                        
                                  </form>
                                  </th>
                                  
                                  
                                  <th></th>
                              </tr>
                              </thead>
                              <tbody>
                              <tr>
                                  <td><a href="basic_table.html#">xxxx</a></td>
                                  <td class="hidden-phone">Centro Social Urbano</td>
                                  <td>Bagé - Rio Grande do Sul</td>
                                  <td class="hidden-phone">Rua: Rômulo Freitas - Pedras Brancas</td>
                                  <td class="hidden-phone">(53) 3241-2651</td>
                                  <td class="hidden-phone">Segunda a sexta: 08:00 as 18:00</td>
                               
                                  
                                  
                                  <td>
                                      <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>
                                      <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
                                  </td>
                              </tr>
                              
                             
                              
                              
                              </tbody>
                          </table>
                      </div><!-- /content-panel -->
                  </div><!-- /col-md-12 -->
              </div><!-- /row -->

		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      <!--footer start-->

      <!--footer end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>

    <!--script for this page-->
    
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script>

  </body>
</html>

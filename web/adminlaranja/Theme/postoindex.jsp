<%@page import="util.StormData"%>
<%@page import="Dao.PostoDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Posto"%>
<%@include file="cabecalho.jsp" %>
<%@include file="lado.jsp" %>


<% 
    
    PostoDAO dao = new PostoDAO();
    List<Posto> lista;
    
    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
        
    } else{ 
   
    //verifico se é excluir
        if(request.getParameter("postocod") != null){
            Posto obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("postocod")));
            if(obj != null){
                dao.excluir(obj);
            }
        }
        
        lista = dao.listar();
    }
    
    

%>

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
        
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> Postos</h3>
				<div class="row">
				</div><!-- row -->

              <div class="row mt">
                  <div class="col-md-12">
                      <form action="#" method="post">
                        <div class="form-group input-group">
                            <input type="text" class="form-control" name="txtFiltro" placeholder="digite...">
                                <span class="input-group-btn"><button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button></span>
                        </div>
                      </form>
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
                                  <%for(Posto itemp: lista)
                                {
                                   %>
                                  <td><a href="basic_table.html#">xxxx<%=itemp.getPostocod()%></a></td>
                                  <td class="hidden-phone">Centro Social Urbano<%=itemp.getPostonome()%></td>
                                  <td>Bagé - Rio Grande do Sul<%=itemp.getMunicipibge().getMunicipnome()%> / <%=itemp.getId().getNome()%> </td>
                                  <td class="hidden-phone">Rua: Rômulo Freitas - Pedras Brancas <%=itemp.getPostoend()%> / <%=itemp.getPostobairro()%></td>
                                  <td class="hidden-phone">(53) 3241-2651 <%=itemp.getPostotelefone()%></td>
                                  <td class="hidden-phone">Segunda a sexta: 08:00 as 18:00 <%=StormData.formata(itemp.getPostohorarioatend())%></td>
                                  <td><img src = "../arquivos/<%=itemp.getPostofoto()%>" width="100" height = "80" /></td>
                                  
                                  <td><a href="postoalterar.jsp?Id=<%=itemp.getPostocod()%>" class="btn  btn-primary btn-sm">Alterar</a>
                                    <button class="btn  btn-danger btn-sm" data-toggle="modal" data-target="#myModal" onclick="codigo=<%=itemp.getPostocod()%>">Excluir</button>  
                                  </td>
                                  <td>
                                      <a href="postoalterar.jsp?Id=<%=itemp.getPostocod()%>" class="btn btn-primary btn-xs" class="fa fa-pencil">Alterar</a>
                                      <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>
                                      <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#myModal" onclick="codigo=<%=itemp.getPostocod()%>"><i class="fa fa-trash-o "></i></button>
                                  </td>
                              </tr>
                              <% } %>
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

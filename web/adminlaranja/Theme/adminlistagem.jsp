<%@page import="modelo.Admin"%>
<%@page import="Dao.AdminDAO"%>
<%@page import="Dao.MedicamentosDAO"%>
<%@page import="modelo.Medicamentos"%>
<%@page import="util.StormData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="modelo.Estado"%>
<%@page import="Dao.EstadoDAO"%>

<%@page import="modelo.Municipibge"%>
<%@page import="Dao.MunicipibgeDAO"%>

<%@page import="Dao.PostoDAO"%>
<%@page import="modelo.Posto"%>

<%@page import="java.util.List"%>
<%@include file="cabecalho.jsp" %>
<%@include file="lado.jsp" %>

<%
    AdminDAO adao = new AdminDAO();
    List<Admin> alista = adao.listar();

    
    if (request.getParameter("txtFiltro") != null) {
        alista = adao.listar(request.getParameter("txtFiltro"));
    } else {
        //verifico se é excluir
        if (request.getParameter("codigo") != null) {
            
            Admin obj = adao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
            if (obj != null) {
                adao.excluir(obj);
            }
        }
        alista = adao.listar();
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

                    <div class="row mt">
                        <div class="col-md-12">
                            <div class="content-panel">
                                <table class="table table-striped table-advance table-hover">
                                    <h4><i class="fa fa-angle-right"></i> Listagem - Administradores</h4>
                                    <hr>
                                    <thead>
                                        <tr>
                                            <th><i class="fa fa-hospital-o"></i> Nome - Sobrenome</th>
                                            <th><i class="fa fa-map-marker"></i> Cidade/Estado</th>
                                            <th><i class="fa fa-map-marker"></i> Endereço/Bairro</th>
                                            <th><i class="fa fa-plus-square"></i>CPF</th>
                                            <th><i class="fa fa-plus-square"></i>Data de Nascimento</th>
                                            <th><i class="fa fa-phone"></i> Telefone</th>
                                           
                                            <th></th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        <tr>
                                            <%for (Admin itema : alista) {
                                            %>


                                            <td><%=itema.getAdminnome()%> / <%=itema.getAdminsobrenome()%></td>
                                            <td class="hidden-phone"><%=itema.getMunicipibge().getMunicipnome()%> / <%=itema.getId().getNome()%></td>
                                            <td><%=itema.getAdminend() %></td>
                                            <td><%=itema.getAdmincpf()%></td>
                                            <td><%=itema.getAdmindatanasc()%></td>
                                            <td><%=itema.getAdmintelefone()%></td>
                                           
                                            <td>
                                                <a href="adminalterar.jsp?codigo=<%=itema.getAdmincod()%>" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                                                <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#myModal" 
                                                        onclick="codigo =<%=itema.getAdmincod()%>"><i class="fa fa-trash-o "></i></button>
                                            </td>


                                        </tr>
                                        <% }%>
                                    </tbody>

                                </table>
                            </div>




                            <!-- /content-panel -->
                        </div><!-- /col-md-12 -->
                    </div><!-- /row -->

                </section><! --/wrapper -->
            </section><!-- /MAIN CONTENT -->

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
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">Exclusão</h4>
                    </div>
                    <div class="modal-body">
                        Tem certeza que deseja excluir?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary" onclick="excluir()">Confirmar Exclusão</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <script>
            //custom select box
            var codigo
            function excluir() {
                document.location.href = "adminlistagem.jsp?codigo=" + codigo;
            }
            $(function () {
                $('select.styled').customSelect();
            });

        </script>

    </body>
</html>



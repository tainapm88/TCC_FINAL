<%@page import="modelo.Admin"%>
<%@page import="Dao.AdminDAO"%>
<%@page import="Dao.MedicamentosDAO"%>
<%@page import="modelo.Medicamentos"%>
<%@page import="util.StormData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>


<%@page import="java.util.List"%>
<%@include file="cabecalho.jsp" %>

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
                                        <form action="#" method="post">
                                            <div class="form-group input-group">
                                                <input type="text" class="form-control" name="txtFiltro" placeholder="Digite...">
                                                    <span class="input-group-btn"><button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button></span>
                                            </div>
                                        </form>
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
                                            <td class="hidden-phone"><%=itema.getAdmincidade()%> / <%=itema.getAdminestado()%></td>
                                            <td><%=itema.getAdminrua()%> / <%=itema.getAdminnumero()%></td>
                                            <td><%=itema.getAdmincpf()%></td>
                                            <td><%=StormData.formata(itema.getAdmindatanasc())%></td>
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



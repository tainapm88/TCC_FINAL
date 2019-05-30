<%@page import="util.StormData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>


<%@page import="Dao.PostoDAO"%>
<%@page import="modelo.Posto"%>

<%@page import="java.util.List"%>
<%@include file="cabecalho.jsp" %>

<%

    PostoDAO dao = new PostoDAO();
    List<Posto> listaposto = dao.listar();


    if (request.getParameter("txtFiltro") != null) {
        listaposto = dao.listar(request.getParameter("txtFiltro"));
    } else {
        //verifico se é excluir
        if (request.getParameter("codigo") != null) {
            
            Posto obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
            
            if (obj != null) {
                dao.excluir(obj);
            }
        }
        listaposto = dao.listar();
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
                                    <h4><i class="fa fa-angle-right"></i> Listagem Postos</h4>
                                    <hr>
                                    <thead>
                                        <form action="#" method="post">
                                            <div class="form-group input-group">
                                                <input type="text" class="form-control" name="txtFiltro" placeholder="Digite...">
                                                    <span class="input-group-btn"><button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button></span>
                                            </div>
                                        </form>
                                        <tr>
                                            <th><i class="fa fa-hospital-o"></i> Nome</th>
                                            <th><i class="fa fa-map-marker"></i> Cidade/Estado</th>
                                            <th><i class="fa fa-map-marker"></i> Endereço/Bairro</th>
                                            <th><i class="fa fa-phone"></i> Telefone</th>
                                            <th><i class="fa fa-align-justify"></i> Especialização</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <%for (Posto itemp : listaposto) {
                                            %>


                                            <td><%=itemp.getPostonome()%></td>
                                            <td class="hidden-phone"><%=itemp.getPostocidade()%> / <%=itemp.getPostoestado()%></td>
                                            <td><%=itemp.getPostorua()%> - <%=itemp.getPostonumero()%> / <%=itemp.getPostobairro()%></td>
                                            <td><%=itemp.getPostotelefone()%></td>
                                            <td><%=itemp.getPostoespecializacao()%></td>
                                            <td>
                                                <a href="postoalterar.jsp?codigo=<%=itemp.getPostocod()%>" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                                                <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#myModal" 
                                                        onclick="codigo =<%=itemp.getPostocod()%>"><i class="fa fa-trash-o "></i></button>
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
                document.location.href = "postolistagem.jsp?codigo=" + codigo;
            }
            $(function () {
                $('select.styled').customSelect();
            });

        </script>

    </body>
</html>



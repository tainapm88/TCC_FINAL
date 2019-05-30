<%@page import="modelo.Posto"%>
<%@page import="Dao.PostoDAO"%>
<%@page import="java.util.List"%>
<%@include file="cabecalho.jsp" %>

<%
    Posto obj = new Posto();
    PostoDAO pdao = new PostoDAO();
    List<Posto> plista = pdao.listar();

    if (request.getParameter("txtFiltro") != null) {
        if (request.getParameter("txtFiltro2") != null) {
             plista = pdao.listar(request.getParameter("txtFiltro2"),request.getParameter("txtFiltro"));
        }
        else{
            plista = pdao.listar(request.getParameter("txtFiltro"));
        }
        }else {
        //verifico se é excluir
        if (request.getParameter("codigo") != null) {

            obj = pdao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
            if (obj != null) {
                pdao.excluir(obj);
            }
        }
        plista = pdao.listar();
    }

%>

<style>
    body{
        background-color: #FFD777;
        color: #FFD777;
    }
    #botao{
        width: 180px;
        height: 50px;
        border-width: 2px;
        border-style: solid;
        display: inline-block;
        border-radius: 50px;        
        background-color: #AE0000;
        color: white;
        font-family: "Rubik", arial, sans-serif;
        font-weight: 300; 
    }
    #tab{
        height: 500px;
        width: 1100px;
        
    }
    h4{
        font-size: 18px;
    }
    h5{
        font-size: 14px;
    }
</style>

<body>
    <section class="site-hero overlay" data-stellar-background-ratio="0.5">
        </br>
        </br>
        </br>
        </br>
        <div class="container" text="center">

            <center>
                <p>Lista solicitada de postos da cidade de <%=request.getParameter("txtPostoNome")%></p>

            </center>
            <li class="nav-item">
                </br>
                <form action="postolista.jsp" method="post">
                    <div class="form-group input-group">
                        <input type="hidden" name="txtFiltro" value="<%=request.getParameter("txtFiltro")%>"> 
                        <input type="text" class="form-control" name="txtFiltro2" placeholder="Pesquisa por nome do posto">
                        
                            <button id="botao" type="submit" class="btn btn-primary">Pesquisar</button>
                       

                        <span class="input-group-btn"></span>
                    </div>
                </form>                    
            </li>

    <div class="container">
        <div class="row mb-10 mb-2">
            <%for (Posto posto : plista) {

                %>
          <div class="col-md-3">
            <div class="post-entry">
              <img src="../../arquivos/<%=posto.getPostofoto()%>" alt="Image placeholder" class="img-fluid">
              <div class="body-text">
                <h4 class="mb-3">Nome: <%=posto.getPostonome()%></a></h4>
                <h5 class="mb-3">Cidade-Estado: <%=posto.getPostocidade()%>-<%=posto.getPostoestado()%></a></h5>
        
                <center><p><a href="detalheposto.jsp?id=<%=posto.getPostocod()%>" class="btn btn-primary btn-sm">Ver detalhes</a></p></center>
              </div>
            </div>
          </div>
              <%}%>
        </div>
      </div>
        </div>
    </section>

    <div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#f4b214"/></svg></div>

    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/jquery-migrate-3.0.0.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.waypoints.min.js"></script>
    <script src="js/jquery.stellar.min.js"></script>

    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/magnific-popup-options.js"></script>

    <script src="js/main.js"></script>
</body>
</html>
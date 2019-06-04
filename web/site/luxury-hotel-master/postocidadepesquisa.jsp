<%@page import="modelo.Posto"%>
<%@page import="Dao.PostoDAO"%>
<%@page import="java.util.List"%>
<%@include file="cabecalho.jsp" %>

<%
    Posto obj = new Posto();
    PostoDAO pdao = new PostoDAO();
    List<Posto> plista = pdao.listar();

    if (request.getParameter("txtFiltro") != null) {
        plista = pdao.listar(request.getParameter("txtFiltro"));
    } else {
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
            width: 200px;
            height: 60px;
            border-width: 2px;
            border-style: solid;
            display: inline-block;
            border-radius: 50px;        
            background-color: #AE0000;
            color: white;
            font-family: "Rubik", arial, sans-serif;
            font-weight: 300; 
        }    
        #pesq{
                border-radius: 200px;
        }
        
        p{
            font-family: URW Chancery;
            font-size: 500px;
               
        }
            
            
       

    </style>



<!doctype html>
  <body>   
      <section class="site-hero overlay" data-stellar-background-ratio="0.5" >
          </br>
          </br>
          </br>
          </br>
          </br>
          </br>
         

          <div class="container" text="center">
              <center><p>Digite a cidade do Posto de Saúde</p></center>
              <li class="nav-item">
                  </br>
                    <form action="postolista.jsp">
                        <div class="form-group input-group">
                            <input id="pesq" type="text" class="form-control" name="txtFiltro" placeholder="Digite...">
                                <span class="input-group-btn"></span>
                        </div>       
                    <center>
                        <p>
                           <button id="botao" class="btn btn-primary" type="submit">Pesquisar</button>
                        </p>
                    </center> 
                    </form>
              </li>
              </br>
              </br>
        
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
<%@include file="cabecalho.jsp" %>
<%@page import="modelo.Posto"%>
<%@page import="Dao.PostoDAO"%>
<%@page import="java.util.List"%>


<%if (request.getParameter("id") == null) {
    response.sendRedirect("index.jsp");
    return;
    }
    PostoDAO daop = new PostoDAO();
    Posto posto = new Posto();
    posto = daop.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
    daop.fecharConexao();
    
    %>

<style>
        body{
            background-color: #FFD777;
            color: #FFD777;
        }
        img{
            border-radius:50px;
        }
        h3{
            font-family: Arial;
            color: #AE0000;
        }
        li{
            color: #AE0000;
        }
        a{
            color: #FFD777;
        }
        h5{
            color: #AE0000;
        }
        
</style>
<!doctype html>
<html lang="en">

  <body>
       
    <!-- END header -->


            <section class="site-hero overlay" data-stellar-background-ratio="0.5" >
      <div class="container">
          
          </br>
          </br>
          </br>
          </br>
          </br>
          </br>
          
        <div class="row">
            
          <div class="col-md-5 order-deails">
            <h3 class="mb-5">
                
                <div class="card" style="width: 28rem;">
               
                <div class="card-body">
                    <center><h3 class="card-title">Informações do Posto</h3></center>
                <ul class="list-group list-group-flush">
                    <h5><li class="list-group-item">Código: <%=posto.getPostocod()%></li>
                <li class="list-group-item">Nome: <%=posto.getPostonome()%> </li>
                <li class="list-group-item">Cidade/Estado: <%=posto.getPostocidade()%>/<%=posto.getPostoestado()%> </li>
                <li class="list-group-item">Endereço/Bairro:<%=posto.getPostorua()%>-<%=posto.getPostonumero()%>/<%=posto.getPostobairro()%></li>
                <li class="list-group-item">Telefone:<%=posto.getPostotelefone()%> </li>
                <li class="list-group-item">Especialização:<%=posto.getPostoespecializacao()%> </li>
                
                </ul>
                </div>
                </div>
                
                
                
                </h3>
                <form action="#" method="post">


                </form>
              </div>
              
              <div class="col-md-1"></div>
              <div class="col-md-5">
                
                <p class="mb-5"><img src="../../arquivos/<%=posto.getPostofoto()%>" alt="" class="img-fluid"></p>
                <div class="card">
                                    <div class="card-header" role="tab" id="headingOne">
                                        <h6 class="mb-0">
                                            <center> <a data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Horário de Atendimento</a></center>
                                        </h6>
                                    </div>

                                    <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
                                        <h5><%=posto.getPostohorarioatend()%></h5>
                                    </div>
                                </div>
                <!--<p>Breve descrição sobre o posto</p>!-->
                
              </div>
        </div>
      </div>
    </section>

    
    <!-- loader -->
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
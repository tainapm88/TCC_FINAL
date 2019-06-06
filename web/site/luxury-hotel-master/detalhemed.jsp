<!doctype html>
<%@include file="cabecalho.jsp" %>
<%@page import="modelo.Medicamentos"%>
<%@page import="Dao.MedicamentosDAO"%>

<%if (request.getParameter("id") == null) {
    response.sendRedirect("index.jsp");
    return;
    }
    MedicamentosDAO daom = new MedicamentosDAO();
    Medicamentos medicamentos = new Medicamentos();
    medicamentos = daom.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
    daom.fecharConexao();

    %>

<html lang="en">

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
        h6{
            font-size: 15px;
            color: #AE0000;
        }
</style>  
    

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
                    <center><h3 class="card-title">Detalhes do Medicamento</h3></center>
                <ul class="list-group list-group-flush">
                    <h5><li class="list-group-item">Código: <%=medicamentos.getMedcod()%></li>
                <li class="list-group-item">Nome: <%=medicamentos.getMednome()%> </li>
                <li class="list-group-item">Quantidade: <%=medicamentos.getMedqtdade()%> </li>
                <li class="list-group-item">Posto: <%=medicamentos.getPostocod().getPostonome()%><li>
                <li class="list-group-item">Endereço: <%=medicamentos.getPostocod().getPostorua()%>- <%=medicamentos.getPostocod().getPostonumero()%><li>
                <li class="list-group-item">Cidade-Estado:<%=medicamentos.getPostocod().getPostocidade()%>/<%=medicamentos.getPostocod().getPostoestado()%><li>    
                </ul>
                </div>
                </div>
                
                
                
                </h3>
                <form action="#" method="post">


                </form>
              </div>
              
              <div class="col-md-1"></div>
              <div class="col-md-5">
                
                <p class="mb-5"><img src="../../arquivos/<%=medicamentos.getMedfoto()%>" alt="" class="img-fluid"></p>
                <div class="card">
                                    <div class="card-header" role="tab" id="headingOne">
                                        <h6 class="mb-0">
                                            <center> <a data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Bula</a></center>
                                        </h6>
                                    </div>

                                    <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
                                        <h6><%=medicamentos.getMedbula()%></h6>
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
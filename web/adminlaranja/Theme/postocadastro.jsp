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
    String msg = "";
    String classe = "";
    
    Posto obj = new Posto();
    PostoDAO pdao = new PostoDAO();

    EstadoDAO edao = new EstadoDAO();
    List<Estado> elistar = edao.listar();
    Estado e = new Estado();
    
    
    MunicipibgeDAO mdao = new MunicipibgeDAO();
    List<Municipibge> mlistar = mdao.listar();
    Municipibge m = new Municipibge();

    
     if(request.getMethod().equals("POST")){

    if (request.getParameter("txtPostoNome") != null) {
        obj.setPostocod(Integer.parseInt(request.getParameter("txtPostoCodigo")));
        obj.setPostonome(request.getParameter("txtPostoNome"));
        obj.setPostoend(request.getParameter("txtPostoEndereco"));
        obj.setPostobairro(request.getParameter("txtPostoBairro"));
        e = edao.buscarPorChavePrimaria(Long.parseLong(request.getParameter("txtEstadoNome")));
        m = mdao.buscarPorChavePrimaria(request.getParameter("txtCidadeNome"));
        obj.setId(e);
        obj.setMunicipibge(m);
        
        obj.setPostohorarioatend(request.getParameter("txtPostoHorario"));
        obj.setPostoespecializacao(request.getParameter("txtPostoEspecializacao"));
        obj.setPostotelefone(request.getParameter("txtPostoTelefone"));
        obj.setPostofoto(request.getParameter("txtPostoFoto"));

          
        Boolean resultado = pdao.incluir(obj);

        if (resultado) {
            msg = "Registro cadastrado com sucesso";
            classe = "alert-success";
        } else {
            msg = "Não foi possível cadastrar";
            classe = "alert-danger";
        }
        
         String redirectURL = "postolistagem.jsp";
        response.sendRedirect(redirectURL);
     
    } 
    
         pdao.fecharConexao();
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

    <title>Cadastro postos</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
        
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
        
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> Cadastro Posto</h3>
                
                <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="../../UploadWS" method="post" enctype="multipart/form-data">
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  
                      
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Código</label>
                              <div class="col-sm-10">
                                  <input type="text"  name="txtPostoCodigo" class="form-control">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Nome</label>
                              <div class="col-sm-10">
                                  <input type="text" name="txtPostoNome" class="form-control">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Endereço</label>
                              <div class="col-sm-10">
                                  <input type="text" name="txtPostoEndereco" class="form-control">
                                  <span class="help-block">Ex.: Rua - nº</span>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Bairro</label>
                              <div class="col-sm-10">
                                  <input type="text" name="txtPostoBairro" class="form-control">
                              </div>
                          </div>

                          
                                
                         <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Estado</label>
                            <div class="col-sm-10">
                                
                            <select id="inputEstado" name="txtEstadoNome" class="form-control">
                                <option selected>
                                    <%
                           for (Estado iteme : elistar) {
                               
                         %>
                         <option value = "<%=iteme.getId()%>">
                             <%=iteme.getNome()%>
                         </option>
                         <%
                             }
                         %>
                                </option>
                            </select>
                         </div>
                                

                         <div class="form-group">
                             <label class="col-sm-2 col-sm-2 control-label">Cidade</label>
                             <div class="col-sm-10">

                                 <select id="inputEstado" name="txtCidadeNome"  class="form-control">
                                     <option selected>
                                         <%
                                             for (Municipibge itemm : mlistar) {

                                         %>
                                     <option value = "<%=itemm.getMunicipibge()%>">
                                         <%=itemm.getMunicipnome()%>
                                     </option>
                                     <%
                                         }
                                     %>
                                     </option>
                                 </select>
                             </div>

                         
                          <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Horário de atendimento</label>
                                    <div class="col-sm-10">
                                        <textarea  id="message" name="txtPostoHorario" class="form-control " cols="30" rows="8">Segunda-feira:
Terça-feira:
Quarta-feira:
Quinta-feira:
Sexta-feira:
Sábado:
Domingo:
                                        </textarea>
                                    </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Telefone</label>
                              <div class="col-sm-10">
                                  <input type="text" name="txtPostoTelefone" class="form-control">
                                  <span class="help-block">Ex.: (00)123456789</span>
                              </div>
                          </div>
                          <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">Especialização</label>
                                    <div class="col-sm-10">
                                        <textarea  name="txtPostoEspecializacao" id="message" class="form-control " cols="30" rows="8">
                                        </textarea>
                                    </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Foto</label>
                              <div class="col-sm-10">
                                  <div class="form-group">
                                    <input class="form-control" type="file"  name="txtPostoFoto"  required />
                                  </div>

                              </div>
                      
                          </div>
          		</div><!-- col-lg-12-->   
                         
          	</div><!-- /row -->
                
                <div class="showback">
                        <input type="submit" class="btn btn-primary btn-lg btn-block" value="Cadastrar"></a>
                    </div><!--/showback -->
                      </form>
                
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
              2019 - Tainá Pacheco Morais
              <a href="form_component.html#" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
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
    <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>

	<!--custom switch-->
	<script src="assets/js/bootstrap-switch.js"></script>
	
	<!--custom tagsinput-->
	<script src="assets/js/jquery.tagsinput.js"></script>
	
	<!--custom checkbox & radio-->
	
	<script type="text/javascript" src="assets/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap-daterangepicker/daterangepicker.js"></script>
	
	<script type="text/javascript" src="assets/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
	
	
	<script src="assets/js/form-component.js"></script>    
    
    
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script>

  </body>
</html>

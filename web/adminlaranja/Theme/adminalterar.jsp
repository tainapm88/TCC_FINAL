<%@page import="util.StormData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="modelo.Estado"%>
<%@page import="Dao.EstadoDAO"%>

<%@page import="modelo.Municipibge"%>
<%@page import="Dao.MunicipibgeDAO"%>

<%@page import="Dao.PostoDAO"%>
<%@page import="modelo.Posto"%>

<%@page import="Dao.AdminDAO"%>
<%@page import="modelo.Admin"%>

<%@page import="java.util.List"%>
<%@include file="cabecalho.jsp" %>
<%@include file="lado.jsp" %>

<%
    String msg = "";
    String classe = "";
    
    Admin obj = new Admin();
    AdminDAO dao = new AdminDAO();
    
    EstadoDAO edao = new EstadoDAO();
    List<Estado> elistar = edao.listar();
    Estado e = new Estado();
    
    
    MunicipibgeDAO mdao = new MunicipibgeDAO();
    List<Municipibge> mlistar = mdao.listar();
    Municipibge m = new Municipibge();

    
     if(request.getMethod().equals("POST")){

    if (request.getParameter("txtAdminNome") != null) {
        obj.setAdmincod(Integer.parseInt(request.getParameter("txtAdminCodigo")));
        obj.setAdminnome(request.getParameter("txtAdminNome"));
        obj.setAdminsobrenome(request.getParameter("txtAdminSobrenome"));
        obj.setAdmincpf(request.getParameter("txtAdminCpf"));
        obj.setAdmindatanasc(StormData.formata(request.getParameter("txtAdminDataNasc")));
        obj.setAdminend(request.getParameter("txtAdminEndereco"));
        obj.setAdmintelefone(request.getParameter("txtAdminTelefone"));
        obj.setAdminsexo(request.getParameter("txtAdminSexo"));
        obj.setAdminemail(request.getParameter("txtAdminEmail"));
        obj.setAdminsenha(request.getParameter("txtAdminSenha"));
        e = edao.buscarPorChavePrimaria(Long.parseLong(request.getParameter("txtEstadoNome")));
        m = mdao.buscarPorChavePrimaria(request.getParameter("txtCidadeNome"));
        obj.setId(e);
        obj.setMunicipibge(m);
        

        Boolean resultado = dao.alterar(obj);
        

        if (resultado) {
            msg = "Registro cadastrado com sucesso";
            classe = "alert-success";
        } else {
            msg = "Não foi possível cadastrar";
            classe = "alert-danger";
        }
        
         } else {
        //e GET
        if (request.getParameter("codigo") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        dao = new AdminDAO();
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));

        if (obj == null) {
            response.sendRedirect("index.jsp");
            return;
        }
    }
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

    <title>Cadastro Administrador</title>

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
          	<h3><i class="fa fa-angle-right"></i> Alterar - Administrador</h3>
                <div class="alert <%=classe%>">
                <%=msg%>
            </div>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                      <form class="form-horizontal style-form">
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Código de identificação</label>
                              <div class="col-sm-10">
                                  <input class="form-control" type="text" placeholder="<%=obj.getAdmincod()%>" readonly>
                              </div>
                          </div>
                          
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Nome</label>
                              <div class="col-sm-10">
                                  <input class="form-control" type="text" placeholder readonly value ="<%=obj.getAdminnome()%>">
                              </div>
                          </div>
                          
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Sobrenome</label>
                              <div class="col-sm-10">
                                  <input class="form-control" type="text" placeholder="Colocar aqui o Sobrenome já cadastrado" readonly>
                              </div>
                          </div>

                          
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">CPF</label>
                              <div class="col-sm-10">
                                  <input class="form-control" type="text" readonly value="<%=obj.getAdmincpf()%>">
                              </div>
                          </div>

                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Endereço</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" placeholder="Rua dos Bobos, nº 0" required value="<%=obj.getAdminend()%>">
                              </div>
                          </div>

                          
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Telefone</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" placeholder="Ex.:(00)123456789" required value="<%=obj.getAdmintelefone()%>">
                              </div>
                          </div>

                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Email</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" placeholder="fulano@gmail.com" required value="<%=obj.getAdminemail()%>">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Nova Senha</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" placeholder="12345678" required value="<%=obj.getAdminsenha()%>">
                              </div>
                          </div>
                      </form>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
                 <div class="showback">
                        <a href="index.jsp"><input type="button" class="btn btn-primary btn-lg btn-block" value="Alterar"></a>
                    </div><!--/showback -->

          	
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

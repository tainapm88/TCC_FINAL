<%@page import="util.Criptografia"%>
<%@page import="modelo.Admin"%>
<%@page import="Dao.AdminDAO"%>

<%
    if (request.getParameter("acao") != null){
        session.setAttribute("admin", "");
    }
    //se os dois campos forem informados, é login 
    if(request.getParameter("txtAdminEmail")!=null && 
            request.getParameter("txtAdminSenha")!= null)
    {
        AdminDAO dao = new AdminDAO();
        Admin a = dao.logar(request.getParameter("txtAdminEmail"),
                (Criptografia.convertPasswordToMD5(request.getParameter("txtAdminSenha"))));{
        session.setAttribute("admin", request.getParameter("txtAdminEmail"));
    }
        
        if(a !=null)
        {
            session.setAttribute("admin", a);
            response.sendRedirect("index.jsp");
            return;
        }
        else
        {
            %>
            <script>alert('Dados inválidos - Verifique seu email e senha');
                </script>
        <%}
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

    <title>FacilitaSUS</title>

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

      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->

	  <div id="login-page">
	  	<div class="container">
	  	
		      <form class="form-login" method="post" action="#">
		        <h2 class="form-login-heading" >Login</h2>
		        <div class="login-wrap">
		            <input type="text" class="form-control" placeholder="Email" name="txtAdminEmail"  autofocus>
		            <br>
		            <input type="password" class="form-control" placeholder="Senha" name="txtAdminSenha" >
		            <button class="btn btn-theme btn-block" type="submit" value="submit"><i class="fa fa-lock"></i> ENTRAR</button>
		            <hr>

		            <div class="registration">
		                Você ainda não possui uma conta?<br/>
		                <a class="" href="admincadastro.jsp">
		                    Criar conta aqui
                                    
		                </a>
		            </div>
		
		        </div>
		

		          <!-- modal -->
		
		      </form>	  	
	  	
	  	</div>
	  </div>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
    <script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
    <script>
        $.backstretch("assets/img/branco.jpg", {speed: 500});
    </script>


  </body>
</html>

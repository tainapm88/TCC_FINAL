<%@page import="util.StormData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>

<%@page import="Dao.AdminDAO"%>
<%@page import="modelo.Admin"%>

<%@page import="java.util.List"%>
<%@include file="cabecalho.jsp" %>

<%
    String msg = "";
    String classe = "";
    
    Admin obj = new Admin();
    AdminDAO dao = new AdminDAO();
    
     if(request.getMethod().equals("POST")){

    if (request.getParameter("txtAdminNome") != null) {
        obj.setAdmincod(Integer.parseInt(request.getParameter("txtAdminCodigo")));
        obj.setAdminnome(request.getParameter("txtAdminNome"));
        obj.setAdminsobrenome(request.getParameter("txtAdminSobrenome"));
        obj.setAdmincpf(request.getParameter("txtAdminCpf"));
        obj.setAdmindatanasc(StormData.formata(request.getParameter("txtAdminDataNasc")));
        obj.setAdminnumero(request.getParameter("numero"));
        obj.setAdmintelefone(request.getParameter("txtAdminTelefone"));
        obj.setAdminsexo(request.getParameter("txtAdminSexo"));
        obj.setAdminemail(request.getParameter("txtAdminEmail"));
        obj.setAdminsenha(request.getParameter("txtAdminSenha"));

        obj.setAdmincep(request.getParameter("cep"));
        obj.setAdminrua(request.getParameter("rua"));
        obj.setAdminbairro(request.getParameter("bairro"));
        obj.setAdmincidade(request.getParameter("cidade"));
        obj.setAdminestado(request.getParameter("uf"));

        

        Boolean resultado = dao.alterar(obj);
        

        if (resultado) {
            msg = "Registro alterado com sucesso";
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
 
        <script type="text/javascript" >

            function limpa_formulário_cep() {
                //Limpa valores do formulário de cep.
                document.getElementById('rua').value = ("");
                document.getElementById('bairro').value = ("");
                document.getElementById('cidade').value = ("");
                document.getElementById('uf').value = ("");
            }

            function meu_callback(conteudo) {
                if (!("erro" in conteudo)) {
                    //Atualiza os campos com os valores.
                    document.getElementById('rua').value = (conteudo.logradouro);
                    document.getElementById('bairro').value = (conteudo.bairro);
                    document.getElementById('cidade').value = (conteudo.localidade);
                    document.getElementById('uf').value = (conteudo.uf);
                } //end if.
                else {
                    //CEP não Encontrado.
                    limpa_formulário_cep();
                    alert("CEP não encontrado.");
                }
            }

            function pesquisacep(valor) {

                //Nova variável "cep" somente com dígitos.
                var cep = valor.replace(/\D/g, '');

                //Verifica se campo cep possui valor informado.
                if (cep != "") {

                    //Expressão regular para validar o CEP.
                    var validacep = /^[0-9]{8}$/;

                    //Valida o formato do CEP.
                    if (validacep.test(cep)) {

                        //Preenche os campos com "..." enquanto consulta webservice.
                        document.getElementById('rua').value = "...";
                        document.getElementById('bairro').value = "...";
                        document.getElementById('cidade').value = "...";
                        document.getElementById('uf').value = "...";

                        //Cria um elemento javascript.
                        var script = document.createElement('script');

                        //Sincroniza com o callback.
                        script.src = 'https://viacep.com.br/ws/' + cep + '/json/?callback=meu_callback';

                        //Insere script no documento e carrega o conteúdo.
                        document.body.appendChild(script);

                    } //end if.
                    else {
                        //cep é inválido.
                        limpa_formulário_cep();
                        alert("Formato de CEP inválido.");
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formulário.
                    limpa_formulário_cep();
                }
            }
            ;

        </script>
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
          	
            <form action="../../UploadWS" method="post" enctype="multipart/form-data">
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                      
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Código de identificação</label>
                              <div class="col-sm-10">
                                  <input class="form-control" type="text" name="txtAdminCodigo" readonly value="<%=obj.getAdmincod()%>">
                              </div>
                          </div>
                          
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Nome</label>
                              <div class="col-sm-10">
                                  <input class="form-control" type="text" name="txtAdminNome" readonly value="<%=obj.getAdminnome()%>">
                              </div>
                          </div>
                          
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Sobrenome</label>
                              <div class="col-sm-10">
                                  <input class="form-control" type="text" name="txtAdminSobrenome" readonly value="<%=obj.getAdminsobrenome()%>">
                              </div>
                          </div>

                          
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">CPF</label>
                              <div class="col-sm-10">
                                  <input class="form-control" type="text" name="txtAdminCpf" readonly value="<%=obj.getAdmincpf()%>">
                              </div>
                          </div>
                              
                          <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Cep:</label>
                                        <div class="col-sm-10">
                                            <input name="cep" type="text" id="cep" value="" class="form-control" maxlength="9"
                                                   onblur="pesquisacep(this.value);" required value="<%=obj.getAdmincep()%>"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Rua:</label>
                                        <div class="col-sm-10">
                                            <input name="rua" type="text" id="rua" class="form-control" required="<%=obj.getAdminrua()%>" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Número</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="numero" class="form-control">

                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Bairro:</label>
                                        <div class="col-sm-10">
                                            <input name="bairro" type="text" id="bairro" class="form-control">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Cidade:</label>
                                        <div class="col-sm-10">
                                            <input name="cidade" type="text" id="cidade" class="form-control">
                                        </div>             
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Estado:</label>
                                        <div class="col-sm-10">
                                            <input name="uf" type="text" id="uf" class="form-control">
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
                  </div>
                 <div class="showback">
                        <input type="submit" class="btn btn-primary btn-lg btn-block" value="Alterar">
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

<%@page import="util.StormData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="Dao.PostoDAO"%>
<%@page import="modelo.Posto"%>

<%@page import="java.util.List"%>
<%@include file="cabecalho.jsp" %>


<%
    String msg = "";
    String classe = "";
    
    Posto obj = new Posto();
    PostoDAO pdao = new PostoDAO();
    
     if(request.getMethod().equals("POST")){

    if (request.getParameter("txtPostoNome") != null) {
        obj.setPostocod(Integer.parseInt(request.getParameter("txtPostoCodigo")));
        obj.setPostonome(request.getParameter("txtPostoNome"));
        
        obj.setPostonumero(request.getParameter("numero"));
        obj.setPostocep(request.getParameter("cep"));
        obj.setPostorua(request.getParameter("rua"));
        obj.setPostobairro(request.getParameter("bairro"));
        obj.setPostocidade(request.getParameter("cidade"));
        obj.setPostoestado(request.getParameter("uf"));
        
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


  <body>

  <section id="container" >
      <!--CABEÇALHO-->
        
      <section id="main-content">
          <section class="wrapper">
              <h3></br> Cadastro Posto</h3>
                
                <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="../../UploadWS" method="post" enctype="multipart/form-data">
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                          <div class="form-group">
                              <label class="col-sm-1">Código</label>
                              <div class="col-sm-11">
                                  <input type="text"  name="txtPostoCodigo" class="form-control">
                              </div>
                            </br>
                            </br>
                          </div>

                          <div class="form-group">
                              <label class="col-sm-1">Nome</label>
                              <div class="col-sm-11">
                                  <input type="text" name="txtPostoNome" class="form-control">
                              </div>
                              </br>
                            </br>
                          </div>
                         
                         <div class="form-group">
                                        <label class="col-sm-1">Cep:</label>
                                        <div class="col-sm-3">
                                            <input name="cep" type="text" id="cep" value="" class="form-control" maxlength="9"
                                                   onblur="pesquisacep(this.value);" />
                                        </div>
                                    </div>
                            
                                    <div class="form-group">
                                        <label class="col-sm-1">Bairro:</label>
                                        <div class="col-sm-7">
                                            <input name="bairro" type="text" id="bairro" class="form-control">
                                        </div>
                                        </br></br>
                                    </div>
                            
                                    <div class="form-group">
                                        <label class="col-sm-1">Rua:</label>
                                        <div class="col-sm-8">
                                            <input name="rua" type="text" id="rua" class="form-control">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-1">Número</label>
                                        <div class="col-sm-2">
                                            <input type="text" name="numero" class="form-control">
                                        </div>
                                        </br></br>
                                    </div>

                                    

                                    <div class="form-group">
                                        <label class="col-sm-1">Cidade:</label>
                                        <div class="col-sm-5">
                                            <input name="cidade" type="text" id="cidade" class="form-control">
                                        </div>             
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-1">Estado:</label>
                                        <div class="col-sm-5">
                                            <input name="uf" type="text" id="uf" class="form-control">
                                        </div> 
                                        </br></br>
                                    </div>
                            <div class="form-group">
                              <label class="col-sm-1">Telefone</label>
                              <div class="col-sm-11">
                                  <input type="text" name="txtPostoTelefone" class="form-control">
                                  <span class="help-block">Ex.: (00)123456789</span>
                              </div>
                          </div>
                         
                          <div class="form-group">
                                <label class="col-sm-1">Horário de atendimento</label>
                                    <div class="col-sm-11">
                                        <textarea  id="message" name="txtPostoHorario" class="form-control " cols="30" rows="8">Segunda-feira:
Terça-feira:
Quarta-feira:
Quinta-feira:
Sexta-feira:
Sábado:
Domingo:
                                        </textarea>
                                       </br>
                                    </div>
                                </br></br>
                          </div>
                          
                          <div class="form-group">
                                <label class="col-sm-1">Especialização</label>
                                    <div class="col-sm-11">
                                        <textarea  name="txtPostoEspecializacao" id="message" class="form-control " cols="30" rows="8">
                                        </textarea>
                                        </br>
                                    </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-1 ">Foto</label>
                              <div class="col-sm-11">
                                  <div class="form-group">
                                    <input class="form-control" type="file"  name="txtPostoFoto"  required />
                                  </div>

                              </div>
                      
                          </div>
          		</div><!-- col-lg-12-->   
                         
          	</div><!-- /row -->
                
                    <div>
                        <input type="submit" class="btn btn-primary btn-lg btn-block" value="Cadastrar">
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

  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script>

  </body>
</html>

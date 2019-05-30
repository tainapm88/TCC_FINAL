<%@page import="modelo.Medicamentos"%>
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

        obj.setPostocod(Integer.parseInt(request.getParameter("txtPostoCodigo")));
        obj.setPostonome(request.getParameter("txtPostoNome"));
        obj.setPostobairro(request.getParameter("txtPostoBairro"));
        
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
        
        if(request.getParameter("txtPostoFoto")!=null)
            {
                obj.setPostofoto(request.getParameter("txtPostoFoto"));
            }
            else
            {
                obj.setPostofoto(request.getParameter("txtFotoVelha"));
            }

          
        Boolean resultado = pdao.alterar(obj);

        if (resultado) {
            response.sendRedirect("postolistagem.jsp");
        } else {
            msg = "Não foi possível cadastrar";
            classe = "alert-danger";
        }
        
         } else {
        //e GET
        if (request.getParameter("codigo") == null) {
            response.sendRedirect("postolistagem.jsp");
            return;
        }

        pdao = new PostoDAO();
        obj = pdao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));

        if (obj == null) {
            response.sendRedirect("postolistagem.jsp");
            return;
        }
    }
%>


<!DOCTYPE html>

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
          	<h3><i class="fa fa-angle-right"></i> Alterar - Posto</h3>
                
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
                                  <input type="text"  name="txtPostoCodigo" class="form-control" readonly value="<%=obj.getPostocod()%>">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Nome</label>
                              <div class="col-sm-10">
                                  <input type="text" name="txtPostoNome" class="form-control" readonly value="<%=obj.getPostonome()%>">
                              </div>
                          </div>
                          
                          <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Cep:</label>
                                        <div class="col-sm-10">
                                            <input name="cep" type="text" id="cep" class="form-control" maxlength="9"
                                                   onblur="pesquisacep(this.value);" required value="<%=obj.getPostocep()%>"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Rua:</label>
                                        <div class="col-sm-10">
                                            <input name="rua" type="text" id="rua" class="form-control" required value="<%=obj.getPostorua()%>">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Número</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="numero" class="form-control" required value="<%=obj.getPostonumero()%>">

                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Bairro:</label>
                                        <div class="col-sm-10">
                                            <input name="bairro" type="text" id="bairro" class="form-control" required value="<%=obj.getPostobairro()%>">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Cidade:</label>
                                        <div class="col-sm-10">
                                            <input name="cidade" type="text" id="cidade" class="form-control" required value="<%=obj.getPostocidade()%>">
                                        </div>             
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Estado:</label>
                                        <div class="col-sm-10">
                                            <input name="uf" type="text" id="uf" class="form-control" required value="<%=obj.getPostoestado()%>">
                                        </div>           
                                    </div>

                            <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Horário de Atendimento</label>
                            <div class="col-sm-10">
                               <TextArea class="form-control" name="txtPostoHorario" cols="30" rows="8" required><%=obj.getPostohorarioatend()%> </TextArea>
                        </div>
                        </div>
                        
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Telefone</label>
                              <div class="col-sm-10">
                                  <input type="text" name="txtPostoTelefone" class="form-control" required value="<%=obj.getPostotelefone()%>">
                                  <span class="help-block">Ex.: (00)123456789</span>
                              </div>
                          </div>
                          <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Especialização</label>
                            <div class="col-sm-10">
                               <TextArea class="form-control" name="txtPostoEspecializacao" cols="30" rows="8" required ><%=obj.getPostoespecializacao()%> </TextArea>
                        </div>
                        </div>
                          <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Foto</label>
                            <div class="col-sm-10">
                                  <div class="form-group">
                                    <input class="form-control" type="file" name="txtPostoFoto" id="arquivo1"  accept="image/*" />
                                    <input type="hidden" name="txtFotoVelha" value="<%=obj.getPostofoto()%>" />
                                    <td><img src="../../arquivos/<%=obj.getPostofoto()%>" id="img1" width="100" height="80"/></td>
                                  </div>

                              </div>
                          </div>
          		</div><!-- col-lg-12-->   
                         
          	</div><!-- /row -->
                
                <div class="showback">
                        <input type="submit" class="btn btn-primary btn-lg btn-block" value="Alterar"></a>
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

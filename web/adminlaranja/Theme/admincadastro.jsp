<%@page import="Dao.AdminDAO"%>
<%@page import="modelo.Admin"%>
<%@page import="util.StormData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@include file="cabecalho.jsp" %>


<%
    String msg = "";
    String classe = "";

    Admin obj = new Admin();
    AdminDAO adao = new AdminDAO();

    if (request.getMethod().equals("POST")) {

        if (request.getParameter("txtAdminNome") != null) {
            obj.setAdmincod(Integer.parseInt(request.getParameter("txtAdminCodigo")));
            obj.setAdminnome(request.getParameter("txtAdminNome"));
            obj.setAdminsobrenome(request.getParameter("txtAdminSobrenome"));
            obj.setAdmincpf(request.getParameter("txtAdminCpf"));
            obj.setAdmindatanasc(StormData.formata(request.getParameter("txtAdminDataNasc"), "yyyy-MM-dd"));
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

            Boolean resultado = adao.incluir(obj);

            if (resultado) {
                msg = "Registro cadastrado com sucesso";
                classe = "alert-success";
            } else {
                msg = "Não foi possível cadastrar";
                classe = "alert-danger";
            }

            String redirectURL = "index.jsp";
            response.sendRedirect(redirectURL);

        }

        adao.fecharConexao();
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
    </head>

    <body>

        <section id="container" >
            <!--CABEÇALHO-->

            <section id="main-content">
                <section class="wrapper">
                    <h3><i class="fa fa-angle-right"></i> Cadastro Administrador</h3>

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
                                            <input type="text"  name="txtAdminCodigo" class="form-control">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Nome</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="txtAdminNome" class="form-control">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Sobrenome</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="txtAdminSobrenome" class="form-control">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Cpf</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="txtAdminCpf" class="form-control">
                                            <span class="help-block">Ex.: 00011122233</span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Data de Nascimento</label>
                                        <div class="col-sm-10">
                                            <input type="date"  name="txtAdminDataNasc"  class="form-control" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Cep:</label>
                                        <div class="col-sm-10">
                                            <input name="cep" type="text" id="cep" value="" class="form-control" maxlength="9"
                                                   onblur="pesquisacep(this.value);" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Rua:</label>
                                        <div class="col-sm-10">
                                            <input name="rua" type="text" id="rua" class="form-control">
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
                                            <input type="text" name="txtAdminTelefone" class="form-control">
                                            <span class="help-block">Ex.: 00111223344</span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Sexo</label>
                                        <div class="col-sm-10">
                                            <select name="txtAdminSexo" class="form-control" required/>
                                                <option value="M">Masculino</option>
                                                <option value="F">Feminino</option>
                                            </select>
                                        </div>  
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Email</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="txtAdminEmail" class="form-control">
                                            <span class="help-block">Ex.: fulano@gmail.com </span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Senha</label>
                                        <div class="col-sm-10">
                                            <input type="password" name="txtAdminSenha" class="form-control">
                                            <span class="help-block">Ex.: 12345678 </span>
                                        </div>
                                    </div>








                                </div><!-- col-lg-12-->   

                            </div><!-- /row -->

                            <div class="showback">
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

        
    </body>
</html>

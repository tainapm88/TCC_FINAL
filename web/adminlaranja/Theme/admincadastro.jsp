<%@page import="Dao.AdminDAO"%>
<%@page import="modelo.Admin"%>
<%@page import="util.StormData"%>
<%@page import="util.Criptografia"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@include file="cabecalho.jsp" %>


<%    String msg = "";
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
            obj.setAdminsenha(Criptografia.convertPasswordToMD5(request.getParameter("txtAdminSenha")));

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

            String redirectURL = "adminlogin.jsp";
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
                <h3></br>Cadastro Administrador</h3>

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
                                    <input type="text"  name="txtAdminCodigo" class="form-control">
                                </div>
                                </br></br>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1">Nome</label>
                                <div class="col-sm-4">
                                    <input type="text" name="txtAdminNome" class="form-control">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1">Sobrenome</label>
                                <div class="col-sm-6">
                                    <input type="text" name="txtAdminSobrenome" class="form-control">
                                </div>
                                </br></br>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1">Cpf</label>
                                <div class="col-sm-5">
                                    <input type="text" name="txtAdminCpf" class="form-control" placeholder="Ex.: 00011122233" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1">Data de Nascimento</label>
                                <div class="col-sm-5">
                                    <input type="date"  name="txtAdminDataNasc"  class="form-control" />
                                </div>
                                </br></br>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1">Cep:</label>
                                <div class="col-sm-5">
                                    <input name="cep" type="text" id="cep" value="" class="form-control" maxlength="9"
                                           onblur="pesquisacep(this.value);" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-1">Bairro:</label>
                                <div class="col-sm-5">
                                    <input name="bairro" type="text" id="bairro" class="form-control">
                                    </br>
                                </div>
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
                                    </br>
                                </div>
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
                                    </br>
                                </div> 

                            </div></br></br>

                            <div class="form-group">
                                <label class="col-sm-1">Telefone</label>
                                <div class="col-sm-5">
                                    <input type="text" name="txtAdminTelefone" class="form-control" placeholder="Ex.: 00111223344">
                                    <span class="help-block"></span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1">Sexo</label>
                                <div class="col-sm-5">
                                    <select name="txtAdminSexo" class="form-control" required/>
                                    <option value="M">Masculino</option>
                                    <option value="F">Feminino</option>
                                </select></br>
                                </div>  
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1">Email</label>
                                <div class="col-sm-6">
                                    <input type="text" name="txtAdminEmail" class="form-control" placeholder="Ex.: fulano@gmail.com">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1">Senha</label>
                                <div class="col-sm-4">
                                    <input type="password" name="txtAdminSenha" class="form-control" placeholder="Ex.: 12345678">
                                    </br>
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

    </section>


</body>
</html>

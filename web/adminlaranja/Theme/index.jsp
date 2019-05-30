<%@include file="cabecalhoindex.jsp" %>
    <style>
        #botao{
            width: 170px;
            height: 80px;

            display: inline-block;
            border-radius: 20px;        
            background-color: #AE0000;
            color: white;
            font-family: "Rubik", arial, sans-serif;
            font-weight: 500; 
            float: left;


        }

    </style>

    <body>

        <section id="container" >


            <!--sidebar end-->

            <!-- **********************************************************************************************************************************************************
            MAIN CONTENT
            *********************************************************************************************************************************************************** -->
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper site-min-height">
                    <hr>
                    <div class="row mt">
                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 desc">
                            <div class="project-wrapper">
                                <div class="project">
                                    <div class="redondo">
                                        <div class="photo">
                                            <img class="img-circle" src="assets/img/fotos/posto2.jpg" alt="" width="400px" height="400px" ></a>
                                            <!-- imagem da tela -->
                                        </div>
                                        <!--POSTO-->
                                        <form action="postocadastro.jsp">
                                            <button id="botao" class="btn btn-primary">Cadastro</button>
                                        </form>
                                        <form action="postolistagem.jsp">
                                            <button id="botao" class="btn btn-primary">Lista</button>
                                        </form>
                                        <div class="overlay"></div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- col-lg-4 -->
                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 desc">
                            <div class="project-wrapper">
                                <div class="project" >
                                    <div class="redondo">
                                        <div class="photo">
                                            <img class="img-circle" src="assets/img/fotos/medadmin1.jpg" alt=""width="400px" height="400px">
                                        </div>
                                        <!--MEDICAMENTO-->
                                        <form action="medcadastro.jsp">
                                            <button id="botao" class="btn btn-primary">Cadastro</button>
                                        </form>
                                        <form action="medlistagem.jsp">
                                            <button id="botao" class="btn btn-primary">Lista</button>
                                        </form>
                                        <div class="overlay"></div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- col-lg-4 -->
                    </div><!-- /row -->

                </section><! --/wrapper -->
            </section><!-- /MAIN CONTENT -->

            
    </body>
</html>
<%@include file="rodape.jsp" %>
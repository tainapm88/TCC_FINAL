<%@page import="java.util.List"%>
<%@page import="modelo.Medicamentos"%>
<%@page import="Dao.MedicamentosDAO"%>
<%@include file="cabecalho.jsp" %>

<html lang="en">
    <head>
        <title>Início - Site</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700,900|Rubik:300,400,700" rel="stylesheet">

        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">

        <link rel="stylesheet" href="fonts/ionicons/css/ionicons.min.css">
        <link rel="stylesheet" href="fonts/fontawesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <!-- Theme Style -->

    </head>
    <style>
        body{
            background-color: #FFD777;
            color: #FFD777;
        }
        #botao{
            width: 210px;
            height: 70px;
            border-width: 2px;
            border-style: solid;
            display: inline-block;
            border-radius: 25px;        
            background-color: #AE0000;
            color: white;
            font-family: "Rubik", arial, sans-serif;
            font-weight: 200; 
            text-align: center; 
            padding-top: 20px;
        }
        h1{
           font-family: "Stencil Std", fantasy;
           font-size: 600px;
        }
        
        p{
            font-family: "Optima", sans-serif;
        }
        

    </style>

    <section class="site-hero overlay" data-stellar-background-ratio="0.5" >
            <div class="container">
                <div class="row align-items-center site-hero-inner justify-content-center">
                    <div class="col-md-12 text-center">

                        <div class="mb-5 element-animate">
                            <h1>FacilitaSUS</h1>
                            <p>Breve descrição do sistema</p>
                            <p>
                                <a id="botao" href="postocidadepesquisa.jsp" class="btn btn-primary">Postos</a>
                                <a id="botao" href="medicamentolista.jsp" class="btn btn-primary">Medicamentos</a>
                           </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <script src="jquery-2.1.4.min.js"></script>
        <script src="jquery.validate.min.js"></script>
        <script>
            $(function () {
                $("#form_contato").validate();
            });
        </script>



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

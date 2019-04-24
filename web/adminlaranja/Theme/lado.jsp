<!DOCTYPE html>
<html lang="en">


  <body>

  <section id="container" >

      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><a href="profile.html"><img src="assets/img/friends/fr-05.jpg" class="img-circle" width="60"></a></p>
              	  <h5 class="centered">Administrador</h5>
              	  	
                  <li class="mt">
                      <a href="index.jsp">
                          <i class="fa fa-home" style="font-size:24px"></i>
                          <span>Início</span>
                      </a>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-medkit" style="font-size:24px"></i>
                          <span>Medicamentos</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="medcadastro.jsp">Cadastro</a></li>
                          <li><a  href="medlistagem.jsp">Listagem</a></li>
                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-hospital-o" style="font-size:24px;"></i>
                          <span>Postos</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="postocadastro.jsp">Cadastro</a></li>
                          <li><a  href="postolistagem.jsp">Listagem</a></li>
                      </ul>
                  </li>
                  
                  <li class="mt">
                      <a href="adminalterar.jsp">
                          <i class="fa fa-user" style="font-size:24px"></i>
                          <span>Perfil</span>
                      </a>
                  </li>
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>

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

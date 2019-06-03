<%@page import="Dao.MedicamentosDAO"%>
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
    
    Medicamentos obj = new Medicamentos();
    MedicamentosDAO meddao = new MedicamentosDAO();
    
    PostoDAO pdao = new PostoDAO();
    List<Posto> plistar = pdao.listar();
    Posto p = new Posto();


    
     if(request.getMethod().equals("POST")){

    if (request.getParameter("txtMedNome") != null) {
        obj.setMedcod(Integer.parseInt(request.getParameter("txtMedCodigo")));
        obj.setMednome(request.getParameter("txtMedNome"));
        obj.setMedbula(request.getParameter("txtMedBula"));
        obj.setMedqtdade(Double.parseDouble(request.getParameter("txtMedQuantidade")));
        obj.setMedfoto(request.getParameter("txtMedFoto"));
        
        p.setPostocod(Integer.parseInt(request.getParameter("txtPostoNome")));
        obj.setPostocod(p);

        Boolean resultado = meddao.incluir(obj);

        if (resultado) {
            msg = "Registro cadastrado com sucesso";
            classe = "alert-success";
        } else {
            msg = "Não foi possível cadastrar";
            classe = "alert-danger";
        }
        
         String redirectURL = "medlistagem.jsp";
        response.sendRedirect(redirectURL);
     
    } 
    
         meddao.fecharConexao();
        }
     
%>



  <body>

  <section id="container" >
      <!--CABEÇALHO-->
        
      <section id="main-content">
          <section class="wrapper">
              <h3></br> Cadastro - Medicamentos</h3>
                
                <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="../../UploadWS" method="post" enctype="multipart/form-data">
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
                    
                    <div class="form-group">
                        <div class="col-lg-12">
                              <label class="col-sm-1">Código</label>
                              <div class="col-sm-11">
                                  <input type="text"  name="txtMedCodigo" class="form-control">
                                  </br>
                              </div>
                         
                            <div class="form-group">
                                <label class="col-sm-1">Nome</label>
                                <div class="col-sm-7">
                                    <input type="text" name="txtMedNome" class="form-control">
                                </div>
                            </div>

                          <div class="form-group">
                              <label class="col-sm-1">Quantidade</label>
                              <div class="col-sm-3">
                                  <input type="text" name="txtMedQuantidade" class="form-control">
                                  </br>
                              </div>
                          </div>
                        
                                     
                             <div class="form-group">
                             <label class="col-sm-1">Posto</label>
                             <div class="col-sm-11">

                                 <select id="inputPosto" name="txtPostoNome" type="text" class="form-control" required placeholder="Selecione">
                                  
                                         <%
                                             for (Posto itemp : plistar) {
                                         %>
                                     <option value = "<%=itemp.getPostocod()%>">
                                         <%=itemp.getPostonome()%>
                                     </option>
                                     <%
                                         }
                                     %>
                                 
                                 </select>
                                     </br>
                             </div>        

                          <div class="form-group">
                                <label class="col-sm-1">Bula</label>
                                    <div class="col-sm-11">
                                        <textarea  name="txtMedBula" id="message" class="form-control " cols="30" rows="8">
                                        </textarea>
                                        </br>
                                    </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-1">Foto</label>
                              <div class="col-sm-11">
                                  <div class="form-group">
                                    <input class="form-control" type="file"  name="txtMedFoto"  required />
                                  </div>

                              </div>
                      
                          </div>
          		</div><!-- col-lg-12--> 
                        </div>
                         
          	</div>
                </div>            
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

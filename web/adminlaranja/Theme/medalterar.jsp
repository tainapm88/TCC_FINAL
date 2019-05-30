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
        obj.setMedcod(Integer.parseInt(request.getParameter("txtMedCodigo")));
        obj.setMednome(request.getParameter("txtMedNome"));
        obj.setMedbula(request.getParameter("txtMedBula"));
        obj.setMedqtdade(Double.parseDouble(request.getParameter("txtMedQuantidade")));
        obj.setMedfoto(request.getParameter("txtMedFoto"));
        
        p.setPostocod(Integer.parseInt(request.getParameter("txtPostoNome")));
        obj.setPostocod(p);
        
         if(request.getParameter("txtMedFoto")!=null)
            {
                obj.setMedfoto(request.getParameter("txtMedFoto"));
            }
            else
            {
                obj.setMedfoto(request.getParameter("txtFotoVelha"));
            }

                  
        Boolean resultado = meddao.alterar(obj);
        
     
        if (resultado) {
            response.sendRedirect("medlistagem.jsp");
        } else {
            msg = "Não foi possível cadastrar";
            classe = "alert-danger";
        }
        
         } else {
        //e GET
        if (request.getParameter("codigo") == null) {
            response.sendRedirect("medlistagem.jsp");
            return;
        }

        meddao = new MedicamentosDAO();
        obj = meddao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));

        if (obj == null) {
            response.sendRedirect("medlistagem.jsp");
            return;
        }
    }
     
   
     
%>




  <body>

  <section id="container" >
        
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> Alterar - Medicamentos</h3>
                
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
                                  <input type="text"  name="txtMedCodigo" class="form-control" readonly value="<%=obj.getMedcod()%>">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Nome</label>
                              <div class="col-sm-10">
                                  <input type="text" name="txtMedNome" class="form-control" readonly value="<%=obj.getMednome()%>">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Quantidade</label>
                              <div class="col-sm-10">
                                  <input type="text" name="txtMedQuantidade" class="form-control" required value="<%=obj.getMedqtdade()%>">
                              </div>
                          </div>
                                     
                             <div class="form-group">
                             <label class="col-sm-2 col-sm-2 control-label">Posto</label>
                             <div class="col-sm-10">

                                 <select type="text" name="txtPostoNome"  class="form-control" required placeholder="Selecione">
                                   
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
                             </div>
                              
                        <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Bula</label>
                            <div class="col-sm-10">
                               <TextArea class="form-control" name="txtMedBula" cols="30" rows="8" readonly><%=obj.getMedbula()%> </TextArea>
                        </div>
                        </div>
   
                          <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">Foto</label>
                            <div class="col-sm-10">
                                  <div class="form-group">
                                    <input class="form-control" type="file" name="txtMedFoto" id="arquivo1"  accept="image/*" />
                                    <input type="hidden" name="txtFotoVelha" value="<%=obj.getMedfoto()%>" />
                                    <td><img src="../../arquivos/<%=obj.getMedfoto()%>" id="img1" width="100" height="80"/></td>
                                  </div>

                              </div>
                          </div>
                      
                    </div>        
          		</div><!-- col-lg-12-->   
                         
          	</div><!-- /row -->
                
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


  </body>
</html>

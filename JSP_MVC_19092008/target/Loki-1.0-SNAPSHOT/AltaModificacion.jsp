<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:Plantilla>
    
    <jsp:attribute name="header">
    </jsp:attribute>
    
    <jsp:body>

        <section>
            <div class="container-fluid">

                <div class="row">
                    <div class="col-md-12">
                        <div class="vis-container">

                        <c:if test="${pdt != null}">
                            <form class="form-inline justify-content-center rounded mb-2 text-center bg-white" action="update" method="POST" >
                        </c:if>

                        <c:if test="${pdt == null}">
                            <form class="form-inline justify-content-center rounded mb-2 text-center bg-white" action="insert" method="POST" >
                        </c:if>

                            <div class="form-group col-12">
                                <label class="form-control-plaintext w-100 text-uppercase">

                                    <c:if test="${pdt != null}">
                                         Editar Producto
                                     </c:if>

                                     <c:if test="${pdt == null}">
                                         Agregar Producto
                                     </c:if>
                                </label>
                            </div>


                                <c:if test="${pdt != null}">			
                                    <input type="hidden" name="id_producto" value="<c:out value='${pdt.id_producto}' />" />		
                                </c:if>


                                <div class="form-group col-6">
                                    <input type="text" class="form-control-plaintext w-100 border bg-light mt-1 rounded " name="nombre_producto" placeholder="Nombre del producto" value="${pdt.nombre_producto}" required>
                                    <input type="text" class="form-control-plaintext w-100 border bg-light mt-1 rounded " name="precio_compra" placeholder="Precio de compra" value="${pdt.precio_compra}" required>
                                    <input type="text" class="form-control-plaintext w-100 border bg-light mt-1 rounded " name="precio_venta" placeholder="Precio de venta" value="${pdt.precio_venta}" required>
                                </div>

                                <div class="form-group col-6">
                                    <input type="text" class="form-control-plaintext w-100 border bg-light mt-1 rounded " name="marca" placeholder="Marca" value="${pdt.marca}" required>
                                    <input type="text" class="form-control-plaintext w-100 border bg-light mt-1 rounded " name="stock" placeholder="Stock" value="${pdt.stock}" required>
                                    <input type="text" class="form-control-plaintext w-100 border bg-light mt-1 rounded " name="medidas" placeholder="Medidas" value="${pdt.nombre_producto}" required>
                                </div>

                                <div class="form-group col-12">
                                    <input type="submit" name="accion" class="btn btn-dark w-100 mt-1 mb-2 text-uppercase" value="Save">
                                </div>
                            </form>

                        </div>
                    </div>

                </div>

            </div>
        </section>

    </jsp:body>
        
</t:Plantilla>
        
        
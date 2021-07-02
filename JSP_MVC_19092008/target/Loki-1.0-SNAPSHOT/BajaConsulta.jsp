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
                        <div id="line-chart-container" class="vis-container table-responsive">
		
                        <div class="container text-left mb-2 text-uppercase">
                            <a href="AltaModificacion.jsp" class="btn btn-dark w-100">Añadir Producto</a>
                        </div>

                            <table class="table table-striped table-hover table-bordered table-sm text-center">
                                <thead class="thead-dark">
                                    <tr>
                                        <th colspan="8" class="text-uppercase">Listado de productos</th>
                                    </tr>
                                    <tr class="text-uppercase">
                                        <th>Id</th>
                                        <th>Nombre</th>
                                        <th>Precio Compra</th>
                                        <th>Precio Venta</th>
                                        <th>Marca</th>
                                        <th>Stock</th>
                                        <th colspan="2" >Acciones</th>
                                    </tr>
                                </thead>

                                <tbody> 

                                    <c:forEach var="pdt" items="${listaProducto}">
                                        <tr>
                                            <td><c:out value="${pdt.id_producto}" /></td>
                                            <td><c:out value="${pdt.nombre_producto}" /></td>
                                            <td><c:out value="${pdt.precio_compra}" /></td>
                                            <td><c:out value="${pdt.precio_venta}" /></td>
                                            <td><c:out value="${pdt.marca}" /></td>
                                            <td><c:out value="${pdt.stock}" /></td> 
                                            <td><a href="edit?id_producto=<c:out value='${pdt.id_producto}' />">Editar</a></td>
                                            <td><a href="delete?id_producto=<c:out value='${pdt.id_producto}' />">Eliminar</a></td>	       
                                        </tr>

                                    </c:forEach>
                                </tbody>

                            </table>

                        </div>
                    </div>

                </div>

            </div>
        </section>

    </jsp:body>
        
</t:Plantilla>
        
        
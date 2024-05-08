<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page  import="Model.Entity.Product" %>
<%@page  import="java.util.ArrayList" %>
<%@page  import="Model.Entity.Category" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thanh Toán</title>

    </head>
    <body>

        <jsp:include page="/layout/Header.jsp"/> 

        <div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card">
                <div class="card-header">
                    <h2 class="text-center">Danh sách sản phẩm cần thanh toán</h2>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th scope="col">Tên sản phẩm</th>
                                    <th scope="col">Đơn giá</th>
                                    <th scope="col">Xuất xứ</th>
                                    <th scope="col">Số lượng</th>
                                    <th scope="col">Tổng tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listThanhToan}" var="product">
                                    <tr>
                                        <td>${product.getName()}</td>
                                        <td>${product.getPrice()}</td>
                                        <td>${product.getOrigin()}</td>
                                        <td>${product.getQuantity()}</td>
                                        <td>${product.getPrice() * product.getQuantity()}</td>
                                    </tr>
                                    <c:set var="total" value="${total + (product.getPrice() * product.getQuantity())}" />
                                </c:forEach>
                                <tr>
                                    <td colspan="4" class="text-center">Tổng tiền tất cả sản phẩm:</td>
                                    <td>${total}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="text-center mt-4">
                        <form action="BoxBilllController" method="post" class="d-inline mr-3">
                            <input type="hidden" name="action" value="thanhToan">
                            <button type="submit" class="btn btn-success">Thanh Toán</button>
                        </form>
                        <form action="BoxBilllController" method="post" class="d-inline">
                            <input type="hidden" name="action" value="huy">
                            <button type="submit" class="btn btn-danger">Hủy</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

                
                
        <jsp:include page="/pages/home/webfeature.jsp"/>
        <jsp:include page="/layout/footer.jsp"/>
    </body>
</html>

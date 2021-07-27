<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jspf" %>
	<section class="content">
        <div class="container my-3">
            <div class="row p-3">
                <div class="welcome">
                    <h2>Welcome, Ly Hung Phat! </h2>
                </div>
                <div class="date-block">
                    <div class="navbar navbar-expand-lg navbar-light">
                        <script>
                           let date = new Date();
                           date.toLocaleDateString();
                           document.write(date);
                        </script>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <div class="card shadow p-3 rounded ">
                        <div class="card-body ">
                            <div class="row align-items-center">
                                <div class="col-9">
                                    <h4>Customers</h4>
                                </div>
                                <div class="col-3">
                                    <i class="bi bi-people-fill " style="font-size:40px; color: #d87e70;"></i>
                                </div>
                            </div>

                        </div>
                        <span class="mx-4 p-0" style="font-size:40px">500</span>
                    </div>
                </div>
                <div class="col-3">
                    <div class="card shadow p-3 rounded ">
                        <div class="card-body ">
                            <div class="row align-items-center">
                                <div class="col-9">
                                    <h4>Sales</h4>
                                </div>
                                <div class="col-3 ">
                                    <i class="bi bi-wallet" style="font-size:40px; color: #d87e70;"></i>
                                </div>
                            </div>

                        </div>
                        <span class="mx-4 p-0" style="font-size:40px">14999 $</span>
                    </div>
                </div>
                <div class="col-3">
                    <div class="card shadow p-3 rounded ">
                        <div class="card-body  ">
                            <div class="row align-items-center">
                                <div class="col-9">
                                    <h4>Employees</h4>
                                </div>
                                <div class="col-3">
                                    <i class="bi bi-person-badge " style="font-size:40px; color: #d87e70;"></i>
                                </div>
                            </div>

                        </div>
                        <span class="mx-4 p-0" style="font-size:40px">100</span>
                    </div>
                </div>
                <div class="col-3">
                    <div class="card shadow p-3 rounded ">
                        <div class="card-body ">
                            <div class="row align-items-center">
                                <div class="col-9">
                                    <h4>Orders</h4>
                                </div>
                                <div class="col-3">
                                    <i class="bi bi-receipt " style="font-size:40px; color: #d87e70;"></i>
                                </div>
                            </div>

                        </div>
                        <span class="mx-4 p-0" style="font-size:40px">500</span>
                    </div>
                </div>
            </div>
            <div class="row my-3">
                <div class="col-6">
                    <div class="card rounded shadow p-3">
                        <canvas id="myChart"></canvas>
                    </div>

                </div>
                <div class="col-6">
                    <div class="card rounded shadow p-3">
                        <canvas id="chart-line"></canvas>
                    </div>

                </div>
            </div>
           
        </div>
    </section>
<%@include file="../common/footer.jspf" %>
	
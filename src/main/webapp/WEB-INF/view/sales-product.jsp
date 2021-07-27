<%@include file="../common/header.jspf" %>
 <section class="content">

        <div class="container my-3">
            <div class="row p-3">
                <div class="welcome">
                    <h2> Product Management </h2>
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
            <div class="row p-3">
                <div class="card rounded shadow p-3">
                    <div class="row p-3">
                        <div class="logo" style="font-size: 25px!important">New Product</div>
                    </div>
                    <div class="row p-3">
                        <div class="col-4">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingInput" placeholder="Product name">
                                <label class="text-muted" for="floatingInput ">Product name</label>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingInput" placeholder="Product quantity">
                                <label class="text-muted" for="floatingInput ">Product quantity</label>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingInput" placeholder="Product price">
                                <label class="text-muted" for="floatingInput ">Product price</label>
                            </div>
                        </div>
                        <div class="col-12 ">
                            <div class="form-floating mb-3">
                                <textarea class="form-control" placeholder="Address" id="floatingTextarea"></textarea>
                                <label for="floatingTextarea">Product description</label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-floating">
                                <select class="form-select" id="floatingSelect" aria-label="Floating label select example">
                                  <option selected>-- Select --</option>
                                  <option value="1">One</option>
                                  <option value="2">Two</option>
                                  <option value="3">Three</option>
                                </select>
                                <label for="floatingSelect">Quote name</label>
                              </div>
                        </div>
                        <div class="col-6">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingInput" placeholder="Quote status" value="Active"disabled>
                                <label class="text-muted" for="floatingInput ">Quote status</label>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-floating mb-3">
                                <textarea class="form-control" placeholder="Address" id="floatingTextarea" disabled >sadsadsadsadsadsd</textarea>
                                <label for="floatingTextarea">Quote description</label>
                            </div>
                        </div>
                        <div class="col-12 mx-2">
                            <label class="form-label" for="">Active</label>
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
                             </div>
                        </div>
                        <div class="col-4 my-3 p-3">
                            <a href="#" class=" btn myBtn rounded "> <i class="bi bi-check2-circle"></i> Submit </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row my-3">
                <div class="col-12">
                    <div class="card rounded shadow  ">
                        <div class="card-header align-items-center mb-0 ">
                            <div class="row p-3 ">
                                <div class="col-4">
                                    <div class="logo" style="font-size: 25px!important">List of Products</div>
                                </div>
                                <div class="col-4">
                                    <div class="search-block">
                                        <input class="form-control rounded " style="padding-left: 35px;" type="search"
                                            placeholder="Search.." aria-label="Search">
                                        <i class="bi bi-search" style="position: relative;
                                            top: -32px;
                                            left: 10px;"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="row p-2 align-items-center ">
                                <div class="col-6">
                                    <div class="filter-block d-flex ">
                                        <div class="show-block me-2">
                                            <label> Show </label>
                                            <select name="" id="">
                                                <option value="All"> All </option>
                                            </select>
                                        </div>
                                        <div class="sort-block">
                                            <label> Sort By </label>
                                            <select name="" id="">
                                                <option value="Ascending"> Ascending </option>
                                                <option value="Descending"> Descending </option>
                                            </select>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="function-block float-end">
                                        <a href="#" class="btn bg-main-color"><i class="bi bi-bar-chart"></i></a>
                                        <a href="#" class="btn btn-primary"><i class="bi bi-folder-symlink"></i></a>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                           <div class="table-responsive">
                            <table class="myTable align-items-center text-center">
                                <thead>
                                    <tr>
                                        <th scope="col">
                                            <input type="checkbox">
                                        </th>
                                        <th scope="col">No.</th>
                                        <th scope="col">Product name</th>
                                        <th scope="col">Product quantity</th>
                                        <th scope="col">Product price</th>
                                        <th scope="col">Product description</th>
                                        <th scope="col">Quote name</th>
                                        <th scope="col">Quote description</th>
                                        <th scope="col">Quote status</th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>1</td>
                                        <td>Sua milo</td>
                                        <td>300</td>
                                        <td>20 </td>
                                        <td>ngon bo re giau chat dinh duong</td>
                                        <td>Quote 1</td>
                                        <td>23/23 Hoa Binh, Tan Phu, hcm city</td>
                                        <td><span class="badge" style="background-color:#d87093">Active</span></td>
                                        <td>
                                            <a href="#"> <small> Edit </small></a>
                                            <a href="#"> <small> Delete </small></a>
                                        </td>
                                    </tr>
                                </tbody>
                        </table>
                           </div>
                        </div>
                        <div class="col-12">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination p-3 my-3 float-end ">
                                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<%@include file="../common/footer.jspf" %>
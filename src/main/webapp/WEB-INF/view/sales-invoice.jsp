<%@include file="../common/header.jspf" %>
  <section class="content">

        <div class="container my-3">
            <div class="row p-3">
                <div class="welcome">
                    <h2> Invoice Management </h2>
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
                        <div class="logo" style="font-size: 25px!important">New Invoice</div>
                    </div>
                    <div class="row p-3">
                        <div class="col-2">
                            <div class="form-floating">
                                <select class="form-select" id="floatingSelect"
                                    aria-label="Floating label select example">
                                    <option selected> -- Select --</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                </select>
                                <label for="floatingSelect">Order Id</label>
                            </div>
                        </div>
                        <div class="col-2">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingInput"
                                    placeholder="Product quantity" value="Phatly2001" disabled>
                                <label class="text-muted" for="floatingInput ">Account</label>
                            </div>
                        </div>
                        <div class="col-2">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingInput"
                                    placeholder="Product quantity" value="Ly Hung Phat" disabled>
                                <label class="text-muted" for="floatingInput ">Customer name</label>
                            </div>
                        </div>
                        <div class="col-2">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingInput" placeholder="Product price"
                                    value="0909123456" disabled>
                                <label class="text-muted" for="floatingInput ">Phone number</label>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingInput" placeholder="Product price"
                                    value="phatly2001@gmail.com" disabled>
                                <label class="text-muted" for="floatingInput ">Email</label>
                            </div>
                        </div>

                        <div class="col-12 ">
                            <div class="form-floating mb-3">
                                <textarea class="form-control" placeholder="Address" id="floatingTextarea"
                                    disabled>23/23 Hoa Binh , Tan Phu , Ho Chi Minh city</textarea>
                                <label for="floatingTextarea">Address</label>
                            </div>
                        </div>
                        <div class="col-3">

                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingInput" placeholder="Product price"
                                    value="sua milo" disabled>
                                <label class="text-muted" for="floatingInput ">Product name</label>
                            </div>

                        </div>
                        <div class="col-3">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingInput" placeholder="Product price"
                                    value="200" disabled>
                                <label class="text-muted" for="floatingInput ">Product price</label>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="form-floating mb-3">
                                <input type="number" class="form-control" id="floatingInput" placeholder="Product price"
                                    value="2" disabled>
                                <label class="text-muted" for="floatingInput ">Quantity</label>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="form-floating mb-3">
                                <input type="number" class="form-control" id="floatingInput" placeholder="Product price"
                                    value="400" disabled>
                                <label class="text-muted" for="floatingInput ">Total price</label>
                            </div>
                        </div>
                        <div class="col-12 ">
                            <div class="form-floating mb-3">
                                <textarea class="form-control" placeholder="Address" id="floatingTextarea"
                                    disabled>23/24 Hoa Binh , Tan Phu, Ho Chi Minh city</textarea>
                                <label for="floatingTextarea">Product description</label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-floating">
                                <input type="date" class="form-control" id="floatingInput" placeholder="Invoice date">
                                <label class="text-muted" for="floatingInput ">Invoice date</label>
                            </div>
                        </div>
                        <div class="col-6">
                            <label class="form-label" for="">Active</label>
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
                            </div>
                        </div>
                        <div class="col-12 my-3 p-3">
                            <a href="#" class=" btn myBtn rounded "> <i class="bi bi-check2-circle"></i> Submit </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row my-3">
                <div class="col-12">
                    <div class="card rounded shadow p-3  ">
                        <div class="card-header align-items-center mb-0 ">
                            <div class="row p-2  ">
                                <div class="col-4">
                                    <div class="logo" style="font-size: 25px!important">List of Invoices</div>
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
                            <table class="myTable">
                                <thead>
                                    <tr>
                                        <th scope="col">
                                            <input type="checkbox">
                                        </th>
                                        <th scope="col">No.</th>
                                        <th scope="col">Order Id</th>
                                        <th scope="col">Account</th>
                                        <th scope="col">Customer name</th>
                                        <th scope="col">Phone number</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Address</th>
                                        <th scope="col">Product name</th>
                                        <th scope="col">Product description</th>
                                        <th scope="col">Product price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Total price</th>
                                        <th scope="col">Order status</th>
                                        <th scope="col">Invoice date</th>
                                        <th scope="col">Invoice status</th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody class="text-center">
                                    <tr>
                                        <td scope="row"><input type="checkbox"></td>
                                        <td scope="row">1</td>
                                        <td scope="row">ms001</td>
                                        <td>phatly2001</td>
                                        <td>Ly Hung Phat</td>
                                        <td>0909123456</td>
                                        <td>phatly2001@gmail.com</td>
                                        <td>23/23 Hoa Binh, Tan Phu, hcm city</td>
                                        <td>Sua milo</td>
                                        <td>Thom ngon bo duong </td>
                                        <td>200</td>
                                        <td>2</td>
                                        <td>400</td>
                                        <td><span class="badge" style="background-color:#d87093">Active</span></td>
                                        <td>12/09/2021</td>
                                        <td><span class="badge" style="background-color:#d87093">Active</span></td>
                                        <td>
                                            <a href="#"> <small> Edit </small></a>
                                            <a href="#"> <small> Delete </small></a>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>1</td>
                                        <td>ms001</td>
                                        <td>phatly2001</td>
                                        <td>Ly Hung Phat</td>
                                        <td>0909123456</td>
                                        <td>phatly2001@gmail.com</td>
                                        <td>23/23 Hoa Binh, Tan Phu, hcm city</td>
                                        <td>Sua milo</td>
                                        <td>Thom ngon bo duong </td>
                                        <td>200</td>
                                        <td>2</td>
                                        <td>400</td>
                                        <td><span class="badge" style="background-color:#d87093">Active</span></td>
                                        <td>12/09/2021</td>
                                        <td><span class="badge" style="background-color:#d87093">Active</span></td>
                                        <td>
                                            <a href="#"> <small> Edit </small></a>
                                            <a href="#"> <small> Delete </small></a>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>1</td>
                                        <td>ms001</td>
                                        <td>phatly2001</td>
                                        <td>Ly Hung Phat</td>
                                        <td>0909123456</td>
                                        <td>phatly2001@gmail.com</td>
                                        <td>23/23 Hoa Binh, Tan Phu, hcm city</td>
                                        <td>Sua milo</td>
                                        <td>Thom ngon bo duong </td>
                                        <td>200</td>
                                        <td>2</td>
                                        <td>400</td>
                                        <td><span class="badge" style="background-color:#d87093">Active</span></td>
                                        <td>12/09/2021</td>
                                        <td><span class="badge" style="background-color:#d87093">Active</span></td>
                                        <td>
                                            <a href="#"> <small> Edit </small></a>
                                            <a href="#"> <small> Delete </small></a>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>1</td>
                                        <td>ms001</td>
                                        <td>phatly2001</td>
                                        <td>Ly Hung Phat</td>
                                        <td>0909123456</td>
                                        <td>phatly2001@gmail.com</td>
                                        <td>23/23 Hoa Binh, Tan Phu, hcm city</td>
                                        <td>Sua milo</td>
                                        <td>Thom ngon bo duong </td>
                                        <td>200</td>
                                        <td>2</td>
                                        <td>400</td>
                                        <td><span class="badge" style="background-color:#d87093">Active</span></td>
                                        <td>12/09/2021</td>
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
<%@include file="../common/header.jspf" %>
 <section class="content">
        <div class="container my-3">
            
            <div class="row p-3">
                <div class="welcome">
                    <h2>Contact Management </h2>
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
            <div class="row my-3">
                <div class="col-12">
                    <div class="card rounded shadow  ">
                        <div class="card-header align-items-center mb-0 ">
                            <div class="row p-3 ">
                                <div class="col-4">
                                    <div class="logo" style="font-size: 25px!important">Contact List</div>
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
                                        <th scope="col">Name</th>
                                        <th scope="col">Job</th>
                                        <th scope="col">D.O.B</th>
                                        <th scope="col">Contact</th>
                                        <th scope="col">Address</th>
                                        <th scope="col"></th>
                                       
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>1</td>
                                        <td><img src="assets/img/dog.jpeg"
                                            width="30" height="30" class="rounded me-2" alt="...">Ly Hung Phat</td>
                                        <td>front-end developer</td>
                                        <td>12/09/2001</td>
                                        <td>
                                            <span><i class="bi bi-telephone"> 0909123456 </i> </span> <br>
                                            <span><i class="bi bi-envelope"> phatly2001@gmail.com </i></span>
                                        </td>
                                        <td>23/23 Hoa Binh, Tan Phu, hcm city</td>
                                        
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
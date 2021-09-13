<%@include file="../common/header.jspf"%>
<section class="content">

	<div class="container my-3">
		<div class="row p-3">
			<div class="welcome">
				<h2>Product Management</h2>
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
					<div class="logo" style="font-size: 25px !important">New
						Product</div>
				</div>
				<div class="row p-3">
					<div class="col-4">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="productName"
								placeholder="Product name" required> <label class="text-muted"
								for="floatingInput ">Product name</label>
						</div>
					</div>
					<div class="col-4">
						<div class="form-floating mb-3">
							<input type="number" class="form-control" id="productQuantity"
								placeholder="Product quantity" required> <label
								class="text-muted" for="floatingInput ">Product quantity</label>
						</div>
					</div>
					<div class="col-4">
						<div class="form-floating mb-3">
							<input type="number" class="form-control" id="productPrice"
								placeholder="Product price" required> <label class="text-muted"
								for="floatingInput ">Product price</label>
						</div>
					</div>
					<div class="col-12 ">
						<div class="form-floating mb-3">
							<textarea class="form-control" placeholder="Description"
								id="productDetail"></textarea>
							<label for="floatingTextarea">Product description</label>
						</div>
					</div>
					<div class="col-12">
						<div class="form-floating">
							<select class="form-select" id="productQuote"
								aria-label="Floating label select example">
								<c:forEach var="item" items="${quotes}">
									<option value="${item.quote_id}">${item.quoteName}</option>
								</c:forEach>
							</select>
							<label for="floatingSelect">Quote</label>							
						</div>
					</div>


					<div class="col-12 mx-2">
						<label class="form-label" for="">Active</label>
						<div class="form-check form-switch">
							<input class="form-check-input" type="checkbox"
								id="productActive">
						</div>
					</div>
					<div class="col-4 my-3 p-3">
						<button id="productCreate" class=" btn myBtn rounded ">
							<i class="bi bi-check2-circle"></i> Submit
						</button>
					</div>
				</div>
			</div>
		</div>
<div id="productError"></div>
		<div class="row my-3">
			<div class="col-12">
				<div class="card rounded shadow  ">
					<div class="card-header align-items-center mb-0 ">
						<div class="row p-3 ">
							<div class="col-4">
								<div class="logo" style="font-size: 25px !important">List
									of Products</div>
							</div>
							<div class="col-4">
								<div class="search-block">
									<input class="form-control rounded " id="productSearch"
										style="padding-left: 35px;" type="search"
										placeholder="Search.." aria-label="Search"> <i
										class="bi bi-search"
										style="position: relative; top: -32px; left: 10px;"></i>
								</div>
							</div>
						</div>
						<div class="row p-2 align-items-center ">
							<div class="col-6">
								<div class="filter-block d-flex ">
									<div class="show-block me-2">
										<label> Show </label> <select name="" id="">
											<option value="All">All</option>
										</select>
									</div>
									<div class="sort-block">
										<label> Sort By </label> <select name="" id="">
											<option value="Ascending">Ascending</option>
											<option value="Descending">Descending</option>
										</select>
									</div>

								</div>
							</div>

						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="myTable align-items-center text-center scroll"
								id="productTable">
								<thead>
									<tr>
										<th scope="col">Product name</th>
										<th scope="col">Product quantity</th>
										<th scope="col">Product price</th>
										<th scope="col">Product description</th>
										<th scope="col">Quote name</th>
										<th scope="col">Status</th>
										<th scope="col">Action</th>
									</tr>
								</thead>
								<tbody id="productTableRow">
									<c:forEach var="item" items="${products}">
										<tr id="o${item.product_id}">
											<td>${item.productName}</td>
											<td>${item.productQuantity}</td>
											<td>${item.productPrice}</td>
											<td>${item.productDetail}</td>
											<td>${item.quote.quoteName}</td>

											<c:if test="${ item.productStatus eq true}">
												<td style="color: green">Active</td>
											</c:if>

											<c:if test="${ item.productStatus eq false}">
												<td style="color: red">Inactive</td>
											</c:if>

											<td>
												<button class="button-link productEdit"
													id="p${item.product_id}" data-bs-toggle="modal"
													data-bs-target="#productEditForm">
													<small> Edit </small>
												</button>
												<button class="button-link productDelete"
													id="p${item.product_id}">
													<small> Delete </small>
												</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Modal Edit-->
<div class="modal fade" id="productEditForm" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1" aria-labelledby="productEditLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="productEditLabel">Edit Product</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<div class="row p-3">
					<!-- product id -->
					<input type="hidden" id="productId">
					<div class="col-12">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="productEditName"
								placeholder="Name" readonly> <label class="text-muted"
								for="floatingInput ">Product Name</label>
						</div>
					</div>
					<div class="form-floating mb-3">
							<input type="number" class="form-control" id="productEditQuantity"
								placeholder="Quantity" required> <label class="text-muted"
								for="floatingInput ">Product Quantity</label>
						</div>
						<div class="form-floating mb-3">
							<input type="number" class="form-control" id="productEditPrice"
								placeholder="Price" required> <label class="text-muted"
								for="floatingInput ">Product Price</label>
						</div>
					<div class="form-floating mb-3">
						<textarea class="form-control" placeholder="Description"
							id="productEditDetail"></textarea>
						<label class="text-muted" for="floatingTextarea">Product
							Description</label>
					</div>
						<div class="form-floating mb-3">
							<select class="form-select" id="productEditQuote"
								aria-label="Floating label select example">
								<c:forEach var="item" items="${quotes}">
									<option value="${item.quote_id}">${item.quoteName}</option>
								</c:forEach>
							</select>
							<label for="floatingSelect">Quote</label>							
						</div>
					<div class="col-12 p-3">
						<label class="form-label" for="">Active</label>
						<div class="form-check form-switch">
							<input class="form-check-input" type="checkbox"
								id="productEditActive">
						</div>
					</div>
				</div>

			</div>
			<div class="modal-footer">
				<div class="row">
					<div class="col">
						<button type="button" class="btn btn-secondary btn-lg"
							data-bs-dismiss="modal">Close</button>
					</div>
					<div class="col">
						<button id="productEditSave" type="button"
							class="btn btn-primary btn-lg">Save</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="../common/footer.jspf"%>
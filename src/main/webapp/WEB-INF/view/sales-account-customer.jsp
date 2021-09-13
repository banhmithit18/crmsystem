<%@include file="../common/header.jspf"%>
<section class="content">
	<div class="container my-3">
		<div class="row p-3">
			<div class="welcome">
				<h2>Account Management</h2>
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
		<div id="accountError"></div>
		<div class="row my-3">
			<div class="col-12">
				<div class="card rounded shadow  ">
					<div class="card-header align-items-center mb-0 ">
						<div class="row p-3 ">
							<div class="col-4">
								<div class="logo" style="font-size: 25px !important">List
									of Customers</div>
							</div>
							<div class="col-4">
								<div class="search-block">
									<input class="form-control rounded " id="accountSearch"
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
								id="accountTable">
								<thead>
									<tr>
										<th scope="col">Name</th>
										<th scope="col">Age</th>
										<th scope="col">Job</th>
										<th scope="col">Phone number</th>
										<th scope="col">Email</th>
										<th scope="col">Address</th>
										<th scope="col">Edit</th>
									</tr>
								</thead>
								<tbody id="leadTableRow">
									<c:forEach var="item" items="${accounts}">
										<tr id="a${item.account_id}" class="l${item.lead.lead_id}">
											<td style="display: none;">${item.leadId}</td>
											<td>${item.lead.leadName}</td>
											<td>${item.lead.leadAge}</td>
											<td>${item.lead.leadJob}</td>
											<td>${item.lead.leadPhone}</td>
											<td>${item.lead.leadEmail}</td>
											<td>${item.lead.leadAddress}</td>
											<td><button class="button-link accountEditForm"
													id="a${item.account_id}" data-bs-toggle="modal"
													data-bs-target="#accountEdit">
													<small> Edit </small>
												</button>
												<button class="button-link accountOrderForm"
													id="a${item.account_id}" data-bs-toggle="modal"
													data-bs-target="#accountOrder">
													<small> Order </small>
												</button>
												<button class="button-link accountHistoryTable"
													id="a${item.account_id}" data-bs-toggle="modal"
													data-bs-target="#accountHistory">
													<small> Order History </small>
												</button>
												<button class="button-link accountContact"
													id="a${item.account_id}" data-bs-toggle="modal"
													data-bs-target="#accountContact">
													<small> Contact </small>
												</button>
												<button class="button-link accountDelete"
													id="a${item.account_id}">
													<small> Delete </small>
												</button></td>
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


<!-- Modal add contact-->
<div class="modal fade" id="accountContact" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="accountContactLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="accountContactLabel">Add Contact</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="row p-3">
					
						<div class="row p-3">
							<div class="logo" style="font-size: 25px !important">Add
								Contact</div>
						</div>
						<div class="row p-3">
							<div class="col-6">
								<div class="form-floating mb-3">
									<input type="text" class="form-control" id="contactName"
										placeholder="Name" required> <label
										class="text-muted" for="floatingInput ">Name</label>
								</div>
							</div>
		
							<div class="col-3">
								<div class="form-floating mb-3">
									<input type="text" class="form-control" id="contactJob"
										placeholder="Job" required> <label class="text-muted"
										for="floatingInput ">Job</label>
								</div>
							</div>
							<div class="col-3">
								<div class="form-floating">
									<input type="number" class="form-control" id="contactAge"
										placeholder="Age"> <label class="text-muted"
										for="floatingInput ">Age</label>
								</div>
							</div>
							<div class="col-3">
								<div class="form-floating mb-3">
									<input type="text" class="form-control" id="contactPhone"
										placeholder="Phone Number" required> <label
										class="text-muted" for="floatingInput ">Phone number</label>
								</div>
							</div>
							<div class="col-9">
								<div class="form-floating mb-3">
									<input type="text" class="form-control" id="contactEmail"
										placeholder="Example@gmail.com" required> <label
										class="text-muted" for="floatingInput ">Email</label>
								</div>
							</div>
							<div class="col-12 ">
								<div class="form-floating">
									<textarea class="form-control" placeholder="Address"
										id="contactAddress"></textarea>
									<label for="floatingTextarea">Address</label>
								</div>
							</div>
							<div class="col-4 my-3 p-3">
								<button id="contactCreate" class=" btn myBtn rounded ">
									<i class="bi bi-check2-circle"></i> Submit
								</button>
							</div>
						</div>
					
				</div>
				<div id="addContractError"></div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- Modal order Table-->
<div class="modal fade" id="accountHistory" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="accountHistoryLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="accountHistoryLabel">Order History
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table class="myTable align-items-center text-center scrollModal">
					<thead>
						<tr>
							<th scope="col">Product Name</th>
							<th scope="col">Quantity</th>
							<th scope="col">Total</th>
							<th scope="col">Order Date</th>
						</tr>
					</thead>
					<tbody id="tableHistory">
					</tbody>
				</table>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- Order -->
<div class="modal fade" id="accountOrder" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="accountOrderLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="accountOrderLabel">Order</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<div class="row p-3">
					<div class="col-12">
						<div class="form-floating mb-3">
							<select class="form-select" id="productId"
								aria-label="Floating label select">
								<c:forEach var="item" items="${products}">
									<option id="p${item.product_id}" value="${item.productPrice}">${item.productName}</option>
								</c:forEach>
							</select> <label for="floatingSelect">Product</label>
						</div>
					</div>
					<div class="col-12">
						<div class="form-floating mb-3">
							<input type="number" class="form-control" id="productQuantity"
								placeholder="Quantity" required value="1"> <label
								class="text-muted" for="floatingInput ">Quantity</label>
						</div>
					</div>
					<hr>
					<div class="col-8">Total</div>
					<div id="productTotal" class="col-4">
						1 <span> VND</span>
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
						<button id="accountOrderSave" type="button"
							class="btn btn-primary btn-lg">Order</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- product id -->
<input type="hidden" id="accountId">
<!-- Edit  -->
<div class="modal fade" id="accountEdit" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="accountEditLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="accountEditLabel">Edit Account</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<input type="hidden" id="leadEditId">
				<div class="row p-3">
					<div class="col-12">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="leadEditName"
								placeholder="Full Name" required> <label
								class="text-muted" for="floatingInput ">Full Name</label>
						</div>
					</div>
					<div class="col-6">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="leadEditJob"
								placeholder="Job"> <label class="text-muted"
								for="floatingInput ">Job</label>
						</div>
					</div>
					<div class="col-6">
						<div class="form-floating">
							<input type="number" class="form-control" id="leadEditAge"
								placeholder="Age"> <label class="text-muted"
								for="floatingInput ">Age</label>
						</div>
					</div>
					<div class="col-12">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="leadEditPhone"
								placeholder="Phone Number" disabled> <label
								class="text-muted" for="floatingInput ">Phone number</label>
						</div>
					</div>
					<div class="col-12">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="leadEditEmail"
								placeholder="Example@gmail.com" disabled> <label
								class="text-muted" for="floatingInput ">Email</label>
						</div>
					</div>
					<div class="col-12 ">
						<div class="form-floating">
							<input class="form-control" placeholder="Address"
								id="leadEditAddress"></input> <label for="floatingInput">Address</label>
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
						<button id="accountEditSave" type="button"
							class="btn btn-primary btn-lg">Save</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="../common/footer.jspf"%>
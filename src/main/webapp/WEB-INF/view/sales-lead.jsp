<%@include file="../common/header.jspf"%>
<section class="content">
	<div class="container my-3">
		<div class="row p-3">
			<div class="welcome">
				<h2>Lead Management</h2>
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
					<div class="logo" style="font-size: 25px !important">Add Lead</div>
				</div>
				<div class="row p-3">
					<div class="col-6">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="leadFirstName"
								placeholder="First name" required> <label
								class="text-muted" for="floatingInput ">First name</label>
						</div>
					</div>
					<div class="col-6">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="leadLastName"
								placeholder="Last name" required> <label
								class="text-muted" for="floatingInput ">Last name</label>
						</div>
					</div>
					<div class="col-3">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="leadJob"
								placeholder="Job" required> <label class="text-muted"
								for="floatingInput ">Job</label>
						</div>
					</div>
					<div class="col-3">
						<div class="form-floating">
							<input type="number" class="form-control" id="leadAge"
								placeholder="Age"> <label class="text-muted"
								for="floatingInput ">Age</label>
						</div>
					</div>
					<div class="col-3">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="leadPhone"
								placeholder="Phone Number" required> <label
								class="text-muted" for="floatingInput ">Phone number</label>
						</div>
					</div>
					<div class="col-3">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="leadEmail"
								placeholder="Example@gmail.com" required> <label
								class="text-muted" for="floatingInput ">Email</label>
						</div>
					</div>
					<div class="col-12 ">
						<div class="form-floating">
							<textarea class="form-control" placeholder="Address"
								id="leadAddress"></textarea>
							<label for="floatingTextarea">Address</label>
						</div>
					</div>
					<div class="col-4 my-3 p-3">
						<button id="leadCreate" class=" btn myBtn rounded ">
							<i class="bi bi-check2-circle"></i> Submit
						</button>
					</div>
				</div>
			</div>
		</div>
		<div id="leadError"></div>
		<div class="row my-3">
			<div class="col-12">
				<div class="card rounded shadow  ">
					<div class="card-header align-items-center mb-0 ">
						<div class="row p-3 ">
							<div class="col-4">
								<div class="logo" style="font-size: 25px !important">List
									of Leads</div>
							</div>
							<div class="col-4">
								<div class="search-block">
									<input class="form-control rounded " id="leadSearch"
										style="padding-left: 35px;" type="search"
										placeholder="Search.." aria-label="Search" id="leadSearch">
									<i class="bi bi-search"
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
								id="leadTable">
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
									<c:forEach var="lead" items="${leads}">
										<tr id="l${lead.lead_id}">
											<td>${lead.leadName}</td>
											<td>${lead.leadAge}</td>
											<td>${lead.leadJob}</td>
											<td>${lead.leadPhone}</td>
											<td>${lead.leadEmail}</td>
											<td>${lead.leadAddress}</td>
											<td><button class="button-link leadEditForm"
													id="l${lead.lead_id}" data-bs-toggle="modal"
													data-bs-target="#leadEdit">
													<small> Edit </small>
												</button>
												<button class="button-link leadOpportunityTable"
													id="l${lead.lead_id}" data-bs-toggle="modal"
													data-bs-target="#leadOpportunity">
													<small> Opportunity </small>
												</button>
												<button class="button-link leadOrderForm" id="l${lead.lead_id}"data-bs-toggle="modal"
													data-bs-target="#leadOrder">
													<small> Order </small>
												</button>
												<button class="button-link leadDelete" id="l${lead.lead_id}">
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

<!-- Modal Opportunity Table-->
<div class="modal fade" id="leadOpportunity" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="leadOpportunityLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="leadOpportunityLabel">Lead
					Opportunities</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div id="leadOportunityError"></div>
				<table class="myTable align-items-center text-center scrollModal"
					id="leadOpportunityTable">
					<thead>
						<tr>
							<th scope="col">Name</th>
							<th scope="col">Detail</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody id="tableOpportunity">
					</tbody>
				</table>

			</div>
			<div class="modal-footer">
				<button type="button" id="OpenLeadOpportunityForm"
					class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#addLeadOpportunityForm">Add Opportunity</button>
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- Modal Add Opportunity for Lead-->
<div class="modal fade" id="addLeadOpportunityForm"
	data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="addLeadOpportunityLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="addLeadOpportunityLabel">Add
					Opportunity</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<div class="row p-3">
					<input type="hidden" id="leadId" name="leadId" value="">
					<div class="col-12">
						<div class="form-floating mb-3">
							<select class="form-select" id="opportunitySelect"
								aria-label="Select opportunity">
								<c:forEach var="item" items="${opportunities}">
									<option id="o${item.opportunity_id}" selected>${item.opportunityName}</option>
									<!-- get detail value -->
									<c:set var="opportunityDetailValue"
										value="${item.opportunityDetail}" />
									<!-- set opportunity id -->
									<c:set var="opportunityIdValue" value="${item.opportunity_id}" />
								</c:forEach>
							</select> <label class="text-muted" for="floatingInput">Opportunity
								Name</label>
						</div>
					</div>
					<input type="hidden" id="opportunityId" name="opportunity"
						value="<c:out value="${opportunityIdValue}"/>">
					<div class="col-12">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="opportunityDetail"
								placeholder="Detail" readonly
								value="<c:out value="${opportunityDetailValue}"/>"> <label
								class="text-muted" for="floatingInput ">Detail</label>
						</div>
					</div>

				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
				<button id="addLeadOpportunity" type="button"
					class="btn btn-primary">Save</button>
			</div>
		</div>
	</div>
</div>
<!-- Modal Edit lead-->
<div class="modal fade" id="leadEdit" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1" aria-labelledby="leadEditLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="leadEditLabel">Edit Lead</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

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
						<button id="leadEditSave" type="button"
							class="btn btn-primary btn-lg">Save</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Order -->
<div class="modal fade" id="leadOrder" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="leadOrderLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="leadOrderLabel">Order</h5>
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
					<div id="productTotal" class="col-4">1
						 <span> VND</span>
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
						<button id="leadOrderSave" type="button"
							class="btn btn-primary btn-lg">Order</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="../common/footer.jspf"%>
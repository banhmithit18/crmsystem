<%@include file="../common/header.jspf"%>
<section class="content">
	<div class="container my-3">

		<div class="row p-3">
			<div class="welcome">
				<h2>Contact Management</h2>
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
		<div id="contactError"></div>
		<div class="row my-3">
			<div class="col-12">
				<div class="card rounded shadow  ">
					<div class="card-header align-items-center mb-0 ">
						<div class="row p-3 ">
							<div class="col-4">
								<div class="logo" style="font-size: 25px !important">Contact
									List</div>
							</div>
							<div class="col-4">
								<div class="search-block">
									<input class="form-control rounded" id="contactSearch"
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
								id="contactTable">
								<thead>
									<tr>
										<th scope="col">Name</th>
										<th scope="col">Age</th>
										<th scope="col">Job</th>
										<th scope="col">Phone Number</th>
										<th scope="col">Email</th>
										<th scope="col">Address</th>
										<th scope="col">Account</th>
										<th scope="col">Action</th>
									</tr>
								</thead>
								<tbody id="contactTableRow">
									<c:forEach var="item" items="${contacts}">
										<tr id="c${item.contact_id}">
											<td>${item.contactName}</td>
											<td>${item.contactAge}</td>
											<td>${item.contactJob}</td>
											<td>${item.contactPhone}</td>
											<td>${item.contactEmail}</td>
											<td>${item.contactAddress}</td>
											<td>${item.account.lead.leadPhone}</td>
											<td><button class="button-link contactEditForm"
													id="c${item.contact_id}" data-bs-toggle="modal"
													data-bs-target="#contactEdit">
													<small> Edit </small>
												</button>
												<button class="button-link contactPromotion"
													id="c${item.contact_id}">
													<small>Lead</small>
												</button>
												<button class="button-link contactDelete"
													id="c${item.contact_id}">
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
<input type="hidden" id="contactId" name="contactId" value="">

<!-- Modal Edit lead-->
<div class="modal fade" id="contactEdit" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="contactEditLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="contactEditLabel">Edit Contact</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<div class="row p-3">
					<div class="col-12">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="contactEditName"
								placeholder="Full Name" required> <label
								class="text-muted" for="floatingInput ">Name</label>
						</div>
					</div>
					<div class="col-6">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="contactEditJob"
								placeholder="Job"> <label class="text-muted"
								for="floatingInput ">Job</label>
						</div>
					</div>
					<div class="col-6">
						<div class="form-floating">
							<input type="number" class="form-control" id="contactEditAge"
								placeholder="Age"> <label class="text-muted"
								for="floatingInput ">Age</label>
						</div>
					</div>
					<div class="col-12">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="contactEditPhone"
								placeholder="Phone Number" disabled> <label
								class="text-muted" for="floatingInput ">Phone number</label>
						</div>
					</div>
					<div class="col-12">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="contactEditEmail"
								placeholder="Example@gmail.com" disabled> <label
								class="text-muted" for="floatingInput ">Email</label>
						</div>
					</div>
					<div class="col-12 ">
						<div class="form-floating">
							<input class="form-control" placeholder="Address"
								id="contactEditAddress"></input> <label for="floatingInput">Address</label>
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
						<button id="contactEditSave" type="button"
							class="btn btn-primary btn-lg">Save</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<%@include file="../common/footer.jspf"%>
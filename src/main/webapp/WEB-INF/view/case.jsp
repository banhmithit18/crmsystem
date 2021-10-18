<%@include file="../common/header.jspf"%>
<section class="content">
	<div class="container my-3">

		<div class="row p-3">
			<div class="welcome">
				<h2>Case Management</h2>
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
					<div class="logo" style="font-size: 25px !important">Add Case</div>
				</div>
				<div class="row p-3">
					<div class="col-6">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="caseName"
								placeholder=" name" required> <label class="text-muted"
								for="floatingInput ">Case name</label>
						</div>
					</div>
					<div class="col-6">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="invoiceId"
								placeholder="Invoce Id" required> <label
								class="text-muted" for="floatingInput ">Invoice Id</label>
						</div>
					</div>
					<div class="col-12">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="caseDetail"
								placeholder="detail" required> <label class="text-muted"
								for="floatingInput ">Detail</label>
						</div>
					</div>
					<div class="col-12">
						<div class="form-floating">
							<select class="form-control" id="caseStatus">
								<option>In processing</option>
								<option>Done</option>
								<option>Failed</option>
							</select> <label class="text-muted" for="floatingInput ">Status</label>
						</div>
					</div>

					<div class="col-4 my-3 p-3">
						<button id="caseCreate" class=" btn myBtn rounded ">
							<i class="bi bi-check2-circle"></i> Submit
						</button>
					</div>
				</div>
			</div>
		</div>
		<div id="caseError"></div>
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
									<input class="form-control rounded" id="caseSearch"
										style="padding-left: 35px;" type="search"
										placeholder="Search.." aria-label="Search"> <i
										class="bi bi-search"
										style="position: relative; top: -32px; left: 10px;"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="myTable align-items-center text-center scroll"
								id="caseTable">
								<thead>
									<tr>
										<th scope="col">Name</th>
										<th scope="col">Invoice</th>
										<th scope="col">Detail</th>
										<th scope="col">Status</th>
										<th scope="col">Action</th>
									</tr>
								</thead>
								<tbody id="caseTableRow">
									<c:forEach var="item" items="${cases}">
										<tr id="ca${item.case_id}">
											<td>${item.caseName}</td>
											<td>${item.invoice.invoice_id}</td>
											<td>${item.caseDetail}</td>
											<td>${item.caseStatus}</td>

											<td><button class="button-link openServiceCalendarTable                                                                                                                                "
													id="ca${item.case_id}" data-bs-toggle="modal"
													data-bs-target="#serviceCalendar">
													<small> Service </small>
												</button>
												<button class="button-link caseEditForm"
													id="ca${item.case_id}" data-bs-toggle="modal"
													data-bs-target="#caseEdit">
													<small> Edit </small>
												</button>
												<button class="button-link caseDelete"
													id="ca${item.case_id}">
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
<input type="hidden" id="caseId" name="caseId" value="">


<!-- Modal service calendar Table-->
<div class="modal fade" id="serviceCalendar" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="serviceCalendarLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="serviceCalendarLabel">Service
					Calendar</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div id="serviceCalendarError"></div>
				<table class="myTable align-items-center text-center scrollModal"
					id="serviceCalendarTable">
					<thead>
						<tr>
							<th scope="col">Employee</th>
							<th scope="col">Assigned Date</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody id="serviceCalendarTableRow">
					</tbody>
				</table>

			</div>
			<div class="modal-footer">
				<button type="button" id="openServiceCalendarForm"
					class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#serviceCalendarForm">Assign Employee</button>
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- Modal-->
<div class="modal fade" id="serviceCalendarForm"
	data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="serviceCalendarFormLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="serviceCalendarFormLabel">Assign
					Employee</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<div class="row p-3">
					<div class="col-12">
						<div class="form-floating mb-3">
							<select class="form-select" id="employeeSelect"
								aria-label="Select employee">
								<c:forEach var="item" items="${users}">
									<option value="${item.user_id}" selected>${item.userFullname}</option>
								</c:forEach>
							</select> <label class="text-muted" for="floatingInput">Employee
								Name</label>
						</div>
					</div>
					<div class="col-12                    ">
						<div class="form-floating mb-3">
							<input type="date" class="form-control" id="assignedDate"
								placeholder="Assgined Date"> <label class="text-muted"
								for="floatingInput ">Assigned Date</label>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
				<button id="serviceCalendarCreate" type="button"
					class="btn btn-primary">Save</button>
			</div>
		</div>
	</div>
</div>

<!-- Modal Edit Case-->
<div class="modal fade" id="caseEdit" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1" aria-labelledby="caseEditLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="contactEditLabel">Edit Case</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<div class="row p-3">
					<div class="col-12">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="caseEditName"
								placeholder="Full Name" disabled> <label
								class="text-muted" for="floatingInput ">Name</label>
						</div>
					</div>
					<div class="col-6">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="caseEditDetail"
								placeholder="Detail"> <label class="text-muted"
								for="floatingInput ">Detail</label>
						</div>
					</div>
					<div class="col-6">
						<div class="form-floating">
							<select class="form-control" id="caseEditStatus">
								<option>In processing</option>
								<option>Done</option>
								<option>Failed</option>
							</select> <label class="text-muted" for="floatingInput ">Status</label>
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
						<button id="caseEditSave" type="button"
							class="btn btn-primary btn-lg">Save</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<%@include file="../common/footer.jspf"%>
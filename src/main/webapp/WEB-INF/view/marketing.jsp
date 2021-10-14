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
											<td>
												<button class="button-link accountHistoryTable"
													id="a${item.account_id}" data-bs-toggle="modal"
													data-bs-target="#accountHistory">
													<small> Order History </small>
												</button>
												<button class="button-link accountEmail"
													id="${item.lead.leadEmail}" data-bs-toggle="modal"
													data-bs-target="#accountEmail">
													<small> Email </small>
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

<!-- Modal add contact-->
<div class="modal fade" id="accountEmail" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="accountEmailLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="accountEmailLabel">Send Email</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="row p-3">					
						<div class="row p-3">
							<div class="col-12">
								<div class="form-floating mb-3">
									<input type="text" class="form-control" id="emailSubject"
										placeholder="" required> <label
										class="text-muted" for="floatingInput ">Subject</label>
								</div>
							</div>
							<div class="col-12">
								<div class="form-floating mb-3">
									<textarea class="form-control" id="emailContent"
										placeholder="" required> </textarea>
								</div>
							</div>
							<div class="col-4 my-3 p-3">
								<button id="sendEmail" class=" btn myBtn rounded ">
									<i class="bi bi-check2-circle"></i> Send
								</button>
							</div>
						</div>
					
				</div>
				<div id="emailError"></div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<input type="hidden" id="accountId">
<input type="hidden" id="emailReceiver">

<%@include file="../common/footer.jspf"%>
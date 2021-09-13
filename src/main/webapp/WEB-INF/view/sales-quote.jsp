<%@include file="../common/header.jspf"%>
<section class="content">
	<div class="container my-3">
		<div class="row p-3">
			<div class="welcome">
				<h2>Quote Management</h2>
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
						Quote</div>
				</div>
				<div class="row p-3">
					<div class="col-12">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="quoteName"
								placeholder="Quote name" required> <label
								class="text-muted" for="floatingInput ">Quote name</label>
						</div>
					</div>
					<div class="col-12 ">
						<div class="form-floating">
							<textarea class="form-control" placeholder="Description"
								id="quoteDetail"></textarea>
							<label class="text-muted" for="floatingTextarea">Quote
								description</label>
						</div>
					</div>
					<div class="col-12 p-3">
						<label class="form-label" for="">Active</label>
						<div class="form-check form-switch">
							<input class="form-check-input" type="checkbox" id="quoteActive">
						</div>
					</div>
					<div class="col-4  p-3">
						<button id="quoteCreate" class=" btn myBtn rounded ">
							<i class="bi bi-check2-circle"></i> Submit
						</button>
					</div>
				</div>
			</div>
		</div>
		<div id="quoteError"></div>
		<div class="row my-3">
			<div class="col-12">
				<div class="card rounded shadow p-3  ">
					<div class="card-header align-items-center mb-0 ">
						<div class="row p-2  ">
							<div class="col-4">
								<div class="logo" style="font-size: 25px !important">List
									of Quotes</div>
							</div>
							<div class="col-4">
								<div class="search-block">
									<input class="form-control rounded "id="quoteSearch"
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
								id="quoteTable">
								<thead>
									<tr>

										<th scope="col">Quote name</th>
										<th scope="col">Quote description</th>
										<th scope="col">Status</th>
										<th scope="col">Action</th>
									</tr>
								</thead>
								<tbody id="quoteTableRow">

									<c:forEach var="item" items="${quotes}">
										<tr id="q{item.quote_id}">

											<td>${item.quoteName}</td>
											<td>${item.quoteDetail}</td>
											<c:if test="${item.quoteStatus eq true}">
												<td style="color:green">Active</td>
											</c:if>
											<c:if test="${item.quoteStatus eq false}">
												<td style="color:red">Inactive</td>
											</c:if>
											<td>
												<button class="button-link quoteEdit" id="q${item.quote_id}"
													data-bs-toggle="modal" data-bs-target="#quoteEditForm">
													<small> Edit </small>
												</button>
												<button class="button-link quoteDelete"
													id="q${item.quote_id}">
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
<div class="modal fade" id="quoteEditForm" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1" aria-labelledby="quoteEditLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="quoteEditLabel">Edit Quote</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<div class="row p-3">
					<!-- quote id -->
					<input type="hidden" id="quoteId">
					<div class="col-12">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="quoteEditName"
								placeholder="Name" readonly> <label class="text-muted"
								for="floatingInput ">Quote Name</label>
						</div>
					</div>
					<div class="form-floating">
						<textarea class="form-control" placeholder="Description"
							id="quoteEditDetail"></textarea>
						<label class="text-muted" for="floatingTextarea">Quote
							Description</label>
					</div>
					<div class="col-12 p-3">
						<label class="form-label" for="">Active</label>
						<div class="form-check form-switch">
							<input class="form-check-input" type="checkbox"
								id="quoteEditActive">
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
						<button id="quoteEditSave" type="button"
							class="btn btn-primary btn-lg">Save</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="../common/footer.jspf"%>
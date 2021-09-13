<%@include file="../common/header.jspf"%>
<section class="content">

	<div class="container my-3">
		<div class="row p-3">
			<div class="welcome">
				<h2>Opportunity Management</h2>
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
						Opportunity</div>
				</div>
				<div class="row p-3">
					<div class="col-12">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="opportunityName"
								placeholder="Opportunity name" required> <label
								class="text-muted" for="floatingInput ">Opportunity name</label>
						</div>
					</div>
					<div class="col-12 ">
						<div class="form-floating">
							<textarea class="form-control" placeholder="Description"
								id="opportunityDetail"></textarea>
							<label class="text-muted" for="floatingTextarea">Opportunity
								description</label>
						</div>
					</div>
					<div class="col-4 my-3 p-3">
						<button id="opportunityCreate" class=" btn myBtn rounded ">
							<i class="bi bi-check2-circle"></i> Submit
						</button>
					</div>
				</div>
			</div>
		</div>
<div id="opportunityError"></div>
		<div class="row my-3">
			<div class="col-12">
				<div class="card rounded shadow  ">
					<div class="card-header align-items-center mb-0 ">
						<div class="row p-3 ">
							<div class="col-4">
								<div class="logo" style="font-size: 25px !important">List
									of Opportunities</div>
							</div>
							<div class="col-4">
								<div class="search-block">
									<input class="form-control rounded " id="opportunitySearch"
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
							<table class="myTable align-items-center text-center scroll" id="opportunityTable">
								<thead>
									<tr>
										<th scope="col">Opportunity name</th>
										<th scope="col">Opportunity description</th>
										<th scope="col">Action</th>


									</tr>
								</thead>
								<tbody id="opportunityTableRow">
									<c:forEach var="item" items="${opportunities}">
										<tr id="o${item.opportunity_id}">
											<td>${item.opportunityName}</td>
											<td>${item.opportunityDetail}</td>
											<td>
												<button class="button-link opportunityEdit" id="o${item.opportunity_id}" data-bs-toggle="modal"
													data-bs-target="#opportunityEditForm">
													<small> Edit </small>
												</button>
												<button class="button-link opportunityDelete" id="o${item.opportunity_id}">
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
<div class="modal fade" id="opportunityEditForm" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1" aria-labelledby="opportunityEditLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="opportunityEditLabel">Edit Opportunity</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<div class="row p-3">
				<!-- opportunity id -->
					<input type="hidden" id="opportunityId"> 
					<div class="col-12">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="opportunityEditName"
								placeholder="Name" readonly> <label
								class="text-muted" for="floatingInput ">Opportunity Name</label>
						</div>
					</div>
						<div class="form-floating">
							<textarea class="form-control" placeholder="Description"
								id="opportunityEditDetail"></textarea>
							<label class="text-muted" for="floatingTextarea">Opportunity
								Description</label>
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
						<button id="opportunityEditSave" type="button"
							class="btn btn-primary btn-lg">Save</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="../common/footer.jspf"%>
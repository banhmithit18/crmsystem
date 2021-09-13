<%@include file="../common/header.jspf"%>
<section class="content">

	<div class="container my-3">
		<div class="row p-3">
			<div class="welcome">
				<h2>Competitor Management</h2>
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
						Competitor</div>
				</div>
				<div class="row p-3">
					<div class="col-4">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="competitorName"
								placeholder="Competitor name"> <label class="text-muted"
								for="floatingInput ">Competitor name</label>
						</div>
					</div>
					<div class="col-4">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="competitorField"
								placeholder="competitor field"> <label
								class="text-muted" for="floatingInput ">Competitor field</label>
						</div>
					</div>
					<div class="col-4">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="competitorDetail"
								placeholder="Competitor detail"> <label
								class="text-muted" for="floatingInput ">Competitor
								detail</label>
						</div>
					</div>

					<div class="col-4 my-3 p-3">
						<button id="competitorCreate" class=" btn myBtn rounded ">
							<i class="bi bi-check2-circle"></i> Submit
						</button>
					</div>
				</div>
			</div>
		</div>
		<div id="competitorError"></div>
		<div class="row my-3">
			<div class="col-12">
				<div class="card rounded shadow  ">
					<div class="card-header align-items-center mb-0 ">
						<div class="row p-3 ">
							<div class="col-4">
								<div class="logo" style="font-size: 25px !important">List
									of Competitors</div>
							</div>
							<div class="col-4">
								<div class="search-block">
									<input class="form-control rounded " id="competitorSearch"
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
								id="competitorTable">
								<thead>
									<tr>
										<th scope="col">Competitor Name</th>
										<th scope="col">Competitor Field</th>
										<th scope="col">Competitor Detail</th>
										<th scope="col">Action</th>

									</tr>
								</thead>
								<tbody id="competitorTableRow">
									<c:forEach var="item" items="${competitors}">
										<tr id="c${item.competitor_id}">

											<td>${item.competitorName }</td>
											<td>${item.competitorField }</td>
											<td>${item.competitorDetail}</td>
											<td><button class="button-link competitorEditForm"
													id="c${item.competitor_id}" data-bs-toggle="modal"
													data-bs-target="#competitorEdit">
													<small> Edit </small>
												</button>
												<button class="button-link competitorOpportunityTable"
													id="c${item.competitor_id}" data-bs-toggle="modal"
													data-bs-target="#competitorOpportunity">
													<small> Opportunity </small>
												</button>
												
												<button class="button-link competitorDelete" id="c${item.competitor_id}">
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
<div class="modal fade" id="competitorOpportunity" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="competitorOpportunityLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="competitorOpportunityLabel">Competitor
					Opportunities</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div id="competitorOportunityError"></div>
				<table class="myTable align-items-center text-center scrollModal"
					id="competitorOpportunityTable">
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
				<button type="button" id="OpenCompetitorOpportunityForm"
					class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#addCompetitorOpportunityForm">Add Opportunity</button>
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- Modal Add Opportunity for Competitor-->
<div class="modal fade" id="addCompetitorOpportunityForm"
	data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="addCompetitorOpportunityLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="addCompetitorOpportunityLabel">Add
					Opportunity</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<div class="row p-3">
					<input type="hidden" id="competitorId" name="competitorId" value="">
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
				<button id="addCompetitorOpportunity" type="button"
					class="btn btn-primary">Save</button>
			</div>
		</div>
	</div>
</div>
<!-- Modal Edit competitor-->
<div class="modal fade" id="competitorEdit" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1" aria-labelledby="competitorEditLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="competitorEditLabel">Edit Competitor</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<div class="row p-3">
					<div class="col-12">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="competitorEditName"
								placeholder="Full Name" readonly> <label
								class="text-muted" for="floatingInput ">Competitor Name</label>
						</div>
					</div>
					<div class="col-6">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="competitorEditField"
								placeholder="Field" required> <label class="text-muted"
								for="floatingInput ">Field</label>
						</div>
					</div>
					<div class="col-6">
						<div class="form-floating">
							<textarea  class="form-control" id="competitorEditDetail"
								placeholder="Detail"></textarea>  <label class="text-muted"
								for="floatingInput ">Detail</label>
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
						<button id="competitorEditSave" type="button"
							class="btn btn-primary btn-lg">Save</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<%@include file="../common/footer.jspf"%>
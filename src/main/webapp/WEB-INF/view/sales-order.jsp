<%@include file="../common/header.jspf"%>
<section class="content">

	<div class="container my-3">
		<div class="row p-3">
			<div class="welcome">
				<h2>Order Management</h2>
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
								<div class="logo" style="font-size: 25px !important">List
									of Orders</div>
							</div>
							<div class="col-4">
								<div class="search-block">
									<input class="form-control rounded " id="orderSearch"
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
							<table class="myTable align-items-center text-center scroll" id="orderTable">
								<thead>
									<tr>
										<th scope="col">Customer Name</th>
										<th scope="col">Customer Phone</th>
										<th scope="col">Product Name</th>
										<th scope="col">Quantity</th>
										<th scope="col">Total</th>
										<th scope="col">Order Date</th>
										<th scope="col">Invoice Id</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${orders}">
										<tr>
											<td>${item.account.lead.leadName}</td>
											<td>${item.account.lead.leadPhone}</td>
											<td>${item.product.productName}</td>
											<td>${item.quantity }</td>
											<td>${item.total}</td>
											<td>${item.invoice.invoiceDate}</td>
											<td>${item.invoice.invoice_id}</td>
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
<%@include file="../common/footer.jspf"%>
$("#productSearch").on("keyup", function() {
	var value = $(this).val().toLowerCase();
	$("#productTable tr").filter(function() {
		$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	});
});
//create
$('#productCreate').click(function() {
	var productName = $('#productName').val();
	var productDetail = $('#productDetail').val();
	var productQuantity = $('#productQuantity').val();
	var productPrice = $('#productPrice').val();
	var quoteId = $('#productQuote :selected').val();
	var productStatus = false;
	if ($('#productActive').is(":checked")) {
		productStatus = true;
	}
	var json = {
		productName: productName,
		productDetail: productDetail,
		productQuantity: productQuantity,
		productPrice: productPrice,
		quoteId: quoteId,
		productStatus: productStatus
	}
	$.ajax({
		type: "POST",
		contentType: "application/json",
		url: "/ProductCreate",
		data: JSON.stringify(json),
		dataType: 'json',
		cache: false,
		timeout: 600000,
		success: function(data) {
			//generate table
			var dataRow = '<tr id="p' + data.product_id + '">';
			dataRow += '<td>' + data.productName + '</td><td>' + data.productQuantity + '</td><td>' + data.productPrice + '</td><td>' + data.productDetail + '</td><td>' + data.productQuote + '</td>';
			if (data.productStatus == true) {
				dataRow += '<td style="color:green">Active</td>';
			}
			else {
				dataRow += '<td style="color:red">Inactive</td>';
			}
			dataRow += '<td><button class="button-link productEdit" id="p' + data.product_id + '" data-bs-toggle="modal"data-bs-target="#productEditForm"><small> Edit&nbsp;</small></button>';
			dataRow += '<button class="button-link productDelete" id="p' + data.product_id + '"><small>' + ' Delete </small></button></td>';
			dataRow += '</tr>';

			//add row
			$('#productTableRow').append(dataRow);
			//show success
			var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Product has been added! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
			$('#productError').append(dataError);
			//clear form
			$('#productName').val("");
			$("#productQuantity").val("");
			$('#productPrice').val("");
			$('#productDetail').val("");
			//add event
			$('.productEdit').click(editForm);
			$('.productDelete').click(deleteProduct);

		},
		error: function(e) {
			//showing failed
			var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Error! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
			$('#productError').append(dataError);
		}
	})
})
$('.productEdit').click(editForm);
//function open edit form
function editForm() {
	//set hidden input id
	var id_string = this.id;
	var id = id_string.substr(1);
	$('#productId').val(id);
	// get the current row
	var currentRow = $(this).closest("tr");
	///get value
	var productName = currentRow.find("td:eq(0)").text(); // get current row 1st TD value
	productName = productName.trim(); //remove space

	var productQuantity = currentRow.find("td:eq(1)").text(); // get current row  value
	productQuantity = productQuantity.trim(); //remove space

	var productPrice = currentRow.find("td:eq(2)").text(); // get current row  value
	productPrice = productPrice.trim(); //remove space

	var productDetail = currentRow.find("td:eq(3)").text(); // get current row
	productDetail = productDetail.trim() //remove space

	var productQuote = currentRow.find("td:eq(4)").text(); // get current row
	productQuote = productQuote.trim() //remove space

	var productActiveElement = currentRow.find("td:eq(5)").text(); // get current row 
	productActiveElement = productActiveElement.trim() //remove space
	if (productActiveElement == "Active") {
		$('#productEditActive').prop('checked', true);

	}
	if (productActiveElement == "Inactive") {
		$('#productEditActive').prop('checked', false);

	}

	// insert data to form
	$('#productEditName').val(productName);
	$('#productEditQuantity').val(productQuantity);
	$('#productEditPrice').val(productPrice);
	$('#productEditDetail').val(productDetail);
	$("select#productEditQuote option").filter(function() {
		return $(this).text() == productQuote;
	}).prop('selected', true);

}
//function save edit
$('#productEditSave').click(function() {
	var productEditName = $('#productEditName').val();
	var productEditQuantity = $('#productEditQuantity').val();
	var productEditPrice = $('productEditPrice').val();
	var productEditDetail = $('#productEditDetail').val();
	var productId = $('#productId').val();
	var quoteId = $('#productEditQuote :selected').val();
	var productEditStatus = false;
	if ($('#productEditActive').is(":checked")) {
		productEditStatus = true;
	}

	var json = {
		product_id: productId,
		productName: productEditName,
		productDetail: productEditDetail,
		productQuantity: productEditQuantity,
		productPrice: productEditPrice,
		quoteId: quoteId,
		productStatus: productEditStatus
	}

	$.ajax({
		type: "POST",
		processData: false,
		contentType: "application/json",
		url: "/ProductEdit",
		data: JSON.stringify(json),
		dataType: 'json',
		cache: false,
		timeout: 600000,
		success: function(data) {
			var currentRow = $('#p' + data.product_id).closest("tr");
			///replace value in table 
			currentRow.find("td:eq(0)").text(data.productName);
			currentRow.find("td:eq(1)").text(data.productQuantity)
			currentRow.find("td:eq(2)").text(data.productPrice);
			currentRow.find("td:eq(3)").text(data.productDescription);
			currentRow.find("td:eq(4)").text(data.productQuote);

			if (data.productStatus == true) {
				currentRow.find("td:eq(5)").text("Active");
				currentRow.find("td:eq(5)").css('color', 'green');
			}
			else {
				currentRow.find("td:eq(5)").text("Inactive");
				currentRow.find("td:eq(5)").css('color', 'red');
			}
			//close modal
			$('#productEditForm').modal('toggle');
			//show success
			var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Product information has been saved! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
			$('#productError').append(dataError);

		}, error: function() {
			//show failed
			var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Save failed! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
			$('#productError').append(dataError);
		}
	})
});
//set event
$('.productDelete').click(deleteProduct);
//delete  quote
function deleteProduct() {
	var idString = this.id;
	var id = idString.substr(1);
	$.ajax({
		type: "POST",
		contentType: "application/json",
		url: "/ProductDelete",
		data: id,
		dataType: "json",
		cache: false,
		timeout: 600000,
		success: function(data) {

			if (data.product_id != 0) {
				//clear table
				$('#p' + data.product_id).remove();
				// show success
				var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Deleted<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
				$('#productError').append(dataError)
			}
			else {
				//show failed
				var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Delete Failed<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
				$('#productError').append(dataError)
			}
		}
	})
}


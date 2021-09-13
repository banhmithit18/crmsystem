$(document).ready(function() {
	$("#accountSearch").on("keyup", function() {
		var value = $(this).val().toLowerCase();
		$("#accountTable tr").filter(function() {
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		});
	});
	//set account id 
	$('.accountContact').click(function() {
		//change account id
		var idWithString = this.id;
		//substring to get the id only
		var id = idWithString.substr(1);
		// set value to hidden input 
		$('#accountId').val(id);
	})
	//create contact
	$('#contactCreate').click(function() {
		var contactName = $('#contactName').val();
		var contactJob = $('#contactJob').val();
		var contactAge = $('#contactAge').val();
		var contactPhone = $('#contactPhone').val().trim();
		var contactEmail = $('#contactEmail').val().trim();
		var contactAddress = $('#contactAddress').val();
		var accountId = $('#accountId').val();
		var json = {
			accountId: accountId,
			contactName: contactName,
			contactAge: contactAge,
			contactJob: contactJob,
			contactPhone: contactPhone,
			contactEmail: contactEmail,
			contactAddress: contactAddress
		}
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "/ContactCreate",
			data: JSON.stringify(json),
			dataType: 'json',
			cache: false,
			timeout: 600000,
			success: function(data) {
				//if lead phone exists
				if (data.leadPhone == "Exists") {
					// show error
					var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Phone number already exists! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#addContractError').append(dataError);
				}
				else {
					// if email exists
					if (data.leadEmail == "Exists") {
						// show error
						var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Email already exists! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
						$('#addContractError').append(dataError);
					}
					//if created
					else {
						//clear form
						$('#contactName').val("");
						$('#contactJob').val("");
						$('#contactAge').val("");
						$('#contactPhone').val("")
						$('#contactEmail').val("")
						$('#contactAddress').val("");
						//show sucess
						var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Contact has been added! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
						$('#addContractError').append(dataError);
					}
				}
			},
			error: function(e) {
				var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Error! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
				$('#addContractError').append(dataError);
			}
		});

	})
	// get order history
	$('.accountHistoryTable').click(leadOpportunityTable);
	//function get opportunity
	function leadOpportunityTable() {
		var idWithString = this.id;
		//substring to get the id only
		var id = idWithString.substr(1);
		// set value to hidden input 
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "/OrderHistory",
			data: id,
			dataType: 'json',
			cache: false,
			timeout: 600000,
			success: function(data) {
				//remove table
				$("#tableHistory tr").remove();
				$.each(data, function(y, data) {
					//generate data
					var dataTable = '<tr><td>' + data.name + '</td>';
					dataTable += '<td>' + data.quantity + '</td>';
					dataTable += '<td>' + data.total + '</td>';
					dataTable += '<td>' + data.date + '</td></tr>';
					//add to table
					$('#tableHistory').append(dataTable);

				});
			}
		})
	}
	//get price 
	$('#productQuantity').on('input', function() {
		var quantity = $(this).val() // get current quantityu
		var price = $('#productId :selected').val(); //get price of selected product
		$("#productTotal").text(quantity * price + " VND") // change total


	});
	//change total
	$('#productId').on('change', function() {
		var price = $(this).val(); //get price
		$("#productQuantity").val(1); // change quantity product to 1
		$("#productTotal").text(1 * price + " VND") // change total
	});

	$('.accountOrderForm').click(function() {
		var quantity = $('#productQuantity').val() // get current quantity
		var price = $('#productId :selected').val(); //get price of selected product
		$("#productTotal").text(quantity * price + " VND") // change total
		//change account id
		var idWithString = this.id;
		//substring to get the id only
		var id = idWithString.substr(1);
		// set value to hidden input 
		$('#accountId').val(id);
	})
	//order
	$('#accountOrderSave').click(function() {
		var accountId = $('#accountId').val();
		var quantity = $('#productQuantity').val() // get current quantity
		var price = $('#productId :selected').val(); //get price of selected product
		var total = quantity * price;
		var productId = $('#productId :selected').attr('id').substr(1);

		var json = {
			accountId: accountId,
			userId: 0,  //need change
			productId: productId,
			quantity: quantity,
			total: total,
			orderStatus: true,
			invoiceId: 0
		}

		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "/OrderCreate",
			data: JSON.stringify(json),
			dataType: 'json',
			cache: false,
			timeout: 600000,
			success: function(data) {
				if (data.order_id != 0) {

					$('#accountOrder').modal('toggle');
					var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Sucess!</strong> Order successful! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#accountError').append(dataError);
				}
				else {
					var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Order failed! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#accountError').append(dataError);
				}
			}, error: function() {
				var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Order failed! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
				$('#accountError').append(dataError);
			}

		})

	})

	//set event
	$('.accountDelete').click(deleteAccount);
	//delete  lead
	function deleteAccount() {
		var idString = this.id;
		var id = idString.substr(1);
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "/AccountDelete",
			data: id,
			dataType: "json",
			cache: false,
			timeout: 600000,
			success: function(data) {

				if (data.account_id != 0) {
					//clear table
					$('#a' + data.account_id).remove();
					// show success

					var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Deleted<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#accountError').append(dataError)
				}
				else {
					//show failed
					var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Delete Failed, Please check the opportunities<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#accountError').append(dataError)
				}
			},

		})
	}


	//event open form
	$('.accountEditForm').click(accountEditForm);
	//function for insert edit form
	function accountEditForm() {
		var idWithString = this.id;
		//substring to get the id only
		var id = idWithString.substr(1);
		// set value to hidden input 
		$('#accountId').val(id);
		// get the current row
		var currentRow = $(this).closest("tr");
		///get value
		var leadId = currentRow.find("td:eq(0)").text();
		leadId = leadId.trim();
		var leadName = currentRow.find("td:eq(1)").text(); // get current row 1st TD value
		leadName = leadName.trim();
		var leadAge = currentRow.find("td:eq(2)").text(); // get current row 2nd TD
		leadAge = leadAge.trim()
		var leadJob = currentRow.find("td:eq(3)").text(); // get current row 3rd TD
		leadJob = leadJob.trim();
		var leadPhoneNumber = currentRow.find("td:eq(4)").text(); // get current row 4th TD
		leadPhoneNumber = leadPhoneNumber.trim();
		var leadEmail = currentRow.find("td:eq(5)").text(); // get current row 5thd TD
		leadEmail = leadEmail.trim();
		var leadAddress = currentRow.find("td:eq(6)").text(); // get current row 6th TD
		leadAddress = leadAddress.trim();

		// insert data to form
		$('#leadEditId').val(leadId);
		$('#leadEditName').val(leadName);
		$('#leadEditAge').val(leadAge);
		$('#leadEditJob').val(leadJob);
		$('#leadEditPhone').val(leadPhoneNumber);
		$('#leadEditEmail').val(leadEmail);
		$('#leadEditAddress').val(leadAddress);
	}
	//function save edit
	$('#accountEditSave').click(function() {
		var leadEditId = $('#leadEditId').val();
		var leadEditName = $("#leadEditName").val();
		var leadEditAge = $("#leadEditAge").val();
		var leadEditJob = $("#leadEditJob").val();;
		var leadEditPhone = $('#leadEditPhone').val();
		var leadEditAddress = $('#leadEditAddress').val();
		var leadEditEmail = $('#leadEditEmail').val();

		var json = {
			lead_id: leadEditId,
			leadName: leadEditName,
			leadJob: leadEditJob,
			leadAge: leadEditAge,
			leadPhone: leadEditPhone,
			leadEmail: leadEditEmail,
			leadAddress: leadEditAddress
		}

		$.ajax({
			type: "POST",
			processData: false,
			contentType: "application/json",
			url: "/AccountEdit",
			data: JSON.stringify(json),
			dataType: 'json',
			cache: false,
			timeout: 600000,
			success: function(data) {
				if (data.lead_id != 0) {
					var currentRow = $('.l' + data.lead_id).closest("tr");
					///replace value in table 
					currentRow.find("td:eq(1)").text(data.leadName);
					currentRow.find("td:eq(2)").text(data.leadAge);
					currentRow.find("td:eq(3)").text(data.leadJob);
					currentRow.find("td:eq(4)").text(data.leadPhone);
					currentRow.find("td:eq(5)").text(data.leadEmail);
					currentRow.find("td:eq(6)").text(data.leadAddress);

					$('#accountEdit').modal('toggle');
					var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Lead information has been saved! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#accountError').append(dataError);
				}
				else {
					var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Save failed! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#accountError').append(dataError)
				}

			}, error: function() {
				var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Save failed! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
				$('#accountError').append(dataError);
			}
		})
	});

});
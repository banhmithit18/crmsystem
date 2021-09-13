$(document).ready(function() {

	$("#leadSearch").on("keyup", function() {
		var value = $(this).val().toLowerCase();
		$("#leadTable tr").filter(function() {
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		});
	});

	$('#leadOrderSave').click(function() {
		var leadID = $('#leadId').val();
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "/LeadPromotion",
			data: leadID,
			dataType: "json",
			cache: false,
			timeout: 600000,
			success: function(data) {
				//remove row
				$('#l' + data.leadId).remove();

				var accountId = data.account_id;
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

							$('#leadOrder').modal('toggle');
							var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Sucess!</strong> Order successful! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
							$('#leadError').append(dataError);
						}
						else {
							var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Order failed! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
							$('#leadError').append(dataError);
						}
					}, error: function() {
						var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Order failed! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
						$('#leadError').append(dataError);
					}

				})

			}, error: function() {
				var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Order failed! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
				$('#leadError').append(dataError);
			}

		})
	})

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

	$('.leadOrderForm').click(function() {
		var quantity = $('#productQuantity').val() // get current quantity
		var price = $('#productId :selected').val(); //get price of selected product
		$("#productTotal").text(quantity * price + " VND") // change total
		//change lead id
		var idWithString = this.id;
		//substring to get the id only
		var id = idWithString.substr(1);
		// set value to hidden input 
		$('#leadId').val(id);
	})


	$('#leadCreate').click(function() {
		var leadFirstName = $('#leadFirstName').val();
		var leadLastName = $('#leadLastName').val();
		var leadJob = $('#leadJob').val();
		var leadAge = $('#leadAge').val();
		var leadPhone = $('#leadPhone').val().trim();
		var leadEmail = $('#leadEmail').val().trim();
		var leadAddress = $('#leadAddress').val();
		var leadName = leadFirstName + " " + leadLastName;
		var json = {
			leadName: leadName,
			leadJob: leadJob,
			leadAge: leadAge,
			leadPhone: leadPhone,
			leadEmail: leadEmail,
			leadAddress: leadAddress
		}
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "/LeadCreate",
			data: JSON.stringify(json),
			dataType: 'json',
			cache: false,
			timeout: 600000,
			success: function(data) {
				//if lead phone exists
				if (data.leadPhone == "Exists") {
					// show error
					var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Phone number already exists! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#leadError').append(dataError);
				}
				else {
					// if email exists
					if (data.leadEmail == "Exists") {
						// show error
						var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Email already exists! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
						$('#leadError').append(dataError);
					}
					//if created
					else {
						//add to table
						var dataRow = '<tr id="l' + data.lead_id + '">';
						dataRow += '<td>' + data.leadName + '</td><td>' + data.leadAge + '</td><td>' + data.leadJob + '</td><td>' + data.leadPhone + '</td><td>' + data.leadEmail + '</td><td>' + data.leadAddress + '</td>';
						dataRow += '<td><button class="button-link leadEditForm" id="l' + data.lead_id + '" data-bs-toggle="modal"data-bs-target="#leadEdit"><small> Edit&nbsp;</small></button>';
						dataRow += '<button class="button-link leadOpportunityTable" id="l' + data.lead_id + '" data-bs-toggle="modal"data-bs-target="#leadOpportunity"><small> Opportunity&nbsp;</small></button>';
						dataRow += '<button class="button-link" id="l' + data.lead_id + '"<small> Order&nbsp;</small></button>';
						dataRow += '<button class="button-link leadDelete" id="l' + data.lead_id + '"><small> Delete </small></button></td></tr>';
						//add row
						$('#leadTableRow').append(dataRow);
						// clear form
						$('#leadFirstName').val("");
						$('#leadLastName').val("");
						$('#leadJob').val("");
						$('#leadAge').val(null);
						$('#leadPhone').val("");
						$('#leadEmail').val("");
						$('#leadAddress').val("");
						//add event
						$('.leadEditForm').click(leadEditForm);
						$('.leadDelete').click(deleteLead);
						$('.leadOpportunityTable').click(leadOpportunityTable);

						//show sucess
						var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Lead has been added! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
						$('#leadError').append(dataError);
					}
				}
			},
			error: function(e) {
				var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Error! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
				$('#leadError').append(dataError);
			}
		});

	})

	//set event when select opportunity
	$('#opportunitySelect').change(getOpportunityDetail);
	//set Opportunity Description
	function getOpportunityDetail() {
		var id_with_string = $(this).children(":selected").attr("id");
		var id = id_with_string.substr(1);
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "GetOpportunity",
			data: id,
			dataType: 'json',
			cache: "false",
			timeout: 600000,
			success: function(data) {
				//set value 
				$("#opportunityDetail").val(data.opportunityDetail);
				$('#opportunityId').val(data.opportunity_id);
			}
		})
	}
	//event open lead opportunity
	$('.leadOpportunityTable').click(leadOpportunityTable);
	//function get opportunity
	function leadOpportunityTable() {
		var idWithString = this.id;
		//substring to get the id only
		var id = idWithString.substr(1);
		// set value to hidden input 
		$('#leadId').val(id);
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "/LeadOpportunityTable",
			data: id,
			dataType: 'json',
			cache: false,
			timeout: 600000,
			success: function(data) {
				//remove tablee
				$("#tableOpportunity tr").remove();
				$.each(data, function(y, data) {
					//generate data
					var dataTable = '"<tr id="ol' + data.opportunity_id + '"><td>' + data.opportunityName + '</td><td>' + data.opportunityDetail + '</td> <td><button class="button-link leadOpportunityDelete" id="ol' + data.opportunity_id + '"><small> Delete </small></button></td>';
					//add to table
					$('#tableOpportunity').append(dataTable);
					//add event
					$('#ol' + data.opportunity_id + ' .leadOpportunityDelete ').click(deleteLeadOpportunity);
				});
			}
		})
	}
	//set evet add lead opportunity
	$('#addLeadOpportunity').click(addLeadOpportunity);
	//add lead opportunity
	function addLeadOpportunity() {
		var leadId = $('#leadId').val();
		var opportunityId = $('#opportunityId').val();
		var json = {
			leadId: leadId,
			opportunityId: opportunityId
		}

		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "/LeadOpportunityAdd",
			data: JSON.stringify(json),
			dataType: "json",
			cache: false,
			timeout: 600000,
			success: function(data) {
				if (data.opportunity_id != 0) {
					//generate data
					var dataTable = '"<tr id="ol' + data.opportunity_id + '"><td>' + data.opportunityName + '</td><td>' + data.opportunityDetail + '</td> <td><button class="button-link leadOpportunityDelete" id="ol' + data.opportunity_id + '"><small> Delete </small></button></td>';
					//add to table
					$('#tableOpportunity').append(dataTable);
					//add event
					$('#ol' + data.opportunity_id + ' .leadOpportunityDelete ').click(deleteLeadOpportunity);
					// show success
					var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Added<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#leadOportunityError').append(dataError)
					// close modal
					$('#addLeadOpportunityForm').modal('toggle');

				}
				else {
					//show failed
					var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Add Failed<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#leadOportunityError').append(dataError)
				}
			}
		})
	}
	//delete lead opportunity
	function deleteLeadOpportunity() {
		var idString = this.id;
		var id = idString.substr(2);
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "/LeadOpportunityDelete",
			data: id,
			dataType: "json",
			cache: false,
			timeout: 600000,
			success: function(data) {
				if (data.opportunitylead_id != 0) {
					//clear table
					$('#ol' + data.opportunitylead_id).remove();
					// show success
					var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Deleted<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#leadOportunityError').append(dataError)
				}
				else {
					//show failed
					var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Delete Failed<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#leadOportunityError').append(dataError)
				}
			}
		})
	}

	//set event
	$('.leadDelete').click(deleteLead);
	//delete  lead
	function deleteLead() {
		var idString = this.id;
		var id = idString.substr(1);
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "/LeadDelete",
			data: id,
			dataType: "json",
			cache: false,
			timeout: 600000,
			success: function(data) {

				if (data.lead_id != 0) {
					//clear table
					$('#l' + data.lead_id).remove();
					// show success
					var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Deleted<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#leadError').append(dataError)
				}
				else {
					//show failed
					var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Delete Failed, Please check the opportunities<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#leadError').append(dataError)
				}
			}
		})
	}


	//event open form
	$('.leadEditForm').click(leadEditForm);
	//function for insert edit form
	function leadEditForm() {
		var idWithString = this.id;
		//substring to get the id only
		var id = idWithString.substr(1);
		// set value to hidden input 
		$('#leadId').val(id);
		// get the current row
		var currentRow = $(this).closest("tr");
		///get value
		var leadName = currentRow.find("td:eq(0)").text(); // get current row 1st TD value
		leadName = leadName.trim();
		var leadAge = currentRow.find("td:eq(1)").text(); // get current row 2nd TD
		leadAge = leadAge.trim()
		var leadJob = currentRow.find("td:eq(2)").text(); // get current row 3rd TD
		leadJob = leadJob.trim();
		var leadPhoneNumber = currentRow.find("td:eq(3)").text(); // get current row 4th TD
		leadPhoneNumber = leadPhoneNumber.trim();
		var leadEmail = currentRow.find("td:eq(4)").text(); // get current row 5thd TD
		leadEmail = leadEmail.trim();
		var leadAddress = currentRow.find("td:eq(5)").text(); // get current row 6th TD
		leadAddress = leadAddress.trim();

		// insert data to form
		$('#leadEditName').val(leadName);
		$('#leadEditAge').val(leadAge);
		$('#leadEditJob').val(leadJob);
		$('#leadEditPhone').val(leadPhoneNumber);
		$('#leadEditEmail').val(leadEmail);
		$('#leadEditAddress').val(leadAddress);
	}
	//function save edit
	$('#leadEditSave').click(function() {
		var leadEditName = $("#leadEditName").val();
		var leadEditAge = $("#leadEditAge").val();
		var leadEditJob = $("#leadEditJob").val();;
		var leadEditPhone = $('#leadEditPhone').val();
		var leadEditAddress = $('#leadEditAddress').val();
		var leadEditEmail = $('#leadEditEmail').val();

		var json = {
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
			url: "/LeadEdit",
			data: JSON.stringify(json),
			dataType: 'json',
			cache: false,
			timeout: 600000,
			success: function(data) {
				var currentRow = $('#l' + data.lead_id).closest("tr");
				///replace value in table 
				currentRow.find("td:eq(0)").text(data.leadName);
				currentRow.find("td:eq(1)").text(data.leadAge);
				currentRow.find("td:eq(2)").text(data.leadJob);
				currentRow.find("td:eq(3)").text(data.leadPhone);
				currentRow.find("td:eq(4)").text(data.leadEmail);
				currentRow.find("td:eq(5)").text(data.leadAddress);

				$('#leadEdit').modal('toggle');
				var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Lead information has been saved! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
				$('#leadError').append(dataError);

			}, error: function() {
				var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Save failed! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
				$('#leadError').append(dataError);
			}
		})
	});

});
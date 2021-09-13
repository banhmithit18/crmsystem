$(document).ready(function() {
	$("#orderSearch").on("keyup", function() {
		var value = $(this).val().toLowerCase();
		$("#orderTable tr").filter(function() {
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		});
	});

	//search
	$("#contactSearch").on("keyup", function() {
		var value = $(this).val().toLowerCase();
		$("#contactTable tr").filter(function() {
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		});
	});

	//set event
	$('.contactDelete').click(deleteContact);
	//delete  contact
	function deleteContact() {
		var idString = this.id;
		var id = idString.substr(1);
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "/ContactDelete",
			data: id,
			dataType: "json",
			cache: false,
			timeout: 600000,
			success: function(data) {

				if (data.contact_id != 0) {
					//clear table
					$('#c' + data.contact_id).remove();
					// show success
					var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Deleted<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#contactError').append(dataError)
				}
				else {
					//show failed
					var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Delete Failed <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#contactError').append(dataError)
				}
			}
		})
	}
	//promotion
	$('.contactPromotion').click(promotionContact);
	//promotion  contact
	function promotionContact() {
		var idString = this.id;
		var id = idString.substr(1);
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "/ContactPromotion",
			data: id,
			dataType: "json",
			cache: false,
			timeout: 600000,
			success: function(data) {

				if (data.contact_id != 0) {
					//clear table
					$('#c' + data.contact_id).remove();
					// show success
					var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Contact has become Lead<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#contactError').append(dataError)
				}
				else {
					//show failed
					var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Promotion failed<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#contactError').append(dataError)
				}
			}
		})
	}

	//event open form
	$('.contactEditForm').click(contactEditForm);
	//function for insert edit form
	function contactEditForm() {
		var idWithString = this.id;
		//substring to get the id only
		var id = idWithString.substr(1);
		// set value to hidden input 
		$('#contactId').val(id);
		// get the current row
		var currentRow = $(this).closest("tr");
		///get value
		var contactName = currentRow.find("td:eq(0)").text(); // get current row 1st TD value
		contactName = contactName.trim();
		var contactAge = currentRow.find("td:eq(1)").text(); // get current row 2nd TD
		contactAge = contactAge.trim()
		var contactJob = currentRow.find("td:eq(2)").text(); // get current row 3rd TD
		contactJob = contactJob.trim();
		var contactPhoneNumber = currentRow.find("td:eq(3)").text(); // get current row 4th TD
		contactPhoneNumber = contactPhoneNumber.trim();
		var contactEmail = currentRow.find("td:eq(4)").text(); // get current row 5thd TD
		contactEmail = contactEmail.trim();
		var contactAddress = currentRow.find("td:eq(5)").text(); // get current row 6th TD
		contactAddress = contactAddress.trim();


		// insert data to form
		$('#contactEditName').val(contactName);
		$('#contactEditAge').val(contactAge);
		$('#contactEditJob').val(contactJob);
		$('#contactEditPhone').val(contactPhoneNumber);
		$('#contactEditEmail').val(contactEmail);
		$('#contactEditAddress').val(contactAddress);
	}
	//function save edit
	$('#contactEditSave').click(function() {
		var contactEditName = $("#contactEditName").val();
		var contactEditAge = $("#contactEditAge").val();
		var contactEditJob = $("#contactEditJob").val();;
		var contactEditPhone = $('#contactEditPhone').val();
		var contactEditAddress = $('#contactEditAddress').val();
		var contactEditEmail = $('#contactEditEmail').val();
		var contactId = $('#contactId').val();

		var json = {
			contact_id: contactId,
			contactName: contactEditName,
			contactAge: contactEditAge,
			contactJob: contactEditJob,
			contactPhone: contactEditPhone,
			contactEmail: contactEditAddress,
			contactAddress: contactEditEmail
		}

		$.ajax({
			type: "POST",
			processData: false,
			contentType: "application/json",
			url: "/ContactEdit",
			data: JSON.stringify(json),
			dataType: 'json',
			cache: false,
			timeout: 600000,
			success: function(data) {
				var currentRow = $('#c' + data.contact_id).closest("tr");
				///replace value in table 
				currentRow.find("td:eq(0)").text(data.contactName);
				currentRow.find("td:eq(1)").text(data.contactAge);
				currentRow.find("td:eq(2)").text(data.contactJob);
				currentRow.find("td:eq(3)").text(data.contactPhone);
				currentRow.find("td:eq(4)").text(data.contactEmail);
				currentRow.find("td:eq(5)").text(data.contactAddress);

				$('#contactEdit').modal('toggle');
				var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Contact information has been saved! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
				$('#contactError').append(dataError);

			}, error: function() {
				var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Save failed! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
				$('#contactError').append(dataError);
			}
		})
	});

});
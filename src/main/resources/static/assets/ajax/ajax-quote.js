//create
$("#quoteSearch").on("keyup", function() {
	var value = $(this).val().toLowerCase();
	$("#quoteTable tr").filter(function() {
		$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	});
});
$('#quoteCreate').click(function() {

	var quoteName = $('#quoteName').val();
	var quoteDetail = $('#quoteDetail').val();
	var quoteStatus = false;
	if ($('#quoteActive').is(":checked")) {
		quoteStatus = true;
	}
	var json = {
		quoteName: quoteName,
		quoteDetail: quoteDetail,
		quoteStatus: quoteStatus
	}
	$.ajax({
		type: "POST",
		contentType: "application/json",
		url: "/QuoteCreate",
		data: JSON.stringify(json),
		dataType: 'json',
		cache: false,
		timeout: 600000,
		success: function(data) {
			//generate table
			var dataRow = '<tr id="q' + data.quote_id + '">';
			dataRow += '<td>' + data.quoteName + '</td><td>' + data.quoteDetail + '</td>';
			if (data.quoteStatus == true) {
				dataRow += '<td style="color:green">Active</td>';
			}
			else {
				dataRow += '<td style="color:red">Inactive</td>';
			}
			dataRow += '<td><button class="button-link quoteEdit" id="q' + data.quote_id + '" data-bs-toggle="modal"data-bs-target="#quoteEditForm"><small> Edit&nbsp;</small></button>';
			dataRow += '<button class="button-link quoteDelete" id="q' + data.quote_id + '"><small>' + ' Delete </small></button></td>';
			dataRow += '</tr>';

			//add row
			$('#quoteTableRow').append(dataRow);
			//show success
			var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Quote has been added! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
			$('#quoteError').append(dataError);
			//clear form
			$('#quoteName').val("");
			$('#quoteDetail').val("");
			//add event
			$('.quoteEdit').click(editForm);
			$('.quoteDelete').click(deleteQuote);

		},
		error: function(e) {
			//showing failed
			var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Error! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
			$('#quoteError').append(dataError);
		}
	})
})
$('.quoteEdit').click(editForm);
//function open edit form
function editForm() {
	//set hidden input id
	var id_string = this.id;
	var id = id_string.substr(1);
	$('#quoteId').val(id);
	// get the current row
	var currentRow = $(this).closest("tr");
	///get value
	var quoteName = currentRow.find("td:eq(0)").text(); // get current row 1st TD value
	quoteName = quoteName.trim(); //remove space
	var quoteDetail = currentRow.find("td:eq(1)").text(); // get current row 2nd TD
	quoteDetail = quoteDetail.trim() //remove space
	var quoteActiveElement = currentRow.find("td:eq(1)").text(); // get current row 3rd TD
	quoteActiveElement = quoteActiveElement.trim() //remove space
	if ($('#quoteActiveElement') == "Active") {
		$('#quoteEditActive').prop('checked', true);

	}

	// insert data to form
	$('#quoteEditName').val(quoteName);
	$('#quoteEditDetail').val(quoteDetail);

}
//function save edit
$('#quoteEditSave').click(function() {
	var quoteEditName = $('#quoteEditName').val();
	var quoteEditDetail = $('#quoteEditDetail').val();
	var quoteId = $('#quoteId').val();
	var quoteEditStatus = false;
	if ($('#quoteEditActive').is(":checked")) {
		quoteEditStatus = true;
	}
	var json = {
		quote_id: quoteId,
		quoteName: quoteEditName,
		quoteDetail: quoteEditDetail,
		quoteStatus: quoteEditStatus
	}

	$.ajax({
		type: "POST",
		processData: false,
		contentType: "application/json",
		url: "/QuoteEdit",
		data: JSON.stringify(json),
		dataType: 'json',
		cache: false,
		timeout: 600000,
		success: function(data) {
			var currentRow = $('#q' + data.quote_id).closest("tr");
			///replace value in table 
			currentRow.find("td:eq(0)").text(data.quoteName);
			currentRow.find("td:eq(1)").text(data.quoteDetail);
			if (data.quoteStatus == true) {
				currentRow.find("td:eq(2)").text("Active");
				currentRow.find("td:eq(2)").css('color', 'green');
			}
			else {
				currentRow.find("td:eq(2)").text("Inactive");
				currentRow.find("td:eq(2)").css('color', 'red');
			}
			//close modal
			$('#quoteEditForm').modal('toggle');
			//show success
			var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Quote information has been saved! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
			$('#quoteError').append(dataError);

		}, error: function() {
			//show failed
			var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Save failed! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
			$('#quoteError').append(dataError);
		}
	})
});
//set event
$('.quoteDelete').click(deleteQuote);
//delete  quote
function deleteQuote() {
	var idString = this.id;
	var id = idString.substr(1);
	$.ajax({
		type: "POST",
		contentType: "application/json",
		url: "/QuoteDelete",
		data: id,
		dataType: "json",
		cache: false,
		timeout: 600000,
		success: function(data) {

			if (data.quote_id != 0) {
				//clear table
				$('#q' + data.quote_id).remove();
				// show success
				var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Deleted<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
				$('#quoteError').append(dataError)
			}
			else {
				//show failed
				var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Delete Failed<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
				$('#quoteError').append(dataError)
			}
		}
	})
}


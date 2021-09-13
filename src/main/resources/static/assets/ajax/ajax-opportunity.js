$("#opportunitySearch").on("keyup", function() {
		var value = $(this).val().toLowerCase();
		$("#opportunityTable tr").filter(function() {
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		});
	});
//create
$('#opportunityCreate').click(function() {
	var opportunityName = $('#opportunityName').val();
	var opportunityDetail = $('#opportunityDetail').val();
	var json = {
		opportunityName: opportunityName,
		opportunityDetail: opportunityDetail
	}
	$.ajax({
		type: "POST",
		contentType: "application/json",
		url: "/OpportunityCreate",
		data: JSON.stringify(json),
		dataType: 'json',
		cache: false,
		timeout: 600000,
		success: function(data) {
			//generate table
			var dataRow = '<tr id="o' + data.opportunity_id + '">';
			dataRow += '<td>' + data.opportunityName + '</td><td>' + data.opportunityDetail + '</td>';
			dataRow += '<td><button class="button-link opportunityEdit" id="o' + data.opportunity_id + '" data-bs-toggle="modal"data-bs-target="#opportunityEditForm"><small> Edit&nbsp; </small></button>';
			dataRow += '<button class="button-link opportunityDelete" id="o' + data.opportunity_id + '"><small>'+ ' Delete </small></button></td>';
			dataRow += '</tr>';

			//add row
			$('#opportunityTableRow').append(dataRow);
			//show success
			var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Opportunity has been added! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
			$('#opportunityError').append(dataError);
			//clear form
			$('#opportunityName').val("");
			$('#opportunityDetail').val("");
			//add event
			$('.opportunityEdit').click(editForm);
			$('.opportunityDelete').click(deleteOpportunity);

		},
		error: function(e) {
			//showing failed
			var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Error! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
			$('#opportunityError').append(dataError);
		}
	})
})
$('.opportunityEdit').click(editForm);
//function open edit form
function editForm() {
	//set hidden input id
	var id_string = this.id;
	var id = id_string.substr(1);
	$('#opportunityId').val(id);
	// get the current row
	var currentRow = $(this).closest("tr");
	///get value
	var opportunityName = currentRow.find("td:eq(0)").text(); // get current row 1st TD value
	opportunityName = opportunityName.trim(); //remove space
	var opportunityDetail = currentRow.find("td:eq(1)").text(); // get current row 2nd TD
	opportunityDetail = opportunityDetail.trim() //remove space

	// insert data to form
	$('#opportunityEditName').val(opportunityName);
	$('#opportunityEditDetail').val(opportunityDetail);

}
//function save edit
$('#opportunityEditSave').click(function() {
	var opportunityEditName = $('#opportunityEditName').val();
	var opportunityEditDetail = $('#opportunityEditDetail').val();
	var opportuinityId = $('#opportunityId').val();
	var json = {
		opportunity_id: opportuinityId,
		opportunityName: opportunityEditName,
		opportunityDetail: opportunityEditDetail,
	}

	$.ajax({
		type: "POST",
		processData: false,
		contentType: "application/json",
		url: "/OpportunityEdit",
		data: JSON.stringify(json),
		dataType: 'json',
		cache: false,
		timeout: 600000,
		success: function(data) {
			var currentRow = $('#o' + data.opportunity_id).closest("tr");
			///replace value in table 
			currentRow.find("td:eq(0)").text(data.opportunityName);
			currentRow.find("td:eq(1)").text(data.opportunityDetail);
			//close modal
			$('#opportunityEditForm').modal('toggle');
			//show success
			var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Opportunity information has been saved! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
			$('#opportunityError').append(dataError);

		}, error: function() {
			//show failed
			var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Save failed! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
			$('#opportunityError').append(dataError);
		}
	})
});
//set event
$('.opportunityDelete').click(deleteOpportunity);
//delete  opportunity
function deleteOpportunity() {
	var idString = this.id;
	var id = idString.substr(1);
	$.ajax({
		type: "POST",
		contentType: "application/json",
		url: "/OpportunityDelete",
		data: id,
		dataType: "json",
		cache: false,
		timeout: 600000,
		success: function(data) {

			if (data.opportunity_id != 0) {
				//clear table
				$('#o' + data.opportunity_id).remove();
				// show success
				var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Deleted<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
				$('#opportunityError').append(dataError)
			}
			else {
				//show failed
				var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Delete Failed<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
				$('#opportunityError').append(dataError)
			}
		}
	})
}


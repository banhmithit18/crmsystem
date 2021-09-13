$(document).ready(function() {
	$("#competitorSearch").on("keyup", function() {
		var value = $(this).val().toLowerCase();
		$("#competitorTable tr").filter(function() {
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		});
	});
	$('#competitorCreate').click(function() {
		var competitorName = $('#competitorName').val();
		var competitorField = $('#competitorField').val();
		var competitorDetail = $('#competitorDetail').val();

		var json = {
			competitorName: competitorName,
			competitorField: competitorField,
			competitorDetail: competitorDetail
		}
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "/CompetitorCreate",
			data: JSON.stringify(json),
			dataType: 'json',
			cache: false,
			timeout: 600000,
			success: function(data) {

				//add to table
				var dataRow = '<tr id="c' + data.competitor_id + '">';
				dataRow += '<td>' + data.competitorName + '</td><td>' + data.competitorField + '</td><td>' + data.competitorDetail + '</td>';
				dataRow += '<td><button class="button-link competitorEditForm" id="c' + data.competitor_id + '" data-bs-toggle="modal"data-bs-target="#competitorEdit"><small> Edit&nbsp;</small></button>';
				dataRow += '<button class="button-link competitorOpportunityTable" id="c' + data.competitor_id + '" data-bs-toggle="modal"data-bs-target="#competitorOpportunity"><small> Opportunity&nbsp;</small></button>';
				dataRow += '<button class="button-link competitorDelete" id="l' + data.competitor_id + '"><small> Delete </small></button></td></tr>';
				//add row
				$('#competitorTableRow').append(dataRow);
				// clear form
				$('#competitorName').val("");
				$('#competitorField').val("");
				$('#competitorDetail').val("");

				$('.competitorEditForm').click(competitorEditForm);
				$('.competitorDelete').click(deleteCompetitor);
				$('.competitorOpportunityTable').click(competitorOpportunityTable);

				//show sucess
				var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Competitor has been added! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
				$('#competitorError').append(dataError);


			},
			error: function(e) {
				var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Error! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
				$('#competitorError').append(dataError);
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
	//event open competitor opportunity
	$('.competitorOpportunityTable').click(competitorOpportunityTable);
	//function get opportunity
	function competitorOpportunityTable() {
		var idWithString = this.id;
		//substring to get the id only
		var id = idWithString.substr(1);
		// set value to hidden input 
		$('#competitorId').val(id);
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "/CompetitorOpportunityTable",
			data: id,
			dataType: 'json',
			cache: false,
			timeout: 600000,
			success: function(data) {
				//remove tablee
				$("#tableOpportunity tr").remove();
				$.each(data, function(y, data) {
					//generate data
					var dataTable = '"<tr id="oc' + data.opportunity_id + '"><td>' + data.opportunityName + '</td><td>' + data.opportunityDetail + '</td> <td><button class="button-link competitorOpportunityDelete" id="ol' + data.opportunity_id + '"><small> Delete </small></button></td>';
					//add to table
					$('#tableOpportunity').append(dataTable);
					//add event
					$('#oc' + data.opportunity_id + ' .competitorOpportunityDelete ').click(deleteCompetitorOpportunity);
				});
			}
		})
	}
	//set evet add competitor opportunity
	$('#addCompetitorOpportunity').click(addCompetitorOpportunity);
	//add competitor opportunity
	function addCompetitorOpportunity() {
		var competitorId = $('#competitorId').val();
		var opportunityId = $('#opportunityId').val();
		var json = {
			competitorId: competitorId,
			opportunityId: opportunityId
		}

		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "/CompetitorOpportunityAdd",
			data: JSON.stringify(json),
			dataType: "json",
			cache: false,
			timeout: 600000,
			success: function(data) {
				if (data.opportunity_id != 0) {
					//generate data
					var dataTable = '"<tr id="oc' + data.opportunity_id + '"><td>' + data.opportunityName + '</td><td>' + data.opportunityDetail + '</td> <td><button class="button-link competitorOpportunityDelete" id="oc' + data.opportunity_id + '"><small> Delete </small></button></td>';
					//add to table
					$('#tableOpportunity').append(dataTable);
					//add event
					$('#oc' + data.opportunity_id + ' .competitorOpportunityDelete ').click(deleteCompetitorOpportunity);
					// show success
					var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Added<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#competitorOportunityError').append(dataError)
					// close modal
					$('#addCompetitorOpportunityForm').modal('toggle');

				}
				else {
					//show failed
					var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Add Failed<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#competitorOportunityError').append(dataError)
				}
			}
		})
	}
	//delete competitor opportunity
	function deleteCompetitorOpportunity() {
		var idString = this.id;
		var id = idString.substr(2);
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "/CompetitorOpportunityDelete",
			data: id,
			dataType: "json",
			cache: false,
			timeout: 600000,
			success: function(data) {
				if (data.opportunitycompetitor_id != 0) {
					//clear table
					$('#oc' + data.opportunitycompetitor_id).remove();
					// show success
					var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Deleted<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#competitorOportunityError').append(dataError)
				}
				else {
					//show failed
					var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Delete Failed<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#competitorOportunityError').append(dataError)
				}
			}
		})
	}

	//set event
	$('.competitorDelete').click(deleteCompetitor);
	//delete  competitor
	function deleteCompetitor() {
		var idString = this.id;
		var id = idString.substr(1);
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "/CompetitorDelete",
			data: id,
			dataType: "json",
			cache: false,
			timeout: 600000,
			success: function(data) {

				if (data.competitor_id != 0) {
					//clear table
					$('#c' + data.competitor_id).remove();
					// show success
					var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Deleted<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#competitorError').append(dataError)
				}
				else {
					//show failed
					var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Delete Failed, Please check the opportunities<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#competitorError').append(dataError)
				}
			}
		})
	}


	//event open form
	$('.competitorEditForm').click(competitorEditForm);
	//function for insert edit form
	function competitorEditForm() {
		var idWithString = this.id;
		//substring to get the id only
		var id = idWithString.substr(1);
		// set value to hidden input 
		$('#competitorId').val(id);
		// get the current row
		var currentRow = $(this).closest("tr");
		///get value
		var competitorName = currentRow.find("td:eq(0)").text(); // get current row 1st TD value
		competitorName = competitorName.trim();
		var competitorField = currentRow.find("td:eq(1)").text(); // get current row 2nd TD
		competitorField = competitorField.trim()
		var competitorDetail = currentRow.find("td:eq(2)").text(); // get current row 3rd TD
		competitorDetail = competitorDetail.trim();


		// insert data to form
		$('#competitorEditName').val(competitorName);
		$('#competitorEditField').val(competitorField);
		$('#competitorEditDetail').val(competitorDetail);

	}
	//function save edit
	$('#competitorEditSave').click(function() {
		var competitorEditName = $("#competitorEditName").val();
		var competitorEditField = $("#competitorEditField").val();
		var competitorEditDetail = $("#competitorEditDetail").val();
		var competitorId = $('#competitorId').val();

		var json = {
			competitor_id: competitorId,
			competitorName: competitorEditName,
			competitorField: competitorEditField,
			competitorDetail: competitorEditDetail,

		}

		$.ajax({
			type: "POST",
			processData: false,
			contentType: "application/json",
			url: "/CompetitorEdit",
			data: JSON.stringify(json),
			dataType: 'json',
			cache: false,
			timeout: 600000,
			success: function(data) {
				var currentRow = $('#c' + data.competitor_id).closest("tr");
				///replace value in table 
				currentRow.find("td:eq(0)").text(data.competitorName);
				currentRow.find("td:eq(1)").text(data.competitorField);
				currentRow.find("td:eq(2)").text(data.competitorDetail);


				$('#competitorEdit').modal('toggle');
				var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Competitor information has been saved! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
				$('#competitorError').append(dataError);

			}, error: function() {
				var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Save failed! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
				$('#competitorError').append(dataError);
			}
		})
	});

});
$(document).ready(function() {
	$("#caseSearch").on("keyup", function() {
		var value = $(this).val().toLowerCase();
		$("#caseTable tr").filter(function() {
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		});
	});

	$('#caseCreate').click(function() {
		var caseName = $('#caseName').val();
		var caseDetail = $('#caseDetail').val();
		var caseStatus = $('#caseStatus').find('option:selected').text();
		var invoiceId = $('#invoiceId').val();
		var json = {
			caseName: caseName,
			caseDetail: caseDetail,
			caseStatus: caseStatus,
			invoiceId: invoiceId,
			userID: 0
		}
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "/CaseCreate",
			data: JSON.stringify(json),
			dataType: 'json',
			cache: false,
			timeout: 600000,
			success: function(data) {
				//if lead phone exists
				if (data.invoiceId == 0) {
					// show error
					var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Cannot find invoice! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#caseError').append(dataError);
				}
				else {

					//add to table
					var dataRow = '<tr id="ca' + data.case_id + '">';
					dataRow += '<td>' + data.caseName + '</td><td>' + data.invoiceId + '</td><td>' + data.caseDetail + '</td><td>' + data.caseStatus + '</td>';
					dataRow += '<td><button class="button-link openServiceCalendarTable" id="ca' + data.case_id + '" data-bs-toggle="modal"data-bs-target="#serviceCalendar"><small> Service&nbsp;</small></button>';
					dataRow += '<button class="button-link caseEditForm" id="ca' + data.case_id + '" data-bs-toggle="modal"data-bs-target="#caseEdit"><small> Edit&nbsp;</small></button>';
					dataRow += '<button class="button-link caseDelete" id="ca' + data.case_id + '"><small> Delete </small></button></td></tr>';
					//add row
					$('#caseTableRow').append(dataRow);
					// clear form
					$('#caseName').val("");
					$('#caseDetail').val("");
					$('#InvoiceId').val("");
					$('#caseStatus').val("");
					//add event
					$('.caseEditForm').click(caseEditForm);
					$('.caseDelete').click(deleteCase);
					$('.openServiceCalendarTable').click(openServiceCalendarTable);

					//show sucess
					var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Case has been added! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#caseError').append(dataError);
				}

			},
			error: function(e) {
				var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Case cannot be created! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
				$('#caseError').append(dataError);
			}
		});

	})

	$('.caseDelete').click(deleteCase);
	//delete  
	function deleteCase() {
		var idString = this.id;
		var id = idString.substr(2);
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "/CaseDelete",
			data: id,
			dataType: "json",
			cache: false,
			timeout: 600000,
			success: function(data) {

				if (data.case_id != 0) {
					//clear table
					$('#ca' + data.case_id).remove();
					// show success
					var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Deleted<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#caseError').append(dataError)
				}
				else {
					//show failed
					var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Delete Failed <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#caseError').append(dataError)
				}
			}
		})
	}

	//event open service calendar table
	$('.openServiceCalendarTable').click(openServiceCalendarTable);
	//function get 
	function openServiceCalendarTable() {
		var idWithString = this.id;
		//substring to get the id only
		var id = idWithString.substr(2);
		// set value to hidden input 
		$('#caseId').val(id);
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "/ServiceCalendarTable",
			data: id,
			dataType: 'json',
			cache: false,
			timeout: 600000,
			success: function(data) {
				//remove tablee
				$("#serviceCalendarTableRow tr").remove();
				$.each(data, function(y, data) {
					//generate data
					var dataTable = '"<tr id="sc' + data.serviceCalendarId + '"><td>'+ data.userFullname +'</td><td>' + data.assignedDate + '</td> <td><button class="button-link serviceCalendarDelete" id="sc' + data.serviceCalendarId + '"><small> Delete </small></button></td></tr>';
					//add to table
					$('#serviceCalendarTableRow').append(dataTable);
					//add event
					$('.serviceCalendarDelete').click(serviceCalendarDelete);
				});
			}
		})
	}

	//delete service calendar
	$('.serviceCalendarDelete').click(serviceCalendarDelete);
	//function
	function serviceCalendarDelete() {
		var idString = this.id;
		var id = idString.substr(2);
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "/ServiceCalendarDelete",
			data: id,
			dataType: "json",
			cache: false,
			timeout: 600000,
			success: function(data) {

				if (data.servicecalendar_id != 0) {
					//clear table
					$('#sc' + data.servicecalendar_id).remove();
					// show success
					var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Deleted<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#serviceCalendarError').append(dataError)
				}
				else {
					//show failed
					var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Delete Failed <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#serviceCalendarError').append(dataError)
				}
			}
		})
	}
	//open service calendar form
	$('#serviceCalendarCreate').click(serviceCalendarCreate);
	//function
	function serviceCalendarCreate() {
		var userId = $("#employeeSelect").find('option:selected').val();
		var assignedDate = $('#assignedDate').val();
		var caseId = $('#caseId').val();
		var json = {
			userId: userId,
			assignedDate: assignedDate,
			caseId : caseId,
		};
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "/ServiceCalendarCreate",
			data: JSON.stringify(json),
			dataType: 'json',
			cache: false,
			timeout: 600000,
			success: function(data) {
				
				if (data.serviceCalendarId != 0) {


					//add to table
					var dataRow = '<tr id="sc' + data.serviceCalendarId + '">';
					dataRow += '<td>' + data.userFullname + '</td><td>' + data.assignedDate + '</td>';
					dataRow += '<td><button class="button-link serviceCalendarDelete" id="sc' + data.serviceCalendarId + '"><small> Delete&nbsp;</small></button>';
					dataRow += '</td></tr>';
					//add row
					$('#serviceCalendarTableRow').append(dataRow);
					// clear form
					$('#assignedDate').val("");
					//add event
					$('.serviceCalendarDelete').click(serviceCalendarDelete);
					// close modal
					$('#serviceCalendarForm').modal('toggle');
					//show sucess
					var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Employee has been assigned! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#serviceCalendarError').append(dataError);

				}
				else {
					var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Failed!</strong> Employee has not been assigned! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#serviceCalendarError').append(dataError);
				}

			}
		});

	}

	//event open form
	$('.caseEditForm').click(caseEditForm);
	//function for insert edit form
	function caseEditForm() {
		var idWithString = this.id;
		//substring to get the id only
		var id = idWithString.substr(2);
		// set value to hidden input 
		$('#caseId').val(id);
		// get the current row
		var currentRow = $(this).closest("tr");
		///get value
		var caseName = currentRow.find("td:eq(0)").text(); // get current row 1st TD value
		caseName = caseName.trim();
		var caseDetail = currentRow.find("td:eq(2)").text(); // get current row 2nd TD
		caseDetail = caseDetail.trim()
		var caseStatus = currentRow.find("td:eq(3)").text(); // get current row 3rd TD
		caseStatus = caseStatus.trim();

		// insert data to form
		$('#caseEditName').val(caseName);
		$('#caseEditDetail').val(caseDetail);
		var status = $('#caseStatus').find('option:selected').text();
		$("#caseEditStatus select option").filter(function() {
			//may want to use $.trim in here
			return $(this).text() == status;
		}).prop('selected', true);
	}
	//function save edit
	$('#caseEditSave').click(function() {
		var caseEditName = $("#caseEditName").val();
		var caseEditDetail = $("#caseEditDetail").val();
		var caseEditStatus = $('#caseEditStatus').find('option:selected').text();
		var caseId = $('#caseId').val();

		var json = {
			case_id: caseId,
			caseName: caseEditName,
			caseDetail: caseEditDetail,
			caseStatus: caseEditStatus
		}

		$.ajax({
			type: "POST",
			processData: false,
			contentType: "application/json",
			url: "/CaseEdit",
			data: JSON.stringify(json),
			dataType: 'json',
			cache: false,
			timeout: 600000,
			success: function(data) {
				var currentRow = $('#ca' + data.case_id).closest("tr");
				///replace value in table 
				currentRow.find("td:eq(2)").text(data.caseDetail);
				currentRow.find("td:eq(3)").text(data.caseStatus);


				$('#caseEdit').modal('toggle');
				var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Caswe information has been saved! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
				$('#caseError').append(dataError);

			}, error: function() {
				var dataError = '<div class="alert alert-danger alert-dismissible fade show" role="alert"> <strong>Error!</strong> Save failed! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
				$('#caseError').append(dataError);
			}
		})
	});

});
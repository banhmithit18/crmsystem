$(document).ready(function() {
	$('.accountEmail').click(function(){
		var email_reciever =  this.id;
		$('#emailReceiver').val(email_reciever)
	});
	//set event
	$('#sendEmail').click(sendEmail);
	//delete  contact
	function sendEmail() {
		var email_reciever =  $('#emailReceiver').val()
		var email_subject = $('#emailSubject').val()
		var email_content = $('#emailContent').val()
		var json = {
			receiver : email_reciever,
			subject : email_subject,
			content : email_content
		}
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "/SendEmail",
			data: JSON.stringify(json),
			dataType: "json",
			cache: false,
			timeout: 600000,
			success: function(data) {
				
					var dataError = '<div class="alert alert-success alert-dismissible fade show" role="alert"> <strong>Success!</strong> Email Sent! <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					$('#emailError').append(dataError)
				
			}
		})
	}

});
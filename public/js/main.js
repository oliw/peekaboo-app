$(document).ready(function() {
	$('.scroll').click(function() {
		var link = $(this).attr('href');
	    $('html, body').animate({
	        scrollTop: $(link).offset().top - 60
	        }, 2000);
	});
	
});

function isEmail(email) {
  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  return regex.test(email);
}

function showError(elem, show) {
	if (show) {
		if (!$(elem).hasClass("has-error")) {
			$(elem).addClass("has-error");
		}
	} else {
		$(elem).removeClass("has-error");
	}
}

function validateForm()
{
	var isOkay = true;
	$('input').each(function() {
		if (!$(this).val()) {
			showError($(this).parent(), true);
			isOkay = false;
		} else {
			showError($(this).parent(), false);
		}
	});
	return isOkay;
}
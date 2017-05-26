$(document).ready(function () {
    var text1 = $('.left-item-1').html();
    var text2 = $('.left-item-2').html();
    var text3 = $('.right-item-1').html();
    var text4 = $('.right-item-2').html();
    var left = [text1, text2];
    var right = [text3, text4];
    var i = 1;
    var j = 1;
    setInterval(function () {
        $('.changing-text-left').slideToggle(500, function () {

            var $this = $(this);
            $this.html(left[i]);
            i === 1 ? i = 0 : i++;
            //$this.toggleClass('first second');
            $this.fadeIn(500);
        });
    }, 11000);

    setInterval(function () {
        $('.changing-text-right').slideToggle(500, function () {

            var $this = $(this);
            $this.html(right[j]);
            j === 1 ? j = 0 : j++;
            //$this.toggleClass('first second');
            $this.fadeIn(500);
        });
    }, 13000);
    
    
});

/*function inputFieldValidation() {
	var enableFormSubmit = true;
	var strErrorMsg = "<strong>Please fix following fields</strong><ul>";

	$('.jqValidate').each(function () {

		var $this = $(this);
		var inputName = $this.attr('name');
		var hasError = false;
		
		//var charectersLimit = parseInt($this.attr('id'));
		if ($this.hasClass("mandatory")) {


			if ($this.val().trim() === "") {
				enableFormSubmit = false;
				strErrorMsg += '<li> ' + inputName + ' field can not be blank </li>';
				$this.parent().addClass("has-error");
				hasError = true;

			}
			
		}

		/*if ($this.val().trim().length > charectersLimit) {
			enableFormSubmit = false;
			strErrorMsg += '<li> ' + inputName + ' field should be limited of ' + charectersLimit + ' characters </li>';
			$this.parent().addClass("has-error");
			hasError = true;
		}#1#

		if (hasError === false) {

			$this.parent().removeClass("has-error");
		}
	});



	if (!enableFormSubmit) {
		
		$('#alertDiv').removeClass("hidden");

		strErrorMsg += "</ul>";
		var str = ShowFailAlertMessage(strErrorMsg);
		$('#alertDiv').html(str);

	}

	else {
		if (!$('#alertDiv').is("hidden")) {
			$('#alertDiv').addClass(" hidden");

		}
	}
	return enableFormSubmit;
}

function ShowFailAlertMessage(strErrorMsg) {
	var alertMessageBox = '<div class="alert alert-danger alert-dismissible m-t-20 m-b-0" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button><strong>Please fix following fields</strong >' ;
	alertMessageBox += strErrorMsg;
	alertMessageBox += '</div>';
	return alertMessageBox;
}*/

function inputFieldValidation() {

	var enableFormSubmit = true;
	var strErrorMsg;

	$('.jqValidate').each(function () {
		var placeholder = $(this).prop("placeholder");

		var message = placeholder.substring(placeholder.indexOf(" ") + 1, placeholder.length);
		//$(".jqValidate").prop("name", $(this).prop("placeholder"));
		if (placeholder === "Retype Password") {
			message = placeholder;
		}
		var $this = $(this);
		//var inputName = $this.attr('name');
		var hasError = false;

		//var charectersLimit = parseInt($this.attr('id'));
		if ($this.hasClass("mandatory")) {


			if ($this.val().trim() === "") {
				enableFormSubmit = false;
				strErrorMsg = '\'' + message + '\' field can not be blank.';
				hasError = true;

			}

		}

		/*if ($this.val().trim().length > charectersLimit) {
			enableFormSubmit = false;
			strErrorMsg += '<li> ' + message + ' field should be limited of ' + charectersLimit + ' characters </li>';
			$this.parent().addClass("has-error");
			hasError = true;
		}*/

		/*if (hasError === false) {

			$this.removeClass("has-error");

		}*/

		if (hasError) {
			$this.addClass("has-error");
			$this.next().css("display", "inline");
			$this.next().html(message + " field can not be blank");
			$this.parent().parent().addClass("parent-bottom-margin");

		} else {
			$this.removeClass("has-error");
			$this.next().css("display", "none");
			$this.parent().parent().removeClass("parent-bottom-margin");
			
			if ($('.btn-primary').hasClass('feedbackAlert')) {
				$.alert({
					title: '',
					content: 'Thank you for your valueable feedback.'
				});
			}
		}
	});



	/*if (!enableFormSubmit) {

		$('#alertDiv').removeClass("hidden");

		strErrorMsg += "</ul>";
		var str = ShowFailAlertMessage(strErrorMsg);
		$('#alertDiv').html(str);


	}

	else {
		if (!$('#alertDiv').is("hidden")) {
			$('#alertDiv').addClass(" hidden");

		}
	}*/
	return enableFormSubmit;
}

function ShowFailAlertMessage(strErrorMsg) {
	var alertMessageBox = '<div class="alert alert-danger alert-dismissible m-t-20 m-b-0" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button><strong>Please fix following fields</strong >';
	alertMessageBox += strErrorMsg;
	alertMessageBox += '</div>';
	return alertMessageBox;
}

function radioButtonValidation() {
	var enableFormSubmit = true;

	$('.jqValidate').each(function () {
		var $this = $(this);
		var $id = $this.attr('id');
		var $value = $('#' + $id + ' input:checked').val();
		var $val = $this.val();
		if ($this.hasClass("mandatory")) {
			if ($value === undefined && $val==="") {
				enableFormSubmit = false;
				
			}
		}
	});
	if (!enableFormSubmit) {
		//alert("Please answer all the question and then submit.");
		$.alert({
			title: 'Alert!',
			content: 'Please answer all the question and then submit.'
		});
	}
	return enableFormSubmit;
}


function stickyRelocateLeft() {
	var windowTop = $(window).scrollTop();
	var windowBottom = windowTop + $(window).height();

	var divTop = $('#sticky-anchor').offset().top;
	var divBottom = $('#middle-panel').position().top + $('#middle-panel').offset().top + $('#middle-panel').outerHeight(true);
	var bottom = $('#sticky').position().top + $('#sticky').offset().top + $('#sticky').outerHeight(true);

	if (windowTop > divTop && windowBottom < divBottom) {
		$('#sticky').addClass('stick col-3');
		$('#sticky-anchor').height($('#sticky').outerHeight(true));
		//var outerHeightd = $('#sticky-anchor').height();

	} else {
		var divTopSticky = $('#sticky').offset().top - $('#middle-panel').offset().top;
		$('#sticky').removeClass('stick col-3');
		if (windowTop < divTop) {
			$('#sticky-anchor').height(0);
		}
		else if (windowBottom > divBottom) {
			$('#sticky-anchor').height(divTopSticky);
		}

	}
}

function stickyRelocateRight() {
	var windowTop = $(window).scrollTop();
	var windowBottom = windowTop + $(window).height();

	var divTop = $('#sticky-anchor-right').offset().top;
	var divBottom = $('#middle-panel').position().top + $('#middle-panel').offset().top + $('#middle-panel').outerHeight(true);

	if (windowTop > divTop && windowBottom < divBottom) {
		$('#sticky-right').addClass('stick col-3');
		$('#sticky-anchor-right').height($('#sticky-right').outerHeight(true));
		//var outerHeightd = $('#sticky-anchor').height();

	} else {
		var divTopSticky = $('#sticky-right').offset().top - $('#middle-panel').offset().top;
		$('#sticky-right').removeClass('stick col-3');
		if (windowTop < divTop) {
			$('#sticky-anchor-right').height(0);
		}
		else if (windowBottom > divBottom) {
			$('#sticky-anchor-right').height(divTopSticky);
		}

	}
}

function stickyRelocateTop() {
	var windowTop = $(window).scrollTop();
	var windowBottom = windowTop + $(window).height();

	var divTop = $('#sticky-anchor-top').offset().top;
	//var divBottom = $('#middle-panel').position().top + $('#middle-panel').offset().top + $('#middle-panel').outerHeight(true);

	if (windowTop > divTop) {
		$('#sticky-top').addClass('stick col-6');
		$('#sticky-anchor-top').height($('#sticky-top').outerHeight(true));
		//var outerHeightd = $('#sticky-anchor').height();

	} else {
		//var divTopSticky = $('#sticky-top').offset().top - $('#middle-panel').offset().top;
		$('#sticky-top').removeClass('stick col-3');
		//if (windowTop < divTop) {
		$('#sticky-anchor-top').height(0);
		//}
		//else if (windowBottom > divBottom) {
		//$('#sticky-anchor-top').height(divTopSticky);
		//}

	}
}

$(function () {
	$(window).scroll(stickyRelocateLeft);
	if ($(window).width > 960) {
		stickyRelocateLeft();
	} else {
		$('#sticky').removeClass('stick col-3');
		$('#sticky-anchor').height(0);
	}
});
$(function () {
	$(window).scroll(stickyRelocateRight);
	if ($(window).width > 960) {
		stickyRelocateRight();
	} else {
		$('#sticky-right').removeClass('stick col-3');
		$('#sticky-anchor-right').height(0);
	}
});
$(function () {
	$(window).resize(function () {
		var width = $(document).width();
		if (width <= 768) {
			$('#sticky').removeClass('stick col-3');
			$('#sticky-anchor').height(0);
			$('#sticky-right').removeClass('stick col-3');
			$('#sticky-anchor-right').height(0);
			$('#sticky').attr("id","stickyN");
			$('#sticky-anchor').attr("id", "sticky-anchorN");
			$('#sticky-anchor-right').attr("id", "sticky-anchor-rightN");
			$('#sticky-right').attr("id", "sticky-rightN");
		} else {
			$('#stickyN').attr("id", "sticky");
			$('#sticky-anchorN').attr("id", "sticky-anchor");
			$('#sticky-anchor-rightN').attr("id", "sticky-anchor-right");
			$('#sticky-rightN').attr("id", "sticky-right");

		}
	});
	/*$(window).scroll(stickyRelocateTop);
	stickyRelocateTop();*/
});


$(document).on("click", ".edit-tools .edit-btn", function(){
	$(this).parents('div.all-info').find('.edit-tools').hide();
	$(this).parents('div.all-info').find('.btn-form-control').removeClass('hidden');
	$(this).parents('div.all-info').find('.form-group').find('.onclick-hidden').addClass('yes');
});
$(document).on("click", ".all-info form .btn-cancel", function(){
	$(this).parents('div.all-info').find('form').addClass('view-mode');
	$(this).parents('div.all-info').find('.edit-tools').show();
	$(this).parents('div.all-info').find('.btn-form-control').addClass('hidden');
	$(this).parents('div.all-info').find('.form-group').find('.onclick-hidden').removeClass('yes');
});
$(document).on("click", ".tab-group .btn", function(){
	$(this).parents('div.tab-group').find('.btn').removeClass('active');
	$(this).addClass('active');
});
function toggleIcon(e) {
$(e.target)
    .prev('.panel-heading')
    .find(".indicator")
    .toggleClass('icon-minus icon-plus');
}
$('.panel-group').on('hidden.bs.collapse', toggleIcon).css('color','#000');
$('.panel-group').on('shown.bs.collapse', toggleIcon);

// EDIT RESUME TAB
$(document).on("click", ".btn-tab-personal", function(){
	$(this).parents('div.big-card').find('.resume-panel-group').hide();
	$('.resume-panel-group.personal').removeClass('hidden');
	$('.resume-panel-group.personal').show();
	// $('.loader').fadeIn();
});
$(document).on("click", ".btn-tab-education", function(){
	$(this).parents('div.big-card').find('.resume-panel-group').hide();
	$('.resume-panel-group.education').removeClass('hidden');
	$('.resume-panel-group.education').show();
});
$(document).on("click", ".btn-tab-employment", function(){
	$(this).parents('div.big-card').find('.resume-panel-group').hide();
	$('.resume-panel-group.employment').removeClass('hidden');
	$('.resume-panel-group.employment').show();
});
$(document).on("click", ".btn-tab-others", function(){
	$(this).parents('div.big-card').find('.resume-panel-group').hide();
	$('.resume-panel-group.others').removeClass('hidden');
	$('.resume-panel-group.others').show();
});
$(document).on("click", ".btn-tab-photograph", function(){
	$(this).parents('div.big-card').find('.resume-panel-group').hide();
	$('.resume-panel-group.photograph').removeClass('hidden');
	$('.resume-panel-group.photograph').show();
});


// Nationality
$(document).on("click", ".onclick", function(){
	$(this).parents('div.btn-form-control').find('.onclick-show').removeClass('hidden');
});
$(document).on("click", ".onclick-o", function(){
	$(this).parents('div.btn-form-control').find('.onclick-show').addClass('hidden');
});



$(document).on("mouseover", ".chips-container a", function(){
	$(this).parents('div.chips-container .well').addClass('hover');
});
$(document).on("mouseout", ".chips-container a", function(){
	$(this).parents('div.chips-container .well').removeClass('hover');
});


// Wells onclick hide
$(document).on("click", ".chips-container a.dismiss", function(){
	$(this).parents('div.well').fadeOut();
});

$(document).on("click", ".edit-tools .edit-btn", function(){
	$(this).parents('div.all-info').find('form').removeClass('view-mode');
});

$(document).ready(function(){
    $('[data-toggle="popover"]').popover(); 
});


// GOOD AND ORDINARY EXAMPLE
$(document).on("click", ".edit-tools .edit-btn", function(){
	$(this).parents('div.all-info').find('form').removeClass('view-mode');
});

// PHOTO UPLOAD EDIT RESUME
$(function () {
    $(":file").change(function () {
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            reader.onload = imageIsLoaded;
            reader.readAsDataURL(this.files[0]);
        }
    });
});

function imageIsLoaded(e) {
    $('#userImg').attr('src', e.target.result);
};


$(function(){
    $('.has-spinner').click(function() {
        $(this).toggleClass('active');
    });
});

// UPLOADING
$(document).on("click", ".btn-upload", function(){
	$(this).find('i.icon-upload').removeClass('icon-upload').addClass('spin icon-circle-loader');
	$(this).addClass('uploading');
});

// $('.alert.alert-dismissible').fadeIn('fast').delay(2000).fadeOut('slow');

function addCommonForm(type){
	   $("#noData_" + type).hide();
	   $("#btnAdd_" + type).prop('disabled', true);
		/*if (referenceNo>=0){
			$("#btnAdd_ref").hide();
			}*/
		$("#div_" + type).css("display", "block");
		//var qualification = $("#pq").html();
		//$("#div_pq").html(qualification);
		$("#div_" + type + " form").removeClass("view-mode");
		$("#div_" + type + " form div").last().removeClass("hidden");
		$("#div_" + type + " .edit-tools").css("display", "none");
	}




function closeDiv(type,itemNo){
	  $('#btnAdd_'+type).prop('disabled', false);
	  $("#div_"+type).empty();
	  $('#alertDiv_'+type+'_'+itemNo).hide();
	  //$("#btnAdd_"+type).show();
	  $("#noData_"+type).show();
	  $("body").load(window.location.href + '#body');
	  }

/*function addCommonForm(type){
	   $("#noData_"+type).hide();
	   $("#btnAdd_"+type).prop('disabled', true);*/
		/*if (referenceNo>=0){
			$("#btnAdd_ref").hide();
			}*/
		/*var refDiv = $("#tr").html();
		$("#div_"+type).html(refDiv);
		$("#div_"+type+" form").removeClass("view-mode");
		$("#div_"+type+" form div").last().removeClass("hidden");
		$("#div_"+type+" .edit-tools").css("display", "none");
	}*/
	
	
	
	
function inputFieldValidation(type_other,itemNo)
{
	var enableFormSubmit = true;
	var strErrorMsg = "<strong>Please fix following fields</strong><ul>";
	
	 $('.jqValidate_'+type_other+'_'+itemNo).each(function() 
	 {
	   
		  //alert("required");
		  var $this = $(this);
		  var inputName = $this.attr('name');
		  var hasError=false;
		  //alert($this)
		  var charectersLimit=parseInt($this.attr('id'));
		  if ($this.hasClass("mandatory"))
		  {
			  
			  	   
				  if($this.val()=="" || $this.val()=="Select" ) 
				  {
					  enableFormSubmit = false;
					  strErrorMsg += '<li> ' + inputName + ' field can not be blank </li>';
					  $this.parent().addClass("has-error");
					  hasError=true;
					  
				  }
				  /*else
				  {
				  	  $this.parent().removeClass("has-error")
				  }*/
  
			}
			  
		   if ($this.val().length>charectersLimit)
			{
				 enableFormSubmit = false;
				 strErrorMsg += '<li> ' + inputName + ' field should be limit of '+charectersLimit+' characters </li>';
				 $this.parent().addClass("has-error");
				  hasError=true;
			}
			
			if ( hasError==false)
			{
				
			  $this.parent().removeClass("has-error")
			}
		});
	  
	  
	// $('.jqValidate_optional_'+type_other+'_'+itemNo).each(function() 
//	 {
//	   
//		  //alert("optional");
//		  var $this = $(this);
//		  var inputName = $this.attr('name');
//		  var charectersLimit=parseInt($this.attr('id'));
//		  //alert($this)
//		  
//		  
//		  
//		    if ($this.val().length>charectersLimit)
//			{
//				 enableFormSubmit = false;
//				 strErrorMsg += '<li> ' + inputName + ' field should be limit of '+charectersLimit+' characters </li>';
//				 $this.parent().addClass("has-error")
//			}
//			
//			else
//			{
//			  $this.parent().removeClass("has-error")
//			}
//			
//	});

	
	 if(!enableFormSubmit) 
	  {
		  //alert(errorMessage);
		  $('#alertDiv_'+type_other+'_'+itemNo).removeClass("hidden");
		 // if (!$('#alertDiv_'+type_other+'_'+itemNo).is("alert-danger"))
//		  {
//			  $('#alertDiv_'+type_other+'_'+itemNo).addClass("alert-danger");
//		   } 
		  strErrorMsg+="</ul>"
		  var str=showFailAlertMessage(strErrorMsg)
		  $('#alertDiv_'+type_other+'_'+itemNo).html(str);
		   
	  }
	  
	  else
	  {
		  if (!$('#alertDiv_'+type_other+'_'+itemNo).is("hidden"))
		  {
			$('#alertDiv_'+type_other+'_'+itemNo).addClass(" hidden");
			
		   }
	  }
	   return enableFormSubmit;
}


function showFailAlertMessage(strMsg)
{
	var msgDiv = "<div class='alert alert-danger alert-dismissible m-t-20 m-b-0' role='alert'>";
	    msgDiv = msgDiv + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>×</span></button>";
		msgDiv = msgDiv + strMsg;
		msgDiv = msgDiv + "</div>";
		
		return msgDiv;
}



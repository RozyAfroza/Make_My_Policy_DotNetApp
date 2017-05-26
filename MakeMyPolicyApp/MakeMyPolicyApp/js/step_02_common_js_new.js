function addCommonForm(type){
	   $("#noData_" + type).hide();
	   $("#btnAdd_" + type).prop('disabled', true);
	    var commonDiv = $("#"+type).html();
		$("#div_"+type).html(commonDiv);
		/*if (referenceNo>=0){
			$("#btnAdd_ref").hide();
			}*/
		//$("#div_"+type).load(location.href + "#div_"+type);
		//$("#div_"+type).show();
		$("#div_" + type).css("display", "block");
		//var qualification = $("#pq").html();
		//$("#div_pq").html(qualification);
		$("#div_" + type + " form").removeClass("view-mode");
		$("#div_" + type + " form div").last().removeClass("hidden");
		$("#div_" + type + " .edit-tools").css("display", "none");
	}



function inputFieldValidation(type_other,itemNo)
{
	var enableFormSubmit = true;
	var strErrorMsg = "<strong>Please fix following fields</strong><ul>";
	
	 $('#'+type_other+'Form_'+itemNo+' .jqValidate_'+type_other).each(function() 
	 {
	   var dat = $(this).val();
		  var $this = $(this);
		  var name = $this.attr('name');
		  var inputName=name.slice(3,name.length);
		  var hasError=false;
		  var charectersLimit=parseInt($this.attr('id'));
		  if ($this.hasClass("mandatory"))
		  {
			  
			  	   
				  if($this.val().trim()=="" || $this.val()=="Select" ) 
				  {
					  enableFormSubmit = false;
					  strErrorMsg += '<li> ' + inputName + ' field can not be blank </li>';
					  $this.parent().addClass("has-error");
					  hasError=true;
				  }
			}
			  
		   if ($this.val().trim().length>charectersLimit)
			{
				 enableFormSubmit = false;
				 strErrorMsg += '<li> ' + inputName + ' field should be limit of '+charectersLimit+' characters </li>';
				 $this.parent().addClass("has-error");
				  hasError=true;
			}
			
			if ($this.hasClass("datepicker") && $this.val().trim()==""){
				var CUR_DATE=document.getElementById('hCurrentDate').value;
				var value = $this.val();
				var toDateSelector = '#'+type_other+'Form_'+itemNo+' .toDate';
				var toTate = $(toDateSelector).val();
				var name = $(toDateSelector).attr('name');
				var toDateName=name.slice(3,name.length);
				
				/*if (value =='-1' || value.trim()=='' ){
					enableFormSubmit = false;
				    strErrorMsg += '<li> Invalid' + inputName + '</li>';
				    $this.parent().addClass("has-error");
				    hasError=true;	
				}*/
				if($this.hasClass("fromDate") && (value == toTate))
				{
					enableFormSubmit = false;
				    strErrorMsg += '<li> ' + inputName + 'and To Date cannot be same !</li>';
				    $this.parent().addClass("has-error");
				    hasError=true;
				}
				
				if (checkdate(value,"/")==false){
					enableFormSubmit = false;
				    strErrorMsg += '<li> Invalid' + inputName + '</li>';
				    $this.parent().addClass("has-error");
				    hasError=true;
				}
				
				if (!$this.hasClass('greater') && CompareDateIsInValid(CUR_DATE,value)){
					enableFormSubmit = false;
				    strErrorMsg += '<li> ' + inputName + ' can not be greater than Current date!</li>';
				    $this.parent().addClass("has-error");
				    hasError=true;
				}
				
				if ($this.hasClass("fromDate") && CompareDateIsInValid(toTate,value)){
					enableFormSubmit = false;
				    strErrorMsg += '<li> ' + inputName + ' can not be greater than '+ toDateName +'!</li>';
				    $this.parent().addClass("has-error");
				    hasError=true;
				}
			}
			
			if ( hasError==false)
			{
				
			  $this.parent().removeClass("has-error")
			}
		});
	  
	 if(!enableFormSubmit) 
	  {
		  //alert(errorMessage);
		  $('.'+type_other+'_'+itemNo+' #alertDiv_'+type_other).removeClass("hidden");
		  
		  strErrorMsg+="</ul>"
		  var str=showFailAlertMessage(strErrorMsg)
		  $('.'+type_other+'_'+itemNo+' #alertDiv_'+type_other).html(str);
	  }
	  
	  else
	  {
		  if (!$('.'+type_other+'_'+itemNo+' #alertDiv_'+type_other).is("hidden"))
		  {
			$('.'+type_other+'_'+itemNo+' #alertDiv_'+type_other).addClass(" hidden");
			
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





function checkdate(dtDate,strSeparator)
{
	var strDate;
	var strDateArray;
	var strDay;
	var strMonth;
	var strYear;
	var intday;
	var intMonth;
	var intYear;
	//var strSeparatorArray = new Array("-"," ","/",".");
//	var intElementNr;
	strDate = dtDate;
	strDateArray = strDate.split(strSeparator);

	strMonth = strDateArray[0];
	strDay = strDateArray[1];
	strYear = strDateArray[2];

	intday = parseInt(strDay);
	intMonth = parseInt(strMonth);
	intYear = parseInt(strYear);

	if (intMonth>12 || intMonth<1)
	{
		return false;
	}

	if (intday>31 || intday<1)
	{
		return false;
	}

	if (intYear<1)
	{
		return false;
	}

	if ((intMonth == 1 || intMonth == 3 || intMonth == 5 || intMonth == 7 || intMonth == 8 || intMonth == 10 || intMonth == 12) && (intday > 31 || intday < 1)) 
	{
	return false;
	}

	if ((intMonth == 4 || intMonth == 6 || intMonth == 9 || intMonth == 11) && (intday > 30 || intday < 1))
	{
		return false;
	}

	if (intMonth == 2)
	{
		if (intday < 1)
			{
				return false;
			}
		if (LeapYear(intYear) == true)
		{
			if (intday > 29)
			{
				return false;
			}
		}
	else
		{
		if (intday > 28)
			{
				return false;
			}
		}
	}
	return true;
}

function LeapYear(intYear)
{
	if (intYear % 100 == 0)
	{
		if (intYear % 400 == 0) { return true; }
	}
	else
	{
		if ((intYear % 4) == 0) { return true; }
	}
	return false;
}// JavaScript Document

function SetValue()
{
	if (document.getElementById("chkContinue" ).checked == true)
	{   document.getElementById("cboTODate").selectedIndex = 0;
		
		document.getElementById("cboTODate").disabled = true;			
	}
	else
	{	document.getElementById("cboTODate").disabled = false;
	
	}
}
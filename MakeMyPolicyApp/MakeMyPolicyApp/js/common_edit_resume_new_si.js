function setEditMode(divID,btn)
{
	var x = document.getElementById(divID).querySelectorAll(".inpClass");
	var y = document.getElementById(divID).querySelectorAll(".para");
	var i;
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "block";
	   y[i].style.display = "none";
    }
	document.getElementById(btn).style.display = "block";

//$("#"+divID).find('.inpClass').type = 'text';
 
}

function setViewMode(divID)
{
	//$(this).parents('div.all-info').find('form').hide();
	//$(this).parents('div.all-info').find('.panel-details').show();
	//$(this).parents('div.all-info').find('.edit-tools').show();
	
	//$("div."+ divID ).find('form').hide();
	//$("div."+ divID).find('.panel-details').show();
	//$("div."+ divID).find('.edit-tools').show();
	
	$('div.'+divID).find('form').addClass('view-mode');
	$('div.'+divID).find('.edit-tools').show();
	$('div.'+divID).find('.btn-form-control').addClass('hidden');
	$('div.'+divID).find('.form-group').find('.onclick-hidden').removeClass('yes');
	
 
}

function getCommonValidation(strParam,version)
{
	 var returnValue;
	if(strParam == "per")
	{
		returnValue = personal_info_validation(version);
	}
	else if(strParam == "cai")
	{
		returnValue = Career_Application_Validate(version);
	}
	else if(strParam == "jclo")
	{
		returnValue = Category_Location_Organization_Validate(version);
	}
	else if(strParam == "ref")
	{
		returnValue = inputFieldValidation(strParam,version);
	}
	else if(strParam == "lan")
	{
		returnValue = inputFieldValidation(strParam,version);
	}
	else if(strParam == "tr")
	{
		returnValue = inputFieldValidation(strParam,version);
	}
	else if(strParam == "pq")
	{
		returnValue = inputFieldValidation(strParam,version);
	}
	
	return returnValue;
}

function commonUpdate(url,formName,divID,lanType)
{
	var type_other=divID.split('_')[0];
	var itemNo=divID.split('_')[1];
	
	
	
	if(getCommonValidation(type_other,itemNo) == false)
	{
		return false;
	}
	
	$.ajax({
			type: "POST",
			url: url,
			data:   $("#"+formName).serialize(),
			cache: false,
			dataType: "html",
			success: function(responseText){
				if(responseText.indexOf('added') > -1 || responseText.indexOf('updated') > -1)
					{
						setViewMode(divID);
						//alert(itemNo)
						//window.location.reload();
						//var str = showSuccessAlertMessage(responseText);
						var str = responseText;
						//$('#alertDiv_'+type_other+'_'+itemNo).empty();
						//$('#alertDiv_'+type_other+'_'+itemNo).removeClass("hidden");
						//$('#alertDiv_'+type_other+'_'+itemNo).addClass("alert-success");
						//$('#alertDiv_'+type_other+'_'+itemNo).html(str);
						//$('.'+type_other+'_'+itemNo).html(str);
						//$('.'+type_other+'_'+itemNo).empty();
						
						if($("#commonForm_"+type_other).length != 0){
							if($('#commonForm_'+type_other+'_'+itemNo).length == 0) {
							d = document.createElement('div');
 							$(d).attr('id', 'commonForm_'+type_other+'_'+itemNo);
							$(d).html(str);						//var newForm=$('#commonForm_'+type_other+'_'+itemNo).prepend(str);
							 $("#commonForm_"+type_other).append(d)
							
						  //it doesn't exist
						    }
							else{
							$('#commonForm_'+type_other+'_'+itemNo).html(str);
							}
						}
						else{
							str=showSuccessAlertMessage(str);
							$('.'+type_other+'_'+itemNo+' #alertDiv_'+type_other).html(str);
							}
						
						
						$("#div_"+type_other).empty();
						/*if ((responseText.indexOf('added') > -1) && (itemNo>=2)){
							$("#btnAdd_"+type_other).hide();
							}*/
						//window.setTimeout(function(){$('body').load(window.location.href + '#body')},3000);	
						//window.setTimeout(function(){location.reload()},3000)
						if (type_other=="lan" && $('#commonForm_'+type_other+' form').length == 3){
							$("#btnAdd_" + type_other).hide();
							}
						else if(type_other=="ref" && $('#commonForm_'+type_other+' form').length == 2){
							$("#btnAdd_" + type_other).hide();
						}
						$("#btnAdd_" + type_other).prop('disabled', false);

					}
				else
					{
						//alert(responseText)
						//var str = responseText;
						var str = showFailAlertMessage(responseText);
						//$('#alertDiv_'+type_other+'_'+itemNo).removeClass("hidden alert-success")
						//$('#alertDiv_'+type_other+'_'+itemNo).addClass("alert-danger");
						$('.'+type_other+'_'+itemNo+' #alertDiv_'+type_other).empty();
						$('.'+type_other+'_'+itemNo+' #alertDiv_'+type_other).removeClass("hidden");
						$('.'+type_other+'_'+itemNo+' #alertDiv_'+type_other).html(str);
						
					}
					console.log(responseText);
			},
			error: function(responseText){
				console.log(responseText);
				alert(responseText);
			},
		});
}




function confirmation_new(ID,tableName,url,itemNo,type_other)
{
	
	
	msg="Are you sure, you want to delete this record?";
	var t=window.confirm(msg);
	if (t)
 	{
	
		$.ajax({
				type: "POST",
				url: url,
				//data:  ID,tableName,
				data:{ID:ID, tableName:tableName},
				//data: "{'ID':'" + ID+ "', 'tableName':'" + tableName+ "'}",
				cache: false,
				dataType: "html",
				success: function(responseText){
					if(responseText.indexOf('deleted') > -1 )
						{
							//setViewMode(divID);
							//alert(itemNo)
							//window.location.reload();
							var str = showSuccessAlertMessage(responseText);
							$('.'+type_other+'_'+itemNo+' #alertDiv_'+type_other).empty();
							$('.'+type_other+'_'+itemNo+' .sub-header').hide();
							$('#commonForm_'+type_other+'_'+itemNo+' .panel-body').css('border-top','none');
							$('#commonForm_'+type_other+'_'+itemNo).empty();
							//$('#'+type_other+'Form_'+itemNo).remove();
							
							//$('.'+type_other+'_'+itemNo+' #alertDiv_'+type_other).removeClass("hidden");
							//$('#alertDiv_'+type_other+'_'+itemNo).addClass("alert-success");
							//$('.'+type_other+'_'+itemNo+' #alertDiv_'+type_other).html(str);
							$('#commonForm_'+type_other+'_'+itemNo).html(str);
							if($('#commonForm_'+type_other+' form').length == 0){
							//if (itemNo==0){
									$("#noData_" + type_other).show();
									//$("commonForm_"+type_other).append()
							}
							if (type_other=="lan" && $('#commonForm_'+type_other+' form').length < 3){
								$("#btnAdd_" + type_other).show();
							}
							else if(type_other=="ref" && $('#commonForm_'+type_other+' form').length < 2){
								$("#btnAdd_" + type_other).show();
							}
							/*if ((responseText.indexOf('added') > -1) && (itemNo>=2)){
								$("#btnAdd_"+type_other).hide();
								}*/
							//window.setTimeout(function(){$('body').load(window.location.href + '#body')},3000);	
							//window.setTimeout(function(){location.reload()},3000)
							  
	
						}
					else
						{
							//alert(responseText)
							//var str = responseText;
							var str = showFailAlertMessage(responseText);
							//$('#alertDiv_'+type_other+'_'+itemNo).removeClass("hidden alert-success")
							//$('#alertDiv_'+type_other+'_'+itemNo).addClass("alert-danger");
							$('.'+type_other+'_'+itemNo+' #alertDiv_'+type_other).empty();
							$('.'+type_other+'_'+itemNo+' #alertDiv_'+type_other).removeClass("hidden");
							$('.'+type_other+'_'+itemNo+' #alertDiv_'+type_other).html(str);
							
						}
						console.log(responseText);
				},
				error: function(responseText){
					console.log(responseText);
					alert(responseText);
				},
			});
		
	}
	else
	{
		return false;
	}
}

	
	
	
	
	
	

/*msg="Are you sure, you want to delete this record?";
	var t=window.confirm(msg);
if (t)
 {
	 //location.href="delete.asp?id="+ID+"&tbl="+tableName+"&userID="+uID;
	 location.href="delete.asp?id="+ID+"&tbl="+tableName;
 }
else
{return false;}
}*/



function showSuccessAlertMessage(strMsg)
{
	var msgDiv = "<div class='alert alert-success alert-dismissible m-t-20 m-b-0' role='alert'>";
	    msgDiv = msgDiv + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>×</span></button>";
		msgDiv = msgDiv + strMsg;
		msgDiv = msgDiv + "</div>";
		
		return msgDiv;
}

function showFailAlertMessage(strMsg)
{
	var msgDiv = "<div class='alert alert-danger alert-dismissible m-t-20 m-b-0' role='alert'>";
	    msgDiv = msgDiv + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>×</span></button>";
		msgDiv = msgDiv + strMsg;
		msgDiv = msgDiv + "</div>";
		
		return msgDiv;
}

function setParamText(id)
{
	var textFieldStr = document.getElementById(id).value;
	document.getElementById("p_"+id).text = "";
	document.getElementById("p_"+id).innerHTML = textFieldStr;
	
}

function Career_Application_Validate()
{
 var OBJ=document.getElementById('obj').value
	if(OBJ.trim()=="")
			{
				alert('Objective field cannot be blank!');
			
				//document.getElementById('txtObjective').focus();
				return false;
			}
		//ga('send','event','Updateinformation','click','Career and Application Informations',1);

}
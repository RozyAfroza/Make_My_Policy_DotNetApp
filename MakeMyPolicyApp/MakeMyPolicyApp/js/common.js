(function ($) {
    "use strict";
    $(document).ready(function () {
        $(function () {

/* ========================================================================== */
/* =========> Toggle Menu Activate
/* ========================================================================== */
$( "#clickble" ).click(function(e) {
$( this).next().toggleClass( "active_bar" );
$( this).next().slideToggle( "slow" );
e.preventDefault();
});
$( ".menu_toggle" ).click(function(e) {
$( this).next().slideToggle( "slow" );
e.preventDefault();
});


      });
    });
})(jQuery);

//Email validation function
//Author : Sufia
//Param : Email ID
//Return : valid->true or invalid->false
function isValidEmailaddress(EmailAddress)
{
   //alert(EmailAddress);
   
	  // var filter=/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/;
	   var filter=/^[_a-zA-Z0-9-\s]+(\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,4})$/;
	  //alert(filter.test(EmailAddress.value));
	 if (filter.test(EmailAddress)) 
	 {
		return true;
	 }else{
		 return false;
	 }
   
}
// for numeric validation
// Author : Rumana
function blockNonNumbers(obj,e, allowDecimal, allowNegative)
{
var key;
var isCtrl = false;
var keychar;
var reg;

if(window.event) {
key = e.keyCode;
isCtrl = window.event.ctrlKey
}
else if(e.which) {
key = e.which;
isCtrl = e.ctrlKey;
}

if (isNaN(key)) return true;

keychar = String.fromCharCode(key);

// check for backspace or delete, or if Ctrl was pressed
if (key == 8 || isCtrl)
{
return true;
}

reg = /\d/;
var isFirstN = allowNegative ? keychar == '-' && obj.value.indexOf('-') == -1 : false;
var isFirstD = allowDecimal ? keychar == '.' && obj.value.indexOf('.') == -1 : false;

return isFirstN || isFirstD || reg.test(keychar);
}
//end function


// extract non-numeric character from input field
//author: Rumana
function extractNumber(obj, decimalPlaces, allowNegative)
{ 
	var temp = obj.value;
	
	// avoid changing things if already formatted correctly
	var reg0Str = '[0-9]*';
	if (decimalPlaces > 0) {
		reg0Str += '\\.?[0-9]{0,' + decimalPlaces + '}';
	} else if (decimalPlaces < 0) {
		reg0Str += '\\.?[0-9]*';
	}
	reg0Str = allowNegative ? '^-?' + reg0Str : '^' + reg0Str;
	reg0Str = reg0Str + '$';
	var reg0 = new RegExp(reg0Str);
	if (reg0.test(temp)) return true;

	// first replace all non numbers
	var reg1Str = '[^0-9' + (decimalPlaces != 0 ? '.' : '') + (allowNegative ? '-' : '') + ']';
	var reg1 = new RegExp(reg1Str, 'g');
	temp = temp.replace(reg1, '');

	if (allowNegative) {
		// replace extra negative
		var hasNegative = temp.length > 0 && temp.charAt(0) == '-';
		var reg2 = /-/g;
		temp = temp.replace(reg2, '');
		if (hasNegative) temp = '-' + temp;
	}
	
	if (decimalPlaces != 0) {
		var reg3 = /\./g;
		var reg3Array = reg3.exec(temp);
		if (reg3Array != null) {
			// keep only first occurrence of .
			//  and the number of places specified by decimalPlaces or the entire string if decimalPlaces < 0
			var reg3Right = temp.substring(reg3Array.index + reg3Array[0].length);
			reg3Right = reg3Right.replace(reg3, '');
			reg3Right = decimalPlaces > 0 ? reg3Right.substring(0, decimalPlaces) : reg3Right;
			temp = temp.substring(0,reg3Array.index) + '.' + reg3Right;
		}
	}
	
	obj.value = temp;
}


function confirmation(ID,tableName)
{

msg="Are you sure, you want to delete this record?";
	var t=window.confirm(msg);
if (t)
 {
	 //location.href="delete.asp?id="+ID+"&tbl="+tableName+"&userID="+uID;
	 location.href="https://mybdjobs.bdjobs.com/mybdjobs/delete.asp?id="+ID+"&tbl="+tableName;
 }
else
{return false;}
}

function CompareDateIsInValid(cBigDate,cSmallDate)
	{

	var bDay;
	var bMon;
	var bYear;
	
	var sDay;
	var sMon;
	var sYear;
//	alert('Into validation');
	//var listArray = stringList.split(",");
	var bArray = cBigDate.split("/");
	var sArray = cSmallDate.split("/");
	
	 bMon=bArray[0];
	 bDay=bArray[1];
	 bYear=bArray[2];
	
	 sMon=sArray[0];
	 sDay=sArray[1];
	 sYear=sArray[2];
	
	if (parseInt(sYear) > parseInt(bYear))
		{
		return true;
		}
	else if(parseInt(sYear) < parseInt(bYear))
		{
			return false;			
		}
	else if(parseInt(sYear) == parseInt(bYear))
		{
			if (parseInt(sMon) > parseInt(bMon))
				{
				return true;
				}
			else if(parseInt(sMon) < parseInt(bMon))
				{
				return false;
				}
			else if(parseInt(sMon) == parseInt(bMon))
				{
					if (parseInt(sDay) > parseInt(bDay))
						{
							return true;
						}
					else
						{
							return false;
						}


				}


		}


	}


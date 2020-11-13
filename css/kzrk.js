function addtext() {
	var str = document.myform.rustext.value;
	if(str)
		{
		document.myform.inputtext.value += "\xA0";
		document.myform.inputtext.value += str;
		document.myform.rustext.value	= "";
		}
	}

function key2bel(e) {
	var key;
	// IE
	if(window.event) { key = e.keyCode; }
	// Netscape/Firefox/Opera
	else if(e.which) { key = e.which; }
	//key = e.keyCode?e.keyCode:e.which;

	switch(key)
	{
	case 1097: //ù 1097 -> ¢ 1118 
		key = 1118;
		break;
	case 1065: //Ù 1065 -> ¢ 1038 
		key = 1038;
		break;
	case 1080: //è 1080 -> ³ 1110 
		key = 1110;
		break;
	case 1048: //È 1048 -> ³ 1030 
		key = 1030;
		break;  	
	case 1098: //ú 1098 -> ' 39 
	case 1066: //Ú 1066 -> ' 39 
		key = 39;
		break;
	default:
		key = 0;
	  break;
	}

if(key)
		{
		//e.keyCode = key;
		//e.which = key;
		//document.getElementById("myText").value += String.fromCharCode(key);
		document.myform.inputtext.value += String.fromCharCode(key);
		key = 0;
		return false;
		}
}
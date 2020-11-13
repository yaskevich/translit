#!/usr/bin/perl

use CGI;                   
$mydoc = <<END;
<p class="notice">
<b>Інструкцыя.</b><br />
Калі ў Вас ёсць толькі расейская раскладка, набірайце ў ёй — тэкст жа будзе стварацца, 
быццам бы Вы набіраеце на беларускай клавіятуры.<br />
Калі Вам трэба уставіць у тэкст слова ці фразу, якія ўтрымліваюць знакі <b>Щ-щ</b> <i>‘шча’</i>, <b>И-и</b> <i>‘і’</i> або <b>Ъ-ъ</b>&nbsp;<i>‘цвёрды знак’</i>, 
напішыце іх у ніжэйшае поле, а потым націсніце кнопку «Дадаць».<br />
Калі Вы хочаце напісаць шмат тэксту, то можаце расцягнуць тэкставую зону за ніжнюю рамку.
</p>
END

$newStyle=<<END;
<!-- 
body {
	position:relative;
	/* background:url("css/baseline.gif") repeat 0 0; */
}
#wrap {
	/*this bit is for show only*/
	width:760px;
	margin:auto;
	padding:1.5em 10px;
}

.resizable-textarea {
  width: 100%;
  font-family:Georgia, Gentium, "Times New Roman", Times, serif;
  font-size:1.1666em;
}
.resizable-textarea .grippie {
  height: 9px;
  overflow: hidden;
  background: #eee url(css/grippie.png) no-repeat center 2px;
  border: 1px solid #ddd;
  border-top-width: 0;
  cursor: s-resize;
}
html.js .resizable-textarea textarea {
  margin-bottom: 0;
  width: 100%;
  display: block;
}

-->
END

my $JSCRIPT = <<'END';
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-18235133-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
END

$cgi = CGI->new;         # ($cgi is now the object)
print $cgi->header(
					-type=>"text/html",
					-charset=>'utf-8',
					);      # function call: $obj->function

print $cgi->start_html(
						-head=>[ $cgi->Link({-rel=>'shortcut icon',-type=>'image/x-icon',-href=>'favicon.ico'}),],
						-title=>'Транслітарацыя: расейская (руская) → беларуская',
						#-title=>'Кузурка-літараед',
						#-author=>'lite',
						-lang=>'be',
						#-base=>'true',
						#-target=>'_blank',
						-meta=>{'keywords'=>'транслітарацыя, руская, расейская, беларуская',
								'copyright'=>'copyright 2009 Alyaxey Yaskevich'},
						-style=>{'src'=>'/css/sen.0.6.css', -code=>$newStyle},
						-script=>{-code=>$JSCRIPT},
						);


#print '<body onkeydown="alert(String.fromCharCode(event.keyCode));">';
print '<script language="JavaScript" src="/css/kzrk.js" type="text/javascript"></script>';
print '<script language="JavaScript" src="/css/jquery.js" type="text/javascript"></script>';
print '<script language="JavaScript" src="/css/drupal.js" type="text/javascript"></script>';
print '<script language="JavaScript" src="/css/textarea.js" type="text/javascript"></script>';


#print $cgi->start_form( -method => "post", -action => "rus.pl" , -name=>"myform", -enctype=>"application/x-www-form-urlencoded");
print '<div id="wrap" class ="quo">';
print $cgi->start_form( -name=>"myform",  -style=>"width:90%;");
#print '<form name="myform">';
print $cgi->h2 ('Трансл<s>и</s><font color="red">І</font>тарацыя: ');
print $mydoc;
print "<br />\r\n";



print $cgi->textarea( -name => "inputtext",
						-class=>"form-textarea resizable required",
						-cols => "120",
						-rows => "12",
						-onkeypress => "return key2bel(event);",
						-value => "");

#print "<br />\r\n";
# # 
# print $cgi->button( -name => "first", 
					# -id => "foobar", 
					# -onclick => "return insertAtCursor(document.getElementById('myText'),'ў');" ,
					# -type=>"button",
					# -value=>"Test");
# print "<br />\r\n";

# print $cgi->button( -name => "second", 
					# -id => "UUU", 
					# -onclick => "return addtext();",
					# -type=>"button",
					# -value=>"Ў");

print "<br />\r\n";
print "<br />\r\n";
print '<strong>Для цытаты з расейскімі літарамі:</strong>';

print "<br />\r\n";
print $cgi->textfield( -name => "rustext", 
					-override=>1,
					-size=> "90%",					
					-type=>"text",
					-value=>"");

print "</form>";
# print $cgi->start_form( -name=>"myform2", -class=>"horizontalForm", -style=>"width:49%;");
# print "</form>";					
# print "<br />\r\n";



print $cgi->button( -name => "addrus", 
					#-class => "quo",					
					-onclick => "return addtext();" ,
					-type=>"button",
					-value=>"Дадаць");

print '<br /><br /><div>© 2009 <a title="Перайсці на сайт аўтара" href="https://yaskevich.com/">Аляксей Яскевіч</a></div>';
print '</div>';



print $cgi->end_html;
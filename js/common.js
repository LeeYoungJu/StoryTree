var arrFile = [
              	 "/jquery/jquery-1.11.3.min.js"              	 
              	 , "/js/commonFunc.js"
              ];

for(var i=0; i<arrFile.length; i++) {
	document.write("<script src='" + arrFile[i] + "'></script>")
}

// Must include 'jquery-2.1.0.min.js'

var isPopUp = false;

$(document).ready(function() {
	$("#applyButton").click(function() {
		isPopUp = true;
		$( "#popUp" ).css( "display", "block" );
		$( "#popUp" ).css( "width", $(window).width() );
		$( "#popUp" ).css( "height", $(window).height() );
		$( "#popUp" ).load( "./html/popUp_1.html" );
	});
	$("#popUp").click(function() {
		isPopUp = false;
		$( "#popUp" ).css( "display", "none" );
		$( "#popUp" ).empty();
	});
});

$(window).resize(function (){
	if( isPopUp == true )
	{
		$( "#popUp" ).css( "width", $(window).width() );
		$( "#popUp" ).css( "height", $(window).height() );
	}
});
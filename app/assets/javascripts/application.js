// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.easing
//= require bootstrap-sprockets
//= require bootstrap-table
//= require turbolinks
//= require_tree .


window.setTimeout(function() {
	$("#flash").fadeTo(2250, 0).slideUp(800, function()
	{
	$(this).remove();
	});
}, 3000);

var $zoho= $zoho || {salesiq:{values:{},ready:function(){}}};var d=document;s=d.createElement("script");s.type="text/javascript";s.defer=true;s.src="https://salesiq.zoho.com/bartverhoeven1/float.ls?embedname=bartverhoeven1";t=d.getElementsByTagName("script")[0];t.parentNode.insertBefore(s,t);$zoho.salesiq.ready=function(embedinfo){$zoho.salesiq.floatbutton.visible("hide");}

$(document).ready(function() {
	$("select.dropdown-selector").select2({
		theme: "bootstrap"
	});
});

$(window).resize(function(){
		if ($(this).width() > 767) {
		  location.reload();
		}
});
$(document).ready(function() {
	
	var sidebar = $("#sidebar"); // get the sidebar
	var sidebarToggle = $("#sidebar_toggle"); // get the toggle button
	var sidebarHidden = true;
	
	sidebar.hide();
	
	sidebarToggle.mouseover(function(){
		sidebarToggle.stop().animate({width:"14px"}, 200);
	});
	sidebarToggle.mouseout(function(){
		sidebarToggle.stop().animate({width:"10px"}, 200);
	});
	
	sidebarToggle.click(function(){
		if (sidebarHidden) {
			sidebar.show();
			sidebarHidden = false;
		}
		else {
			sidebar.hide();	
			sidebarHidden = true;
		}
	});
	
	$("#closeSidebar").click(function(){
		sidebar.hide();
		sidebarHidden = true;
	});
});
$(document).ready(function() {
	
	var sidebar = $("#sidebar"); // get the sidebar
	var sidebarContents = $("#sidebar_contents");
	var sidebarToggle = $("#sidebar_toggle"); // get the toggle button
	var sidebarHidden = true;
	
	sidebar.hide();
	sidebarContents.hide();
	sidebarContents.animate({opacity:"0.0"}, 0);
	
	sidebarToggle.mouseover(function(){
		sidebarToggle.stop().animate({opacity:"0.7"}, 200);
	});
	sidebarToggle.mouseout(function(){
		sidebarToggle.stop().animate({opacity:"1.0"}, 200);
	});
	
	sidebarToggle.click(function(){
		if (sidebarHidden) {
			sidebar.show(function(){
				sidebar.animate({width:"25%"}, 0, function(){
					sidebarContents.show(function(){
						sidebarContents.animate({opacity:"1.0"}, 10);
					});
				});
			});
			sidebarHidden = false;
		}
		else {
			sidebar.hide();
			sidebarContents.hide();
			sidebarHidden = true;
		}
	});
	
	$("#closeSidebar").click(function(){
		sidebar.hide();
		sidebarHidden = true;
	});
});
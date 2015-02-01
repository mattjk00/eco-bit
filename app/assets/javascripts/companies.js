// Used to display graphs and stuff for the stock market

var data = {
	labels: ["0:00", "1:00", "2:00", "3:00", "4:00", "5:00", "6:00", "7:00", "8:00", "9:00", "10:00",
			"11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00",
			"22:00", "23:00", "24:00"],
	datasets: [
		{
			label: "First",
			fillColor: "rgba(43,87,151, 0.2)",
			pointColor: "rgba(45,137,239, 1)",
			data: [5, 5, 5, 6, 7, 8, 12, 9, 8, 8, 8, 1, 1, 1, 1, 3, 4, 5, 6, 7, 8, 10, 12, 15, 14]
		}
	]
};

var options = {
    animation: false
};

setTimeout(function() {
	var ctx = document.getElementById("stockGraph").getContext("2d");
	var chart = new Chart(ctx).Line(data, options);
}, 500);



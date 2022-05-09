

<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Test Name', 'Student Name'],
          ['2004',  800],
          ['2005',  800],     
          ['2006',  800],    
          ['2007',  800]  
        ]);

        var options = {
          title: 'Student Performance',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
  </head>
  <body style = "background-color: blue">
    <div id="curve_chart" style="width: 1900px; height: 800px"></div>
  </body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chart_Sample.aspx.cs" Inherits="Chart_Sample" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.2/Chart.bundle.min.js" type="text/javascript"></script>  
           <script src="//cdn.jsdelivr.net/excanvas/r3/excanvas.js" type="text/javascript"></script>
    <script src="//cdn.jsdelivr.net/chart.js/0.2/Chart.js" type="text/javascript"></script>

</head>
<body>
    <form id="form1" runat="server">
          <script type="text/javascript">
              $(function () {
                  LoadPieChart();

                  //              $("[id*=rbldonughtChartType] input").bind("click", function () {
                  //                  LoadPieChart();

                  //              });
              });


              function LoadPieChart() {
                  var chartType = 1;
                  $.ajax({
                      type: "POST",
                      url: "Chart_Sample.aspx/GetChart",
                      data: "{country: '" + $("[id*=ddlCount]").val() + "'}",
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: function (r) {
                          $("#dvChart").html("");
                          $("#dvLegend").html("");

                          var data = eval(r.d);

                          var el = document.createElement('canvas');
                          $("#dvChart")[0].appendChild(el);



                          //Fix for IE 8
                          if ($.browser.msie && $.browser.version == "8.0") {
                              G_vmlCanvasManager.initElement(el);
                          }
                          var ctx = el.getContext('2d');
                          responsive: true

                          var userStrengthsChart;

                          switch (chartType) {
                              case 1:
                                  userStrengthsChart = new Chart(ctx).Pie(data);
                                  break;
                              case 2:
                                  userStrengthsChart = new Chart(ctx).Doughnut(data);
                                  break;
                              case 3:
                                  userStrengthsChart = new Chart(ctx).PolarArea(data);
                                  break;
                          }

                          for (var i = 0; i < data.length; i++) {
                              var div = $("<div />");
                              div.css("margin-bottom", "10px");
                              div.html("<span style = 'display:inline-block;height:10px;width:10px;background-color:" + data[i].color + "'></span> " + data[i].text + ' ' + data[i].value);
                              $("#dvLegend").append(div);
                          }
                      },
                      failure: function (response) {
                          alert('There was an error.');
                      }
                  });
              }
            

        </script>
    <div>
    
    </div>
         <div id="dvChart" >
                </div>
    </form>
</body>
</html>

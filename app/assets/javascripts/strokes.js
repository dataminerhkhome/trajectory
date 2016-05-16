$(document).ready(function() {
  // alert("test");
  var t=1;
  var chart = dc.seriesChart("#test");
  var experiments=gon.positions;
  ndx = crossfilter(experiments);
  runDimension = ndx.dimension(function(d) {return [+d.ini_velocity, +d.distance]; });
  runGroup = runDimension.group().reduceSum(function(d) { return +d.height; });

  chart
    .width(1100)
    .height(480)
    .chart(function(c) { return dc.lineChart(c).interpolate('basis'); })
    .x(d3.scale.linear().domain([0,18]))
    .brushOn(false)
    .yAxisLabel("Height")
    .xAxisLabel("Distance")
    .clipPadding(10)
    .elasticY(true)
    .dimension(runDimension)
    .group(runGroup)
    .mouseZoomable(true)
    .seriesAccessor(function(d) {return "INI-V: " + d.key[0];})
    .keyAccessor(function(d) {return +d.key[1];})
    .valueAccessor(function(d) {return +d.value;})
    .legend(dc.legend().x(100).y(20).itemHeight(13).gap(5).horizontal(1).legendWidth(90).itemWidth(90));
  chart.yAxis().tickFormat(function(d) {return d3.format(',d')((d+2));});
  chart.margins().left += 40;
  chart.renderHorizontalGridLines(false).renderVerticalGridLines(true).rightYAxisLabel("Monthly Index Move");

  dc.renderAll();
  
});

$(document).on("change","#stroke_angle",function(e){
  var url="strokes?angle="+$(this).val();
  location.href=url;
});

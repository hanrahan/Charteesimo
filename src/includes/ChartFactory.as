import formatting.DateTimeFormatter;

import mx.charts.AreaChart;
import mx.charts.BarChart;
import mx.charts.CategoryAxis;
import mx.charts.ColumnChart;
import mx.charts.DateTimeAxis;
import mx.charts.LineChart;
import mx.charts.PlotChart;
import mx.charts.chartClasses.IAxis;
import mx.charts.effects.SeriesInterpolate;
import mx.charts.series.AreaSeries;
import mx.charts.series.BarSeries;
import mx.charts.series.ColumnSeries;
import mx.charts.series.LineSeries;
import mx.charts.series.PlotSeries;
import mx.collections.ArrayCollection;

import valueObjects.Chart;
import valueObjects.Series;

public function createChart(chart:Chart):void{
	if(chart.chartType == 'area'){
		createAreaChart(chart);
	}else if(chart.chartType == 'bar'){
		createBarChart(chart);
	}else if(chart.chartType == 'column'){
		createColumnChart(chart);
	}else if(chart.chartType == 'line'){
		createLineChart(chart);
	}else if(chart.chartType == 'pie'){
		
	}else if(chart.chartType == 'plot'){
	    createPlotChart(chart);
	}
}

private function createAreaChart(chart:Chart):void{
	var areaChart:AreaChart = new AreaChart();
	areaChart.showDataTips=true;
	areaChart.horizontalAxis=getAxis(chart);
	areaChart.series=getAreaSeriesArray(chart.series);	
	
	addChildAt(areaChart,0);
}

private function createBarChart(chart:Chart):void{
	var barChart:BarChart = new BarChart();
	barChart.showDataTips=true;
	barChart.verticalAxis=getAxis(chart);
	barChart.series=getBarSeriesArray(chart.series);	
	
	addChildAt(barChart,0);
}

private function createColumnChart(chart:Chart):void{
	var columnChart:ColumnChart = new ColumnChart();
	columnChart.showDataTips=true;
	columnChart.horizontalAxis=getAxis(chart);
	columnChart.series=getColumnSeriesArray(chart.series);	
	
	addChildAt(columnChart,0);
}

private function createLineChart(chart:Chart):void{
	var lineChart:LineChart = new LineChart();
	lineChart.showDataTips=true;
	lineChart.horizontalAxis=getAxis(chart);
	lineChart.series=getLineSeriesArray(chart.series);	
	
	addChildAt(lineChart,0);
}

private function createPlotChart(chart:Chart):void{
	var plotChart:PlotChart = new PlotChart();
	plotChart.showDataTips=true;
	plotChart.horizontalAxis=getAxis(chart);
	plotChart.series=getPlotSeriesArray(chart.series);	
	
	addChildAt(plotChart,0);
}

public function getAxis(chart:Chart):IAxis{
  	if(chart.axisType == 'datetimeaxis'){
  		return getDateTimeAxis(chart);
  	}else if(chart.axisType == 'categoryaxis'){
  		return getCategoryAxis(chart.series.getItemAt(0).seriesData);
  	}
  	else {
  		return getCategoryAxis(chart.series.getItemAt(0).seriesData);
  	}	
}

public function getCategoryAxis(seriesData:ArrayCollection):CategoryAxis{
   var categoryAxis:CategoryAxis = new CategoryAxis();
   categoryAxis.categoryField="attribute";
   categoryAxis.dataProvider=seriesData
  
   return categoryAxis;
}

public function getDateTimeAxis(chart:Chart):IAxis{           	      	   
     var dateTimeAxis:DateTimeAxis = new DateTimeAxis();
     dateTimeAxis.padding=getAxisPadding(chart);
     dateTimeAxis.parseFunction=parseDate;
     dateTimeAxis.labelFunction=formatDate;
     dateTimeAxis.title="Axis Labels Go Here";
     dateTimeAxis.alignLabelsToUnits=false; 
     dateTimeAxis.dataUnits="days";
     //dateTimeAxis.displayLocalTime=true;
       	  	
     return dateTimeAxis;
}

public function getAxisPadding(chart:Chart):Number{
  if(chart.chartType =='bar' || chart.chartType =='column'){
  	  return .5
  }else{
  	  return 0;
  }	
}


private function formatDate(value:Date,previousValue:Date,axis:DateTimeAxis):String {    
   return DateTimeFormatter.getDayFormatter().format(value);
}

public function parseDate(s:String):Date { 
    var a:Array = s.split("/");
    
    var newDate:Date = new Date(a[0],a[1]-1,a[2]);
    
    return newDate;
}

public function getAreaSeriesArray(seriesArray:ArrayCollection):Array{
   var chartSeriesArray:Array = new Array();
   
   for(var i:Object in seriesArray){
   	   chartSeriesArray.push(getAreaSeries(seriesArray[i]));
   }	
   return chartSeriesArray;
}

public function getAreaSeries(series:Series):AreaSeries{
	var a:AreaSeries = new AreaSeries();
	a.xField = "attribute";
    a.yField = "number";
    a.displayName = series.displayName;
    a.dataProvider = series.data;
    a.setStyle("showDataEffect",getSeriesInteropolate());
    
    return a;
}

public function getBarSeriesArray(seriesArray:ArrayCollection):Array{
   var chartSeriesArray:Array = new Array();
   
   for(var i:Object in seriesArray){
   	   chartSeriesArray.push(getBarSeries(seriesArray[i]));
   }	
   return chartSeriesArray;
}

public function getBarSeries(series:Series):BarSeries{
	var bs:BarSeries = new BarSeries();
	bs.yField = "attribute";
    bs.xField = "number";
    bs.displayName = series.displayName;
    bs.dataProvider = series.data;
    bs.setStyle("showDataEffect",getSeriesInteropolate());
    
    return bs;
}

public function getColumnSeriesArray(seriesArray:ArrayCollection):Array{
   var chartSeriesArray:Array = new Array();
   
   for(var i:Object in seriesArray){
   	   chartSeriesArray.push(getColumnSeries(seriesArray[i]));
   }	
   return chartSeriesArray;
}

public function getColumnSeries(series:Series):ColumnSeries{
	var cs:ColumnSeries = new ColumnSeries();
	cs.xField = "attribute";
    cs.yField = "number";
    cs.displayName = series.displayName;
    cs.dataProvider = series.data;
    //cs.id = i.toString();
    cs.setStyle("showDataEffect",getSeriesInteropolate());
    
    return cs;
}

public function getLineSeriesArray(seriesArray:ArrayCollection):Array{
   var chartSeriesArray:Array = new Array();
   
   for(var i:Object in seriesArray){
   	   chartSeriesArray.push(getLineSeries(seriesArray[i]));
   }	
   return chartSeriesArray;
}

public function getLineSeries(series:Series):LineSeries{
	var ls:LineSeries = new LineSeries();
	ls.xField = "attribute";
    ls.yField = "number";
    ls.displayName = series.displayName;
    ls.dataProvider = series.data;
    ls.setStyle("showDataEffect",getSeriesInteropolate());
    
    return ls;
}

public function getPlotSeriesArray(seriesArray:ArrayCollection):Array{
   var chartSeriesArray:Array = new Array();
   
   for(var i:Object in seriesArray){
   	   chartSeriesArray.push(getPlotSeries(seriesArray[i]));
   }	
   return chartSeriesArray;
}

public function getPlotSeries(series:Series):PlotSeries{
	var ps:PlotSeries = new PlotSeries();
	ps.xField = "attribute";
    ps.yField = "number";
    ps.displayName = series.displayName;
    ps.dataProvider = series.data;
    ps.setStyle("showDataEffect",getSeriesInteropolate());
    
    return ps;
}

private function getSeriesInteropolate():SeriesInterpolate{
	var seriesInteropolate:SeriesInterpolate = new SeriesInterpolate();
	seriesInteropolate.duration=2000;
	
	return seriesInteropolate;
}



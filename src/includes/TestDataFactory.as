import mx.collections.ArrayCollection;

import valueObjects.Chart;
import valueObjects.Series;
import valueObjects.SeriesData;
	
public function buildChartResult():Chart{
    var chart:Chart = new Chart();
    chart.axisType='datetimeaxis';
    chart.chartType='plot';
            	
    var seriesArray:ArrayCollection = new ArrayCollection();
    chart.series=seriesArray;
  
    var series:Series = new Series();
    seriesArray.addItem(series);
    //seriesArray.addItem(series);
            	
    var seriesDataArray:ArrayCollection = new ArrayCollection();
            	
    var seriesData1:SeriesData = new SeriesData(123,"2010/1/1");
    seriesDataArray.addItem(seriesData1);
    
    var seriesData2:SeriesData = new SeriesData(500,"2010/1/2");
    seriesDataArray.addItem(seriesData2);
    
    var seriesData3:SeriesData = new SeriesData(1233,"2010/1/3");
    seriesDataArray.addItem(seriesData3);
    
    var seriesData4:SeriesData = new SeriesData(2000,"2010/1/4");
    seriesDataArray.addItem(seriesData4);
    
    var seriesData5:SeriesData = new SeriesData(4000,"2010/1/5");
    seriesDataArray.addItem(seriesData5);
    
    var seriesData6:SeriesData = new SeriesData(8000,"2010/1/6");
    seriesDataArray.addItem(seriesData6);
            	
    series.displayName="Series Number 1";
    series.data=seriesDataArray;
    
    var series2:Series = new Series();
    seriesArray.addItem(series2);
            	
    var seriesDataArray2:ArrayCollection = new ArrayCollection();
            	
    var seriesData12:SeriesData = new SeriesData(200,"2010/1/1");
    seriesDataArray2.addItem(seriesData12);
    
    var seriesData22:SeriesData = new SeriesData(300,"2010/1/2");
    seriesDataArray2.addItem(seriesData22);
    
    var seriesData32:SeriesData = new SeriesData(200,"2010/1/3");
    seriesDataArray2.addItem(seriesData32);
    
    var seriesData42:SeriesData = new SeriesData(1000,"2010/1/4");
    seriesDataArray2.addItem(seriesData42);
    
    var seriesData52:SeriesData = new SeriesData(3500,"2010/1/5");
    seriesDataArray2.addItem(seriesData52);
    
    var seriesData62:SeriesData = new SeriesData(8500,"2010/1/6");
    seriesDataArray2.addItem(seriesData62);
            	
    series2.displayName="Series Number 2";
    series2.data=seriesDataArray2;
            	         	
    return chart;
}
class MonthlyController < ApplicationController
  def index
  end

  def view
     @trips = Trip.find_by_sql("SELECT CONVERT(VARCHAR(6), START_TIME, 112) as MONTH,
   ROUND(AVG(ROUND(CONSUMED_ENERGY,3)),3) as AVGCONSUMED,ROUND(AVG(ROUND(EST_PWR_AC,3)),3) as AVGAC ,ROUND(AVG(ROUND(EST_PWR_HTR,3)),3) as AVGHTR
   FROM TRIPS_FOR_USE,LEAFSPY_AC
   WHERE TRIPS_FOR_USE.TRIP_ID = LEAFSPY_AC.TRIP_ID
   GROUP BY CONVERT(VARCHAR(6), START_TIME, 112)
   ORDER BY CONVERT(VARCHAR(6), START_TIME, 112)")
   month = []
   consumed = []
   ac = []
   htr = []
   @trips.each do |t|
    month.push(t.MONTH)
    consumed.push(t.AVGCONSUMED)
    ac.push(t.AVGAC)
    htr.push(t.AVGHTR)
   end
   
   @graph = LazyHighCharts::HighChart.new('graph') do |f|
    f.title(text: '月別消費電力量')
    f.xAxis(categories: month)
    
    f.series(name: 'AC消費エネルギー[kWh]', data: ac, color: 'blue')
    f.series(name: 'HTR消費エネルギー[kWh]', data: htr, color:'red')
    f.series(name: '走行消費エネルギー[kWh]', data: consumed, color:'green')
    f.options[:chart][:defaultSeriesType] = "column"
    f.plot_options({:column=>{:stacking=>"normal"}})
    end
  end
end

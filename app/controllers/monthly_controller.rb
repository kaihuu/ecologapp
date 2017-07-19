class MonthlyController < ApplicationController
  def index
  end

  def view
     @trips = Trip.find_by_sql(querystring)
   month = []
   consumed = []
   ac = []
   htr = []
   aux = []
   
   @trips.each do |t|
    month.push(t.MONTH)
    consumed.push(t.AVGCONSUMED)
    ac.push(t.AVGAC)
    htr.push(t.AVGHTR)
    aux.push(t.AVGAUX)
   end
   
   @graph = LazyHighCharts::HighChart.new('graph') do |f|
    f.chart(height:800)
    f.title(text: 'Average Energy Consumption Group by Each Month',style: {
            color: '#000000',
            fontWeight: 'bold',
                fontSize: '40px'
            })
    f.xAxis(categories: month,
    title: {
                 text: 'Month',
                 style: {
                 fontSize: '30px'
                }
               }, labels:{style:{color: '#000000',
                fontSize: '25px'}})
    f.yAxis(title: {
                 text: 'Average Energy Consumption',
                 style: {
                 fontSize: '30px'
                }
               },labels:{style:{color: '#000000',
                fontSize: '25px'}})
    f.legend(itemStyle: {
            color: '#000000',
            fontWeight: 'bold',
            fontSize: '20px'
        })
    f.tooltip(style:{fontSize: '20px'})
    f.series(name: 'AUX消費エネルギー[kWh]', data: aux, color:'yellow')
    f.series(name: 'AC消費エネルギー[kWh]', data: ac, color: 'blue')
    f.series(name: 'HTR消費エネルギー[kWh]', data: htr, color:'red')
    f.series(name: '走行消費エネルギー[kWh]', data: consumed, color:'green')
    f.options[:chart][:defaultSeriesType] = "column"
    f.plot_options({:column=>{:stacking=>"normal"}})
    end
    
  end
  
  def querystring
   query = "SELECT CONVERT(VARCHAR(6), TRIPS_FOR_USE.START_TIME, 112) as MONTH,
   ROUND(AVG(ROUND(TRIPS_FOR_USE.CONSUMED_ENERGY,3)),3) as AVGCONSUMED,ROUND(AVG(ROUND(EST_PWR_AC,3)),3) as AVGAC ,ROUND(AVG(ROUND(EST_PWR_HTR,3)),3) as AVGHTR, ROUND(AVG(ROUND(AUX_PWR,3)),3) as AVGAUX
   FROM TRIPS_FOR_USE,LEAFSPY_AC,TRIPS_LINKS_LOOKUP
   WHERE TRIPS_LINKS_LOOKUP.TRIP_ID = LEAFSPY_AC.TRIP_ID AND TRIPS_FOR_USE.START_TIME = TRIPS_LINKS_LOOKUP.START_TIME
   AND TRIPS_LINKS_LOOKUP.END_TIME = TRIPS_FOR_USE.END_TIME AND TRIPS_FOR_USE.SENSOR_ID = TRIPS_LINKS_LOOKUP.SENSOR_ID
   AND TRIPS_FOR_USE.CAR_ID = TRIPS_LINKS_LOOKUP.CAR_ID AND TRIPS_FOR_USE.DRIVER_ID = TRIPS_LINKS_LOOKUP.DRIVER_ID
   AND TRIPS_FOR_USE.CONSUMED_ENERGY IS NOT NULL
   GROUP BY CONVERT(VARCHAR(6), TRIPS_FOR_USE.START_TIME, 112)
   ORDER BY CONVERT(VARCHAR(6), TRIPS_FOR_USE.START_TIME, 112)"
  end
end

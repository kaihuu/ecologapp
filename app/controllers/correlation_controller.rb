class CorrelationController < ApplicationController
  def index
   @p = params[:strip][:TRIP_ID].try(:[], :TRIP_ID)
   @val = Trip.new
   @trips = Trip.all
   tripid = []
   start = []
   consumed = []
   
   @trips.each do |t|
    tripid.push(t.TRIP_ID)
    start.push(t.START_TIME)
    consumed.push(t.CONSUMED_ENERGY)
   end
   
   gon.xdata = start
   gon.ydata = tripid
   gon.colordata = consumed
  end

  def view

   @val = Trip.new
   @trips = Trip.all
   tripid = []
   start = []
   consumed = []
   
   @trips.each do |t|
    tripid.push(t.TRIP_ID)
    start.push(t.START_TIME)
    consumed.push(t.CONSUMED_ENERGY)
   end
   
   gon.xdata = start
   gon.ydata = tripid
   gon.colordata = consumed
  end
  
end

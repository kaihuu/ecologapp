class CorrelationController < ApplicationController
  def index
    binding.pry
    id =  params[:strip].to_i
   @val = Trip.new
   @trips = Trip.where("TRIP_ID > ?", id)
   #@trips = Trip.where(TRIP_ID: id)
   a=Trip.attribute_names
   tripid = []
   start = []
   consumed = []

   @trips.each do |t|
    tripid.push(t.TRIP_ID)
    start.push(t.START_TIME)
    consumed.push(t.CONSUMED_ENERGY)
   end
   #binding.pry
   gon.clear
   gon.watch.xdata = start
   gon.watch.ydata = tripid
   gon.watch.colordata = consumed
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
   
   gon.watch.xdata = start
   gon.watch.ydata = tripid
   gon.watch.colordata = consumed
  end
  
end

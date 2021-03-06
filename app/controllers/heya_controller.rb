class HeyaController < ApplicationController
  protect_from_forgery :except => [:create]
  def index
  end

  def show
    date_start ,date_end = view_context.get_datetime(params)
    @datas = Heya.where(date: date_start..date_end).order('date ASC')
    @chart_data = @datas.map{|x| [x.date, x.temperature] }
  end

  def create
    record = Heya.new
    record.temperature = params[:temperature]
    record.humidity = params[:humidity]
    record.date = params[:date]
    record.save
    render :index
  end

end

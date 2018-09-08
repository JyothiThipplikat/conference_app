class Api::MeetingsController < ApplicationController
  
  def index
    @meetings = Meeting.all
    render "index.json.jbuilder"
  end

  def create
    @meeting = Meeting.new(title: params[:title],
                          agenda:params[:agenda],
                          remote:params[:remote],
                          location:params[:location],
                          time:params[:time]
                          )
    @meeting.save
    render "show.json.jbuilder"
  end

  def show
    @meeting = Meeting.find(params[:id])
    render "show.json.jbuilder"
  end

  def update
    @meeting = Meeting.find(params[:id])

    @meeting.title = params[:title] || @meeting.title
    @meeting.agenda = params[:agenda] || @meeting.agenda
    @meeting.remote = params[:remote] || @meeting.remote
    @meeting.location = params[:locaion] || @meeting.location
    @meeting.time = params[:time] || @meeting.time

    @meeting.save
    render "show.json.jbuilder"
  end


  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy

    render json: {message: "Successful deleted meeting!"}
  end
end


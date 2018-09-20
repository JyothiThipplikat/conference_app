class Api::MeetingsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]
  
  def index
    @meetings = Meeting.all

   
    @meetings = @meetings.where('remote = ?', 'true')
 

    render "index.json.jbuilder"
  end

  def create
    @meeting = Meeting.new(title: params[:title],
                          agenda:params[:agenda],
                          remote:params[:remote],
                          location:params[:location],
                          time:params[:time],
                          speaker_id:params[:speaker_id]
                          )
    if @meeting.save
      render "show.json.jbuilder"
    else
      render json: {errors: @meetings.errors.full_messages}, status: :unprocessable_entity
    end
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
    @meeting.speaker_id = params[:speaker_id] || @meeting.speaker_id

   if @meeting.save
    render "show.json.jbuilder"
  else
    render json: {errors: @meetings.errors.full_messages}, status: :unprocessable_entity
  end
  end


  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy

    render json: {message: "Successful deleted meeting!"}
  end
end


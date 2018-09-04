class Api::MeetingsController < ApplicationController
  def meeting
    @meetings = Meeting.all
    render "meeting.json.jbuilder"
  end
  
  def first_meeting
    @meeting = Meeting.first
    render 'first_meeting.json.jbuilder'
  end
  def second_meeting
    @meeting = Meeting.find_by(id: 2)
    render 'second_meeting.json.jbuilder'
  end
   def last_meeting
    @meeting = Meeting.last
    render 'last_meeting.json.jbuilder'
  end

end

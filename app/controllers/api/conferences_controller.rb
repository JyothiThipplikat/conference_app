class Api::ConferencesController < ApplicationController

  def index
    @speakers = Speaker.all
    render 'index.json.jbuilder'
  end

  def create 
    @speaker = Speaker.new(
                          first_name: params[:first_name],
                           last_name: params[:last_name],
                           age: params[:age],
                           gender:params[:gender],
                           email: params[:email]
                          )
    if @speaker.save
      render "show.json.jbuilder"
    else
      render json: {errors: @speakers.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @speaker = Speaker.find(params[:id])
    render "show.json.jbuilder"
  end

  def update
    @speaker = Speaker.find(params[:id])

    @speaker.first_name = params[:first_name] || @speaker.first_name
    @speaker.last_name = params[:last_name] || @speaker.last_name
    @speaker.age = params[:age] || @speaker.age
    @speaker.gender = params[:gender] || @speaker.gender
    @speaker.email = params[:email] || @speaker.email
  
    if @speaker.save
     render "show.json.jbuilder"
    else 
      render json: {errors: @speakers.errors.full_messages}, status: :unprocessable_entity
   end
  end

def destroy
  @speaker = Speaker.find(params[:id])
  @speaker.destroy
  render json: {message: "Speaker successfully destroyed!"}
end

end

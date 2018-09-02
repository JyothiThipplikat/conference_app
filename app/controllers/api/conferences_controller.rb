class Api::ConferencesController < ApplicationController

  def speaker
    @speaker = Speaker.first
    render 'speaker.json.jbuilder'
  end
end

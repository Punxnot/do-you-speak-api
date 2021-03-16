class AudiosController < ApplicationController
  before_action :authenticate_request, only: [:create]

  def add_audio
    @text = Text.find(params[:text_id])
    @text.build_audio(audio_file: params[:audio_file])
    if @text.save
      render json: @text
    else
      render json: {
        error: @event.errors.full_messages,
        status: 400
      }, status: 400
    end
  end
end

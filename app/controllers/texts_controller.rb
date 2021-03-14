class TextsController < ApplicationController
  before_action :require_editor, only: [:new, :create, :destroy, :edit, :update]

  def all_texts
    @texts = Text.all

    render json: @texts
  end

  def show
    @text = Text.find(params[:id])

    render json: @text
  end

  def update
    @text = Text.find(params[:id])

    if @text.update(text_params)
      render json: @text
    else
      render json: {
        error: @event.errors.full_messages,
        status: 400
      }, status: 400
    end
  end

  def destroy
    @text = Text.find(params[:id])
    @text.destroy

    render json: {}
  end

  def level_1
    @texts = Text.where(level: 1).order(:id)
    if (params[:order] == 'duration')
      if (params[:type] == 'asc')
        @texts = Text.sort_by_duration(@texts, "asc")
      else
        @texts = Text.sort_by_duration(@texts, "desc")
      end
    elsif (params[:order] == 'date')
      if (params[:type] == 'asc')
        @texts = Text.sort_by_date(@texts, "asc")
      else
        @texts = Text.sort_by_date(@texts, "desc")
      end
    end

    render json: @texts
  end

  def level_2
    @texts = Text.where(level: 2).order(:id)
    if (params[:order] == 'duration')
      if (params[:type] == 'asc')
        @texts = Text.sort_by_duration(@texts, "asc")
      else
        @texts = Text.sort_by_duration(@texts, "desc")
      end
    elsif (params[:order] == 'date')
      if (params[:type] == 'asc')
        @texts = Text.sort_by_date(@texts, "asc")
      else
        @texts = Text.sort_by_date(@texts, "desc")
      end
    end

    render json: @texts
  end

  def level_3
    @texts = Text.where(level: 3).order(:id)
    if (params[:order] == 'duration')
      if (params[:type] == 'asc')
        @texts = Text.sort_by_duration(@texts, "asc")
      else
        @texts = Text.sort_by_duration(@texts, "desc")
      end
    elsif (params[:order] == 'date')
      if (params[:type] == 'asc')
        @texts = Text.sort_by_date(@texts, "asc")
      else
        @texts = Text.sort_by_date(@texts, "desc")
      end
    end

    render json: @texts
  end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == USER_ID && password == PASSWORD
    end
  end

  private

  def text_params
    params.require(:text).permit(:title, :author, :text, :audio, :level, :duration)
  end
end

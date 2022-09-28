class CopiesController < ApplicationController
  include CopyMethods

  before_action :load_data_from_copy_json, only: %i[copy update_value]

  def copy
    render json: @copy_base
  end

  def update_value
    case params[:key]
    when 'greeting'
      render json: { value: greeting }
    when 'greetingVIP'
      render json: { value: greeting_vip }
    when 'intro'
      params[:created_at].present? ? render_intro_created_at : render_intro_updated_at
    when 'refresh'
      Airtable::FetchDataOnLoad.call
      redirect_to copy_path
    when 'time'
      render json: { value: time }
    end
  end

  private

  def load_data_from_copy_json
    file = File.read(Rails.root.join('tmp', 'copy.json'))
    @copy_base = JSON.parse(file)
  end

  def render_intro_created_at
    render json: { value: intro_created_at }
  end

  def render_intro_updated_at
    render json: { value: intro_updated_at }
  end
end

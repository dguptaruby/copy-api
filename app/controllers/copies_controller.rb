class CopiesController < ApplicationController
  include CopyMethods

  before_action :load_data_from_copy_json, only: %i[index copy_data refresh]

  def index
    render json: @copy_base
  end

  def copy_data
    case params[:key]
    when 'greeting'
      render json: { value: greeting }
    when 'greetingVIP'
     render json: { value: greeting_vip }
    when 'intro'
      params[:created_at].present? ? (render json: { value: intro_created_at }) : (render json: { value: intro_updated_at })
    end
  end

  private

  def load_data_from_copy_json
    file = File.read(Rails.root.join('tmp', 'copy.json'))
    @copy_base = JSON.parse(file)
  end
end

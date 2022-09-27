class CopiesController < ApplicationController
  before_action :load_data_from_copy_json, only: :index

  def index
    render json: @copy_base
  end

  private

  def set_params
    params.require
  end

  def load_data_from_copy_json
    file = File.read(Rails.root.join('tmp', 'copy.json'))
    @copy_base = JSON.parse(file)
  end
end

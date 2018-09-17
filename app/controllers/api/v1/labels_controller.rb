require 'google/apis/gmail_v1'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'

class Api::V1::LabelsController < ApiController
  before_action :authenticate_user
  before_action :set_google_api

  def index
    render json: get_label_list.to_json
  end

  def set_google_api
    @gmail = GoogleApi::Gmail.new
  end

  private
  def get_label_list
    label_list = @gmail.label_list
  end
end
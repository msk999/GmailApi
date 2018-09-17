require 'google/apis/gmail_v1'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'

class Api::V1::MessagesController < ApiController
  before_action :authenticate_user
  before_action :set_google_api
  def show
    id = params[:id]
    render html: @gmail.get(id, true).html
  end

  def index 
    label_ids = params[:label_ids] if params[:label_ids]
    render json: get_list(label_ids).to_json
  end

  private

  def get_list(label_ids)
    label_ids = ['INBOX','UNREAD'] if label_ids.nil?
    message_list = @gmail.list(label_ids)
    messages = []
    message_list.each do|msg| 
      message = @gmail.get(msg.id)
      messages << message
    end
    messages.sort_by {|message| message.date}.reverse
  end

  def set_google_api
    @gmail = GoogleApi::Gmail.new
  end
end

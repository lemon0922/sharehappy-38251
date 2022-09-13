class MessagesController < ApplicationController
  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path
    end
  end

  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
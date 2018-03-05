class MessagesController < ApplicationController
  before_action do
   @conversation = Conversation.find(params[:conversation_id])
  end
def index
  @messages = @conversation.messages.paginate(page: params[:page], per_page: 10)
  if @messages.length > 10
   @over_ten = true
   @messages = @messages[-10..-1]
  end
  if params[:m]
   @over_ten = false
   @messages = @conversation.messages
  end
  @messages.each do |message| 
   #fix toggle method -> doesnt work well when the messages other than last arent read.
    if message.user_id != current_user.id
     message.set_read
    end
  end
@message = @conversation.messages.new
 end
def new
 @message = @conversation.messages.new
end
def create
 @message = @conversation.messages.new(message_params)
 if @message.save
  redirect_to conversation_messages_path(@conversation)
 end
end
private
 def message_params
  params.require(:message).permit(:body, :user_id)
 end
end
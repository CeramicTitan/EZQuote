class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :projects, dependent: :destroy
  has_many :conversations, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  def get_name
    if self.admin?
      self.first_name.capitalize + " "+ self.last_name.capitalize+"(Administrator)"
    else
      self.first_name.capitalize + " "+ self.last_name.capitalize
    end
  end
  
  def unread_mail?
      #get all conversations that the user is involved in
      conversations = Conversation.where('sender_id =? OR recipient_id =?', self.id, self.id)
      #loop over all conversations
      conversations.each do |conversation|
          #This complains because conversation doesn't technically exist.
        return true if conversation.messages.where.not(:user_id => self.id).where(:read => false).any?   
      end
      false
  end
end
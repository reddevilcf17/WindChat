class OutgoingMessage 
  
  extend ActiveModel::Naming 
  include ActiveModel::Conversion
  
  attr_accessor :subject, :content, :recipients

  def persisted?
    false
  end
   
   # def initialize(subject, content, recipients)
   #    @subject = subject
   #    @content = content
   #    @recipients = recipients
   # end

end
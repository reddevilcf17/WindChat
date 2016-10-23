class MessagesController < ApplicationController

	def new
		@outgoing_message = OutgoingMessage.new
		@relationships = Relationship.where(friend_id: current_user.id, relationship_status: 1)
	end

	def create

		if (!params[:recipients].nil?) && params[:recipients].any? && params[:subject].present? && params[:content].present?
			@recipients = params[:recipients]

			@recipients.each do |recipient|
				@user = User.find_by(email: recipient)
				if @user
					Message.create(message_type: 'TEXT', user_id: current_user.id, recipient_id: @user.id, title: params[:subject], content: params[:content], status: 1)
					
				end				
			end

			redirect_to new_message_path, flash: {success: 'Your message have successfully sent to your friend(s)'}
		else
			redirect_to new_message_path, notice: 'All fields are required!'
		end
	end

	def show
		if params[:id]
			puts "current_user.id: "
			puts params[:id].to_s
			# @message_ids = session[:message_recipients].select{|x| x["sender_id"].to_s == params[:id].to_s}

			# MessageRecipient.where(id: @message_ids.collect{|mss| mss["id"]}).update_all(status: 2)

			# @messages_list = Message.where(id: @message_ids.collect{|mss| mss["message_id"]})
			if current_user.id.to_i == params[:id].to_i
				@messages_list = Message.where(user_id: params[:id]).order('created_at DESC')
			else
				@messages_list = Message.where(user_id: params[:id], recipient_id: current_user.id).order('created_at DESC')
			end
			
		end
	end

	def update
		if params[:id]

			Message.where(id: params[:id], status: 1).update(status: 2) #already read the message
		end
	end

	# private
	# def outgoing_message_params
	# 	params.require(:outgoing_message).permit(:subject, :content, 'recipients[]')
	# end
end

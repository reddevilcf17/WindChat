class RelationshipsController < ApplicationController
	def new
		@users = User.joins('left join relationships on users.id = relationships.user_id and relationships.friend_id = ' + current_user.id.to_s).where('users.id != ?', current_user.id).select('users.id as id, users.name as name, users.email as email, case when relationships.relationship_status is null then -1 else relationships.relationship_status end as status')
		puts @users.class
		puts @users.inspect
	end

	def create
		
		if params[:friend_id]
			@relationship_count = Relationship.where(user_id: current_user.id, friend_id: params[:friend_id]).count
			if @relationship_count == 0
				Relationship.create(user_id: current_user.id, friend_id: params[:friend_id], relationship_status: 0, action: 1)
				Relationship.create(user_id: params[:friend_id], friend_id: current_user.id, relationship_status: 2, action: 1)
			end
		end

		@users = User.joins('left join relationships on users.id = relationships.user_id and relationships.friend_id = ' + current_user.id.to_s).where('users.id != ?', current_user.id).select('users.id as id, users.name as name, users.email as email, case when relationships.relationship_status is null then -1 else relationships.relationship_status end as status')
	end

	def update
		if params[:id]
			Relationship.where(user_id: current_user.id, friend_id: params[:id]).update(relationship_status: 1)
			Relationship.where(user_id: params[:id], friend_id: current_user.id).update(relationship_status: 1)
			@users = User.joins('left join relationships on users.id = relationships.user_id and relationships.friend_id = ' + current_user.id.to_s).where('users.id != ?', current_user.id).select('users.id as id, users.name as name, users.email as email, case when relationships.relationship_status is null then -1 else relationships.relationship_status end as status')
		end
	end

	def destroy
		if params[:id]
			Relationship.destroy_all(user_id: current_user.id, friend_id: params[:id])
			Relationship.destroy_all(user_id: params[:id], friend_id: current_user.id)
			@users = User.joins('left join relationships on users.id = relationships.user_id and relationships.friend_id = ' + current_user.id.to_s).where('users.id != ?', current_user.id).select('users.id as id, users.name as name, users.email as email, case when relationships.relationship_status is null then -1 else relationships.relationship_status end as status')
		end
	end
end

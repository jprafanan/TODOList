class ItemsController < ApplicationController
	before_filter :authenticate	

	def index
		@items = current_user.items
	end

	def new
		@item = current_user.items.new
	end

	def create
		@item = current_user.items.new(item_params)
		@item.save
		redirect_to items_path
	end

	def edit
		@item = find_item
	end

	def update
		@item = find_item
		@item.update_attributes(item_params)
		redirect_to items_path
	end

	def destroy
		@item = find_item
		@item.destroy
		redirect_to items_path
	end

	private
		def find_item
			current_user.items.find(params[:id])
		end

		def item_params
			params.require(:item).permit(:description)
		end
end
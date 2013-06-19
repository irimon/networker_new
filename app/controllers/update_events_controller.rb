class UpdateEventsController < ApplicationController
  def new
	 @update_event = UpdateEvent.new
  end
end

class ComplaintsController < ApplicationController
before_action :authenticate_user!
def new
    @complaint = Complaint.new
end

def create
	@complaint = Complaint.new(complaint_params)
    @complaint.user_id = current_user.id
    respond_to do |format|
      if @complaint.save
      	format.html { redirect_to complaints_path}
      	flash[:success] = 'Complaint was successfully lodged.' 
      else
        format.html { render :new }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
     end
end

def authenticate_user!
      unless logged_in?
        redirect_to login_path, flash[:danger]= "You need to sign in before continuing."
      end
    end
    def complaint_params
	params.require(:complaint).permit(:title, :text, :user_id)
  end
end

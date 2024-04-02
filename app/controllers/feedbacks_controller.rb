class FeedbacksController < ApplicationController
    before_action :set_cloth, only: [:create, :destroy]
    def create
        @cloths=@cloth.feedbacks.new(feedback_params)
        @cloths.created_by = current_user.f_name
        if @cloths.save
            redirect_to @cloth
        end
    end


    def destroy
        @cloth=@cloth.feedback.find(params[:id])
        @cloth.destroy
        redirect_to @cloth, notice: 'Feedback deleted!'
    end

    private

    def set_cloth
        @cloth=Cloth.find(params[:cloth_id])
    end

    def feedback_params
        params.require(:feedback).permit(:comment)
    end
end
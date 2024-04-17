class Api::FeedbacksController < ApiController
    def index
        render json: Feedback.all
    end
end
class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.book_id = params[:book_id]

    if @review.save
      flash[:notice] = "Save Successful"
    else
      flash[:notice] = "Review Save Failed"
    end
    redirect_to book_path(params[:book_id])
  end

  private

  def review_params
    params.required(:review).permit( :rating, :body )
  end
end

class ReviewsController < ApplicationController

  before_action :set_review, only: [:update, :destroy]
  before_action :set_products


  def create
    @review = @product.reviews.new({
        rating: params[:rating],
        description: params[:comments],
        user_id: current_user.id
      })
    @review.user = current_user
    @review.save!
    # respond_to do |format|
    #   if @review.save
    #     format.html { redirect_to @product, notice: 'Review was successfully created.' }
    #     format.json { render :show, status: :created, location: @product }
    #   else
    #     format.html { redirect_to @product }
    #     format.json { render json: @review.errors, status: :unprocessable_entity }
    #   end
    # end
    redirect_to :back
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    respond_to do |format|
      format.html {redirect_to @product, notice: 'Comment was successfully deleted.'}
      format.json { head:no_content}
    end
  end
  

  private
    def set_products
      @product = Product.find(params[:product_id])
    end
    
end

class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end
# GET /blogs/new
  def new
    @portfolio_item = Portfolio.new
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @portfolio_item = Portfolio.new(blog_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'portfolio_item was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end
   private
   
    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:portfolio).permit(:title, :subtitle,:body)
    end
end
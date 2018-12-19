class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def about
  end

  def contact
  end

  def index
    @listings = Listing.order('created_at DESC');
  end

  def show 
    listing = Listing.find(params[:id])
  end

def create 
    listing = Listing.new(listing_params)

    if listing.save
        redirect_to root_path
    else
      redirect_to root_path
    end

end

def destroy 
    listing = Listing.find(params[:id])
    listing.destroy
    redirect_to root_path
end

def edit 
    @listing = Listing.find(params[:id])
end

def update
    listing = Listing.find(params[:id])
    listing.update_attributes(listing_params)
    redirect_to root_path
end

private 
def listing_params
    params.require(:listing).permit(:category, :body)
end

end



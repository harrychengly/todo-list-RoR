class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def about
  end

  def contact
  end

  def home
    @listings = Listing.order('created_at DESC');
  end

  def show 
    listing = Listing.find(params[:id])
    render json:{status:'SUCCESS', message:'Loaded listing', data:listing},status: :ok
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

def update
    listing = Listing.find(params[:id])
    if listing.update_attributes(listing_params)
        render json:{status:'SUCCESS', message:'Updated listing', data:listing},status: :ok
    else
        render json:{status:'ERROR', message:'Listing not updated', data:listing.errors},status: :unprocessable_entity
    end
end

private 
def listing_params
    params.require(:listing).permit(:category, :body)
end

end



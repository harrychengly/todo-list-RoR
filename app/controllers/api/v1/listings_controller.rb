module Api
    module V1
        class ListingsController < ApplicationController
            skip_before_action :verify_authenticity_token
            def index 
             listings = Listing.order('created_at DESC');
             render json:{status:'SUCCESS', message:'Loaded listings', data:listings},status: :ok
            end 

            def show 
                listing = Listing.find(params[:id])
                render json:{status:'SUCCESS', message:'Loaded listing', data:listing},status: :ok
            end

            def create 
                listing = Listing.new(listing_params)

                if listing.save
                    render json:{status:'SUCCESS', message:'Saved listing', data:listing},status: :ok
                else
                    render json:{status:'ERROR', message:'Listing not saved', data:listing.errors},status: :unprocessable_entity
                end

            end

            def destroy 
                listing = Listing.find(params[:id])
                listing.destroy
                render json:{status:'SUCCESS', message:'Listing deleted', data:listing},status: :ok
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
                params.permit(:category, :body)
            end
        end
    end
end
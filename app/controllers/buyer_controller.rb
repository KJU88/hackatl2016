class BuyerController < ApplicationController
    def new
        @buyer = Buyer.new
    end
    
    def create
        @buyer = Buyer.new(buyer_params)
        
        if @buyer.save
            name = params[:contact][:name]
            email = params[:contact][:email]
            product = params[:contact][:product]
            
            BuyerMailer.buyer_email(name, email, body).deliver
            flash[:success] = 'Message sent.'
            redirect_to new_buyer_path
        else
            flash[:danger] = 'Error occured, message has not been sent.'
            redirect_to new_buyer_path
        end
    end
    
    private
        def buyer_params
          params.require(:buyer).permit(:name, :email, :comments)
        end
end

class BuyerMailer < ActionMailer::Base
    default to: 'j.liang8888@gmail.com'
    
    def buyer_email(name, email, product)
        @name = name
        @email = email
        @product = product
        
        mail(from: email, subject: 'Contact Form Message')
    end
end
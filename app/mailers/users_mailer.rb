class UsersMailer < ActionMailer::Base

    def confirmation_email(user_id)
        @user = User.find(user_id)
    
        mail(   :to      => @user.email,
                :subject => "Order Confirmation",
                :from => "maha.sajid@pakeventures.com"
        ) do |format|
          format.text
          format.html
        end
      end
    end
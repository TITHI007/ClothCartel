class ClothMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.cloth_mailer.cloth_created.subject
  #
  def cloth_created
    @user = params[:user]
    @cloth = params[:cloth]

    mail(
      to: @user.email, 
      subject: "Cloth Created successfully"
    ) 
  end
end

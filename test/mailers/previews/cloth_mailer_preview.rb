# Preview all emails at http://localhost:3000/rails/mailers/cloth_mailer
class ClothMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/cloth_mailer/cloth_created
  def cloth_created
    ClothMailer.with(user: Customer.first, cloth:Cloth.first).cloth_created
  end

end

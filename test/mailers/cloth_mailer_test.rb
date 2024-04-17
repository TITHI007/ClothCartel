require "test_helper"

class ClothMailerTest < ActionMailer::TestCase
  test "cloth_created" do
    mail = ClothMailer.cloth_created
    assert_equal "Cloth created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

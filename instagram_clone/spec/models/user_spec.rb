require 'rails_helper'

RSpec.describe User, type: :model do

  describe "If User is valid then" do
    let(:valid_user_account) do
      username = 'gwoodman92'
      email = 'gwoodman92@example.com'
      password = '123456'
      User.create(username: username, email: email, password: password, password_confirmation: password)
    end

    it "has username" do
      expect(valid_user_account.username).to eq 'gwoodman92'
    end
  end

end

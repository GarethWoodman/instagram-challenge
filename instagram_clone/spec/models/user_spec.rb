require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_username)    { 'gwoodman92' }
  let(:invalid_username)  { 'gwoodman92gwoodman92gwoodman92gwoodman92' }

  let(:valid_email)       { 'gwoodman92@example.com' }
  let(:invalid_email)     { 'gwoodman-at.com' }

  let(:valid_password)    { '123456' }
  let(:invalid_password)  { '123' }

  def create_user(username, email, password, password_confirmation=valid_password)
    User.create(username: username, email: email, password: password, password_confirmation: password_confirmation)
  end

  let(:valid_user) do
    create_user(valid_username, valid_email, valid_password, valid_password)
  end

  describe "If User is valid then" do
    it "has username" do
      expect(valid_user.username).to eq 'gwoodman92'
    end

    it "has email" do
      expect(valid_user.email).to eq 'gwoodman92@example.com'
    end

    it "has encryped password" do
      expect(valid_user.authenticate('123456')).to_not eq false
    end
  end

  describe "If User attribute is invalid" do
    it "username is invalid" do
      user_with_invalid_username = create_user(invalid_username, valid_email, valid_password)
      expect(user_with_invalid_username.id).to eq nil
    end

    it "email is invalid" do
      user_with_invalid_email = create_user(valid_username, invalid_email, valid_password)
      expect(user_with_invalid_email.id).to eq nil
    end

    it "password is invalid" do
      user_with_invalid_password = create_user(invalid_username, valid_email, invalid_password, invalid_password)
      expect(user_with_invalid_password.id).to eq nil
    end
  end

  describe "If User enters incorrect password" do
    it "password_confirmation does not match password" do
      user_with_invalid_password_confirmation = create_user(valid_username, valid_email, valid_password, 'adifferentpassword')
      expect(user_with_invalid_password_confirmation.id).to eq nil
    end

    it "password to login is incorrect" do
      expect(valid_user.authenticate('123498')).to eq false
    end
  end

end

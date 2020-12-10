require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a first name, last name, email, password' do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it 'is invalid without a first name' do
    user = FactoryBot.build(:user)
    user.first_name = nil
    user.valid?
    expect(user.errors[:first_name]).to include('doit être rempli(e)')
  end

  it 'is invalid without a last name' do
    user = FactoryBot.build(:user)
    user.last_name = nil
    user.valid?
    expect(user.errors[:last_name]).to include('doit être rempli(e)')
  end

  it 'is invalid without a password' do
    user = FactoryBot.build(:user)
    user.password = nil
    user.valid?
    expect(user.errors[:password]).to include('doit être rempli(e)')
  end

  it 'is invalid without an e-mail' do
    user = FactoryBot.build(:user)
    user.email = nil
    user.valid?
    expect(user.errors[:email]).to include('doit être rempli(e)')
  end

  # Checked by devise directly
  # it 'is invalid with a wrong e-mail' do
  #   user = FactoryBot.build(:user)
  #   user.email = 'alice'
  #   user.valid?
  #   expect(user.errors[:email]).to include("n'est pas valide")
  # end
end

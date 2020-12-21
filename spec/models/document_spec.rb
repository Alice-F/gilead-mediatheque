require 'rails_helper'

RSpec.describe Document, type: :model do
  it 'is valid with a title, correct language' do
    document = FactoryBot.build(:document)
    expect(document).to be_valid
  end

  it 'is invalid without a title' do
    document = FactoryBot.build(:document)
    document.title = ""
    document.valid?
    expect(document.errors[:title]).to include('doit être rempli(e)')
  end

  it 'is invalid with a title, incorrect language' do
    document = FactoryBot.build(:document)
    document.language = "GR"
    document.valid?
    expect(document.errors[:language]).to include("n'est pas inclus(e) dans la liste")
  end
end

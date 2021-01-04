require 'rails_helper'

RSpec.describe Folder, type: :model do
  it 'is invalid without a name' do
    folder = FactoryBot.build(:folder)
    folder.name = ""
    folder.valid?
    expect(folder.errors[:name]).to include('doit être rempli(e)')
  end

  it 'is invalid with a name already used' do
    folder_one = FactoryBot.create(:folder)
    folder_two = FactoryBot.build(:folder)
    folder_two.valid?
    expect(folder_two.errors[:name]).to include("n'est pas disponible")
  end
end

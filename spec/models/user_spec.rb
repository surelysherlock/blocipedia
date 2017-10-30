require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) {User.create!(email:'bloc@bloc.io', password: 'pace123456')}

  describe 'attributes' do
    it 'has email and password attributes' do
      expect(user).to have_attributes(email:'bloc@bloc.io', password: 'pace123456')
    end 
  end 
end

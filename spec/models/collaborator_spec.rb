require 'rails_helper'

RSpec.describe Collaborator, type: :model do

  let (:user) {User.create!(email:'bloc@bloc.io', password: 'pace123456')}
  let (:wiki) {Wiki.create!(title:"New Wiki Title", body:"New Body Title", private: false, user: user)}
  let (:coll) {Collaborator.create!(email:'bloc@bloc.io')}

  describe 'attributes' do
    it 'has email attributes' do
      expect(coll).to have_attributes(email:'bloc@bloc.io')
    end 
  end
end

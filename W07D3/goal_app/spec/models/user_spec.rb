require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # debugger
  it {should validate_presence_of(:username)}
#   it {should validate_presence_of(:password_digest)}
#   it {should validate_length_of(:password).is_at_least(6)}

#   # subject(:capy)  { User.create(
#   #       username: 'capy', 
#   #       password: 'password') }
  
#   subject(:capy) {FactoryBot.create(:user)}

#   it {should validate_uniqueness_of(:username)}

#   describe '#ensure_session_token' do
#     it 'assigns a seesion token if none is given' do
#       expect(FactoryBot.build(:user).session_token).not_to be_nil 
#     end
#   end

#   describe '#password_encryption' do
#     it 'does not save password to the database' do
#         FactoryBot.create(:user, username: 'Gendo') # save to DB
#         user = User.find_by(username: 'Gendo') # find user
#         expect(user.password).not_to eq('password') # checks password is not in DB
#     end

#     it 'ensure password is encrypted using BCrypt' do
#         expect(BCrypt::Password).to receive(:create).with('abcdef')
#         FactoryBot.build(:user, password: 'abcdef')
#     end
#   end

#   describe 'associations' do
#       it {should have_many(:goals)}
#   end
end

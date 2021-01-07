require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'GET #new' do
    it 'renders new users template successfully' do
      get :new
      expect(response).to be_success
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do 
    context 'with valid params' do
      let(:user_params) do 
        {user: { username: 'bryan',
          password: 'password'}
        }
      end

      it 'logs in the user' do
        post :create, params: user_params
        user = User.find_by(username: 'bryan')
        expect(session[:session_token]).to eq(user.session_token)
      end

      it 'redirects to the users show page' do
        post :create, params: user_params
        user = User.find_by(username: 'bryan')
        expect(response).to redirect_to(user_url(user))
      end
    end
  end
end

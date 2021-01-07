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

  #describe
end

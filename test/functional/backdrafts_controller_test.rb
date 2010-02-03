require 'test_helper'

class BackdraftsControllerTest < ActionController::TestCase

  context 'GET to index' do
    setup { get :index }

    should_respond_with :success
    should_render_template :index
  end

end


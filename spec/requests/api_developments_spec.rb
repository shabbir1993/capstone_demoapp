# require 'rails_helper'
RSpec.describe "ApiDevelopments", type: :request do
  
  def parsed_body
    JSON.parse(response.body)
  end
  
  describe "RDBMS-backed resource" do
    before(:each) {Foo.delete_all}
    after(:each)  {Foo.delete_all}
    it 'creates RDBMS-backed resource' do
      object = Foo.create(:name=>'test');
      expect(Foo.find(object.id).name).to eq('test')
    end

    it 'exposes RDBMS-backed API resource' do
      object = Foo.create(name: 'test')
      expect(foos_path).to eq('/api/foos')
      get foo_path(object.id)
      expect(response).to have_http_status(:ok)
      expect(parsed_body['name']).to eq('test')
    end
  end
  
  describe 'MongoDB-backed resource' do
    it 'creates MongoDB backed resource'do
    end
    
    it 'exposes MongoDB backed api resource' do
    end
  end
end

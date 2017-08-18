require 'rails_helper'

RSpec.describe 'ApiDevelopments', type: :request do
  #def parsed_body
   # JSON.parse(response.body)
  #end
  describe 'RDBMS-backed resource' do

    before(:each) {Foo.delete_all}
    after(:each) {Foo.delete_all}

    it 'creates RDBMS-backed resource' do
      object = Foo.create(:name=>'test')
      expect(Foo.find(object.id).name).to eq('test')
    end
    it 'expose RDBMS-backed resource API' do
      object = Foo.create(name: 'test')
      expect(foos_path).to eq('/api/foos')
      get foo_path(object.id)
      expect(response).to have_http_status(:ok)
      #expect(parsed_body['name']).to eq('test')
    end
  end

  describe 'MongoDB backed resource' do

    before(:each) {Bar.delete_all}
    after(:each) {Bar.delete_all}


    it 'creates MongoDB-backed resource' do
      object = Bar.create(name: 'test')
      expect(Bar.find(object.id).name).to eq('test')
    end

    it 'expose MongoDB-backed resource API' do
      object = Bar.create(name: 'test')
      expect(bars_path).to eq('/api/bars')
      get bar_path(object.id)
      expect(response).to have_http_status(:ok)
      #expect(parsed_body['name']).to eq('test')
      #expect(parsed_body).to include('created_at')
      #expect(parsed_body).to include('id'=> object.id.to_s)
    end
  end
end

require 'rails_helper'

RSpec.describe 'ApiDevelopments', type: :request do
  describe 'RDBMS-backed resource' do
    it 'creates RDBMS-backed resource' do
      object = Foo.create(:name=>'test')
      expect(Foo.find(object.id).name).to eq('test')
    end
    it 'expose RDBMS-backed resource API' do
    end
  end

  describe 'MongoDB backed resource' do
    it 'creates MongoDB-backed resource' do
    end
    it 'expose MongoDB-backed resource API' do
    end
  end
end

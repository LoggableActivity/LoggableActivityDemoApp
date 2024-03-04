# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Demo::CitiesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/demo/cities').to route_to('demo/cities#index')
    end

    it 'routes to #new' do
      expect(get: '/demo/cities/new').to route_to('demo/cities#new')
    end

    it 'routes to #show' do
      expect(get: '/demo/cities/1').to route_to('demo/cities#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/demo/cities/1/edit').to route_to('demo/cities#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/demo/cities').to route_to('demo/cities#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/demo/cities/1').to route_to('demo/cities#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/demo/cities/1').to route_to('demo/cities#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/demo/cities/1').to route_to('demo/cities#destroy', id: '1')
    end
  end
end

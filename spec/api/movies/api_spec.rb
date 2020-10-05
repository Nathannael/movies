require 'rails_helper'

RSpec.describe Movies::API do
  let(:api_key) { Faker::Alphanumeric.alphanumeric(number: 8) }

  before do
    allow(OMDb::Client).to receive(:api_key).and_return(api_key)
  end

  shared_examples 'API endpoint' do
    context 'when something goes wrong with the API call' do
      before do
        stub_request(:get, 'www.omdbapi.com')
          .with(query: query.merge({ apikey: api_key }).to_param)
          .to_raise('API not Available')

        api_call.call
      end

      it 'return status 500 INTERNAL SERVER ERROR' do
        expect(response).to have_http_status(:internal_server_error)
      end

      it 'returns error' do
        expect(response.body).to include('API not Available')
      end
    end

    context 'when API returns data' do
      let(:successful_response) { 'content' }

      before do
        stub_request(:get, 'www.omdbapi.com')
          .with(query: query.merge({ apikey: api_key }).to_param)
          .to_return(body: successful_response)

        api_call.call
      end

      it 'return status 200 OK' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns content' do
        expect(response.body).to include('content')
      end
    end
  end

  describe 'GET /api/v1/movies/:id' do
    let(:id) { Faker::Alphanumeric.alphanumeric(number: 8) }

    it_behaves_like 'API endpoint' do
      let(:query) { { i: id } }
      let(:api_call) { Proc.new { get "/api/v1/movies/#{id}" } }
    end
  end

  describe 'GET /api/v1/movies?title=[movie]' do
    let(:movie) { "avatar" }

    it_behaves_like 'API endpoint' do
      let(:query) { { s: movie } }
      let(:api_call) { Proc.new { get "/api/v1/movies?title=#{movie}" } }
    end
  end
end

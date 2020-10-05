require 'rails_helper'

RSpec.describe OMDb::Client do
  let(:api_key) { Faker::Alphanumeric.alphanumeric(number: 8) }
  let(:successful_response) { 'content' }

  before do
    allow(described_class).to receive(:api_key).and_return(api_key)
  end

  shared_examples 'endpoint' do
    context 'when API is available' do
      before do
        stub_request(:get, 'www.omdbapi.com')
          .with(query: query.merge({ apikey: api_key }))
          .to_return(body: successful_response)
      end

      it 'returns success = true' do
        expect(request).to be_success
      end

      it 'returns payload from OMDb API' do
        expect(request.payload.body).to eq successful_response
      end
    end

    context 'when request returns an error' do
      let(:error) { 'API not Available' }

      before do
        stub_request(:get, 'www.omdbapi.com')
          .with(query: query.merge({ apikey: api_key }) )
          .to_raise(error)
      end

      it 'returns success = false' do
        expect(request).not_to be_success
      end

      it 'returns error message' do
        expect(request.error).to eq error
      end
    end
  end

  describe '.find_by_id' do
    let(:id) { Faker::Alphanumeric.alphanumeric(number: 8) }

    it_behaves_like 'endpoint' do
      let(:query) { { i: id } }
      let(:request) { described_class.find_by_id(id: id) }
    end
  end

  describe '.find_by_name' do
    let(:name) { "avatar" }

    it_behaves_like 'endpoint' do
      let(:query) { { t: name } }
      let(:request) { described_class.find_by_name(name: name) }
    end
  end

  describe '.search' do
    let(:term) { "avatar" }

    it_behaves_like 'endpoint' do
      let(:query) { { s: term } }
      let(:request) { described_class.search(term: term) }
    end
  end
end

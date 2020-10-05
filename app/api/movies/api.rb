module Movies
  class API < Grape::API
    version 'v1', using: :path
    prefix "api"
    format :json

    resource :movies do
      desc 'return a movie associated with an IMDB Id'
      params do
        requires :id, type: String, desc: 'movie IMDB ID.'
      end

      get '/:id' do
        response = OMDb::Client.find_by_id(id: params[:id])

        if response.success?
          status response.payload.code
          response.payload.parsed_response
        else
          error! response.error, :internal_server_error
        end
      end

      desc 'searches a movie given the title'
      params do
        optional :title, type: String, desc: 'search term'
      end

      get do
        response = OMDb::Client.search(term: params[:title])

        if response.success?
          response.payload.parsed_response
        else
          error! response.error, :internal_server_error
        end
      end
    end
  end
end

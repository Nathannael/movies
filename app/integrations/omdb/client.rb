module OMDb
  class Client
    include HTTParty

    base_uri 'http://www.omdbapi.com'

    def self.find_by_id(id:)
      url_params = { i: id }

      call(url_params)
    end

    def self.find_by_name(name:)
      url_params = { t: name }

      call(url_params)
    end

    def self.search(term:)
      url_params = { s: term }

      call(url_params)
    end

    private
    def self.call(url_params)
      result = get("/", { query: url_params.merge(apikey: api_key).to_param })
    rescue => e
      OpenStruct.new({success?: false, error: e.message})
    else
      OpenStruct.new({success?: true, payload: result})
    end

    def self.api_key
      Rails.application.credentials.omdb[:access_key]
    end
  end
end

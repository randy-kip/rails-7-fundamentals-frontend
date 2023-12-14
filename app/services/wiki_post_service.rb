class WikiPostService
    BASE_URL = 'http://localhost:3000/api/v1/wiki_posts'.freeze

    def self.fetch_post(id)
        uri = URI.parse("#{BASE_URL}/#{id}")
        response = Net::HTTP.get_response(uri)
        JSON.parse(response.body)
    end
end
class WikiPostService
    TOKEN = ENV['WIKI_API_KEY']

    BASE_URL = 'http://localhost:3000/api/v1/wiki_posts'.freeze

    def self.fetch_post(id)
        uri = URI.parse("#{BASE_URL}/#{id}")
        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Get.new(uri.request_uri)
        request['Authorization'] = "Bearer #{TOKEN}"

        response = http.request(request)
        JSON.parse(response.body)
    end
end
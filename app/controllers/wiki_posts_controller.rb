# frozen_string_literal: true
require 'net/http'

class WikiPostsController < ApplicationController
    TOKEN = ENV['WIKI_API_KEY']
    def index
        uri = URI.parse('http://localhost:3000/api/v1/wiki_posts?page=1&limit=4')

        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Get.new(uri.request_uri)
        request['Authorization'] = "Bearer #{TOKEN}"

        response = http.request(request)

        if response.is_a?(Net::HTTPSuccess)
            @wiki_posts = JSON.parse(response.body)
        else
            @error = response.body
            render :error
        end
    end

    def show
        id = params[:id]
        
        attributes = WikiPostService.fetch_post(id)
        @wiki_post = WikiPost.new(attributes)
    end
end

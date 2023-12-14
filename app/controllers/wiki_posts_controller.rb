# frozen_string_literal: true
require 'net/http'
class WikiPostsController < ApplicationController
    def index
        uri = URI.parse('http://localhost:3000/api/v1/wiki_posts')
        response = Net::HTTP.get_response(uri)

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

class WikiPost
    attr_accessor :id, :created_at, :updated_at, :title, :description, :author
    def initialize(attributes)
        @id = attributes['id']
        @created_at = attributes['created_at']
        @updated_at = attributes['updated_at']
        @title = attributes['title']
        @description = attributes['description']
        @author = attributes['author']
    end
end
class MoviesController
  include Swagger::Blocks

  swagger_path "/movies" do
    operation :get do
      key :summary, "Index movies"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "movie"
      ]
      response 200 do
        key :description, "List of all movies"
        schema do
          key :"$ref", :movie_index_response
        end
      end
      response 401 do
        key :description, "Unauthorized"
      end
      response 404 do
        key :description, "Not Found"
      end
      response :default do
        key :description, "Unexpected error"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
    end
  end

  swagger_path "/movies/{id}" do
    operation :get do
      key :summary, "Show movie"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "movie"
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, "id of movie"
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, "Show movie"
        schema do
          key :"$ref", :movie_show_response
        end
      end
      response 401 do
        key :description, "Unauthorized"
      end
      response 404 do
        key :description, "Not Found"
      end
      response :default do
        key :description, "Unexpected error"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
    end
  end

  swagger_path "/movies" do
    operation :post do
      key :summary, "Create movie"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "movie"
      ]
      parameter do
        key :name, :movie_params
        key :in, :body
        key :required, true
        schema do
          key :"$ref", :create_movie
        end
      end
      response 201 do
        key :description, "movie"
        schema do
          key :"$ref", :movie_create_response
        end
      end
      response 401 do
        key :description, "Unauthorized"
      end
      response 403 do
        key :description, "Forbidden"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
      response :default do
        key :description, "Unexpected error"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
    end
  end

  swagger_path "/movies/{id}" do
    operation :put do
      key :summary, "Update movie"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "movie"
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, "id of movie"
        key :required, true
        key :type, :integer
      end
      parameter do
        key :name, :movie_params
        key :in, :body
        key :required, true
        schema do
          key :"$ref", :update_movie
        end
      end
      response 200 do
        key :description, "movie"
        schema do
          key :"$ref", :movie_create_response
        end
      end
      response 401 do
        key :description, "Unauthorized"
      end
      response 202 do
        key :description, "Accepted"
      end
      response 204 do
        key :description, "No Content"
      end
      response 403 do
        key :description, "Forbidden"
      end
      response 404 do
        key :description, "Not Found"
      end
      response 409 do
        key :description, "Conflict"
      end
      response :default do
        key :description, "Unexpected error"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
    end
  end

  swagger_path "/movies/{id}" do
    operation :patch do
      key :summary, "Update movie"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "movie"
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, "id of movie"
        key :required, true
        key :type, :integer
      end
      parameter do
        key :name, :movie_params
        key :in, :body
        key :required, true
        schema do
          key :"$ref", :update_movie
        end
      end
      response 200 do
        key :description, "movie"
        schema do
          key :"$ref", :movie_create_response
        end
      end
      response 401 do
        key :description, "Unauthorized"
      end
      response 202 do
        key :description, "Accepted"
      end
      response 204 do
        key :description, "No Content"
      end
      response 403 do
        key :description, "Forbidden"
      end
      response 404 do
        key :description, "Not Found"
      end
      response 409 do
        key :description, "Conflict"
      end
      response :default do
        key :description, "Unexpected error"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
    end
  end
  
  swagger_path "/movies/{id}" do
    operation :delete do
      key :summary, "Delete movie"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "movie"
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, "id of movie"
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, "Ok"
      end
      response 202 do
        key :description, "Accepted"
      end
      response 204 do
        key :description, "No Content"
      end
      response 404 do
        key :description, "Not Found"
      end
      response 401 do
        key :description, "Unauthorized"
      end
      response :default do
        key :description, "Unexpected error"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
    end
  end

  swagger_path "/movies/{movie_id}/actors" do
    operation :get do
      key :summary, "Show actors from movie"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "movie"
      ]
      response 200 do
        key :description, "Show actors from movie"
        schema do
          key :"$ref", :show_actors_from_movie_response
        end
      end
      response 401 do
        key :description, "Unauthorized"
      end
      response 403 do
        key :description, "Forbidden"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
      response 404 do
        key :description, "Not Found"
      end
      response :default do
        key :description, "Unexpected error"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
    end
  end

  swagger_path "/movies/{id}/relationships/actors" do
    operation :get do
      key :summary, "Show actors from movie"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "movie"
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, "id of movie"
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, "Show actors from movie"
        schema do
          key :"$ref", :show_actors_from_movie_relation_response
        end
      end
      response 401 do
        key :description, "Unauthorized"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
      response 403 do
        key :description, "Forbidden"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
      response :default do
        key :description, "Unexpected error"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
    end
  end

  swagger_path "/movies/{id}/relationships/actors" do
    operation :put do
      key :summary, "Update actors from movie"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "movie"
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, "id of movie"
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, "Update actors from movie"
        schema do
          key :"$ref", :update_actors_from_movie_relation_response
        end
      end
      response 202 do
        key :description, "Accepted"
      end
      response 204 do
        key :description, "No Content"
      end
      response 401 do
        key :description, "Unauthorized"
      end
      response 403 do
        key :description, "Forbidden"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
      response :default do
        key :description, "Unexpected error"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
    end
  end

  swagger_path "/movies/{id}/relationships/actors" do
    operation :post do
      key :summary, "Update actors from movie"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "movie"
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, "id of movie"
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, "Update actors from movie"
        schema do
          key :"$ref", :update_actors_from_movie_relation_response
        end
      end
      response 202 do
        key :description, "Accepted"
      end
      response 204 do
        key :description, "No Content"
      end
      response 401 do
        key :description, "Unauthorized"
      end
      response 403 do
        key :description, "Forbidden"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
      response :default do
        key :description, "Unexpected error"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
    end
  end

   swagger_path "/movies/{id}/relationships/actors" do
    operation :delete do
      key :summary, "Delete actors from movie"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "movie"
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, "id of movie"
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, "Delete actors from movie"
        schema do
          key :"$ref", :delete_actors_from_movie_relation_response
        end
      end
      response 202 do
        key :description, "Accepted"
      end
      response 204 do
        key :description, "No Content"
      end
      response 401 do
        key :description, "Unauthorized"
      end
      response 404 do
        key :description, "Not Found"
      end
      response 403 do
        key :description, "Forbidden"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
      response :default do
        key :description, "Unexpected error"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
    end
  end

  swagger_path "/movies/{movie_id}/movie_type" do
    operation :get do
      key :summary, "Show movie_type from movie"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "movie"
      ]
      response 200 do
        key :description, "Show movie_type from movie"
        schema do
          key :"$ref", :show_movie_type_from_movie_response
        end
      end
      response 401 do
        key :description, "Unauthorized"
      end
      response 403 do
        key :description, "Forbidden"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
      response 404 do
        key :description, "Not Found"
      end
      response :default do
        key :description, "Unexpected error"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
    end
  end

  swagger_path "/movies/{id}/relationships/movie_type" do
    operation :get do
      key :summary, "Show movie_type from movie"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "movie"
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, "id of movie"
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, "Show movie_type from movie"
        schema do
          key :"$ref", :show_movie_type_from_movie_relation_response
        end
      end
      response 401 do
        key :description, "Unauthorized"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
      response 403 do
        key :description, "Forbidden"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
      response :default do
        key :description, "Unexpected error"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
    end
  end

  swagger_path "/movies/{id}/relationships/movie_type" do
    operation :put do
      key :summary, "Update movie_type from movie"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "movie"
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, "id of movie"
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, "Update movie_type from movie"
        schema do
          key :"$ref", :update_movie_type_from_movie_relation_response
        end
      end
      response 202 do
        key :description, "Accepted"
      end
      response 204 do
        key :description, "No Content"
      end
      response 401 do
        key :description, "Unauthorized"
      end
      response 403 do
        key :description, "Forbidden"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
      response :default do
        key :description, "Unexpected error"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
    end
  end

  swagger_path "/movies/{id}/relationships/movie_type" do
    operation :post do
      key :summary, "Update movie_type from movie"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "movie"
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, "id of movie"
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, "Update movie_type from movie"
        schema do
          key :"$ref", :update_movie_type_from_movie_relation_response
        end
      end
      response 202 do
        key :description, "Accepted"
      end
      response 204 do
        key :description, "No Content"
      end
      response 401 do
        key :description, "Unauthorized"
      end
      response 403 do
        key :description, "Forbidden"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
      response :default do
        key :description, "Unexpected error"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
    end
  end

   swagger_path "/movies/{id}/relationships/movie_type" do
    operation :delete do
      key :summary, "Delete movie_type from movie"
      key :produces, [
        "application/json"
      ]
      key :tags, [
        "movie"
      ]
      parameter do
        key :name, :id
        key :in, :path
        key :description, "id of movie"
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, "Delete movie_type from movie"
        schema do
          key :"$ref", :delete_movie_type_from_movie_relation_response
        end
      end
      response 202 do
        key :description, "Accepted"
      end
      response 204 do
        key :description, "No Content"
      end
      response 401 do
        key :description, "Unauthorized"
      end
      response 404 do
        key :description, "Not Found"
      end
      response 403 do
        key :description, "Forbidden"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
      response :default do
        key :description, "Unexpected error"
        schema do 
          property :errors do
            property :status do
              key :type, :integer
            end
            property :source do
              key :type, :string
            end
            property :detail do
              key :type, :string
            end
          end
        end
      end
    end
  end
end

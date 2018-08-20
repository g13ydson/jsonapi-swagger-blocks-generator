class Movie
  include Swagger::Blocks

  swagger_schema :movie_index_response do
    property :data do
      key :type, :array
      items do
        property :id do
          key :type, :integer
        end
        property :type do
          key :type, :string
        end
        property :attributes do
          items do
            property :id do
              key :type, :string
            end
            property :name do
              key :type, :string
            end
            property :release_year do
              key :type, :string
            end
          end
        end
        property :relationships do
          property :actors do
            property :links do
              property :self do
                key :type, :string
              end
              property :related do
                key :type, :string
              end
            end
          end
          property :movie_type do
            property :links do
              property :self do
                key :type, :string
              end
              property :related do
                key :type, :string
              end
            end
          end
        end
      end
    end
  end

  swagger_schema :movie_show_response do
    property :data do
      property :id do
        key :type, :integer
      end
      property :type do
        key :type, :string
      end
      property :links do
        property :self do
          key :type, :string
        end
      end
      property :attributes do
        items do
          property :id do
            key :type, :string
          end
          property :name do
            key :type, :string
          end
          property :release_year do
            key :type, :string
          end
        end
      end
      property :relationships do
        property :actors do
          property :links do
            property :self do
              key :type, :string
            end
            property :related do
              key :type, :string
            end
          end
        end
        property :movie_type do
          property :links do
            property :self do
              key :type, :string
            end
            property :related do
              key :type, :string
            end
          end
        end
      end
    end
  end

  swagger_schema :movie_create_response do
    property :data do
      property :id do
        key :type, :integer
      end
      property :type do
        key :type, :string
      end
      property :links do
        property :self do
          key :type, :string
        end
      end
      property :attributes do
        items do
          property :id do
            key :type, :string
          end
          property :name do
            key :type, :string
          end
          property :release_year do
            key :type, :string
          end
        end
      end
      property :relationships do
        property :actors do
          property :links do
            property :self do
              key :type, :string
            end
            property :related do
              key :type, :string
            end
          end
        end
        property :movie_type do
          property :links do
            property :self do
              key :type, :string
            end
            property :related do
              key :type, :string
            end
          end
        end
      end
    end
  end

  swagger_schema :movie_update_response do
    property :data do
      property :id do
        key :type, :integer
      end
      property :type do
        key :type, :string
      end
      property :links do
        property :self do
          key :type, :string
        end
      end
      property :attributes do
        items do
          property :id do
            key :type, :string
          end
          property :name do
            key :type, :string
          end
          property :release_year do
            key :type, :string
          end
        end
      end
      property :relationships do
        property :actors do
          property :links do
            property :self do
              key :type, :string
            end
            property :related do
              key :type, :string
            end
          end
        end
        property :movie_type do
          property :links do
            property :self do
              key :type, :string
            end
            property :related do
              key :type, :string
            end
          end
        end
      end
    end
  end

  swagger_schema :create_movie do
    property :data do
      property :type do
        key :type, :string
      end
      property :attributes do
        items do
          property :id do
            key :type, :string
          end
          property :name do
            key :type, :string
          end
          property :release_year do
            key :type, :string
          end
        end
      end
      property :relationships do
        property :actors do
          property :data do
            items do
              property :type do
                key :type, :string
              end
              property :id do
                key :type, :string
              end
            end
          end
        end
        property :movie_type do
          property :data do
            property :type do
              key :type, :string
            end
            property :id do
              key :type, :string
            end
          end
        end
      end
    end
  end

  swagger_schema :update_movie do
    property :data do
      property :type do
        key :type, :string
      end
      property :attributes do
        items do
          property :id do
            key :type, :string
          end
          property :name do
            key :type, :string
          end
          property :release_year do
            key :type, :string
          end
        end
      end
    end
  end

  swagger_schema :show_actors_from_movie_response do
    property :data do
      key :type, :array
      items do
        property :id do
          key :type, :integer
        end
        property :type do
          key :type, :string
        end
        property :attributes do
          items do
            property :id do
              key :type, :string
            end
            property :name do
              key :type, :string
            end
            property :email do
              key :type, :string
            end
          end
        end
        property :relationships do
        end
      end
    end
  end

  swagger_schema :show_actors_from_movie_relation_response do
    property :links do
      property :self do
        key :type, :string
      end
      property :related do
        key :type, :string
      end
    end
    property :data do
      key :type, :array
      items do
        property :id do
          key :type, :integer
        end
        property :type do
          key :type, :string
        end
      end
    end
  end

  swagger_schema :put_actors_from_movie_relation_response do
    property :data do
      key :type, :array
      items do
        property :id do
          key :type, :integer
        end
        property :type do
          key :type, :string
        end
      end
    end
  end

  swagger_schema :update_actors_from_movie_relation_response do
    property :data do
      key :type, :array
      items do
        property :id do
          key :type, :integer
        end
        property :type do
          key :type, :string
        end
      end
    end
  end

  swagger_schema :delete_actors_from_movie_relation_response do
    property :data do
      key :type, :array
      items do
        property :id do
          key :type, :integer
        end
        property :type do
          key :type, :string
        end
      end
    end
  end

  swagger_schema :show_movie_type_from_movie_response do
    property :data do
      key :type, :array
      items do
        property :id do
          key :type, :integer
        end
        property :type do
          key :type, :string
        end
        property :attributes do
          items do
            property :id do
              key :type, :string
            end
            property :name do
              key :type, :string
            end
          end
        end
        property :relationships do
          property :movies do
            property :links do
              property :self do
                key :type, :string
              end
              property :related do
                key :type, :string
              end
            end
          end
        end
      end
    end
  end

  swagger_schema :show_movie_type_from_movie_relation_response do
    property :links do
      property :self do
        key :type, :string
      end
      property :related do
        key :type, :string
      end
    end
    property :data do
      key :type, :array
      items do
        property :id do
          key :type, :integer
        end
        property :type do
          key :type, :string
        end
      end
    end
  end

  swagger_schema :put_movie_type_from_movie_relation_response do
    property :data do
      key :type, :array
      items do
        property :id do
          key :type, :integer
        end
        property :type do
          key :type, :string
        end
      end
    end
  end

  swagger_schema :update_movie_type_from_movie_relation_response do
    property :data do
      key :type, :array
      items do
        property :id do
          key :type, :integer
        end
        property :type do
          key :type, :string
        end
      end
    end
  end

  swagger_schema :delete_movie_type_from_movie_relation_response do
    property :data do
      key :type, :array
      items do
        property :id do
          key :type, :integer
        end
        property :type do
          key :type, :string
        end
      end
    end
  end
end

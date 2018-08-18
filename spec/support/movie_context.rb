# frozen_string_literal: true

RSpec.shared_context "movie class" do
  # Movie, Actor Classes and resources
  before(:context) do
    # models
    class Movie
      attr_accessor :id,
                    :name,
                    :release_year,
                    :director,
                    :actor_ids,
                    :movie_type_id

      def actors
        actor_ids.map.with_index do |id, i|
          a = Actor.new
          a.id = id
          a.name = "Test #{a.id}"
          a.email = "test#{a.id}@test.com"
          a
        end
      end

      def movie_type
        mt = MovieType.new
        mt.id = movie_type_id
        mt.name = "Episode"
        mt.movie_ids = [id]
        mt
      end
    end

    class Actor
      attr_accessor :id, :name, :email
      def url
        "http://movies.com/actors/#{id}"
      end
    end

    class MovieType
      attr_accessor :id, :name, :movie_ids

      def movies
        movie_ids.map.with_index do |_id, _i|
          m = Movie.new
          m.id = 232
          m.name = "test movie"
          m.actor_ids = [1, 2, 3]
          m.movie_type_id = 1
          m
        end
      end
    end

    class OwnerResource < JSONAPI::Resource
    end

    class MovieResource < JSONAPI::Resource
      attributes :name, :release_year
      has_many :actors
      has_one :movie_type
    end

    class ActorResource < JSONAPI::Resource
      attributes :name, :email
    end

    class MovieTypeResource < JSONAPI::Resource
      attributes :name
      has_many :movies
    end
  end
end

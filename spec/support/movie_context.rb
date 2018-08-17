# frozen_string_literal: true

RSpec.shared_context "movie class" do

  # Movie, Actor Classes and serializers
  before(:context) do
    # models
    class Movie
      attr_accessor :id,
                    :name,
                    :release_year,
                    :director,
                    :actor_ids,
                    :owner_id,
                    :movie_type_id

      def actors
        actor_ids.map.with_index do |id, i|
          a = Actor.new
          a.id = id
          a.name = "Test #{a.id}"
          a.email = "test#{a.id}@test.com"
          a.agency_id = i
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

      def advertising_campaign_id
        1
      end

      def advertising_campaign
        ac = AdvertisingCampaign.new
        ac.id = 1
        ac.movie_id = id
        ac.name = "Movie #{name} is incredible!!"
        ac
      end

      def owner
        return unless owner_id
        ow = Owner.new
        ow.id = owner_id
        ow
      end

      def cache_key
        "#{id}"
      end

      def local_name(locale = :english)
        "#{locale} #{name}"
      end

      def url
        "http://movies.com/#{id}"
      end
    end

    class Actor
      attr_accessor :id, :name, :email, :agency_id

      def agency
        Agency.new.tap do |a|
          a.id = agency_id
          a.name = "Test Agency #{agency_id}"
          a.state_id = 1
        end
      end

      def awards
        award_ids.map do |i|
          Award.new.tap do |a|
            a.id = i
            a.title = "Test Award #{i}"
            a.actor_id = id
          end
        end
      end

      def award_ids
        [id * 9, id * 9 + 1]
      end

      def url
        "http://movies.com/actors/#{id}"
      end
    end

    class AdvertisingCampaign
      attr_accessor :id, :name, :movie_id
    end

    class Agency
      attr_accessor :id, :name, :state_id

      def state
        State.new.tap do |s|
          s.id = state_id
          s.name = "Test State #{state_id}"
          s.agency_ids = [id]
        end
      end
    end

    class Award
      attr_accessor :id, :title, :actor_id
    end

    class State
      attr_accessor :id, :name, :agency_ids
    end

    class MovieType
      attr_accessor :id, :name, :movie_ids

      def movies
        movie_ids.map.with_index do |id, i|
          m = Movie.new
          m.id = 232
          m.name = "test movie"
          m.actor_ids = [1, 2, 3]
          m.owner_id = 3
          m.movie_type_id = 1
          m
        end
      end
    end

    class Agency
      attr_accessor :id, :name, :actor_ids
    end

    class Agency
      attr_accessor :id, :name, :actor_ids
    end

    class Supplier
      attr_accessor :id, :account_id

      def account
        if account_id
          a = Account.new
          a.id = account_id
          a
        end
      end
    end

    class Account
      attr_accessor :id
    end

    class Owner
      attr_accessor :id
    end

    class OwnerResource < JSONAPI::Resource
    end

    # serializers
    class MovieResource < JSONAPI::Resource
      # director attr is not mentioned intentionally
      attributes :name, :release_year
      has_many :actors
      has_one :owner
      has_one :movie_type
      has_one :advertising_campaign
    end

    class ActorResource < JSONAPI::Resource
      attributes :name, :email
      has_one :agency
      has_many :awards
    end

    class AgencyResource < JSONAPI::Resource
      attributes :name
      has_one :state
      has_many :actors
    end

    class AwardResource < JSONAPI::Resource
      attributes :title
      has_one :actor
    end

    class StateResource < JSONAPI::Resource
      attributes :name
      has_one :agency
    end

    class AdvertisingCampaignResource < JSONAPI::Resource
      attributes :name
      has_one :movie
    end

    class MovieTypeResource < JSONAPI::Resource
      attributes :name
      has_many :movies
    end

    class SupplierResource < JSONAPI::Resource
      has_one :account
    end

    class AccountResource < JSONAPI::Resource
      has_one :supplier
    end

    class MovieOptionalRecordDataResource < JSONAPI::Resource
      attributes :name
      attribute :release_year, if: Proc.new { |record| record.release_year >= 2000 }
    end

    class MovieOptionalParamsDataResource < JSONAPI::Resource
      attributes :name
      attribute :director, if: Proc.new { |record, params| params && params[:admin] == true }
    end

    # class MovieOptionalRelationshipResource < JSONAPI::Resource
    #   attributes :name
    #   has_many :actors, if: Proc.new { |record| record.actors.any? }
    # end

    # class MovieOptionalRelationshipWithParamsResource < JSONAPI::Resource
    #   attributes :name
    #   has_one :owner, record_type: :user, if: Proc.new { |record, params| params && params[:admin] == true }
    # end
  end


  # Namespaced MovieResource
  before(:context) do
    # namespaced model stub
    module AppName
      module V1
        class MovieResource < JSONAPI::Resource
          # to test if compute_serializer_name works
        end
      end
    end
  end

  # Movie and Actor struct
  before(:context) do
    MovieStruct = Struct.new(
      :id,
      :name,
      :release_year,
      :actor_ids,
      :actors,
      :owner_id,
      :owner,
      :movie_type_id,
      :advertising_campaign_id
    )

    ActorStruct = Struct.new(:id, :name, :email, :agency_id, :award_ids)
    MovieWithoutIdStruct = Struct.new(:name, :release_year)
    AgencyStruct = Struct.new(:id, :name, :actor_ids)
  end

  after(:context) do
    classes_to_remove = %i[
      Movie
      MovieResource
      Actor
      ActorResource
      MovieType
      MovieTypeResource
      AppName::V1::MovieResource
      MovieStruct
      ActorStruct
      MovieWithoutIdStruct
      HyphenMovieResource
      MovieWithoutIdStructResource
      Agency
      AgencyStruct
      AgencyResource
      AdvertisingCampaign
      AdvertisingCampaignResource
    ]
    classes_to_remove.each do |klass_name|
      Object.send(:remove_const, klass_name) if Object.constants.include?(klass_name)
    end
  end

  let(:movie_struct) do

    agency = AgencyStruct

    actors = []

    3.times.each do |id|
      actors << ActorStruct.new(id, id.to_s, id.to_s, id, [id])
    end

    m = MovieStruct.new
    m[:id] = 23
    m[:name] = "struct movie"
    m[:release_year] = 1987
    m[:actor_ids] = [1, 2, 3]
    m[:owner_id] = 3
    m[:movie_type_id] = 2
    m[:actors] = actors
    m
  end

  let(:movie_struct_without_id) do
    MovieWithoutIdStruct.new("struct without id", 2018)
  end

  let(:movie) do
    m = Movie.new
    m.id = 232
    m.name = "test movie"
    m.actor_ids = [1, 2, 3]
    m.owner_id = 3
    m.movie_type_id = 1
    m
  end

  let(:actor) do
    Actor.new.tap do |a|
      a.id = 234
      a.name = "test actor"
      a.email = "test@test.com"
      a.agency_id = 432
    end
  end

  let(:movie_type) do
    movie

    mt = MovieType.new
    mt.id = movie.movie_type_id
    mt.name = "Foreign Thriller"
    mt.movie_ids = [movie.id]
    mt
  end

  let(:supplier) do
    s = Supplier.new
    s.id = 1
    s.account_id = 1
    s
  end

  def build_movies(count)
    count.times.map do |i|
      m = Movie.new
      m.id = i + 1
      m.name = "test movie"
      m.actor_ids = [1, 2, 3]
      m.owner_id = 3
      m.movie_type_id = 1
      m
    end
  end
end

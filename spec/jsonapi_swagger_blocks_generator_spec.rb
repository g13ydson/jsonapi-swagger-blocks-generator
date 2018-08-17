# frozen_string_literal: true

require_relative "./support/movie_context.rb"

RSpec.describe Jsonapi::Swagger::Blocks::Generator do
  include_context "movie class"

  context "when testing model template" do
    it "return correct hash when seriazable is called" do

      serializable_hash = JSONAPI::ResourceSerializer.new(MovieResource, include: ["actors"]).serialize_to_hash(MovieResource.new(movie, nil))
      expect(serializable_hash[:data].length).to eq 5
      expect(serializable_hash[:data]["relationships"].length).to eq 4
      expect(serializable_hash[:data]["attributes"].length).to eq 2
      expect(serializable_hash[:data]["links"]).to be_instance_of(Hash)

      expect(serializable_hash[:included]).to be_instance_of(Array)
      expect(serializable_hash[:included][0]).to be_instance_of(Hash)
      expect(serializable_hash[:included].length).to eq 3

      serializable_hash = JSONAPI::ResourceSerializer.new(MovieResource).serialize_to_hash(MovieResource.new(movie, nil))

      expect(serializable_hash[:data]).to be_instance_of(Hash)
      expect(serializable_hash[:included]).to be nil
    end
  end

  it "returns correct nested includes when serializable_hash is called" do
    # 3 actors, 3 agencies
    include_object_total = 6

    serializable_hash = JSONAPI::ResourceSerializer.new(MovieResource, include: ["actors", "actors.agency"]).serialize_to_hash(MovieResource.new(movie, nil))

    expect(serializable_hash[:included]).to be_instance_of(Array)
    expect(serializable_hash[:included].length).to eq include_object_total
    (0..include_object_total - 1).each do |include|
      expect(serializable_hash[:included][include]).to be_instance_of(Hash)
    end

    serializable_hash = JSONAPI::ResourceSerializer.new(MovieResource, include: ["actors.agency"]).serialize_to_hash(MovieResource.new(movie, nil))

    expect(serializable_hash[:included]).to be_instance_of(Array)
    expect(serializable_hash[:included].length).to eq include_object_total
    (0..include_object_total - 1).each do |include|
      expect(serializable_hash[:included][include]).to be_instance_of(Hash)
    end
  end
end

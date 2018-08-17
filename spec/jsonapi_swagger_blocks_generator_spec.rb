# frozen_string_literal: true

require_relative "./support/movie_context.rb"
require "rails/generators/testing/behaviour"
require "generators/jsonapi/swagger_blocks_generator"


RSpec.describe Jsonapi::Swagger::Blocks::Generator do
  include_context "movie class"
  include FileUtils

  let(:generator) { Jsonapi::Generators::SwaggerBlocksGenerator}

  before do
    generator.start(["Movie"])
  end

  # after do
  #   rm_rf File.join("app")
  # end

  context "when testing movie resource" do
    it "return correct model test file" do

    end

    it "return correct controller test file" do

    end
  end
end

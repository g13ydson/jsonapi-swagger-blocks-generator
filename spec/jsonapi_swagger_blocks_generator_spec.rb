# frozen_string_literal: true

require_relative "./support/movie_context.rb"
require "rails/generators/testing/behaviour"
require "generators/jsonapi/swagger_blocks_generator"

RSpec.describe Jsonapi::Swagger::Blocks::Generator do
  include_context "movie class"
  include FileUtils

  let(:generator) { Jsonapi::Generators::SwaggerBlocksGenerator }
  let(:app_root) { File.expand_path("../app", __dir__) }
  let(:docs_dir) { File.join(app_root, "docs") }

  before do
    generator.start(["Movie"])
  end

  after do
    rm_rf File.join("app")
  end

  context "when testing movie resource" do
    it "has movie.rb" do
      expect("#{docs_dir}/movie.rb").to be_an_existing_file
    end

    it "has movies_controller.rb" do
      expect("#{docs_dir}/movies_controller.rb").to be_an_existing_file
    end

    it "return correct model test file" do
    end

    it "return correct controller test file" do
    end
  end
end

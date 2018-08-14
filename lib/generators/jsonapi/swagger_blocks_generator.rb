# frozen_string_literal: true

module Jsonapi
  module Generators
    class SwaggerBlocksGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)
      argument :model, type: :string

      def generate_documentation
        begin
          Object.const_get("#{model.camelcase}Resource").is_a?(Class)
          puts "########"
          puts "#{model.camelcase}Resource".constantize._relationships
          puts "#{model.camelcase}Resource".constantize._attributes
          generate_model_template
          generate_controller_template
        rescue Exception => e
          p e.message
          exit!
        end
      end

      private
        def generate_model_template
          template "model_template.template", "app/controllers/docs/#{model.underscore}.rb"
        end

        def generate_controller_template
          template "controller_template.template", "app/controllers/docs/#{model.underscore.pluralize}_controller.rb"
        end
    end
  end
end

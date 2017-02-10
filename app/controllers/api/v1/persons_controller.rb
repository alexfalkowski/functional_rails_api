module Api
  module V1
    class PersonsController < ApplicationController
      include RFunk::Match

      def create
        match(RFunk.either(-> { Person.create!(person_attributes) })) do |p|
          p.with :success, ->(v) { render json: { message: v }, status: :created }
          p.with :failure, ->(v) { render json: { error: v }, status: :unprocessable_entity }
        end
      end

      private

      def person_attributes
        params.require(:person).permit(:name)
      end
    end
  end
end

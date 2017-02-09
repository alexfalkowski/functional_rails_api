module Api
  module V1
    class PersonsController < ApplicationController
      def create
        either = RFunk.either(-> { Person.create!(person_attributes) })
        case either
          when RFunk::Success
            render json: { message: either.result }, status: :created
          when RFunk::Failure
            render json: { error: either.result }, status: :unprocessable_entity
        end
      end

      private

      def person_attributes
        params.require(:person).permit(:name)
      end
    end
  end
end

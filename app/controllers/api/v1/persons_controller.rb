module Api
  module V1
    class PersonsController < ApplicationController
      def create
        either = Either(-> { Person.create!(person_attributes) })
        case either
          when Success
            render json: { message: either.result }, status: :created
          when Failure
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

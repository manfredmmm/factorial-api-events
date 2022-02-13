module Api
  module V1
    class EventsController < ApplicationController
      def index
        @events = Event.all
        render template: 'events/index', formats: [:json]
      end

      def create
        event = Event.new(build_params)
        if event.save
          render json: event, status: :created
        else
          render json: event.errors, status: :unprocessable_entity
        end
      end

      def show
        @event = Event.find(params[:id])
        render template: 'events/show', formats: [:json]
      end

      def update
        event = Event.find(params[:id])
        if event.update(build_params)
          render json: event, status: :ok
        else
          render json: event.errors, status: :unprocessable_entity
        end
      end

      def destroy
        Event.find(params[:id]).destroy!
        head :no_content
      end

      private

      def build_params
        {
          title: params[:title],
          description: params[:description],
          start_date: parse_date(params[:start_date]),
          end_date: parse_date(params[:end_date])
        }
      end

      def parse_date(date)
        return nil unless date.present?
        Time.at(date.to_i)
      end
    end
  end
end
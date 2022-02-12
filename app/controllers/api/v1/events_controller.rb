module Api
  module V1
    class EventsController < ApplicationController
      def index
        @events = Event.all
        render template: 'events/index', formats: [:json]
      end

      def create
        event = Event.new(event_params)
        if params[:start_date]
          event.start_date = Time.at(params[:start_date].to_i)
        end
        if params[:end_date]
          event.end_date = Time.at(params[:end_date].to_i)
        end
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
        #if params[:start_date]
        #  params[:start_date] = Time.at(params[:start_date].to_i)
        #end
        #if params[:end_date]
        #  params[:end_date] = Time.at(params[:end_date].to_i)
        #end
        update_params = event_params
        if update_params[:start_date]
          update_params[:start_date] = Time.at(update_params[:start_date].to_i)
        end
        if update_params[:end_date]
          update_params[:end_date] = Time.at(update_params[:end_date].to_i)
        end
        if event.update(update_params)
          render json: event
        else
          render json: event.errors, status: :unprocessable_entity
        end
      end

      def destroy
        Event.find(params[:id]).destroy!
        head :no_content
      end

      private

      def event_params
        params.require(:event).permit(:title, :description, :start_date, :end_date)
      end
    end
  end
end

# Validar peticio JWT
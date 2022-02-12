class EventsRepresenter
  def initialize(events)
    @events = events
  end

  def as_json_array
    events.map do |event|
      parsed_event(event)
    end
  end

  def as_json_object
    event = events
    parsed_event(event)
  end

  private

  def parsed_event(event)
    {
      id: event.id,
      title: event.title,
      description: event.description,
      start_ts: event.start_date.to_i,
      end_ts: event.end_date.to_i
    }
  end

  attr_reader :events
end
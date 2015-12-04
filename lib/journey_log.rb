
class Journey_log

  attr_reader :journey_klass, :journey

def initialize(journey_klass)
  @journey_klass = journey_klass
  @journey = nil
  @history = []
end

  def start_journey(station)
    if journey == nil
      @journey = journey_klass.new
      journey.start(station)
    else
      journey.finish("INCOMPLETE")
      record_journey
      @journey = journey_klass.new
      journey.start(station)
    end
  end

  def exit_journey(station)
    if journey == nil
      @journey = journey_klass.new
      journey.start("Did not touch in!")
      journey.finish(station)
      record_journey
      @journey = nil
    else
      journey.finish(station)
      record_journey
      @journey = nil
    end
  end

  def show_history
    history
  end

  private

  attr_reader :history

  def current_journey
    if journey == nil
      journey_klass.new
    else
      return journey
    end
  end

    def record_journey
     history << journey
    end

end

class Journey
  attr_reader :log
  attr_accessor :current_journey

  PENALTY_FINE = 20

  def initialize
    @log = {}
    @current_journey = []
  end

  def start(station)
    current_journey << station
  end

  def finish(station)
    current_journey << station
  end


def in_journey?
  !@current_journey.empty?
end


  def save_trip
    @log[@log.length + 1] = @current_journey
  end

  def reset_trip
    @current_journey = []
  end

  def penalize_on_touch_in?
    @current_journey.length > 0 ? PENALTY_FINE : 0
  end

  def penalize_on_touch_out?
    @current_journey.empty? ? PENALTY_FINE : 0
  end

end

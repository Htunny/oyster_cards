require_relative 'journey'

class Oystercard
  MAX_LIMIT = 90
  FARE = 1


  attr_reader :balance, :journey

  def initialize
    @balance = 0
    @journey = Journey.new
  end

  def top_up(amount)
    raise "Sorry mate- Limit is #{MAX_LIMIT}" if maxed_out(amount)
    @balance += amount
  end

  def touch_in(entry_station)
    raise "Sorry mate- you need a top up!" if out_of_cash?
    @balance -= @journey.penalize_on_touch_in?
    @journey.start(entry_station)
  end

  def touch_out(exit_station)
    @balance -= @journey.penalize_on_touch_out?
    @journey.finish(exit_station)
    @journey.save_trip
    @journey.reset_trip
    charge_card
  end

  private



  def charge_card
    @balance -= FARE
  end

  def maxed_out(amount)
    @balance + amount > MAX_LIMIT
  end


  def out_of_cash?
    FARE > @balance
  end

end

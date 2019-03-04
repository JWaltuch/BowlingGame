Class Game
  def roll(pins_knocked_down)
    pins_remaining = 10 - pins_knocked_down
    pins_knocked_down = rand(1..pins_remaining)
  end

  def score
    10
  end
end

Class Frame
  def score(first_pins, second_pins, strike, spare)
    score += score + first_pins + second_pins
    if strike
      score += first_pins + second_pins
    end
    if spare
      score += first_pins
    end
  end

  def is_strike(first_pins, second_pins)
    strike = first_pins || second_pins == 10
  end

  def is_spare(first_pins, second_pins)
    spare = first_pins + second_pins == 10
  end
end

# Class Roll
#   def roll
#     pins_knocked_down = rand(1..10)
#   end
# end

Class TenthFrame
  def score(first_pins, second_pins, third_pins)
    score += score + first_pins + second_pins + third_pins
  end
end


def main
  game_start = Game.new
  greet_player
  i = 0
  while i <= 10
    pins_knocked_down = 0
    pins_knocked_down = Game.roll(pins_knocked_down)
    add_to_frame_score(pins_knocked_down)
    pins_knocked_down = Game.roll(pins_knocked_down)
    add_to_frame_score(pins_knocked_down)
    display_frame_score
    i += 1
  end


end

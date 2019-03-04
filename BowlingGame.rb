class Game
  def roll(pins_knocked_down)
    pins_remaining = 10 - pins_knocked_down
    pins_knocked_down = rand(1..pins_remaining)
  end

  def score
    10
  end
end

  def add_to_frame_score(pins_knocked_down, strike, spare, frame_score)
    frame_score += pins_knocked_down
    if strike
      frame_score += pins_knocked_down
    end
    if spare
      frame_score += pins_knocked_down
      spare = false
    end
  end

  # def check_if_is_strike(frame_score)
  #   strike = frame_score == 10
  # end

  def check_if_is_spare(frame_score)
    spare = frame_score == 10
  end

# Class Roll
#   def roll
#     pins_knocked_down = rand(1..10)
#   end
# end

class TenthFrame
  def score(first_pins, second_pins, third_pins)
    score += score + first_pins + second_pins + third_pins
  end
end


def main
  game_start = Game.new
  greet_player
  i = 0
  spare = false
  strike = false
  total_score = 0
  while i <= 10
    frame_score = 0
    ask_player_to_roll
    pins_knocked_down = 0
    pins_knocked_down = Game.roll(pins_knocked_down)
    puts("You knocked down " + pins_knocked_down + " pins!")
    frame_score = add_to_frame_score(pins_knocked_down, spare, strike, frame_score)
    if pins_knocked_down < 10
      ask_player_to_roll
      pins_knocked_down = Game.roll(pins_knocked_down)
      puts("You knocked down " + pins_knocked_down + " pins!")
      frame_score = add_to_frame_score(pins_knocked_down, spare, strike, frame_score)
      spare = check_if_is_spare(frame_score)
    else
      puts("You've knocked down all the pins! Congrats on your strike!")
      strike = true
    end
    display_frame_score(frame_score)
    total_score += frame_score
    i += 1
  end
end

def greet_player
  puts("Welcome, player. Let's bowl!")
end

def ask_player_to_roll
  puts("Type 'Roll' to roll the ball. Type 'Quit' to quit.")
  roll = gets.chomp.to_s
  if roll == "Quit"
    puts("How can I let the player quit?")
end

def display_frame_score(frame_score)
  puts("Your score for this frame is: " + frame_score)
end

main

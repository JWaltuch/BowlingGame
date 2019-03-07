class Game
  def roll(pins_knocked_down)
    pins_remaining = 10 - pins_knocked_down
    pins_knocked_down = rand(0..pins_remaining)
  end
end

def add_to_frame_score(pins_knocked_down, spare, frame_score, i)
  frame_score[i-1] += pins_knocked_down
  if (spare)
    frame_score[i-1] += pins_knocked_down
  end
  frame_score
end

  # def check_if_is_strike(frame_score)
  #   strike = frame_score == 10
  # end

def check_if_is_spare(pins_knocked_down, spare_pins)
  spare = ((pins_knocked_down + spare_pins) == 10)
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
  i = 1
  spare = false
  strike_bonuses_in_frame = Array.new(9)
  strike_bonus_values = Array.new(9)
  frame_score = Array.new(9)
  frame_score.fill(0)
  game_score = 0

  while i <= 10
    ask_player_to_roll
    pins_knocked_down = 0
    pins_knocked_down = game_start.roll(pins_knocked_down)
    puts("You knocked down #{pins_knocked_down} pin(s)!")
    frame_score[i-1] = add_to_frame_score(pins_knocked_down, spare, frame_score, i)
    strike_bonuses_in_frame.each_with_index do |item, i|
      if item == (1 || 2)
        strike_bonus_values[i] += pins_knocked_down
        item -= 1
      end
    end
    spare = false
    if pins_knocked_down < 10
      ask_player_to_roll
      spare_pins = pins_knocked_down
      pins_knocked_down = game_start.roll(pins_knocked_down)
      puts("You knocked down #{pins_knocked_down} pin(s)!")
      frame_score[i-1] = add_to_frame_score(pins_knocked_down, spare, frame_score, i)
      strike_bonuses_in_frame.each_with_index do |item, i|
        if item == (1 || 2)
          strike_bonus_values[i] += pins_knocked_down
          item -= 1
        end
      end
      spare = check_if_is_spare(pins_knocked_down, spare_pins)
      strike_bonuses_in_frame[i-1] = 0
    else
      puts("You've knocked down all the pins! Congrats on your strike!")
      strike_bonuses_in_frame[i-1] = 2
    end

    if i == 10 && spare
      puts("This is the final frame. Your spare earned you a bonus role.")
      pins_knocked_down = 0
      ask_player_to_roll
      pins_knocked_down = game_start.roll(pins_knocked_down)
      puts("You knocked down #{pins_knocked_down} pin(s)!")
      frame_score[i-1] = add_to_frame_score(pins_knocked_down, spare, frame_score, i)
    end

    if i == 10 && pins_knocked_down == 10
      puts("This is the final frame. Your strike earns you two bonus rolls.")
      pins_knocked_down = 0
      ask_player_to_roll
      pins_knocked_down = game_start.roll(pins_knocked_down)
      puts("You knocked down #{pins_knocked_down} pin(s)!")
      frame_score[i-1] = add_to_frame_score(pins_knocked_down, spare, frame_score, i)
      strike_bonuses_in_frame.each_with_index do |item, i|
        if item == (1 || 2)
          strike_bonus_values[i] += pins_knocked_down
          item -= 1
        end
      end
      if pins_knocked_down == 10
        pins_knocked_down = 0
      end
      ask_player_to_roll
      pins_knocked_down = game_start.roll(pins_knocked_down)
      puts("You knocked down #{pins_knocked_down} pin(s)!")
      frame_score[i-1] = add_to_frame_score(pins_knocked_down, spare, frame_score, i)
    end

    if i >= 3
      add_strike_bonuses(strike_bonus_values, strike_bonuses_in_frame, frame_score)
    end

    display_frame_score(frame_score)
    puts(frame_score[i-1])

    i += 1
  end

  frame_score.each do |item|
    game_score += item
  end

  puts("Game over. Your final score is: #{game_score}")
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
end

def display_frame_score(frame_score)
  puts("Frame Scores:\n#{frame_score[0]}|#{frame_score[1]}|#{frame_score[2]}|" +
    "|#{frame_score[3]}|#{frame_score[4]}|#{frame_score[5]}|" +
    "#{frame_score[6]}|#{frame_score[7]}|#{frame_score[8]}|#{frame_score[9]}")
end

def add_strike_bonuses(strike_bonus_values, strike_bonuses_in_frame, frame_score)
  strike_bonus_values.each_with_index do |item, i|
    if strike_bonuses_in_frame[i] == 0 and strike_bonus_values > 0
      frame_score[i] += strike_bonus_values[i]
      strike_bonus_values[i] = 0
    end
  end
end

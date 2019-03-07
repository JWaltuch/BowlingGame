require "test/unit"
require_relative "BowlingGame.rb"

class TestGame < Test::Unit::TestCase

#Score with no strikes or spares just adds all frames with no bonuses
  def test_score_with_no_strikes_or_spares
    test_game = Game.new
    i = 1
    frame_score = 0
    while i <= 10
      frame_score = add_to_frame_score(1, false, frame_score, i)
      frame_score = add_to_frame_score(1, false, frame_score, i)
      i+=1
    end
    assert_equal 20, frame_score
  end

#Score for all strikes
def test_score_for_all_strikes
  i = 1
  spare = false
  strike_bonuses_in_frame = Array.new(9)
  strike_bonus_values = Array.new(9)
  frame_score = Array.new(9)
  game_score = 0

  while i <= 10
    pins_knocked_down = 10
    frame_score[i-1] = add_to_frame_score(pins_knocked_down, spare, frame_score, i)
    strike_bonuses_in_frame.each_with_index do |item, i|
      if item == (1 || 2)
        strike_bonus_values[i] += pins_knocked_down
        item -= 1
      end
    end
    if pins_knocked_down < 10
      strike_bonuses_in_frame[i-1] = 0
    else
      strike_bonuses_in_frame[i-1] = 2
    end

    if i == 10 && pins_knocked_down == 10
      pins_knocked_down = 10
      frame_score[i-1] = add_to_frame_score(pins_knocked_down, spare, frame_score, i)
      strike_bonuses_in_frame.each_with_index do |item, i|
        if item == (1 || 2)
          strike_bonus_values[i] += pins_knocked_down
          item -= 1
        end
      end
      pins_knocked_down = 10
      frame_score[i-1] = add_to_frame_score(pins_knocked_down, spare, frame_score, i)
    end

    if i >= 3
      add_strike_bonuses(strike_bonus_values, strike_bonuses_in_frame, frame_score)
    end

    game_score += frame_score[i-1]
    i += 1
  end
  assert_equal game_score, 300
end

#Score for all spares of 3 and 7

#Rolling a strike in 10th frame gets two extra rolls


#Rolling a spare in 10th frame gets one extra roll
# def test_spare_in_10th_frame_gets_one_extra_roll
# end

#knocked down 3 pins after strike.

#strike after strike

end

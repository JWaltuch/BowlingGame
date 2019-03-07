require "test/unit"
require_relative "BowlingGame.rb"

class TestGame < Test::Unit::TestCase

#Score with no strikes or spares just adds all frames with no bonuses
  def test_score_with_no_strikes_or_spares
    test_game = Game.new
    i = 1
    frame_score = 0
    while i <= 10
      frame_score = add_to_frame_score(1, false, false, frame_score)
      frame_score = add_to_frame_score(1, false, false, frame_score)
      i+=1
    end
    assert_equal 20, frame_score
  end

#Score for all strikes
def test_score_for_all_strikes
  test_game = Game.new
  i = 1
  spare = false
  strike = false
  game_score = 0

  while i <= 10
    frame_score = 0
    pins_knocked_down = 10
    frame_score = add_to_frame_score(pins_knocked_down, spare, strike, frame_score)
    if pins_knocked_down < 10
      strike = false
    else
      strike = true
    end
    if i == 10 && strike
      pins_knocked_down = 10
      frame_score = add_to_frame_score(pins_knocked_down, spare, strike, frame_score)
      pins_knocked_down = 10
      frame_score = add_to_frame_score(pins_knocked_down, spare, strike, frame_score)
    end
    game_score += frame_score
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

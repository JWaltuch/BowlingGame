require "test/unit"
require_relative "BowlingGame.rb"

class TestGame < Test::Unit::TestCase

#Score with no strikes or spares just adds all frame with no bonuses
def test_score_with_no_strikes_or_spares
  test_game = Game.new
  i = 0
  frame_score = 0
  while i <= 10
    frame_score = add_to_frame_score(1, false, false, frame_score)
  end
  assert_equal frame_score, 20
end

#Score for all strikes

#Score for all spares of 3 and 7

#Rolling a strike in 10th frame gets two extra rolls


#Rolling a spare in 10th frame gets one extra roll
def test_spare_in_10th_frame_gets_one_extra_roll
end

end


#knocked down 3 pins after strike.

#strike after strike



test_score_with_no_strikes_or_spares

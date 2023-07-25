$LOAD_PATH.unshift("./11plurality")

require_relative "../lib/io_test_helpers"
require "minitest/autorun"

class PluralityTest < Minitest::Test
  include IoTestHelpers

  # get_list method
  def test_get_list_with_valid_input
    skip
    _output, _error = capture_io do
      fake_names = "Diego Wences Deyvi"
      fake_voters = "5"
      fake_votes = ["Diego", "Wences", "Deyvi", "Diego", "Diego"]

      simulate_stdin(fake_names, fake_voters, *fake_votes) do
        load "plurality.rb"
        prompt = "Candidates names: "
        input = "Diego Wences Deyvi"
        simulate_stdin(*input) do
          assert_equal ["Diego", "Wences", "Deyvi"], get_list(prompt, 1, 9), "When user input is: #{input}"
        end
      end
    end
  end

  def test_get_list_show_prompt_correctly
    skip
    output, _error = capture_io do
      fake_names = "Diego Wences Deyvi"
      fake_voters = "5"
      fake_votes = ["Diego", "Wences", "Deyvi", "Diego", "Diego"]

      simulate_stdin(fake_names, fake_voters, *fake_votes) do
        load "plurality.rb"
        prompt = "Candidates names: "
        input = "Diego Wences Deyvi"
        simulate_stdin(*input) do
          get_list(prompt, 1, 9)
        end
      end
    end
    prompt = "Candidates names: "
    assert_match prompt, output, "When prompt is: #{prompt}"
  end

  def test_get_list_show_error_when_out_of_range_input
    skip
    output, _error = capture_io do
      fake_names = "Diego Wences Deyvi"
      fake_voters = "5"
      fake_votes = ["Diego", "Wences", "Deyvi", "Diego", "Diego"]

      simulate_stdin(fake_names, fake_voters, *fake_votes) do
        load "plurality.rb"
        prompt = "Candidates names: "
        input = ["Diego Wences Deyvi", "Diego Wences"]
        simulate_stdin(*input) do
          assert_equal ["Diego", "Wences"], get_list(prompt, 1, 2), "When user input is: #{input}"
        end
      end
    end
    input = ["Diego Wences Deyvi", "Diego Wences"]
    error = "The list should have between 1 and 2 elements"
    assert_match error, output, "When prompt is: #{input} and min=1 max=2"
  end

  # get_positive method
  def test_get_possitive_method_show_correct_prompt
    skip
    output, _error = capture_io do
      fake_names = "Diego Wences Deyvi"
      fake_voters = "5"
      fake_votes = ["Diego", "Wences", "Deyvi", "Diego", "Diego"]

      simulate_stdin(fake_names, fake_voters, *fake_votes) do
        load "plurality.rb"
        input = "5"
        simulate_stdin(*input) do
          prompt = "Number of voters: "
          get_positive(prompt)
        end
      end
    end
    prompt = "Number of voters: "
    assert_equal prompt, output[-18..-1], "When prompt is: #{prompt}"
  end

  def test_get_possitive_method_show_error_message_when_input_not_positive
    skip
    output, _error = capture_io do
      fake_names = "Diego Wences Deyvi"
      fake_voters = "5"
      fake_votes = ["Diego", "Wences", "Deyvi", "Diego", "Diego"]

      simulate_stdin(fake_names, fake_voters, *fake_votes) do
        load "plurality.rb"
        input = ["any", "5"]
        simulate_stdin(*input) do
          prompt = "Number of voters: "
          get_positive(prompt)
        end
      end
    end
    input = ["any", "5"]
    error = "Number should be positive"
    assert_match error, output, "When input is: #{input}"
  end

  def test_get_possitive_method_return_only_positive_value
    skip
    _output, _error = capture_io do
      fake_names = "Diego Wences Deyvi"
      fake_voters = "5"
      fake_votes = ["Diego", "Wences", "Deyvi", "Diego", "Diego"]

      simulate_stdin(fake_names, fake_voters, *fake_votes) do
        load "plurality.rb"
        prompt = "Prompt for positive number"
        input = ["0", "letters", "-10", "", "5"]
        simulate_stdin(*input) do
          assert_equal 5, get_positive(prompt), "When user input is: #{input}"
        end
      end
    end
  end

  # valid_vote? method
  def test_valid_vote_return_true_when_name_is_valid
    skip
    _output, _error = capture_io do
      fake_names = "Diego Wences Deyvi"
      fake_voters = "5"
      fake_votes = ["Diego", "Wences", "Deyvi", "Diego", "Diego"]

      simulate_stdin(fake_names, fake_voters, *fake_votes) do
        load "plurality.rb"
        $candidates = [{ "name" => "Diego", "votes" => 0 }, { "name" => "Wences", "votes" => 0 }]
        assert_equal true, valid_vote?("Diego"), "When candidates is: #{$candidates} and valid_vote?('Diego') is called"
      end
    end
  end

  def test_valid_vote_return_false_when_name_is_invalid
    skip
    _output, _error = capture_io do
      fake_names = "Diego Wences Deyvi"
      fake_voters = "5"
      fake_votes = ["Diego", "Wences", "Deyvi", "Diego", "Diego"]

      simulate_stdin(fake_names, fake_voters, *fake_votes) do
        load "plurality.rb"
        $candidates = [{ "name" => "Diego", "votes" => 0 }, { "name" => "Wences", "votes" => 0 }]
        assert_equal false, valid_vote?("Deyvi"), "When candidates is: #{$candidates} and valid_vote?('Deyvi') is called"
      end
    end
  end

  def test_valid_vote_add_1_to_candidate_votes_when_valid
    skip
    _output, _error = capture_io do
      fake_names = "Diego Wences Deyvi"
      fake_voters = "5"
      fake_votes = ["Diego", "Wences", "Deyvi", "Diego", "Diego"]

      simulate_stdin(fake_names, fake_voters, *fake_votes) do
        load "plurality.rb"
        $candidates = [{ "name" => "Diego", "votes" => 0 }, { "name" => "Wences", "votes" => 0 }]
        valid_vote?("Diego")
        assert_equal ({ "name" => "Diego", "votes" => 1 }), $candidates.first, "When candidates is: #{$candidates} and valid_vote?('Diego') is called"
      end
    end
  end

  def test_valid_vote_do_nothing_when_invalid
    skip
    _output, _error = capture_io do
      fake_names = "Diego Wences Deyvi"
      fake_voters = "5"
      fake_votes = ["Diego", "Wences", "Deyvi", "Diego", "Diego"]

      simulate_stdin(fake_names, fake_voters, *fake_votes) do
        load "plurality.rb"
        $candidates = [{ "name" => "Diego", "votes" => 0 }, { "name" => "Wences", "votes" => 0 }]
        valid_vote?("Deyvi")
        assert_equal [{ "name" => "Diego", "votes" => 0 }, { "name" => "Wences", "votes" => 0 }], $candidates, "When candidates is: #{$candidates} and valid_vote?('Deyvi') is called"
      end
    end
  end

  # print_winner method
  def test_print_winner_when_only_one_winner
    skip
    output, _error = capture_io do
      fake_names = "Diego Wences Deyvi"
      fake_voters = "5"
      fake_votes = ["Diego", "Wences", "Deyvi", "Diego", "Diego"]

      simulate_stdin(fake_names, fake_voters, *fake_votes) do
        load "plurality.rb"
        $candidates = [
          { "name" => "Diego", "votes" => 3 },
          { "name" => "Wences", "votes" => 1 },
          { "name" => "Deyvi", "votes" => 1 }
        ]
        print_winner
      end
    end
    assert_equal "Winners: Diego", output.lines.last.chomp, "When candidates is: #{$candidates}"
  end

  def test_print_winners_when_is_a_tie
    skip
    output, _error = capture_io do
      fake_names = "Diego Wences Deyvi"
      fake_voters = "5"
      fake_votes = ["Diego", "Wences", "Deyvi", "Diego", "Diego"]

      simulate_stdin(fake_names, fake_voters, *fake_votes) do
        load "plurality.rb"
        $candidates = [
          { "name" => "Diego", "votes" => 2 },
          { "name" => "Wences", "votes" => 2 },
          { "name" => "Deyvi", "votes" => 1 }
        ]
        print_winner
      end
    end
    assert_equal "Winners: Diego, Wences", output.lines.last.chomp, "When candidates is: #{$candidates}"
  end

  # Test the program as a whole
  def test_display_the_correct_winner
    skip
    output, _error = capture_io do
      fake_names = "Diego Wences Deyvi"
      fake_voters = "5"
      fake_votes = ["Diego", "Wences", "Deyvi", "Diego", "Diego"]

      simulate_stdin(fake_names, fake_voters, *fake_votes) do
        load "plurality.rb"
      end
    end
    assert_equal "Winners: Diego", output.lines.last.chomp
  end
end

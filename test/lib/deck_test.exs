defmodule CardGame.DeckTest do
  alias CardGame.Card
  alias CardGame.Deck
  use ExUnit.Case, async: true

  @book [
    Card.new(1, :hearts),
    Card.new(1, :clubs),
    Card.new(1, :spades)
  ]

  @basic_run [
    Card.new(1, :hearts),
    Card.new(2, :hearts),
    Card.new(3, :hearts)
  ]

  @invalid_run [
    Card.new(1, :hearts),
    Card.new(2, :hearts),
    Card.new(3, :hearts),
    Card.new(4, :clubs)
  ]

  @pair10 [
    Card.new(2, :hearts),
    Card.new(9, :hearts)
  ]

  @pair15 [
    Card.new(2, :hearts),
    Card.new(10, :hearts)
  ]

  @ace_high_run [
    Card.new(1, :hearts),
    Card.new(12, :hearts),
    Card.new(13, :hearts)
  ]

  #
  # Given and Ace of hearts, Ace of Clubs and Ace of Spades
  #
  test "@book is a book" do
      assert(Deck.book?(@book))
  end

  test "@book is not a run" do
    refute(Deck.run?(@book))
  end

  test "@book is worth 45 points" do
    assert(Deck.points(@book) == 45)
  end

  #
  # Given and Ace of Heats, 2 of Hearts and 3 of Hearts
  #
  test "@basic_run is a run" do
    assert(Deck.run?(@basic_run))
  end

  test "@basic_run is not a book" do
    refute(Deck.book?(@basic_run))
  end

  test "@basic_run is worth 25 points" do
    assert(Deck.points(@basic_run) == 25)
  end

  #
  # Given a 2 of Hearts and 9 of Hearts
  #
  test "@pair10 is worth 10 points" do
    assert(Deck.points(@pair10) == 10)
  end

  test "@pair10 is not a book" do
    refute(Deck.book?(@pair10))
  end

  test "@pair10 is not a run" do
    refute(Deck.run?(@pair10))
  end

  #
  # Given a 2 of Hearts and 10 of Hearts
  #
  test "@pair15 is worth 10 points" do
    assert(Deck.points(@pair15) == 15)
  end

  test "@pair15 is not a book" do
    refute(Deck.book?(@pair15))
  end

  test "@pair15 is not a run" do
    refute(Deck.run?(@pair15))
  end

  #
  # Given and Ace of hearts, 2 of Hearts, 3 of Hearts and 4 of Clubs
  #
  test "@invalid_run is not a run" do
    refute(Deck.run?(@invalid_run))
  end

  test "@invalid_run is not a book" do
    refute(Deck.book?(@invalid_run))
  end

  test "@invalid_run is worth 30 points" do
    assert(Deck.points(@invalid_run) == 30)
  end

  #
  # Given an Ace of Hearts, King of Hearts and Queen of Hearts
  #
  test "@ace_high_run is a run" do
    assert(Deck.run?(@ace_high_run))
  end

  test "@ace_high_run is not a book" do
    refute(Deck.book?(@ace_high_run))
  end

  test "@ace_high_run is worth 35 points" do
    assert(Deck.points(@ace_high_run))
  end
end

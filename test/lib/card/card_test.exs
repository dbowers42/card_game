defmodule CardGame.CardTest do
  use ExUnit.Case, async: true

  alias CardGame.Card
  doctest CardGame.Card

  test "points" do
    # Ace
    assert Card.new(1, :hearts) |> Card.points == 15

    # Rank 2-9
    assert Card.new(2, :hearts) |> Card.points == 5
    assert Card.new(3, :hearts) |> Card.points == 5
    assert Card.new(4, :hearts) |> Card.points == 5
    assert Card.new(5, :hearts) |> Card.points == 5
    assert Card.new(6, :hearts) |> Card.points == 5
    assert Card.new(7, :hearts) |> Card.points == 5
    assert Card.new(8, :hearts) |> Card.points == 5
    assert Card.new(9, :hearts) |> Card.points == 5

    # Rank 10-13
    assert Card.new(10, :hearts) |> Card.points == 10
    assert Card.new(11, :hearts) |> Card.points == 10
    assert Card.new(12, :hearts) |> Card.points == 10
    assert Card.new(13, :hearts) |> Card.points == 10
  end

  test "display_name" do
    #
    # Hearts
    #

    # Ace of Hearts
    assert Card.new(1, :hearts) |> Card.display_name == "Ace of Hearts"

    # Rank 2-9 of Hearts
    assert Card.new(2, :hearts) |> Card.display_name == "2 of Hearts"
    assert Card.new(3, :hearts) |> Card.display_name == "3 of Hearts"
    assert Card.new(4, :hearts) |> Card.display_name == "4 of Hearts"
    assert Card.new(5, :hearts) |> Card.display_name == "5 of Hearts"
    assert Card.new(6, :hearts) |> Card.display_name == "6 of Hearts"
    assert Card.new(7, :hearts) |> Card.display_name == "7 of Hearts"
    assert Card.new(8, :hearts) |> Card.display_name == "8 of Hearts"
    assert Card.new(9, :hearts) |> Card.display_name == "9 of Hearts"

    # Rank 10-13 of Hearts
    assert Card.new(10, :hearts) |> Card.display_name == "10 of Hearts"
    assert Card.new(11, :hearts) |> Card.display_name == "Jack of Hearts"
    assert Card.new(12, :hearts) |> Card.display_name == "Queen of Hearts"
    assert Card.new(13, :hearts) |> Card.display_name == "King of Hearts"

    #
    # Clubs
    #

    # Ace of Clubs
    assert Card.new(1, :clubs) |> Card.display_name == "Ace of Clubs"

    # Rank 2-9 of Clubs
    assert Card.new(2, :clubs) |> Card.display_name == "2 of Clubs"
    assert Card.new(3, :clubs) |> Card.display_name == "3 of Clubs"
    assert Card.new(4, :clubs) |> Card.display_name == "4 of Clubs"
    assert Card.new(5, :clubs) |> Card.display_name == "5 of Clubs"
    assert Card.new(6, :clubs) |> Card.display_name == "6 of Clubs"
    assert Card.new(7, :clubs) |> Card.display_name == "7 of Clubs"
    assert Card.new(8, :clubs) |> Card.display_name == "8 of Clubs"
    assert Card.new(9, :clubs) |> Card.display_name == "9 of Clubs"

    # Rank 10-13 of Clubs
    assert Card.new(10, :clubs) |> Card.display_name == "10 of Clubs"
    assert Card.new(11, :clubs) |> Card.display_name == "Jack of Clubs"
    assert Card.new(12, :clubs) |> Card.display_name == "Queen of Clubs"
    assert Card.new(13, :clubs) |> Card.display_name == "King of Clubs"

    #
    # Diamonds
    #

    # Ace of Diamonds
    assert Card.new(1, :diamonds) |> Card.display_name == "Ace of Diamonds"

    # Rank 2-9 of Diamonds
    assert Card.new(2, :diamonds) |> Card.display_name == "2 of Diamonds"
    assert Card.new(3, :diamonds) |> Card.display_name == "3 of Diamonds"
    assert Card.new(4, :diamonds) |> Card.display_name == "4 of Diamonds"
    assert Card.new(5, :diamonds) |> Card.display_name == "5 of Diamonds"
    assert Card.new(6, :diamonds) |> Card.display_name == "6 of Diamonds"
    assert Card.new(7, :diamonds) |> Card.display_name == "7 of Diamonds"
    assert Card.new(8, :diamonds) |> Card.display_name == "8 of Diamonds"
    assert Card.new(9, :diamonds) |> Card.display_name == "9 of Diamonds"

    # Rank 10-13 of Diamons
    assert Card.new(10, :diamonds) |> Card.display_name == "10 of Diamonds"
    assert Card.new(11, :diamonds) |> Card.display_name == "Jack of Diamonds"
    assert Card.new(12, :diamonds) |> Card.display_name == "Queen of Diamonds"
    assert Card.new(13, :diamonds) |> Card.display_name == "King of Diamonds"

    #
    # Spades
    #

    # Ace of Spades
    assert Card.new(1, :spades) |> Card.display_name == "Ace of Spades"

    # Rank 2-9 of Spades
    assert Card.new(2, :spades) |> Card.display_name == "2 of Spades"
    assert Card.new(3, :spades) |> Card.display_name == "3 of Spades"
    assert Card.new(4, :spades) |> Card.display_name == "4 of Spades"
    assert Card.new(5, :spades) |> Card.display_name == "5 of Spades"
    assert Card.new(6, :spades) |> Card.display_name == "6 of Spades"
    assert Card.new(7, :spades) |> Card.display_name == "7 of Spades"
    assert Card.new(8, :spades) |> Card.display_name == "8 of Spades"
    assert Card.new(9, :spades) |> Card.display_name == "9 of Spades"

    # Rank 10-13 of Spades
    assert Card.new(10, :spades) |> Card.display_name == "10 of Spades"
    assert Card.new(11, :spades) |> Card.display_name == "Jack of Spades"
    assert Card.new(12, :spades) |> Card.display_name == "Queen of Spades"
    assert Card.new(13, :spades) |> Card.display_name == "King of Spades"
end
end

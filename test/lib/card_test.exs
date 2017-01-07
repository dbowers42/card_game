defmodule CardGame.CardTest do
  use ExUnit.Case, async: true

  alias CardGame.Card
  doctest CardGame.Card

  @some_suit :Hearts

  describe "CardGame.Card.display_name/1" do
    setup do
      %{
        test_data: [
          {1, @some_suit, "Ace of #{@some_suit}"},
          {2, @some_suit, "2 of #{@some_suit}"},
          {3, @some_suit, "3 of #{@some_suit}"},
          {4, @some_suit, "4 of #{@some_suit}"},
          {5, @some_suit, "5 of #{@some_suit}"},
          {6, @some_suit, "6 of #{@some_suit}"},
          {7, @some_suit, "7 of #{@some_suit}"},
          {8, @some_suit, "8 of #{@some_suit}"},
          {9, @some_suit, "9 of #{@some_suit}"},
          {10, @some_suit, "10 of #{@some_suit}"},
          {11, @some_suit, "Jack of #{@some_suit}"},
          {12, @some_suit, "Queen of #{@some_suit}"},
          {13, @some_suit, "King of #{@some_suit}"}
        ]
      }
    end

    test "displays the correct display name for a card", context do
      context.test_data |> Enum.each(fn sample ->
        card = Card.new(elem(sample, 0), elem(sample, 1))
        assert Card.display_name(card) == elem(sample, 2)
      end)
    end
  end

  describe "CardGame.Card.points/1" do
    test "rank 1" do
      # Ace
      assert Card.new(1, @some_suit) |> Card.points == 15
    end

    test "rank 2-9" do
      [2, 3, 4, 5, 6, 7, 8, 9] |> Enum.each(fn rank ->
        assert Card.new(rank, @some_suit) |> Card.points == 5
      end)
    end

    test "rank 10-13" do
      # Rank 10-13
      [10, 11, 12, 13] |> Enum.each(fn rank ->
        assert Card.new(rank, @some_suit) |> Card.points == 10
      end)
    end
  end
end

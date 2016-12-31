defmodule CardGame.Deck do
  alias CardGame.Card

  def book?(cards) do
    minimum_cards?(cards) && same_rank?(cards)
  end

  def run?(cards) do
    cond do
      !minimum_cards?(cards) -> false       # A run must have at least 3 cards
      !same_suit?(cards) -> false           # The cards must have the same suit
      sequential?(cards) -> true            # Card ranks must be sequential
      sequential_high_ace?(cards) -> true   # An Ace can have a high or low rank
      true -> false                         # These cards are not a run
    end
  end

  def points(cards) do
    cards
    |> Enum.map(&(Card.points(&1)))
    |> Enum.reduce(&(&1 + &2))
  end

  defp minimum_cards?(cards) do
     Enum.count(cards) >= 3
  end

  defp same_suit?(cards) do
    suit = List.first(cards).suit
    Enum.all?(cards, &(&1.suit == suit))
  end

  defp same_rank?(cards) do
    rank = List.first(cards).rank
    Enum.all?(cards, &(&1.rank == rank))
  end

  defp sequential?([]) do
    true
  end

  defp sequential?(cards) do
    [h|t] = Enum.sort_by(cards, &(&1.rank))

    cond do
      (Enum.count(cards) == 1) -> true
      (h.rank + 1 == List.first(t).rank) && sequential?(t) -> true
      true -> false
    end
  end

  defp sequential_high_ace?(cards) do
    cards
    |> Enum.map(&low_to_high/1)
    |> Enum.sort_by(&(&1.rank))
    |> sequential?
  end

  defp low_to_high(card) do
    cond do
      card.rank == 1 -> %Card{rank: 14, suit: card.suit}
      true -> card
    end
  end
end

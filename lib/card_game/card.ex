defmodule CardGame.Card do
  alias __MODULE__

  @rank_map %{1 => "Ace", 11 => "Jack", 12 => "Queen", 13 => "King"}

  defstruct rank: nil, suit: nil

  def new(rank, suit) do
    %Card{rank: rank, suit: suit}
  end

  def display_name(card) do
    "#{rank_name(card)} of #{suit_name(card)}"
  end

  def points(rank) when is_integer(rank) and rank == 1, do: 15
  def points(rank) when is_integer(rank) and rank > 9, do: 10
  def points(rank) when is_integer(rank), do: 5

  def points(card) when is_map(card) do
    points(card.rank)
  end

  defp suit_name(card) when is_map(card) do
    card.suit
    |> Atom.to_string
    |> String.capitalize
  end

  defp rank_name(card) do
    Map.get(@rank_map, card.rank, Integer.to_string(card.rank))
  end
end

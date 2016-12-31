defmodule CardGame.DrawPileTest do
  use ExUnit.Case

  alias CardGame.DrawPile
  alias CardGame.Card

  @ace_of_clubs Card.new(1, :clubs)

  setup do
    cards = [
      Card.new(1, :hearts),
      Card.new(2, :spades),
      Card.new(3, :clubs),
      Card.new(4, :diamonds)
    ]

    {:ok, pid} = DrawPile.start_link(cards)

    {:ok, %{pid: pid}}
  end

  describe "DrawPile.count/1" do
     test "It returns the number of cards in a draw pile", context do
       assert DrawPile.count(context.pid) == 4
     end

     test "It adds to the count when a card is added to the draw pile", context do
       DrawPile.add_card(context.pid, @ace_of_clubs)
       assert DrawPile.count(context.pid) == 5
     end

     test "It reduces the count when a card is drawn from the draw pile", context do
       DrawPile.draw_card(context.pid)
       assert DrawPile.count(context.pid) == 3
     end
  end

  describe "DrawPile.add_card/2" do
    test "A card can be added to a draw pile", context do
      DrawPile.add_card(context.pid, @ace_of_clubs)
      assert DrawPile.draw_card(context.pid) == @ace_of_clubs
    end
  end

  describe "DrawPile.draw_card/1" do
    test "It returns nil if there are no more cards to draw", context do
       DrawPile.draw_card(context.pid)
       DrawPile.draw_card(context.pid)
       DrawPile.draw_card(context.pid)
       DrawPile.draw_card(context.pid)
       assert DrawPile.draw_card(context.pid) == nil
    end
  end
end

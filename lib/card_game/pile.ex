defmodule CardGame.Pile do
  defmacro __using__(_params) do
    quote do
      use GenServer

      def start_link(default) do
        GenServer.start_link(__MODULE__, default)
      end

      def add_card(pid, card) do
        GenServer.cast(pid, {:add_card, card})
      end

      def draw_card(pid) do
        cond do
          count(pid) == 0 -> nil
          true -> GenServer.call(pid, :draw_card)
        end
      end

      def count(pid) do
        GenServer.call(pid, :count)
      end

      def shuffle(pid, cards) do
        GenServer.cast(pid, {:shuffle, cards})
      end

      def handle_cast({:add_card, card}, cards) do
        {:noreply, [card | cards]}
      end

      def handle_cast({:shuffle, _}, cards) do
        {:noreply, Enum.shuffle(cards)}
      end

      def handle_call(:draw_card, _from, [card | cards]) do
        {:reply, card, cards}
      end

      def handle_call(:count, _from, cards) do
        {:reply, Enum.count(cards), cards}
      end
    end
  end
end

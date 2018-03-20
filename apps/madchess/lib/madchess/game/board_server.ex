defmodule Madchess.Game.BoardServer do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [board: nil])
  end

  def init([board: board]) do
    {:ok, %{board: board}}
  end

  def handle_call(_, _from, state) do
    {:reply, :ok, state}
  end
end

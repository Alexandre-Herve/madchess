defmodule Madchess.Game.CommandQueueServer do
  use GenServer

  def start_link do
    Agent.start_link(fn -> %{} end)
  end

end

defmodule Madchess.Game.Supervisor do

  use Supervisor
  alias Madchess.Game

  def get_registry_name do
    Game.SupervisorRegistry
  end

  def start_link(opts = %{game_id: id}) do
    Supervisor.start_link(__MODULE__, opts, name: {:via, Registry, {get_registry_name(), id}})
  end

  def init(_opts) do
    children = [
      worker(Game.BoardServer, [], restart: :transient)
      worker(Game.CommandQueueServer, [], restart: :transient)
    ]
    supervise(children, strategy: :one_for_one)
  end
end

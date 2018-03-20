defmodule Madchess.GamesSupervisor do

  use Supervisor

  def create_game(opts \\ []) do
    id = Haikuname.generate_name()
    case start_game(id) do
      pid when is_pid(pid) -> {:ok, id, pid}
      err -> err
    end
  end

  def start_game(id, opts \\ []) do
    Supervisor.start_child(__MODULE__, [%{game_id: id}]) |> case do
      {:ok, pid} -> pid
      {:error, {:already_started, _}} -> {:error, "Game with this ID already exists"}
    end
  end

  def start_link(opts \\ []) do
    options = Keyword.merge([name: __MODULE__], opts)
    Supervisor.start_link(__MODULE__, [], name: options[:name])
  end

  def init([]) do
    children = [
      supervisor(Madchess.Game.Supervisor, [], restart: :temporary)
    ]
    supervise(children, strategy: :simple_one_for_one)
  end
end

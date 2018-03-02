defmodule Madchess.Application do
  @moduledoc """
  The Madchess Application Service.

  The madchess system business domain lives in this application.

  Exposes API to clients such as the `MadchessWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      
    ], strategy: :one_for_one, name: Madchess.Supervisor)
  end
end

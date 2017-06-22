defmodule EmailService.Consumer do
  require Logger

  def handle_message(message) do
    Logger.error fn() -> message |> inspect() end

    message[:value]
    |> Poison.decode!()
    |> reactor()

    :ok
  end

  defp reactor(message = %{"action" => _action, "user" => _user, "movie" => _movie}) do
    Logger.debug fn() -> message |> inspect end

    :ok
  end
end

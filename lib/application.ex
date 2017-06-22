defmodule EmailService.Application do
  use Application
  use Bamboo.Mailer, otp_app: :email_service

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      worker(:brod_sup, []),
      worker(Kaffe.Consumer, [])
    ]

    opts = [strategy: :one_for_one, name: EmailService.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

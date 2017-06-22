use Mix.Config

config :logger, level: :debug

config :kaffe, consumer: [
    endpoints: [kafka: 9092],
    topics: ["events"],
    consumer_group: "email-service",
    message_handler: EmailService.Consumer,
    async_message_ack: false,
    start_with_earliest_message: true,
]

config :email_service, EmailService.Application,
  adapter: Bamboo.SMTPAdapter,
  tls: :if_available,
  ssl: :false,
  retries: 1,
  server: "mailcatcher",
  port: 1025,
  username: "username",
  password: "password"


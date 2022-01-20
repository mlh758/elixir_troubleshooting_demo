# Misbehave

This is a demo app with an intentionally misbehaving web server. Sending any `count` parameter to `/api/calculate` greater than 1337 will
cause an infinite loop.

There is a great document for building/troubleshooting running systems [here](https://s3.us-east-2.amazonaws.com/ferd.erlang-in-anger/text.v1.1.0.pdf).

## Setup

1. I was lazy with configuration for this demo. In config.exs change the `priv_dir` key under the `esshd` config.
2. Generate host keys in that directory based on [these instructions](https://github.com/jbenden/esshd#drop-in-secure-remote-elixir-repl)

A production setup would be more complicated, this is just a demo.

## Troubleshooting

Erlang comes with an ssh server built in. The `esshd` package just wraps that for Elixir to make setup a little easier. You can ssh into the running
server after you start it to poke around.

`:recon.proc_count(:reductions, 5)` will give the top 5 running processes by `reductions`. Reductions in Erlang are a measure of CPU usage and it
lets the scheduler decide how to run tasks. If something is consuming a lot of reductions there's a good bet it's a CPU hog. You can also list
by `:memory` and several other metrics.

You can also use `:recon.proc_window` to run give top processes over a sliding window of time. This is helpful if there are many short-lived but
resource intensive processes starting and stopping that might not appear in a single call to `proc_count`.

`Process.exit(pid, :kill)` lets you stop a running process.

You can also use `:erlang.system_monitor(self(), [{:long_gc, 500}])` followed eventually by `flush()` to see any processes with long GC times.
Unset this with `:erlang.system_monitor(:undefined)` when you are done!

You can trace the calls with `:recon_trace.calls({Misbehave.Math, :sum_to, 1}, {10, 100})`. `{10, 100}` says up to 10 calls will be traced every 100ms.

## Running It

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

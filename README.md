# Dogfood

Prepare with `make` or:

```bash
mix deps.get
mix ecto.setup
npm install --prefix assets
```

Start Phoenix endpoint and get an interactive prompt:

```bash
iex -S mix phx.server`
```

Verify:

```elixir
OpenTelemetry.Honeycomb.Http.ConsoleBackend.activate()
import OpenTelemetry.Tracer
with_span "name" do
end
```

You should see something like:

```plain
POST /1/batch/opentelemetry HTTP/1.1
Host: api.honeycomb.io
Content-Type: application/json
User-Agent: opentelemetry_honeycomb/0.3.0-rc.0
X-Honeycomb-Team: HONEYCOMB_WRITEKEY

[
  {
    "time": "2020-11-13T04:11:02.003155Z",
    "samplerate": 1,
    "data": {
      "trace.trace_id": "ba7a00b79ff2eff830ba634bf1fe3376",
      "trace.span_id": "37ed7d40ef49c83c",
      "trace.parent_id": null,
      "service.namespace": "service-namespace",
      "service.name": "service-name",
      "name": "name",
      "duration_ms": 0.028076171875
    }
  }
]
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Learn more

* [Official website](https://www.phoenixframework.org/)
* [Guides](https://hexdocs.pm/phoenix/overview.html)
* [Docs](https://hexdocs.pm/phoenix)
* [Forum](https://elixirforum.com/c/phoenix-forum)
* [Source](https://github.com/phoenixframework/phoenix)
* [Deployment guides](https://hexdocs.pm/phoenix/deployment.html)

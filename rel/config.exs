# Import all plugins from `rel/plugins`
# They can then be used by adding `plugin MyPlugin` to
# either an environment, or release definition, where
# `MyPlugin` is the name of the plugin module.
Path.join(["rel", "plugins", "*.exs"])
|> Path.wildcard()
|> Enum.map(&Code.eval_file(&1))

use Mix.Releases.Config,
    # This sets the default release built by `mix release`
    default_release: :default,
    # This sets the default environment used by `mix release`
    default_environment: Mix.env()

# For a full list of config options for both releases
# and environments, visit https://hexdocs.pm/distillery/configuration.html


# You may define one or more environments in this file,
# an environment's settings will override those of a release
# when building in that environment, this combination of release
# and environment configuration is called a profile

environment :dev do
  plugin MyApp.DistilleryPlugins
  set dev_mode: true
  set include_erts: false
  set cookie: :"ld02YCa,8lsm[p|[%OA&SyG`1rkLM`>AFG4f;hFKk|n=J1(g^[_p<r:J&(vG7,`M"
end

environment :prod do
  plugin MyApp.DistilleryPlugins
  set include_erts: true
  set include_src: false
  set cookie: :"]_R=Uer4oJ{NXF@tgjfM|1M<Qp^?]:xMDOreb[PsW~f&L}EYKiwY*Y}0JPdtr4nK"
end

# You may define one or more releases in this file.
# If you have not set a default release, or selected one
# when running `mix release`, the first release in the file
# will be used by default

release :myapp do
  set version: "#{current_version(:myapp)}-#{System.cmd("git", ["rev-parse", "--short", "HEAD"]) |> elem(0) |> String.rstrip}"
end


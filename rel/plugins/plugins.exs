defmodule MyApp.DistilleryPlugins do
  use Mix.Releases.Plugin

  def before_assembly(%Release{} = release, _opts) do
    info "This is executed just prior to assembling the release"
    release # or nil
  end

  def after_assembly(%Release{} = release, _opts) do
    info "This is executed just after assembling, and just prior to packaging the release"
    release # or nil
  end

  def before_package(%Release{} = release, _opts) do
    info "This is executed just before packaging the release"
    release # or nil
  end

  def after_package(%Release{} = release, _opts) do
    info "Write archives.txt file"
    release # or nil
    |> write_archive_path
  end

  def after_cleanup(_args, _opts) do
    info "This is executed just after running cleanup"
    :ok # It doesn't matter what we return here
  end

  def write_archive_path(%Release{} = release) do
    archive_path = Mix.Releases.Release.archive_path(release)
    output_dir = release.output_dir
    archive_list_filename = Path.join([output_dir, "archives.txt"])

    File.write(archive_list_filename, archive_path, [:append])

    release
  end

end
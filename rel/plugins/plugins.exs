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
    |> copy_archive
  end

  def after_cleanup(_args, _opts) do
    info "This is executed just after running cleanup"
    :ok # It doesn't matter what we return here
  end

  def copy_archive(%Release{} = release) do
    archive_path = Mix.Releases.Release.archive_path(release)
    copy_to_dir = release.output_dir |> Path.split |> Enum.drop(-1) |> Enum.concat(["artifacts"]) |> Path.join
    ext = cond do
      release.profile.executable ->
        ".run"
      :else ->
        ".tar.gz"
    end
    filename = "#{Atom.to_string(release.name)}-#{release.version}#{ext}"
    artifact = Path.join([copy_to_dir, filename])
    File.mkdir_p!(copy_to_dir)
    File.copy(archive_path, artifact)
    release
  end

  # def write_archive_path(%Release{} = release) do
  #   archive_path = Mix.Releases.Release.archive_path(release)
  #   output_dir = release.output_dir
  #   archive_list_filename = Path.join([output_dir, "archives.txt"])
  #   File.write(archive_list_filename, archive_path, [:append])

  #   release
  # end

end
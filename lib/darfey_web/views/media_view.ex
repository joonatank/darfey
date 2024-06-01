defmodule MediaFile do
  defstruct [:type, :file, :thumb, :caption]
end

defmodule DarfeyWeb.MediaView do
  @moduledoc """
  MediaView module
  """

  use DarfeyWeb, :view
  require Logger

  @doc """
  Recursive function for creating list of image assets
  @return List of MediaFiles

  Tries to find a thumbnail file with {FILENAME}_thumb.{EXT}
  where {FILENAME} is the orignal name, {EXT} is any extension (image)

  If no thumbnail was found then
  Assign the file as thumbnail
  LOG: that the file doesn't have a thumbnail
  """
  def get_image([file | files]) do
    # Find a thumb file
    # TODO
    # Problem: if a video file has no thumbs the html img tag will not work
    thumb = List.first(Path.wildcard(Path.rootname(file) <> "_thumb*"))
            || (Logger.warn "NO thumb #{inspect(file)}"; file)

    # Only supports mp4 videos
    # We need to create a list of supported video/image types and check against those
    type_ =
      if Path.extname(file) == ".mp4" do
        "video"
      else
        "img"
      end
    Logger.debug "file: #{inspect{Path.basename(file)}} Image type : #{inspect(type_)} thumb: #{inspect(thumb)}"
    [%MediaFile{type: type_, file: Path.basename(file), thumb: Path.basename(thumb), caption: "Problems"}] ++ get_image(files)
  end
  def get_image([]), do: []

  @doc """
  Get the images/videos from asset/images/media directory
  @return List of MediaFiles
  """
  def get_images() do
    # Find all thumbs
    # Use get_image to find the orignal file
    # TODO
    # Problem: If the file has non image/video extension
    path = "assets/static/images/media/"
    thumbs = Path.wildcard(path <> "*_thumb*")
    all = Path.wildcard(path <> "*")
    originals = MapSet.difference(Enum.into(all, MapSet.new), Enum.into(thumbs, MapSet.new))
                |> MapSet.to_list
    get_image(originals)
  end

end

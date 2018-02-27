defmodule MediaFile do
  defstruct [:type, :file, :thumb, :caption]
end

defmodule DarfeyWeb.MediaView do
  use DarfeyWeb, :view
  require Logger

  # Recursive function for creating list of image assets
  def get_image([t | thumbs]) do
    # Remove the _thumb from the name and find a file with that name
    # Finds any extension for the file
    # TODO
    # Problem: If one thumb has multiple files with different extensions
    # Problem: If thumb doesn't have an image
    # Problem: If a file has non image/video extension
    filename = String.replace_trailing(Path.rootname(t), "_thumb", "")
    file = List.first(Path.wildcard(filename <> "*"))

    # Only supports mp4 videos
    # We need to create a list of supported video/image types and check against those
    type_ =
      if Path.extname(file) == ".mp4" do
        "video"
      else
        "img"
      end
    Logger.debug "file: #{inspect{Path.basename(file)}} Image type : #{inspect(type_)} thumbs: #{inspect(t)}"
    [%MediaFile{type: type_, file: Path.basename(file), thumb: Path.basename(t), caption: "Problems"}] ++ get_image(thumbs)
  end
  def get_image([]), do: []

  # Get the images/videos from asset directory
  # assumes that every image has a thumb file named: {filename}_thumb.{fileext}
  # Extra thumbs or images are not a problem
  # but only images that have image/thumb pair as above are displayed.
  def get_images() do
    # Find all thumbs
    # Use get_image to find the orignal file
    path = "assets/static/images/media/"
    thumbs = Path.wildcard(path <> "*_thumb*")
    get_image(thumbs)
  end

end

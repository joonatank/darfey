defmodule MediaFile do
   defstruct [:type, :file, :thumb]
end

defmodule DarfeyWeb.MediaView do
  use DarfeyWeb, :view
  require Logger

  # Recursive function for creating list of image assets
  def get_image([file | origs], [t | thumbs]) do
    type_ =
      if Path.extname(file) == ".mp4" do
        "video"
      else
        "img"
      end
    Logger.debug "file: #{inspect{Path.basename(file)}} Image type : #{inspect(type_)}"
    [%MediaFile{type: type_, file: Path.basename(file), thumb: Path.basename(t)}] ++ get_image(origs, thumbs)
  end
  def get_image([], _), do: []

  # Get the images/videos from asset directory
  # assumes that every image has a thumb file named: {filename}_thumb.{fileext}
  # No error checking if no thumb is found for the image
  # will give wrong thumbs for all images if one thumb is missing
  def get_images() do
    path = "assets/static/images/"
    thumbs = Path.wildcard(path <> "*_thumb*")
    all = Path.wildcard(path <> "*")
    originals = MapSet.difference(Enum.into(all, MapSet.new), Enum.into(thumbs, MapSet.new)) |> MapSet.to_list
    get_image(originals, thumbs)
  end

end

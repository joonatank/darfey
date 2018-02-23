defmodule MediaFile do
   defstruct [:type, :file, :thumb]
end

defmodule DarfeyWeb.MediaView do
   use DarfeyWeb, :view

   def get_images() do
      [%MediaFile{type: "img", file: "test_huge.jpg", thumb: "test_huge_thumb.jpg"},
       %MediaFile{type: "img", file: "test_small.png", thumb: "test_small_thumb.png"},
       %MediaFile{type: "img", file: "test_large_wp.jpg", thumb: "test_large_wp_thumb.jpg"},
       %MediaFile{type: "img", file: "test_medium_wp.jpg", thumb: "test_medium_wp_thumb.jpg"}]
   end

   def get_videos() do
      [%MediaFile{type: "video", file: "test_video.mp4", thumb: "test_video_thumb.png"}]
   end

end

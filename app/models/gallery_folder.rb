class GalleryFolder < Gallery
  has_attached_file :asset, default_url: "/images/folder.png"
end

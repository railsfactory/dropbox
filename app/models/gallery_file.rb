class GalleryFile < Gallery
    has_attached_file :asset, default_url: "/images/:style/missing.png",
    :url => "/system/:class/:id/:basename.:extension"
    validates_attachment :asset, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
    validates :parent_id, presence: true
    acts_as_commentable
end

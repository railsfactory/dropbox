class GalleryFile < Gallery
    has_attached_file :asset, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    # validates_attachment :asset, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
    validates :parent_id, presence: true
    acts_as_commentable
    # before_validate :vaidate_contenttype

    def vaidate_contenttype
      byebug
    end
end

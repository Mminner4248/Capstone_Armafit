class Image < ApplicationRecord
        # Establishes what formats of image we accept, width and height limits for thumbnail and regular view, and establishes what image belongs to
        attr_accessor :image 
        belongs_to :imageable, polymorphic: true, optional: true
        has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100#" }, default_url: "/images/default.jpg"
        validates_attachment_content_type :image, content_type: {content_type: ["image/jpeg", "image/gif", "image/png"] }
end

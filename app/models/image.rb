class Image < ActiveRecord::Base
   belongs_to :project
   has_attached_file :image, styles: { medium: "500x500>", thumb: "150x150>" }, default_url: "/images/:style/missing.png", validate_media_type: false
   do_not_validate_attachment_file_type :image
end
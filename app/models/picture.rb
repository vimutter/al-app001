class Picture < ActiveRecord::Base
  belongs_to :gadget

  has_attached_file :image, url: "/system/:hash.:extension",
    hash_secret: "lo5nhgdSecfdretStsdfrindfsga",
    styles: { thumb: 'x100', croppable: '600x600>', big: '1000x1000>' }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment :image,
    presence: true,
    size: { in: 0..5.megabytes }

end

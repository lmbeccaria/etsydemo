class Listing < ActiveRecord::Base
  has_attached_file :image, :styles => { :large => "400x400", :medium => "275x275>", :small => "100x100>", :thumb => "50x50>" }, :default_url => "default_:style.jpg", :storage => :dropbox, :dropbox_credentials => Rails.root.join("config/dropbox.yml")

end

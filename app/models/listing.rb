class Listing < ActiveRecord::Base
  if Rails.env.development?
    has_attached_file :image, :styles => { :large => "400x400", :small => "200x200>", :thumb => "50x50>" }, :default_url => "default_:style.jpg"

  else
    has_attached_file :image, :styles => {  :large => "400x400>", 
                                            :small => "200x200>", 
                                            :thumb => "50x50>" }, 
                              :default_url => "default_:style.jpg", 
                              :storage => :dropbox, 
                              :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                              :path => ":style/:id_:filename"
  end

  validates :name, :description, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates_attachment_presence :image

  belongs_to :user

end

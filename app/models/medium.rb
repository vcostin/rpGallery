class Medium < ActiveRecord::Base
  resourcify
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :title, presence: true # Make sure that Media has the title
  validates :attachment, presence: true # Make sure that Media is present
end

class Document < ActiveRecord::Base
   mount_uploader :attachment, AttachmentUploader # use this uploader for this model.
   validates :name, presence: true #owner's name is present?
end

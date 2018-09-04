#class Document < ActiveRecord::Base
class Document < ApplicationRecord
   has_one_attached :image
   mount_uploader :attachment, AttachmentUploader # use this uploader for this model.
   validates :name, presence: true #owner's name is present?

end

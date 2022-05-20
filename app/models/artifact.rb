class Artifact < ApplicationRecord
   attr_accessor :upload
   belongs_to :project
	MAX_FILESIZE = 10.megabytes
	validates_presence_of :name, :upload

	validates_uniqueness_of :name

	Add another custom validation for file size:

	validate :uploaded_file_size

	With the uploaded_file_size looking like this under private:

  def uploaded_file_size

	if upload

	errors.add(:upload, "File size must be less than #{self.class::MAX_FILESIZE}") unless upload.size <= self.class::MAX_FILESIZE

    end

 end
end

class Task < ActiveRecord::Base

  belongs_to :user

  has_attached_file :attachment, styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "missing.png"
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\z/

  def attachment_url
    "http://" + Rails.configuration.default_host  + self.attachment.url(:original)
  end

  def as_json(options = {})
    super options.merge(methods: [:attachment_url])
  end

end

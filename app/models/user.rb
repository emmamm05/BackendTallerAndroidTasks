class User < ActiveRecord::Base

  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tasks

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def avatar_url
    "http://" + Rails.configuration.default_host  + self.avatar.url(:original)
  end

  def as_json(options = {})
    super options.merge(methods: [:avatar_url])
  end

end

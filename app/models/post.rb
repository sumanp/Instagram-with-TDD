class Post < ActiveRecord::Base
  validates :user_id, presence: true
  validates :image, presence: true

  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  acts_as_votable

  belongs_to :user
  has_many :comments, dependent: :destroy

end

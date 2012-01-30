class Project < ActiveRecord::Base
  belongs_to :chapter

  attr_accessible :name, :title, :url, :email, :phone, :description, :use, :chapter_id

  validates_presence_of :name
  validates_presence_of :title
  validates_presence_of :email
  validates_presence_of :description
  validates_presence_of :use
  validates_presence_of :chapter_id

  cattr_accessor :mailer
  self.mailer = ProjectMailer

  def save
    was_new_record = new_record?
    saved = super
    if saved && was_new_record
      mailer.new_application(self).deliver
    end
    saved
  end
end
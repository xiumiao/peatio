class Announcement < ActiveRecord::Base
  belongs_to :author, class_name: 'Member', foreign_key: 'author_id'
end
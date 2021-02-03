class Page < ActiveRecord::Base
    has_and_belongs_to_many :editors, :class_name => "AdminUser"
    belongs_to :subject
    has_many :sections
end

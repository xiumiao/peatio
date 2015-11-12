class IpoApplicant < ActiveRecord::Base
  belongs_to :member
  belongs_to :auditor , class_name:'Member', foreign_key: :audit_id
end

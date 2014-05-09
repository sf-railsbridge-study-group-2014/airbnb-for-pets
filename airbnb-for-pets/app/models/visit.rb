class Visit < ActiveRecord::Base
  belongs_to :visitor, :class_name => 'User'
  belongs_to :pet

  def reject!
    update_attributes({"status" => "rejected"})
  end

  def accept!
    update_attributes({'status'=> 'accepted'})
  end

  def pending?
    status == "pending"
  end
end
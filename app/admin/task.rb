ActiveAdmin.register Task do
scope :all, :default => true
scope :due_this_week do |tasks|
  tasks.where('due_date > ? and due_date < ?', Time.now, 1.week.from_now)
end
scope :late do |tasks|
  tasks.where('due_date < ?', Time.now)
end
scope :mine do |tasks|
  tasks.where(:admin_user_id => current_admin_user.id)
end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
   permit_params :list, :of, :attributes, :on, :model, :title, :project_id, :admin_user_id, :is_done, :due_date
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end

ActiveAdmin.register Project do
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
   permit_params :name, user_ids:[]

   index do
     selectable_column
     column :name
     column(:users){|projects| projects.users.pluck(:name).join(', ')}
     actions
   end


  form do |f|
    f.inputs do
      f.input :name
      f.input :users, :as => :check_boxes
    end
    f.actions
  end


end

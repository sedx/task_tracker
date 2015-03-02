ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :admin, :name

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :admin
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :admin

  form do |f|
    f.inputs "Информация о пользователе" do
      f.input :name, label:"Имя"
      f.input :email
      f.input :password, label: "Пароль"
      f.input :password_confirmation, label: "Подтверждение"
      f.li do
        f.label "Администратор"
        f.check_box :admin
      end
    end
    f.actions
  end

end

ActiveAdmin.register Staff do


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :email, :name, :status, :avatar, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  index do
    column "Avatar" do |staff|
      image_tag(staff.avatar.url(:small))
    end

    column :email
    column :name
    column 'Status' do |staff|
      if staff.status
        label_tag 'Active'
      else
        label_tag 'Suspend'
      end
    end
    actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Staff detail" do
      f.input :email
      f.input :name
      f.input :status, as: :select, collection: [["Active", 1], ["Suspend", 0]]
      f.input :avatar, as: :file
    end
    f.actions
  end

  filter :email
  filter :name
  filter :status

end

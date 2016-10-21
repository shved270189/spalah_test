ActiveAdmin.register Post do
  permit_params :body, :slug, :title, :image, :user_id

  index do
    selectable_column
    id_column
    column :body
    column :slug
    column :title
    column :image do |post|
      image_tag post.image.url, size: '50x50'
    end
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :title
      row :body
      row :slug
      row :image do |post|
        image_tag post.image.url, size: '150x150'
      end
    end
    active_admin_comments
  end

  filter :title
  filter :slug
  filter :created_at

  form do |f|
    f.inputs "Post" do
      f.input :body
      f.input :slug
      f.input :title
      f.input :image
      f.input :user_id, as: :select, collection: User.pluck(:name, :id), include_blank: false
    end
    f.actions
  end

end

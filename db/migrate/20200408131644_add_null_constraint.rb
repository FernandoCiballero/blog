class AddNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:articles, :title, false)
    change_column_null(:articles, :text, false)
    change_column_null(:articles, :image_url, false)
    change_column_null(:articles, :user_id, false)
    
    change_column_null(:categories, :name, false)
    change_column_null(:categories, :description, false)
    change_column_null(:categories, :display, false)

    change_column_null(:comments, :commenter, false)
    change_column_null(:comments, :body, false)

  end
end

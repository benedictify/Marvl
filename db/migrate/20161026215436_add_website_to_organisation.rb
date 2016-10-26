class AddWebsiteToOrganisation < ActiveRecord::Migration[5.0]
  def change
    add_column :organisations, :website, :string
  end
end

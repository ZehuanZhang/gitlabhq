class CreateBadges < ActiveRecord::Migration[4.2]
  DOWNTIME = false

  # rubocop:disable Migration/PreventStrings
  def change
    create_table :badges do |t|
      t.string     :link_url, null: false
      t.string     :image_url, null: false
      t.references :project, index: true, foreign_key: { on_delete: :cascade }, null: true
      t.integer    :group_id, index: true, null: true
      t.string     :type, null: false

      t.timestamps_with_timezone null: false
    end

    # rubocop:disable Migration/AddConcurrentForeignKey
    add_foreign_key :badges, :namespaces, column: :group_id, on_delete: :cascade
    # rubocop:enable Migration/AddConcurrentForeignKey
  end
  # rubocop:enable Migration/PreventStrings
end

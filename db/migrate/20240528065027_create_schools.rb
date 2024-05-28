class CreateSchools < ActiveRecord::Migration[7.1]
  def change
    create_table :schools, comment: 'スクール' do |t|
      t.string :name, null: false, comment: '名前'
      t.string :address, comment: '住所'
      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, comment: 'ユーザー' do |t|
      t.string :name, null: false, comment: '名前'
      t.string :email, null: false, comment: 'メールアドレス'
      t.timestamps
    end
  end
end

class CreateUserTeachers < ActiveRecord::Migration[7.1]
  def change
    create_table :user_teachers, comment: '先生ユーザー'  do |t|
      t.references :user, comment: 'ユーザーID'
      t.references :school, comment: 'スクールID'
      t.timestamps
    end
  end
end

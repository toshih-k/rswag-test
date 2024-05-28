class CreateUserStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :user_students, comment: '生徒ユーザー' do |t|
      t.references :user, comment: 'ユーザーID'
      t.references :school, comment: 'スクールID'
      t.timestamps
    end
  end
end

class CreateUserSchoolAdmins < ActiveRecord::Migration[7.1]
  def change
    create_table :user_school_admins, comment: '教室管理者ユーザー' do |t|
      t.references :user, comment: 'ユーザーID'
      t.references :school, comment: 'スクールID'
      t.timestamps
    end
  end
end

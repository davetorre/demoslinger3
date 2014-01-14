namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(sc_user_name: "dave_torre",
                 sc_user_id: "8958287",
                 admin: true)
  end
end
User.find_or_create_by(email: 'admin@example.com') do |admin|
  p 'Seeding admin user'

  admin.first_name = 'Super'
  admin.last_name = 'Admin'
  admin.password = 'Test1234!'
  admin.gender = 'male'
  admin.skip_confirmation!
  admin.add_role(:admin)
end

User.find_or_create_by(email: 'foo@example.com') do |registered|
  p 'Seeding registered user'

  registered.first_name = 'John'
  registered.last_name = 'Foo'
  registered.password = 'test1234'
  registered.gender = 'male'
  registered.skip_confirmation!
  registered.add_role(:registered)
end
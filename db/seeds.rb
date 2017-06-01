User.destroy_all
Role.destroy_all
RoleUser.destroy_all

if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)

AuthorList.destroy_all
Author.destroy_all
Book.destroy_all
Stillage.destroy_all
Hall.destroy_all

h1 = Hall.create(name_full: 'Главный зал', name_short: 'ГЗ')
h2 = Hall.create(name_full: 'Зал руководств', name_short: 'ЗР')

s1 = Stillage.create(index: 1, hall: h1)
s2 = Stillage.create(index: 1, hall: h2)

a1 = Author.create(fname: 'Иван', sname: 'Иванович', lname: 'Иванов', index: 1)
a2 = Author.create(fname: 'Петр', sname: 'Петрович', lname: 'Петров', index: 2)
a3 = Author.create(fname: 'Василий', sname: 'Васильевич', lname: 'Васильев', index: 3)

b1 = Book.create(name: 'Математический анализ, 5 класс', part: 1, isbn: 123123, 
  print_year: 2015, stillage: s1, shelf: 1, copies: 1)
b2 = Book.create(name: 'Математический анализ, 5 класс', part: 2, isbn: 456456, 
  print_year: 2015, stillage: s1, shelf: 2, copies: 1)

b3 = Book.create(name: 'Сборник руководств для чайников', isbn: 789789, 
  print_year: 2017, stillage: s2, shelf: 1, copies: 1)

al1 = AuthorList.create(book: b1, author: a1)
al2 = AuthorList.create(book: b1, author: a2)
al3 = AuthorList.create(book: b2, author: a1)
al4 = AuthorList.create(book: b3, author: a3)
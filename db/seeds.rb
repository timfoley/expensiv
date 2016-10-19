# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Debt.destroy_all
Expense.destroy_all
Group.destroy_all

house = Group.create!(name: "5227 Nebraska Ave")
team = Group.create!(name: "Softball Team")

tim = house.users.create!(name: "Tim", email: "tim@tim.tim", password: "timtim")
jack = house.users.create!(name: "Jack", email: "jack@jack.jack", password: "jackjack")
matt = house.users.create!(name: "Matt", email: "matt@matt.matt", password: "mattmatt")

dara = team.users.create!(name: "Dara", email: "dara@dara.dara", password: "daradara")
tim.memberships.create!(group: team)

tim.expenses.create!(name: "Paper Towels", notes: "NA", date: Date.today, amount: 30, share: 10)
jack.expenses.create!(name: "Rent", notes: "NA", date: Date.today, amount: 3000, share: 1000)
matt.expenses.create!(name: "Netflix", notes: "NA", date: Date.today, amount: 9, share: 3)

tim.debts.create!(amount: 1000, reconciled: false, expense_id: jack.expenses.first.id)
tim.debts.create!(amount: 3, reconciled: false, expense_id: matt.expenses.first.id)

jack.debts.create!(amount: 10, reconciled: false, expense_id: tim.expenses.first.id)
jack.debts.create!(amount: 3, reconciled: false, expense_id: matt.expenses.first.id)

matt.debts.create!(amount: 1000, reconciled: false, expense_id: jack.expenses.first.id)
matt.debts.create!(amount: 10, reconciled: false, expense_id: tim.expenses.first.id)

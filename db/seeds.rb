u1 = User.create(email: 'ferris@ferryrules.com', username: 'ferryrules', password_digest: 'asd', permission: 'God', fname: 'Ferris', lname: 'Boran')

c1 = Company.create(name: "FerryRules", user: u1)

e1 = Employee.create(full_name: "Sam Perrey", pay_type: "Salary", pay_rate: 300000.99, filing_status: 'Married', w4_allowances: 0, company: c1)

cu1 = CompUser.create(email: 'dnj547@live.com', username: 'dnj547', password_digest: 'ferris', permission: 'God', fname: 'Danielle', lname: 'Jasper', company: c1)

d1 = Department.create(name: "CAO", company: c1, employee: e1)

t1 = Ticket.create(title: 'Computer Crashed', description: "Hit it was golf club and now it doesn't work", priority: 'High', category: 'Hardware', comp_user: cu1, company: c1, user: u1)

pr1 = Payroll.create(start_date: 'June 1, 2019', end_date: 'June 8, 2019', check_date: 'June 11, 2019', company: c1)

pc1 = Paycheck.create(hours: 40, payroll: pr1, employee: e1)

pa1 = PaycheckAdjustment.create(adj_type: 'Addition', adj_amount: 456.78, description: 'Additional Cool Person Bonus', paycheck: pc1, employee: e1)

ra1 = RecurringAdjustment.create(adj_type: 'Addition', adj_amount: 12345.67, description: 'Awesome Person Bonus', employee: e1)

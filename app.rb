require('pry')
require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('./lib/contact')
require('./lib/phone')

get('/') do
  @contacts = Contact.all()
  erb(:index)
end

post('/form1') do
  @name = params.fetch('name')
  @cell = params.fetch('cell')
  @work = params.fetch('work')
  @pager = params.fetch('pager')
  @new_phone = Phone.new({:cell => @cell, :work => @work, :pager => @pager})
  @new_contact = Contact.new({:name => @name, :phone_numbers => @new_phone}).save()
  @contacts = Contact.all()
  erb(:index)
end

get("/contact/:name") do
  found_contact = Contact.find(params.fetch("name"))
  @name = found_contact.name()
  erb(:contact)
end


post("/add_cell") do
  cell = params.fetch("new_cell")
  name = Contact.get_this()

  Contact.find(name).phone_numbers().add_cell(cell)

  redirect("/")
end

post("/add_work") do
  cell = params.fetch("new_work")
  name = Contact.get_this()

  Contact.find(name).phone_numbers().add_work(cell)

  redirect("/")
end

post("/add_pager") do
  cell = params.fetch("new_pager")
  name = Contact.get_this()

  Contact.find(name).phone_numbers().add_pager(cell)

  redirect("/")
end

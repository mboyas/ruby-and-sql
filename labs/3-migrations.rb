# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-migrations.rb

# **************************
# Don't change or move
Activity.destroy_all
# **************************

# Add new Activity model with database table

# 1. in terminal, run:
# rails generate model Activity

# 2. open newly generated files

# 3. add relevant columns to the db/migrate file

# 4. execute the migration file. in terminal, run:
# rails db:migrate

# Activity is the join model between Salesperson and Contact
# Add the relevant associations to the models.

# 5. Insert at least 2 activities into the activities table

brian = Salesperson.where({last_name: "Eng", first_name: "Brian"})[0]
contact = Contact.where({first_name: "Tim", last_name: "Cook"})[0]
values = {
  salesperson_id: brian.id,
  contact_id: contact.id,
  note: "Grabbed tacos"
}
activity = Activity.new(values)
activity.save

ben = Salesperson.where({last_name: "Block", first_name: "Ben"})[0]
contact = Contact.where({first_name: "Elon", last_name: "Musk"})[0]
values = {
  salesperson_id: ben.id,
  contact_id: contact.id,
  note: "Liked a tweet"
}
activity = Activity.new(values)
activity.save


# 6. Loop through the salespeople and display their activites and related contacts, e.g.:

# ---------------------------------
# Brian Eng
# Grabbed tacos - Tim Cook
#
# Ben Block
# Liked a tweet - Elon Musk

salespeople = Salesperson.all

for salesperson in salespeople
    puts "#{salesperson.first_name} #{salesperson.last_name}"
  
    activities = salesperson.activities
    for activity in activities
      contact = activity.contact
      puts "#{activity.note} - #{contact.first_name} #{contact.last_name}"
    end
  end

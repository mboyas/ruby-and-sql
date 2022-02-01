# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/1-models.rb

# **************************
# Don't change or move
Company.destroy_all
# **************************

# 1a. check out the schema file
# 1b. check out the model file
puts "There are now #{Company.all.count} companies."

# 2. create new companies
values = { 
    name: "Apple", 
    url: "test", 
    city: "Cupertino", 
    state: "CA" 
}

apple = Company.new(values)
apple.save

values = { 
    name: "Amazon", 
    url: "test", 
    city: "Seattle", 
    state: "WA" 
}

amazon = Company.new(values)
amazon.save

puts "There are now #{Company.all.count} companies."

# 3. query companies table
puts Company.all.inspect

california_company = Company.where({ state: "CA" })[0]
puts california_company.inspect


# 4. read column values from row
puts california_company.read_attribute(:url)
puts california_company.url

# 5. update attribute value
california_company.write_attribute(:slogan, "Think different.")
california_company.slogan = "Think different."
california_company.save

puts california_company.inspect

new_company = Company.new
new_company.name = "Tesla"
new_company.url = "test"
new_company.city = "Palo Alto"
new_company.save

puts new_company.inspect
puts "There are now #{Company.all.count} companies."
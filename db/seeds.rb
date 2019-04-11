require('pry-byebug')
require_relative('../models/student.rb')
require_relative('../models/house.rb')


gryffindor = House.new({
  "name" => "Gryffindor",
  "logo" => "https://cdn.shopify.com/s/files/1/2597/5112/products/hptvtgryat_1_1024x1024@2x.jpg"
  })

gryffindor.save()

hufflepuff = House.new({
  "name" => "Hufflepuff",
  "logo" => "https://cdn.europosters.eu/image/1300/metal-tin-sign/harry-potter-hufflepuff-i67993.jpg"
  })

hufflepuff.save()

ravenclaw = House.new({
  "name" => "Ravenclaw",
  "logo" => "https://cdn.shopify.com/s/files/1/2597/5112/products/hptvtravat_1_88e78167-7950-4440-beb8-35fa9dd3564d_1024x1024@2x.jpg"
  })

ravenclaw.save()

slytherin = House.new({
  "name" => "Slytherin",
  "logo" => "https://images.ctfassets.net/bxd3o8b291gf/4U98maPA5aEUWcO8uOisOq/e01e17cc414b960380acbf8ace1dc1d5/PM_House_Pages_400_x_400_px_FINAL_CREST4.png"
  })

slytherin.save()



student1 = Student.new({
  "first_name" => "Harry",
  "second_name" => "Potter",
  "house_id" => gryffindor.id,
  "age" => "35"
  })

student1.save()

student2 = Student.new({
  "first_name" => "Draco",
  "second_name" => "Malfoy",
  "house_id" => slytherin.id,
  "age" => "50"
  })

student2.save()

binding.pry

nil

require 'open-uri'

# Create admin user if not exists
unless AdminUser.find_by(email: 'admin@nerdcrate.com')
  AdminUser.create!(
    email: 'admin@nerdcrate.com',
    password: 'adminpass123!',
    password_confirmation: 'adminpass123!'
  )
end

# Create sample crate types
crates = [
  {
    name: "Gamer's Paradise",
    description: "A monthly selection of gaming merchandise, collectibles, and exclusive items from popular video game franchises.",
    price: 49.99,
    image_url: "https://example.com/images/gaming.jpg" # Replace with real image URLs
  },
  {
    name: "Anime Essentials",
    description: "Curated collection of anime merchandise, including figurines, manga volumes, and Japanese snacks.",
    price: 44.99
  },
  {
    name: "Comic Collector's Box",
    description: "Limited edition comics, graphic novels, and superhero merchandise from Marvel, DC, and indie publishers.",
    price: 39.99
  },
  {
    name: "Sci-Fi Explorer",
    description: "Items from beloved sci-fi franchises like Star Wars, Star Trek, and Doctor Who, including collectibles and memorabilia.",
    price: 54.99
  },
  {
    name: "Fantasy Realm",
    description: "Merchandise from fantasy worlds like Lord of the Rings, Harry Potter, and Game of Thrones.",
    price: 49.99
  },
  {
    name: "Retro Gaming",
    description: "Classic gaming merchandise, retro-styled items, and collectibles from gaming's golden age.",
    price: 45.99
  },
  {
    name: "Tech Enthusiast",
    description: "Gadgets, tech accessories, and smart home items for the technology lover.",
    price: 59.99
  },
  {
    name: "Board Game Master",
    description: "Curated selection of board games, card games, and tabletop gaming accessories.",
    price: 49.99
  },
  {
    name: "Pop Culture Premium",
    description: "Mix of trending pop culture items, memes, and viral sensation merchandise.",
    price: 39.99
  },
  {
    name: "Collector's Edition",
    description: "Limited edition items, rare collectibles, and exclusive merchandise from various fandoms.",
    price: 69.99
  }
]

crates.each do |crate|
  crate_type = CrateType.find_or_create_by!(name: crate[:name]) do |c|
    c.description = crate[:description]
    c.price = crate[:price]
  end

  # Attach image if URL is provided and no image is attached yet
  if crate[:image_url] && !crate_type.image.attached?
    begin
      file = URI.open(crate[:image_url])
      crate_type.image.attach(io: file, filename: "#{crate[:name].parameterize}.jpg")
    rescue OpenURI::HTTPError => e
      puts "Could not download image for #{crate[:name]}: #{e.message}"
    end
  end
end

# Create default pages
Page.find_or_create_by!(slug: 'about') do |page|
  page.title = 'About NerdCrate'
  page.content = <<~CONTENT
    Welcome to NerdCrate - Your Monthly Box of Geek and Gaming Goodness!

    At NerdCrate, we're passionate about delivering the best curated collections 
    of merchandise for gamers, comic fans, and pop culture enthusiasts. Each 
    month, our team of dedicated nerds handpicks the coolest items from your 
    favorite franchises and delivers them right to your door.

    Our Mission:
    To bring joy and excitement to fellow nerds through carefully curated 
    subscription boxes filled with exclusive collectibles, merchandise, and 
    memorable items from the worlds of gaming, comics, and pop culture.
  CONTENT
end

Page.find_or_create_by!(slug: 'contact') do |page|
  page.title = 'Contact Us'
  page.content = <<~CONTENT
    Get in Touch with NerdCrate

    Have questions about your subscription? Want to learn more about our crates? 
    We'd love to hear from you!

    Email: support@nerdcrate.com
    Phone: (555) 123-4567
    Hours: Monday-Friday, 9am-5pm EST

    Follow Us:
    Twitter: @NerdCrate
    Instagram: @NerdCrateOfficial
    Facebook: /NerdCrateOfficial
  CONTENT
end

puts "Seed completed! Created:"
puts "- Admin user (email: admin@nerdcrate.com)"
puts "- #{CrateType.count} crate types" 
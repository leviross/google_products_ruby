require 'json'
file = File.read("./products.json")

google_data = JSON.parse(file)

#outputs the full object
puts google_data.inspect

#outputs the first item's title
puts google_data["items"][0]["product"]["title"]

google_data["items"] = google_products
#counts = Hash.new(0)

# I COULD ALSO USE THE .count METHOD ON MOST OF THESE
# 1) How many 'kinds' are 'shopping#product'
google_products.count { |element| element["kind"] === "shopping#product" }
# OR 
number_of_products = google_products.select{ |element| element["kind"] === "shopping#product" }.size
puts number_of_products
#Where else is this count information stored in the search results? 
google_data["currentItemCount"]

# 2) Find all items with a backorder availability in inventories.
backorder_total = google_products.select{ |element| element["product"]["inventories"][0]["availability"] === "backorder"  }.size
puts backorder_total

# 3) Find all items with more than one image link.

more_than_1 = goolge_products.select{ |element| element["product"]["images"].length > 1 }.size

#4.) Find all canon products in the items (careful with case sensitivity).

canon_products = google_products.select{ |element| element["product"]["brand"] === "Canon" }.size

#5.) Find all items that have product author name of "eBay" and are brand "Canon".

def get_eBay_Canon(array)
	array.select{ |i| i["product"]["author"][/eBay/] && i["product"]["brand"][/Canon/] }.size
end

puts get_eBay_Canon(google_products)

#6.) Print all the products with their brand, price, and a image link
def print_all(array)
	results = array.select{ |i| i["product"]["brand"] && i["product"]["inventories"]["price"] && i["product"]["images"][0]["link"] }
	puts results
end




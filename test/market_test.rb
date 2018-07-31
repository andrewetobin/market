require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'
require './lib/market'


class MarketTest < Minitest::Test

  def setup
    @market = Market.new("South Pearl Street Farmers Market")
  end

  def test_it_exists
    assert_instance_of Market, @market
  end

  def test_it_has_a_name
    expected = "South Pearl Street Farmers Market"
    assert_equal expected, @market.name 
  end





end
# pry(main)> market = Market.new("South Pearl Street Farmers Market")
# #=> #<Market:0x00007fe134933e20...>
#
# pry(main)> market.name
# #=> "South Pearl Street Farmers Market"
#
# pry(main)> market.vendors
# #=> []
#
# pry(main)> vendor_1 = Vendor.new("Rocky Mountain Fresh")
# #=> #<Vendor:0x00007fe1348a1160...>
#
# pry(main)> vendor_1.stock("Peaches", 35)
# #=> 35
#
# pry(main)> vendor_1.stock("Tomatoes", 7)
# #=> 7
#
# pry(main)> vendor_2 = Vendor.new("Ba-Nom-a-Nom")
# #=> #<Vendor:0x00007fe1349bed40...>
#
# pry(main)> vendor_2.stock("Banana Nice Cream", 50)
# #=> 50
#
# pry(main)> vendor_2.stock("Peach-Raspberry Nice Cream", 25)
# #=> 25
#
# pry(main)> vendor_3 = Vendor.new("Palisade Peach Shack")
# #=> #<Vendor:0x00007fe134910650...>
#
# pry(main)> vendor_3.stock("Peaches", 65)
# #=> 65
#
# pry(main)> market.add_vendor(vendor_1)
# #=> [#<Vendor:0x00007fe1348a1160...>]
#
# pry(main)> market.add_vendor(vendor_2)
# #=> [#<Vendor:0x00007fe1348a1160...>, #<Vendor:0x00007fe1349bed40...>]
#
# pry(main)> market.add_vendor(vendor_3)
# #=> [#<Vendor:0x00007fe1348a1160...>, #<Vendor:0x00007fe1349bed40...>, #<Vendor:0x00007fe134910650...>]
#
# pry(main)> market.vendors
# #=> [#<Vendor:0x00007fe1348a1160...>, #<Vendor:0x00007fe1349bed40...>, #<Vendor:0x00007fe134910650...>]
#
# pry(main)> market.vendor_names
# #=> ["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"]
#
# pry(main)> market.vendors_that_sell("Peaches")
# #=> [#<Vendor:0x00007fe1348a1160...>, #<Vendor:0x00007fe134910650...>]
#
# pry(main)> market.vendors_that_sell("Banana Nice Cream")
# #=> [#<Vendor:0x00007fe1349bed40...>]
# ```

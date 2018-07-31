require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'
require './lib/market'


class MarketTest < Minitest::Test

  def setup
    @market = Market.new("South Pearl Street Farmers Market")
    @vendor_1 = Vendor.new("Rocky Mountain Fresh")
    @vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor_3 = Vendor.new("Palisade Peach Shack")
  end

  def test_it_exists
    assert_instance_of Market, @market
  end

  def test_it_has_a_name
    expected = "South Pearl Street Farmers Market"
    assert_equal expected, @market.name
  end

  def test_it_starts_with_no_vendors
    assert_equal [], @market.vendors
  end

  def test_add_vendors
    @market.add_vendor(@vendor_1)
    @market.add_vendor(@vendor_2)
    @market.add_vendor(@vendor_3)

    expected = [@vendor_1, @vendor_2, @vendor_3]
    assert_equal expected, @market.vendors
  end

  def test_it_can_return_list_of_vendor_names
    @market.add_vendor(@vendor_1)
    @market.add_vendor(@vendor_2)
    @market.add_vendor(@vendor_3)

    expected =  ["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"]

    assert_equal expected, @market.vendor_names
  end

  def test_vendor_search_by_item
    @vendor_1.stock("Peaches", 35)
    @vendor_1.stock("Tomatoes", 7)
    @vendor_2.stock("Banana Nice Cream", 50)
    @vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    @vendor_3.stock("Peaches", 65)
    @market.add_vendor(@vendor_1)
    @market.add_vendor(@vendor_2)
    @market.add_vendor(@vendor_3)

    assert_equal [@vendor_1, @vendor_3], @market.vendors_that_sell("Peaches")
    assert_equal [@vendor_2], @market.vendors_that_sell("Banana Nice Cream")
  end

  def test_sorted_item_list
    @vendor_1.stock("Peaches", 35)
    @vendor_1.stock("Tomatoes", 7)
    @vendor_2.stock("Banana Nice Cream", 50)
    @vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    @vendor_3.stock("Peaches", 65)
    @market.add_vendor(@vendor_1)
    @market.add_vendor(@vendor_2)
    @market.add_vendor(@vendor_3)

    expected = ["Banana Nice Cream", "Peach-Raspberry Nice Cream", "Peaches", "Tomatoes"]

    assert_equal expected, @market.sorted_item_list
  end

  def test_market_total_inventory
    @vendor_1.stock("Peaches", 35)
    @vendor_1.stock("Tomatoes", 7)
    @vendor_2.stock("Banana Nice Cream", 50)
    @vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    @vendor_3.stock("Peaches", 65)
    @market.add_vendor(@vendor_1)
    @market.add_vendor(@vendor_2)
    @market.add_vendor(@vendor_3)

    expected = {"Peaches"=>100, "Tomatoes"=>7, "Banana Nice Cream"=>50, "Peach-Raspberry Nice Cream"=>25}

    assert_equal expected, @market.total_inventory
  end





end

# pry(main)> market = Market.new("South Pearl Street Farmers Market")
# #=> #<Market:0x00007fe134933e20...>
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
# pry(main)> market.sorted_item_list
# #=> ["Banana Nice Cream", "Peach-Raspberry Nice Cream", "Peaches", "Tomatoes"]
#
# pry(main)> market.total_inventory
# #=> {"Peaches"=>100, "Tomatoes"=>7, "Banana Nice Cream"=>50, "Peach-Raspberry Nice Cream"=>25}
# ```

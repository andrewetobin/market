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

  def test_it_can_sell_if_market_has_stock
    @vendor_1.stock("Peaches", 35)
    @vendor_1.stock("Tomatoes", 7)
    @vendor_2.stock("Banana Nice Cream", 50)
    @vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    @vendor_3.stock("Peaches", 65)
    @market.add_vendor(@vendor_1)
    @market.add_vendor(@vendor_2)
    @market.add_vendor(@vendor_3)

    assert_equal false, @market.sell("Peaches", 200)
    assert_equal false, @market.sell("Onions", 1)
    assert_equal true, @market.sell("Banana Nice Cream", 5)
  end

  def test_vendor_sells_and_inventory_is_depleted
    @vendor_1.stock("Peaches", 35)
    @vendor_1.stock("Tomatoes", 7)
    @vendor_2.stock("Banana Nice Cream", 50)
    @vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    @vendor_3.stock("Peaches", 65)
    @market.add_vendor(@vendor_1)
    @market.add_vendor(@vendor_2)
    @market.add_vendor(@vendor_3)
    @market.sell("Banana Nice Cream", 5)
    @market.sell("Peaches", 40)

    assert_equal 45, @vendor_2.check_stock("Banana Nice Cream")
    assert_equal 0, @vendor_1.check_stock("Peaches")
    assert_equal 60, @vendor_3.check_stock("Peaches")
  end





end

# pry(main)> market.sell("Peaches", 200)
# #=> false
#
# pry(main)> market.sell("Onions", 1)
# #=> false
#
# pry(main)> market.sell("Banana Nice Cream", 5)
# #=> true
#
# pry(main)> vendor_2.check_stock("Banana Nice Cream")
# #=> 45
#
# pry(main)> market.sell("Peaches", 40)
# #=> true
#
# pry(main)> vendor_1.check_stock("Peaches")
# #=> 0
#
# pry(main)> vendor_3.check_stock("Peaches")
# #=> 60
# ```

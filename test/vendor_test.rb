require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'


class VendorTest < Minitest::Test

  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  def test_it_exists
    assert_instance_of Vendor, @vendor
  end

  def test_inventory_starts_empty
    assert_equal ({}), @vendor.inventory
    assert_equal 0, @vendor.check_stock("Peaches")
  end

  def test_it_can_stock
    assert_equal 30, @vendor.stock("Peaches", 30)
    assert_equal 55, @vendor.stock("Peaches", 25)
    assert_equal 12, @vendor.stock("Tomatoes", 12)
    assert_equal ({"Peaches"=>55, "Tomatoes"=>12}), @vendor.inventory
  end

  def test_check_stock
    @vendor.stock("Peaches", 30)
    @vendor.stock("Peaches", 25)
    @vendor.stock("Tomatoes", 12)

    assert_equal 55, @vendeor.check_stock("Peaches")
    assert_equal 12, @vendeor.check_stock("Tomatoes")
  end

end

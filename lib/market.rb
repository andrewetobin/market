class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory.keys.include?(item)
    end.compact
  end

  def sorted_item_list
    list = @vendors.map do |vendor|
      vendor.inventory.keys
    end.flatten
    list.uniq.sort
  end

  def total_inventory
    total_inventory = Hash.new(0)
    @vendors.each do |vendor|
      vendor.inventory.each do |item, amount|
        total_inventory[item] += amount
      end
    end
    total_inventory
  end

  def sell(item, quantity)
    if total_inventory[item] >= quantity
      move_stock(item, quantity)
      true
    else
      false
    end
  end

  def move_stock(sold, demand)
    @vendors.each do |vendor|
      if vendor.check_stock(sold) >= demand
        vendor.inventory[sold] -= demand
        demand = 0
      else
        difference = demand - vendor.check_stock(sold)
        vendor.inventory[sold] = 0
        demand = difference
      end
    end
  end

end

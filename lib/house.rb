class House
  attr_reader :price,
              :address,
              :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    if @price.gsub("$","").to_i > 5000000
      true
    else
      false
    end
  end

  def rooms_from_category(category)
    selected_rooms = []

    @rooms.each do |room|
      if room.category == category
        selected_rooms << room
      end
    end
    selected_rooms
  end

  def details
    {"price" => @price.gsub("$","").to_i, "address" => @address}
  end

  def price_per_square_foot
    total_square_feet = 0.0
    @rooms.each do |room|
      total_square_feet += room.area
    end

    (@price.gsub("$","").to_i / total_square_feet).round(2)
  end

  def rooms_sorted_by_area
    (@rooms.sort_by { |room| room.area}).reverse
  end

  # def rooms_by_category
  #   @rooms.sort_by { |room| room.category}
  # end
end

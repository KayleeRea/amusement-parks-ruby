class ParkOrganizer

  def by_id(input)
    hash = {}
    input.each do |info|
      id = info[:id]
      hash[id] = info
    end
    hash
  end

  def by_country(input)
    hash = {}
    input.each do |info|
      country = info[:country]
      hash[country] ||= []
      hash[country] << info
    end
    hash
  end

  def by_state_and_country(input)
    hash = {}
    input.each do |info|
      country = info[:country]
      state = info[:state]
      hash[state + ', ' + country] ||= []
      hash[state + ', ' + country] << info
    end
    hash
  end

end
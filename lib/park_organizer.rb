class ParkOrganizer

  def by_id(input)
    hash = {}
    input.each do |info|
      id = info.first[1]
      #hash = {id => info}
      hash[id] = info
    end
    hash
  end

  def by_country(input)
    hash = {}
    input.each do |info|
      country =  info.values.last
      hash[country] = info
    end
    hash
  end

    def by_state_and_country(input)
      hash = {}
       input.each do |info|
        country = info.values[3]
        state = info.values.last
        hash[country + ', ' + state] = [info]
       end
      hash
    end
end
require 'spec_helper'
require 'park_organizer'

describe ParkOrganizer do
  it 'returns a hash where the key is the id and the values are the information hashes' do
    input = [
      {
        :id=>546,
        :name=>"Kalahari Resorts",
      },
      {
        :id=>547,
        :name=>"Little Amerricka",
      }
    ]

    expected = {
      546 => {
        :id=>546,
        :name=>"Kalahari Resorts",
      },
      547 => {
        :id=>547,
        :name=>"Little Amerricka",
      }
    }

    organizer = ParkOrganizer.new

    expect(organizer.by_id(input)).to eq expected
  end

  it 'returns a hash where the key is the country and the values are arrays of parks for that country' do
    input = [
      {
        :id=>546,
        :name=>"Kalahari Resorts",
        :city=>"Wisconsin Dells",
        :state=>"Wisconsin",
        :country=>"United States"
      },
      {
        :id=>547,
        :name=>"Little Amerricka",
        :city=>"Marshall",
        :state=>"Wisconsin",
        :country=>"United States"
      },
      {
        :id=>2,
        :name=>"Calaway Park",
        :city=>"Calgary",
        :state=>"Alberta",
        :country=>"Canada"
      }
    ]

    expected = {
      "Canada" => [
        {
          :id=>2,
          :name=>"Calaway Park",
          :city=>"Calgary",
          :state=>"Alberta",
          :country=>"Canada"
        }
      ],
      "United States" => [
        {
          :id=>546,
          :name=>"Kalahari Resorts",
          :city=>"Wisconsin Dells",
          :state=>"Wisconsin",
          :country=>"United States"
        },
        {
          :id=>547,
          :name=>"Little Amerricka",
          :city=>"Marshall",
          :state=>"Wisconsin",
          :country=>"United States"
        }
      ]
    }
    organizer = ParkOrganizer.new
    expect(organizer.by_country(input)).to eq expected
  end

  it 'returns a hash where the key is the state and the country and the value is an array of park info for that state and country' do
    input = [
      {
        :id=>3,
        :name=>"Galaxyland",
        :city=>"Edmonton",
        :state=>"Alberta",
        :country=>"Canada"
      },
      {
        :id=>4,
        :name=>"Heratage Park",
        :city=>"Calgary",
        :state=>"Alberta",
        :country=>"Canada"
      },
      {
        :id=>6,
        :name=>"Playland (Vancouver)",
        :city=>"Vancouver",
        :state=>"British Columbia",
        :country=>"Canada"
      },
      {
        :id=>8,
        :name=>"Crystal Palace Amusement Park",
        :city=>"Dieppe",
        :state=>"New Brunswick",
        :country=>"Canada"
      }
    ]

    expected = {
      "Alberta, Canada" => [
        {
          :id => 3,
          :name => "Galaxyland",
          :city => "Edmonton",
          :state => "Alberta",
          :country => "Canada"
        },
        {
          :id => 4,
          :name => "Heratage Park",
          :city => "Calgary",
          :state => "Alberta",
          :country => "Canada"
        },
      ],
      "British Columbia, Canada" => [
        {
          :id => 6,
          :name => "Playland (Vancouver)",
          :city => "Vancouver",
          :state => "British Columbia",
          :country => "Canada"
        },
      ],
      "New Brunswick, Canada" => [
        {
          :id => 8,
          :name => "Crystal Palace Amusement Park",
          :city => "Dieppe",
          :state => "New Brunswick",
          :country => "Canada"
        }
      ]
    }

    organizer = ParkOrganizer.new

    expect(organizer.by_state_and_country(input)).to eq expected

  end
end
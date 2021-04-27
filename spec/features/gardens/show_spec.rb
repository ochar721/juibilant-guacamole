require 'rails_helper'

RSpec.describe 'Garden Show Page' do
  before(:each)do
    @community = Garden.create(name: "Community Garden", organic: true)

    @plot1 = @community.plots.create(number: 1, size: "Large", direction: "North")
    @plot2 = @community.plots.create(number: 3, size: "small", direction: "East")

    @catnip = Plant.create(name: "Catnip", description: "Good for cats", days_to_harvest: 20)
    @potato = Plant.create(name: "Plant", description: "Boil Em, Mash Em...", days_to_harvest: 10)
    @brussel = Plant.create(name: "Brussel Sprouts", description: "Tasty when roasted", days_to_harvest: 100)
    @corn = Plant.create(name: "Corn", description: "Tall Stalks", days_to_harvest: 101)
    @watermelon = Plant.create(name: "Watermelon", description: "Great to cool down", days_to_harvest: 38)
    @zucchini = Plant.create(name: "Zucchini", description: "Loves to grow on the ground", days_to_harvest: 2)

    PlotPlant.create(plot: @plot1, plant: @catnip)
    PlotPlant.create(plot: @plot1, plant: @potato)
    PlotPlant.create(plot: @plot1, plant: @brussel)
    PlotPlant.create(plot: @plot2, plant: @corn)
    PlotPlant.create(plot: @plot2, plant: @watermelon)
    PlotPlant.create(plot: @plot2, plant: @zucchini)

    visit garden_path(@community)
  end

  it "has the gardens name and ogranic attribut" do
    expect(page).to have_content(@community.name)
    expect(page).to have_content(@community.organic)
  end
end

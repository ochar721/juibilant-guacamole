require 'rails_helper'

RSpec.describe 'Garden Show Page' do
  before(:each)do
    @community = Garden.create(name: "Community Garden", organic: true)

    @plot1 = @community.plots.create(number: 1, size: "Large", direction: "North")
    @plot2 = @community.plots.create(number: 3, size: "small", direction: "East")

    @catnip = Plant.create(name: "Catnip", description: "Good for cats", days_to_harvest: 20)
    @potato = Plant.create(name: "Potato", description: "Boil Em, Mash Em...", days_to_harvest: 10)
    @brussel = Plant.create(name: "Brussel Sprouts", description: "Tasty when roasted", days_to_harvest: 100)
    @corn = Plant.create(name: "Corn", description: "Tall Stalks", days_to_harvest: 101)
    @watermelon = Plant.create(name: "Watermelon", description: "Great to cool down", days_to_harvest: 38)
    @watermelon1 = Plant.create(name: "Watermelon", description: "Great to cool down", days_to_harvest: 38)
    @zucchini = Plant.create(name: "Zucchini", description: "Loves to grow on the ground", days_to_harvest: 2)

    PlotPlant.create(plot: @plot1, plant: @catnip)
    PlotPlant.create(plot: @plot1, plant: @potato)
    PlotPlant.create(plot: @plot1, plant: @brussel)
    PlotPlant.create(plot: @plot1, plant: @watermelon1)

    PlotPlant.create(plot: @plot2, plant: @corn)
    PlotPlant.create(plot: @plot2, plant: @watermelon)
    PlotPlant.create(plot: @plot2, plant: @zucchini)

    visit garden_path(@community)
  end

  it "has the gardens name and ogranic attributes" do
    expect(page).to have_content(@community.name)
    expect(page).to have_content(@community.organic)
  end

  it "has a uniq list of plants, who are able to be harvested in under 100 days" do

    expect(page).to have_content(@catnip.name)
    expect(page).to have_content(@potato.name)
    expect(page).to have_content(@watermelon.name)
    expect(page).to have_content(@zucchini.name)

    expect(page).to_not have_content(@watermelon1)
    expect(page).to_not have_content(@corn)
    expect(page).to_not have_content(@brussel)
  end
end

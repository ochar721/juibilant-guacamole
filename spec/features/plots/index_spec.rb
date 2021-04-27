require 'rails_helper'

RSpec.describe 'Plots  Index Page' do
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

    visit plots_path
  end

  it "I see a list of all plot numbers" do
    expect(page).to have_content("Plots")
    expect(page).to have_content(@plot1.id)
    expect(page).to have_content(@plot2.id)
  end

  it "I see the names of all that plot's plants" do
    within "plot-#{@plot1.id}" do
    expect(page).to have_content(@catnip.name)
    expect(page).to have_content(@potato.name)
    expect(page).to have_content(@brussel.name)

    expect(page).to_not have_content(@corn.name)

      within "plot-#{@plot2.id}" do
        expect(page).to have_content(@corn.name)
        expect(page).to have_content(@watermlon.name)
        expect(page).to have_content(@zucchini.name)
      end
    end
  end
end

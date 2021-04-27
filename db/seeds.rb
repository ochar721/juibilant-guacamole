# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Garden.destroy_all
Plant.destroy_all
Plot.destroy_all
PlotPlant.destroy_all

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

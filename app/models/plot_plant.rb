class PlotPlant < ApplicationRecord
  belongs_to :plot
  belongs_to :plant
  has_many :gardens, through: :plot
end

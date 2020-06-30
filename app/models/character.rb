class Character < ApplicationRecord

  def health
    @health = 20 - rand(10)
  end

  def discount
    @discount = 10 - rand(5)
  end

  # def healthAndDiscountGenerator
  #   total_allocatable_points = 20
  #   :health = total_allocatable_points - rand(10)
  #   :discount = health - rand(10)
  # end

end

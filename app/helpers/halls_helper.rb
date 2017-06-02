module HallsHelper
  def hall_options()
    Hall.all.map{|c| [c.name_full+'('+c.name_short+')', c.id ]}
  end
end

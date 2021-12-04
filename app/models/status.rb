class Status < ApplicationRecord
  enum status: {"inprogress"=>0, "complete"=>1, "interested"=>2, "not_interested"=>3} 

  # Direct associations

  belongs_to :game,
             :class_name => "VideoGame"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    game.to_s
  end

end

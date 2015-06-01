class Request < ActiveRecord::Base
  include Parser

  has_many :offers

  #lets use friendlyId instead.
  # def to_param
    name.parameterize
  # end

end

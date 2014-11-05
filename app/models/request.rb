class Request < ActiveRecord::Base
  include Parser

  has_many :offers

end

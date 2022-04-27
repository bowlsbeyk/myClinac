class User < ApplicationRecord

  include Secured
  #see me
  #see me now!

  def is_complete?
    complete = true
    if self.first_name = ""
      complete = false
    end
    if self.last_name = ""
      complete = false
    end
    if self.email =""
      complete = false
    end
    return complete
  end

end

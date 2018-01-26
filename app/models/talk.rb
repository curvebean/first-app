class Talk < ApplicationRecord
    
    def sended_user
        return User.find_by(id: self.sended_user_id)
    end
    
    def send_user
      return User.find_by(id: self.send_user_id)
    end
end

class Room < ApplicationRecord
    validates :code, uniqueness: true

    def self.getCode

        code = (0...7).map { (65 + rand(26)).chr }.join
        while(Room.find_by_code(code))
            code = (0...7).map { (65 + rand(26)).chr }.join
        end
        return code
    end

    def owner
        User.find_by_id(self.owner_id)
    end
end

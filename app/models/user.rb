class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :wikis
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

         enum role: [:standard, :premium, :admin]
         after_initialize :set_default_role, :if => :new_record?

         def set_default_role
           self.role ||= :standard
         end

         def downgrade
           #Downgrades private wikis to public when a user downgrades their account status
           self.wikis.where(private: true).map{ |r| r.update_attributes(private: false) }

           #Downgrades a users account to standard
           self.standard!
         end

end

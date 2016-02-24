class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

         #Final refactoring eliminates need for delegate method
         has_many :collaborators
         has_many :wikis, through: :collaborators

         enum role: [:standard, :premium, :admin]
         after_initialize :set_default_role, :if => :new_record?

         #Delegate the calculation of wikis to the collaborators model to eliminate need for defining the wikis method (Rendered unnecessary by the Active Record association methods)
         #delegate :wikis, to: :collaborators

         def set_default_role
           self.role ||= :standard
         end

         def downgrade
           #Downgrades private wikis to public when a user downgrades their account status
           self.wikis.where(private: true).map{ |r| r.update_attributes(private: false) }

           #Downgrades a users account to standard
           self.standard!
         end

         #(Rendered unnecessary by the Active Record association methods)
         #def collaborators
           #Collaborator.where(user_id: id)
         #end

         #Code replaced by delegate method
         #def wikis
            #initial code before refactoring
            #Wiki.where( id: collaborators.pluck(:wiki_id) )

            #Code after refactoring to the collaborator.rb model
            #collaborators.wikis
         #end

end

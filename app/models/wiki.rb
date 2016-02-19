class Wiki < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  #Final refactoring eliminates need for delegate method
  has_many :collaborators
  has_many :users, through: :collaborators

  scope :visible_to, -> (user) { user ? all : where(private: false) }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true

  #Delegate the calculation of users to the collaborators model to eliminate need for defining the users method (Rendered unnecessary by the Active Record association methods)
  #delegate :users, to: :collaborators


  #(Rendered unnecessary by the Active Record association methods)
  #def collaborators
    #Collaborator.where(wiki_id: id)
  #end

  #Code replaced by delegate method
  #def users
    #Initial code before refactoring
    #User.where( id: collaborators.pluck(:user_id) )

    #Code after refactoring to the collaborator.rb model
    #collaborators.users
  #end

end

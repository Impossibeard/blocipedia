class Collaborator < ActiveRecord::Base

  belongs_to :user
  belongs_to :wiki

  #Code rendered unnecessary by the Active Record association methods
  #Delegate target of the User model
  #def self.wikis
    #Wiki.where( id: pluck(:wiki_id) )
  #end

  #Delegate target of the Wiki model
  #def self.users
    #User.where ( id: pluck(:user_id) )
  #end

  #def wiki
    #Wiki.find(wiki_id)
  #end

  #def user
    #User.find(user_id)
  #end
end

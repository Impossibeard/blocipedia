class WikiPolicy < ApplicationPolicy

  def update?
    user.present? && (record.user == user || user.admin? || record.users.include?(user))
  end

  def destroy?
    user.present? && (record.user == user || user.admin?)
  end

  class Scope
     attr_reader :user, :scope

     def initialize(user, scope)
       @user = user
       @scope = scope
     end

     def resolve
       wikis = []
       if user && user.role == 'admin'
         wikis = scope.all # if the user is an admin, show them all the wikis
       else
         #wikis = scope.all
         all_wikis = scope.all
         all_wikis.each do |wiki|
           if !wiki.private? || wiki.user == user || wiki.users.include?(user)
             wikis << wiki # if the user is premium, only show them public wikis, or that private wikis they created, or private wikis they are a collaborator on
           end
         end
       end
       wikis # return the wikis array we've built up
     end
   end
end

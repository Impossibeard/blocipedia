class CollaboratorsController < ApplicationController
  before_action :set_wiki

  def create
    @collaborator = User.find_by_email(params[:collaborator]) #pulled from email tag in collaborator form_for partial
    Collaborator.create(user_id: @collaborator.id, wiki_id: @wiki.id)
    #@collaborator = @wiki.collaborators.new(user_id: params[:user_id])

    if @collaborator.save
      flash[:notice] = "#{@collaborator.username} at #{@collaborator.email} has been added as a collaborator to #{@wiki.title}"
    else
      flash[:error] = "Adding of collaborator failed"
    end

    redirect_to @wiki
  end

  def destroy
    #@collaborator = @wiki.users.find(params[:id])
    #@collaboration = Collaborator.find_by(user_id: @collaborator.id, wiki_id: @wiki.id)
    @wiki = Wiki.find(params[:wiki_id])
    collaborator = Collaborator.find(params[:id])


    if collaborator.destroy
      flash[:notice] = "#{collaborator.user.username} at #{collaborator.user.email} has been removed from wiki: #{@wiki.title}"
    else
      flash[:error] = "Removal of collaborator failed"
    end

    redirect_to @wiki

  end

private
  def set_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end
end

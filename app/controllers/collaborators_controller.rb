class CollaboratorsController < ApplicationController

  def create
    wiki = Wiki.find(params[:wiki_id])
    collaborator = current_user.collaborators.build(wiki: wiki)

    if collaborator.save
      flash[:notice] = "Collaborator added"
    else
      flash[:error] = "Adding of collaborator failed"
    end

    redirect_to wiki
  end
end

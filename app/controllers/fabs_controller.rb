class FabsController < ApplicationController
  before_action :authenticate_user!

  def create
    @fab = current_user.fabs.build(fab_params)
    @post = @fab.post
    if @fab.save
      respond_to :js
    end
  end

  def destroy
    @fab = Fab.find_by(id: params[:id])
    @post = @fab.post
    if @fab.destroy
      respond_to :js
    end
  end
  
  private
    def fab_params
      params.permit(:post_id)
    end
end

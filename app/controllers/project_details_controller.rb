class ProjectDetailsController < ApplicationController
  before_action :set_project_detail, only: [:show, :edit, :update, :destroy]

  # GET /project_details
  # GET /project_details.json
  def index
    @project_details = ProjectDetail.all
  end

  # GET /project_details/1
  # GET /project_details/1.json
  def show
  end

  # GET /project_details/new
  def new
    @project_detail = ProjectDetail.new
  end

  # GET /project_details/1/edit
  def edit
  end

  # POST /project_details
  # POST /project_details.json
  def create
    @project_detail = ProjectDetail.new(project_detail_params)
    message = @project_detail.save ? 'Project detail was successfully created.' : 'Incomplete Information.'
    redirect_to discuss_your_project_path, notice: message
  end

  # PATCH/PUT /project_details/1
  # PATCH/PUT /project_details/1.json
  def update
    respond_to do |format|
      if @project_detail.update(project_detail_params)
        format.html { redirect_to @project_detail, notice: 'Project detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_detail }
      else
        format.html { render :edit }
        format.json { render json: @project_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_details/1
  # DELETE /project_details/1.json
  def destroy
    @project_detail.destroy
    respond_to do |format|
      format.html { redirect_to project_details_url, notice: 'Project detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_detail
      @project_detail = ProjectDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_detail_params
      params.require(:project_detail).permit(:name, :contact_no, :email, :country, :description)
    end
end

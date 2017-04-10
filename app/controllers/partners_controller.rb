class PartnersController < ApplicationController
  before_action :set_partner, only: [:show, :edit, :update, :destroy]

  PAGE_SIZE = 10

  # GET /partners
  # GET /partners.json
  def index

    @page = (params[:page] || 0).to_i

    if params[:keywords].present?
      @keywords = params[:keywords]
      @partners = Partner.where("lower(last_name) LIKE '%#{@keywords.downcase}%'").order(:last_name)
                 .offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
                 number_of_records = Partner.where("lower(last_name) LIKE '%#{@keywords.downcase}%'").count
    else
      @partners = Partner.order(:last_name).offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
      number_of_records = Partner.count
    end
      @number_of_pages = (number_of_records % PAGE_SIZE) == 0 ?
                    number_of_records / PAGE_SIZE - 1 : number_of_records / PAGE_SIZE
  end

  # GET /partners/1
  # GET /partners/1.json
  def show
  end

  # GET /partners/new
  def new
    @partner = Partner.new
  end

  # GET /partners/1/edit
  def edit
  end

  # POST /partners
  # POST /partners.json
  def create
    @partner = Partner.new(partner_params)

    respond_to do |format|
      if @partner.save
        format.html { redirect_to @partner, notice: 'Partner was successfully created.' }
        format.json { render :show, status: :created, location: @partner }
      else
        format.html { render :new }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partners/1
  # PATCH/PUT /partners/1.json
  def update
    respond_to do |format|
      if @partner.update(partner_params)
        format.html { redirect_to @partner, notice: 'Partner was successfully updated.' }
        format.json { render :show, status: :ok, location: @partner }
      else
        format.html { render :edit }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partners/1
  # DELETE /partners/1.json
  def destroy
    @partner.destroy
    respond_to do |format|
      format.html { redirect_to partners_url, notice: 'Partner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partner
      @partner = Partner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def partner_params
      params.require(:partner).permit(:first_name, :last_name, :dni)
    end
end

class DietasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dieta, only: [ :show, :edit, :update, :destroy ]
  def index
    @dietas = policy_scope(Dieta)
  end

  def show
    authorize @dieta
  end

  def new
    @dieta = Dieta.new

    @dieta.refeicoes.build
    authorize @dieta
  end

  def create
    @dieta = current_user.dietas.build(dieta_params)
    authorize @dieta

    if @dieta.save
      redirect_to @dieta, notice: "Dieta criada com sucesso!"
    else
      render :new
    end
  end

  def edit
    authorize @dieta
  end

  def update
    authorize @dieta
    if @dieta.update(dieta_params)
      redirect_to @dieta, notice: "Dieta atualizada com sucesso!"
    else
      @dieta.refeicoes.build if @dieta.refeicoes.empty?
      render :edit
    end
  end

  def destroy
    authorize @dieta
    @dieta.destroy
    redirect_to dietas_url, notice: "Dieta excluída com sucesso!"
  end

  private

  def set_dieta
    @dieta = Dieta.find(params[:id])
  end

  def dieta_params
    params.require(:dieta).permit(
      :id,
      :nome,
      :objetivo,
      :descricao,
      refeicoes_attributes: [
        :id,
        :nome,
        :descricao,
        :calorias,
        :proteinas,
        :carboidratos,
        :gorduras,
        :_destroy
      ]
      )
  end
end

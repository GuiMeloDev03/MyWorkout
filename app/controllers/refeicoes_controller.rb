class RefeicoesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dieta
  before_action :set_refeicao, only: [ :edit, :update, :destroy ]

  def create
    @refeicao = @dieta.refeicoes.build(refeicao_params)
    authorize @dieta, :update?

    if @refeicao.save
      redirect_to @dieta, notice: "Refeição adicionada com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @dieta, :update?
    @refeicao.destroy!
    redirect_to @dieta, notice: "Refeição excluída com sucesso.", status: :see_other
  end

  private

  def set_dieta
    @dieta = policy_scope(Dieta).find(params[:dieta_id])
  end

  def set_refeicao
    @refeicao = @dieta.refeicoes.find(params[:id])
  end

  def refeicao_params
    params.require(:refeicao).permit(
      :nome,
      :descricao,
      :calorias,
      :proteinas,
      :carboidratos,
      :gorduras
    )
  end
end

class ExercicioPlanosControlle < ApplicationController
  before_action :authenticate_user!
  before_action :set_dia_treino
  before_action :set_exercicio_plano, only: [ :update, :destroy ]

  def destroy
    authorize @dia_treino.treino, :update?
    @exercicios_plano.destroy!
    redirect_to @dia_treino.treino, notice: "Exercício excluído com sucesso."
  end

  private

  def set_dia_treino
    @dia_treino - policy_scope(DiaTreino).find(params[:id])
  end

  def set_exercicio_plano
    @exercicios_plano = @dia_treino.exercicio_planos.find(params[:id])
  end

  def exercicios_plano_params
    params.require(:exercicio_plano).permit(:nome, :series, :repeticoes, :carga, :observacoes)
  end
end

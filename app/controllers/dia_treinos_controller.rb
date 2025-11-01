class DiaTreinosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_treino
  before_action :set_dia_treino, only: [ :show, :edit, :update, :destroy ]

  def new
    @dia_treino = @treino.dia_treinos.build
    authorize @treino, :update?

    @dia_treino.exercicio_planos.build
  end

  def edit
    authorize @treino, :update?

    if @dia_treino.exercicio_planos.empty?
      @dia_treino.exercicio_planos.build
    end
  end

  def create
    @dia_treino = @treino.dia_treinos.build(dia_treino_params)
    authorize @treino, :update?

    if @dia_treino.save
      redirect_to @treino, notice: "Dia de treino criado com sucesso!"
    else
      @dia_treino.exercicio_planos.build if @dia_treino.exercicio_planos.empty?
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @treino, :update?
    if @dia_treino.update(dia_treino_params)
      redirect_to @treino, notice: "Dia de Treino atualizado com sucesso!"
    else
      @dia_treino.exercicio_planos.build if @dia_treino.exercicio_planos.empty?
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @treino, :update?
    @dia_treino.destroy!
    redirect_to @treino, notice: "Dia de treino excluído com sucesso.", status: :see_other
  end

  private

  def set_treino
    @treino = policy_scope(Treino).find(params[:treino_id])
  end

  def set_dia_treino
    @dia_treino = @treino.dia_treinos.find(params[:id])
  end

  def dia_treino_params
    params.require(:dia_treino).permit(
      :id,
      :nome,
      exercicio_planos_attributes: [
        :id,
        :exercicio_id,
        :series,
        :repeticoes,
        :carga,
        :observacoes,
        :_destroy
      ]
      )
  end
end

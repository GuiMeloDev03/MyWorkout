class TreinosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_treino, only: [ :show, :edit, :update, :destroy ]
  def index
    @treinos = policy_scope(Treino)
  end

  def show
    authorize @treino
  end

  def new
    @treino = current_user.treinos.build
    authorize @treino
  end

  def create
    @treino = current_user.treinos.build(treino_params)
    authorize @treino

    if @treino.save
      redirect_to @treino, notice: "Treino criado com sucesso! Agora adicione os Dias de Treino."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @treino
  end

  def update
    authorize @treino
    if @treino.update(treino_params)
      redirect_to @treino, notice: "Treino atualizado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @treino
    @treino.destroy
    redirect_to treinos_url, notice: "Treino excluído com sucesso.", status: :see_other
  end

  private

  def set_treino
    @treino = Treino.find(params[:id])
  end

  def treino_params
    params.require(:treino).permit(:nome, :objetivo)
  end
end

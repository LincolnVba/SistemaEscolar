class AlunosController < ApplicationController
  before_action :set_aluno, only: [:show, :edit, :update, :destroy]

  # GET /alunos
  # GET /alunos.json
  def index
    if params[:query]
      @alunos = Aluno.where("(LOWER(nome) like LOWER(:query))", {query: "%#{params[:query]}%"})
    else
      @alunos = Aluno.all
    end
  end

  # GET /alunos/1
  # GET /alunos/1.json
  def show
    if @aluno.provas.empty?
        4.times { @aluno.provas.build }
    end
  end

  # GET /alunos/new
  def new
    carrega_turmas
    @aluno = Aluno.new
  end

  # GET /alunos/1/edit
  def edit
    carrega_turmas
  end

  # POST /alunos
  # POST /alunos.json
  def create
    @aluno = Aluno.new(aluno_params)

    respond_to do |format|
      if @aluno.save
        format.html { redirect_to @aluno, notice: 'Aluno criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @aluno }
      else
        carrega_turmas
        format.html { render action: 'new' }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alunos/1
  # PATCH/PUT /alunos/1.json
  def update
    respond_to do |format|
      if @aluno.update(aluno_params)
        format.html { redirect_to @aluno, notice: 'Aluno atualizado com sucesso.' }
        format.json { head :no_content }
      else
        carrega_turmas
        if params[:aluno][:prova]
           format.html { render action: 'show' }
        else
          format.html { render action: 'edit' }
        end
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alunos/1
  # DELETE /alunos/1.json
  def destroy
    @aluno.destroy
    respond_to do |format|
      format.html { redirect_to alunos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aluno
      @aluno = Aluno.find(params[:id])
    end

     def carrega_turmas
        @turmas = Turma.all
     end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aluno_params
      params.require(:aluno).permit(:turma_id, :nome, provas_attributes: [:id, :nota])
    end
end

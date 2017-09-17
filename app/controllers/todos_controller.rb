class TodosController<ApplicationController

before_action :set_todo, only: [:show, :edit, :update,:destroy]


  def new
    @todo=Todo.new
  end
  
  def create
    @todo=Todo.new(todo_params)
    if @todo.save
      redirect_to todo_path(@todo)
      flash[:notificacion]="El todo se creó con exito"
    else
      render "new"
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @todo.update(todo_params)
      flash[:notificacion]="El todo se actualizó con exito"
      redirect_to todo_path(@todo)
    else
      render "edit"
    end
  end
  
  def index
    @todos=Todo.all
  end
  
  def destroy
     @todo.destroy
    flash[:notificacion]="El todo se eliminó con éxito"
    redirect_to todos_path
  end
  
  
  private 
  def set_todo
    @todo =Todo.find(params[:id])
  end
  
  def todo_params
    params.required(:todo).permit(:nombre,:descripcion)
  end
  
end

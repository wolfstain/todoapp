class TodosController<ApplicationController

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
    @todo = Todo.find(params[:id])
  end
  
  private 
  def todo_params
    params.required(:todo).permit(:nombre,:descripcion)
  end
  
end

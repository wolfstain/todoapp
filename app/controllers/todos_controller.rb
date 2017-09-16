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
  
  def edit
    @todo = Todo.find(params[:id])
  end
  
  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      flash[:notificacion]="El todo se actualizó con exito"
      redirect_to todo_path(@todo)
    else
      render "edit"
    end
  end
  
  private 
  def todo_params
    params.required(:todo).permit(:nombre,:descripcion)
  end
  
end

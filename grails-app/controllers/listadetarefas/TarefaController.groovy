package listadetarefas

class TarefaController {

    
    def index() {
        def totalCompleta
    	def lista = Tarefa.list()
    	def tarefaCompleta = Tarefa.createCriteria().list{ 
            projections {
                property('status')
                groupProperty('status')
                count()
            }
            eq ('status', 'N') 
        }
       //println tarefaCompleta
        if(tarefaCompleta){
         totalCompleta = tarefaCompleta[0][2] //
        }else{ totalCompleta  = 0}
        
        
        render(view:"/tarefa/index", model:[tarefas: lista, tarefaCount: Tarefa.count(), tarefaCompleta: totalCompleta])

    }

    def adicionar(){
       Tarefa  novaTarefa = new Tarefa()
    	novaTarefa.status = 'N'
        render(template:"form", model: [tarefa: novaTarefa])

    }

    def editar(){
        Tarefa tarefa = Tarefa.get(params.id)
        render(template:"form", model: [tarefa: tarefa])
    }

    def listar(){
       def lista = Tarefa.list()
       def totalCompleta
        def tarefaCompleta = Tarefa.createCriteria().list{ 
            projections {
                property('status')
                groupProperty('status')
                count()
            }
            eq ('status', 'N') 
        }
       //println tarefaCompleta
        if(tarefaCompleta){
            totalCompleta = tarefaCompleta[0][2] //
        }else{ totalCompleta  = 0}
         render(template:"lista", model:[tarefas: lista, tarefaCompleta: totalCompleta])
        }

    def ocultar(){
      render(template:"blank")
    }

    def deletar() {
        Tarefa tarefa = Tarefa.get(params.id)
        tarefa.delete(flush:true)
        redirect action: "index"
    }

    def completar() {
        Tarefa tarefa = Tarefa.get(params.id)
        tarefa.status = 'C'
        tarefa.save(flush:true)
        redirect action: "index"
    }

    def salvar(){
        Tarefa tarefa = null
        if(params.id){
            tarefa = Tarefa.get(params.id)
        }else{
            tarefa = new Tarefa()
        }
          
        //tarefa.status = 'N'
        Date dataInicial = new Date().parse("yyyy-MM-dd",params.dataFim)
        tarefa.nomeTarefa = params.nomeTarefa
        tarefa.dataFim = dataInicial
        def categoriaId = params.categoria.id.toLong()
        def categoria = Categoria.get(categoriaId)

        tarefa.categoria = categoria
        tarefa.validate()
        if(!tarefa.hasErrors()){
           tarefa.save(flush:true)
          
        }else{
            tarefa.errors.allErrors.each{println it}
            
        }
    }
}

package listadetarefas

class Categoria {
String nome
static hasMany = [tarefas: Tarefa]

    static constraints = {
    	nome(nullable:false, blank:false)
    }
     String toString() {
        return nome
    }
}
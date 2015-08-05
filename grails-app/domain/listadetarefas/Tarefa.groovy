package listadetarefas

class Tarefa {

    String nomeTarefa
	Date dataFim
	String status = 'N'//N=nova , C=completa
	static belongsTo = [categoria: Categoria]
	
    static constraints = {
    	nomeTarefa (nullable:false, blank:false)
    	dataFim (blank:false)
    	
    }
    static mapping ={
    	

    }
}

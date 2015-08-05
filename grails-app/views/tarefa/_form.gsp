
<section>
<g:formRemote id="taskForm" name="formTarefa" url="[controller: 'tarefa', action: 'salvar']" update="divMensagem" onSuccess="carregarLista()">

<div>
	<label>Tarefa</label> 
	<input type="text" name="nomeTarefa" class="large" required="required" placeholder="Estudar e programar" value="${tarefa.nomeTarefa}"/>
</div>
<div>
	<label>Finalizar até</label> <input type="date"  required="required" name="dataFim" value="<g:formatDate format='yyyy-MM-dd' date='${tarefa.dataFim}'/>" />
</div>
<div>
	<label>Categoria</label> 
	
	


<g:select id="categoria.id" name="categoria.id" from="${listadetarefas.Categoria.list()}" optionKey="id" required="" value="${tarefaInstance?.categoria?.id}" optionValue="nome" class="many-to-one"/> 
	
	
</div>
<nav>
	<input type="submit" id="saveTask" name="btnSalvar" value="Salvar tarefa" />
	<input type="reset" name="btnLimpar" id="clearTask" value="Limpar tarefa" />
	<g:link controller="categoria" action="create">Adicionar Categoria</g:link>
</nav>
     
	

</nav>
<input type="hidden" name="id" value="${tarefa.id}"/>
</g:formRemote>
</section>
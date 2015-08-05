
<section>
		<table id="tblTasks">
				<colgroup>
					 <col width="40%">
			         <col width="15%">
			         <col width="15%">
			         <col width="30%">
				</colgroup>
				<thead>
					<tr>
						<th>Nome</th>
						<th>Deadline</th>
						<th>Categoria</th>
						<th>Ações</th>
					</tr>
				</thead>
				
	<tbody>		
<g:each var="tarefa" in="${tarefas}">
<g:if test="${tarefa.status == 'C'}">                                  
    <tr class="Completed">                      
        <td class="taskCompleted">${tarefa?.nomeTarefa} </td>                        
        <td class="taskCompleted"><g:formatDate format="yyyy-MM-dd" date="${tarefa?.dataFim}" /></td>

        <td class="taskCompleted">${tarefa?.categoria}</td>                        
        
</g:if>
<g:elseif test="${tarefa.dataFim < (new Date() - 1)}">
	 <tr class="overdue">                      
        <td class="overdue">${tarefa.nomeTarefa} </td>                        
        <td class="overdue"><g:formatDate format="yyyy-MM-dd" date="${tarefa.dataFim}" /></td>
        <td class="overdue">${tarefa.categoria}</td>                        
</g:elseif>
<g:elseif test="${tarefa.dataFim - (new Date() + 3) <= 3  && tarefa.dataFim - (new Date() +3 ) >= 0 }">
	 <tr class="warning">                      
        <td class="warning">${tarefa.nomeTarefa} </td>                        
        <td class="warning"><g:formatDate format="yyyy-MM-dd" date="${tarefa.dataFim}" /></td>
        <td class="warning">${tarefa.categoria}</td>                        
</g:elseif>


<g:else>
    <tr class="">                      
        <td class="">${tarefa.nomeTarefa} </td>                        
        <td class=""><g:formatDate  format="yyyy-MM-dd" date="${tarefa.dataFim}" /></td>                        
        <td class="">${tarefa.categoria}</td>                        
         
</g:else>

        <g:form resource="${tarefa}" method="DELETE">
        <fieldset class="buttons" style="background-color: transparent!important; -webkit-box-shadow: none!important;">
        <td>
            <g:if test="${tarefa.status == 'N'}">
              
					<nav>
						<g:remoteLink class="editRow" controller="tarefa" action="editar" update="divForm" resource="${tarefa}">Edit</g:remoteLink>
						<g:link class="completeRow" action="completar" resource="${tarefa}">Complete</g:link>
						<g:link class="deleteRow" action="deletar" resource="${tarefa}">Delete</g:link>
					</nav>	
				
            </g:if>
            <g:else>
            
            <nav>
            	<g:link class="deleteRow" action="deletar" resource="${tarefa}">Delete</g:link>
            </nav>
           
            </g:else>
         </td> 
        </fieldset>
    </g:form>
   

</g:each>
 </tbody>
     
</table>
</body>	
</section>

<section>
<nav>
<g:remoteLink controller="tarefa" action="adicionar" update="divForm" id="btnAddTask">Adicionar Tarefa</g:remoteLink>

</section>
<footer> Você tem <span>${tarefaCompleta} Tarefas</span></footer>
 


<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        
        
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

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
                        <th>Ações</th>
                        
                    </tr>
                </thead>
                
    <tbody>     



            <g:each var="categoria" in="${lista}">

             <tr class="">                      
            <td class="">${categoria.nome} </td> 
            <td>
                <nav>
                 <g:form resource="${categoria}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${categoria}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
                </nav>

            </td>
            </tr>                       

         </g:each>
     </table>
 </section>

            <div class="pagination">
                <g:paginate total="${categoriaCount ?: 0}" />
            </div>
        </div>
        <div >
            <section>
            <nav>
              <!--<a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label" /></a>-->
               <g:link controller="tarefa" action="index" >Tarefa</g:link>
                <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
            </nav>
             </section>
        </div>
    </body>
</html>
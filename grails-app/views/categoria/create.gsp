<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
      <section>
        
            <nav><a class="home" href="${createLink(uri: '/tarefa')}">Tarefa</a>
                <g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
            </nav>
       
        <div id="create-categoria" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.categoria}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.categoria}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <f:field bean="categoria" property="nome" input-placeholder="Nome da nova Categoria"/>
                </fieldset>
                <nav>
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </nav>
            </g:form>
        </div>
   </section>
    </body>
</html>

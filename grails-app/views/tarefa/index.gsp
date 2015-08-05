<!doctype html>
<html>
    <head>
       <meta name="layout" content="main"/>
       
       <g:javascript library="jquery/jquery"/>


      <script type="text/javascript">
        function carregarLista(){
            <g:remoteFunction controller="tarefa" action="listar" update="divLista" />
            <g:remoteFunction controller="tarefa" action="ocultar" update="divForm" />
            
        }
    </script>

  </head>
    <body>

<div id="divForm"> </div>

<div id="divLista"> 
    <g:render template="lista" model= "[tarefas: tarefas]"></g:render>
</div>


</html>

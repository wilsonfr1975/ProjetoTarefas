class MyAppTagLib {
    def redirectMainPage = {
      response.sendRedirect("${request.contextPath}/tarefa/index/")
    }
  }
package listadetarefas

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CategoriaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def  categoriaLista = Categoria.list()
        
        respond Categoria.list(), model:[categoriaCount: Categoria.count(), lista: categoriaLista]
    }

    def show(Categoria categoria) {
        respond categoria
    }

    def create() {
        respond new Categoria(params)
    }

    @Transactional
    def save(Categoria categoria) {
        if (categoria == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (categoria.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond categoria.errors, view:'create'
            return
        }

        categoria.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'categoria.label', default: 'Categoria'), categoria.id])
                redirect view:'index'
            }
            '*' { respond categoria, [status: CREATED] }
        }
    }

    def edit(Categoria categoria) {
        respond categoria
    }

    @Transactional
    def update(Categoria categoria) {
        if (categoria == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (categoria.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond categoria.errors, view:'edit'
            return
        }

        categoria.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'categoria.label', default: 'Categoria'), categoria.id])
                redirect categoria
            }
            '*'{ respond categoria, [status: OK] }
        }
    }

    @Transactional
    def delete(Categoria categoria) {

        if (categoria == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        categoria.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'categoria.label', default: 'Categoria'), categoria.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

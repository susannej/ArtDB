package artdb

import grails.validation.ValidationException
import org.springframework.web.multipart.MultipartFile

import static org.springframework.http.HttpStatus.*

class PaintingController {

    PaintingService paintingService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond paintingService.list(params), model:[paintingCount: paintingService.count()]
    }

    def show(Long id) {
        respond paintingService.get(id)
    }

    def create() {
        respond new Painting(params)
    }

    def save(Painting painting) {
        if (painting == null) {
            notFound()
            return
        }

        painting.acqCompl = params.acqCompl == 'on'? true : false
        painting.web = params.web == 'on'? true : false

        if (params.paintingImageUp) {
            def parameter = SyParameter.findByKeyValue('SpeicherplatzBilder')
            String uploadPath = parameter.value
            println "Upload- SpeicherplatzBilder = " + uploadPath

            // Create the upload-path if it doesn't exist
            def uploadPathFile = new File(uploadPath)
            if (!uploadPathFile.exists()) {
                uploadPathFile.mkdirs()
            }
            MultipartFile file = request.getFile('paintingImageUp')
            if (!file.empty) {
                String name = file.originalFilename
                println "Upload- originalFilename = " + name

                File tempFile = File.createTempFile('ArtDB_', '_' + name, uploadPathFile)
                file.transferTo(tempFile)

                painting.paintingImage = tempFile.name
            }
        }

        try {
            paintingService.save(painting)
        } catch (ValidationException e) {
            respond painting.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'painting.label', default: 'Painting'), painting.id])
                //redirect painting
                redirect action:"index", method:"GET"
            }
            '*' { respond painting, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond paintingService.get(id)
    }

    def update(Painting painting) {
        if (painting == null) {
            notFound()
            return
        }

        painting.acqCompl = params.acqCompl == 'on'? true : false
        painting.web = params.web == 'on'? true : false

        if (params.paintingImageUp) {
            def parameter = SyParameter.findByKeyValue('SpeicherplatzBilder')
            String uploadPath = parameter.value
            println "Upload- SpeicherplatzBilder = " + uploadPath

            // Create the upload-path if it doesn't exist
            def uploadPathFile = new File(uploadPath)
            if (!uploadPathFile.exists()) {
                uploadPathFile.mkdirs()
            }
            MultipartFile file = request.getFile('paintingImageUp')
            if (!file.empty) {
                String name = file.originalFilename
                println "Upload- originalFilename = " + name

                File tempFile = File.createTempFile('ArtDB_', '_' + name, uploadPathFile)
                file.transferTo(tempFile)

                painting.paintingImage = tempFile.name
            }
        }

        try {
            paintingService.save(painting)
        } catch (ValidationException e) {
            respond painting.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'painting.label', default: 'Painting'), painting.id])
                //redirect painting
                redirect action:"index", method:"GET"
            }
            '*'{ respond painting, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        paintingService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'painting.label', default: 'Painting'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'painting.label', default: 'Painting'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def image(Painting painting) {
        def imagePath = SyParameter.findByKeyValue('SpeicherplatzBilder').value

        File file
        if (imagePath != null && painting?.paintingImage != null && painting?.paintingImage.size() > 0) {
            file = new File(imagePath + "/" + painting.paintingImage)
        } else {
            file = new File(imagePath + "/default.png")
        }

        if(!file.exists()) {
            response.status = 404
        } else {
            OutputStream out = response.getOutputStream();
            out.write(file.bytes);
            out.close();
        }
    }
}

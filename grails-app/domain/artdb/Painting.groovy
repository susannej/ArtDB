package artdb

import tools.YesNoType

class Painting {

    boolean acqCompl = false

    String paintingImage

    // Deutsch
    String titleDe
    String descriptionDe

    // English
    String titleEn
    String descriptionEn

    // Farsi
    String titleFa
    String descriptionFa

    Date creationTime

    Place place
    String owner
    String ort

    Category category
    Material material
    Technic technic

    boolean web

    int height
    int width
    int depth

    static mapping = {
        table name: 'paintings'
        acqCompl type: 'tools.YesNoType'
        descriptionDe type: 'text'
        descriptionEn type: 'text'
        descriptionFa type: 'text'
        web type: 'tools.YesNoType'
    }

    static constraints = {
        paintingImage nullable: true
        titleDe nullable: true
        descriptionDe nullable: true
        titleEn nullable: true
        descriptionEn nullable: true
        titleFa nullable: true
        descriptionFa nullable: true
        creationTime nullable: true
        place nullable: true
        owner nullable: true
        ort nullable: true
        category nullable: true
        material nullable: true
        technic nullable: true
        height nullable: true
        width nullable: true
        depth nullable: true
    }

}

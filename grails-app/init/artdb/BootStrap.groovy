package artdb

import org.apache.shiro.authc.credential.PasswordService
import artdb.SyParameter

class BootStrap {

    PasswordService credentialMatcher

    def init = { servletContext ->
        //ParserRegistry.setDefaultCharset("UTF-8")
        ShiroRole.withTransaction {

            /* Create Roles if not existent */
            def role = ShiroRole.findByName("Admin")
            if (!role) {
                role = new ShiroRole(name: "Admin")
                role.addToPermissions("*:*")
                role.save(flush: true, failOnError: true)
            }
            role = ShiroRole.findByName("User")
            if (!role) {
                role = new ShiroRole(name: "User")
                role.addToPermissions("dashboard:*")
                role.addToPermissions("painting:*")
                role.addToPermissions("place:*")
                role.addToPermissions("category:*")
                role.addToPermissions("material:*")
                role.addToPermissions("technic:*")
                role.save(flush: true, failOnError: true)
            }
            role = ShiroRole.findByName("Guest")
            if (!role) {
                role = new ShiroRole(name: "Guest")
                role.addToPermissions("dashboard:index")
                role.addToPermissions("painting:index")
                role.addToPermissions("painting:show")
                role.save(flush: true, failOnError: true)
            }

            /* Create Admin-User if not existent */
            def existingUser = ShiroUser.findByUsername("admin")
            if (!existingUser) {
                def firstUser = new ShiroUser(username: "admin", active: true, passwordHash: credentialMatcher.encryptPassword("admin"))
                firstUser.addToRoles(ShiroRole.findByName"Admin")
                firstUser.save(flush: true, failOnError: true)
            }
        }

        SyParameter.withTransaction {

            /* create SyParameter which should exist */
            def parm = SyParameter.findByKeyValue("SpeicherplatzBilder")
            if (!parm) {
                parm = new SyParameter(keyValue: 'SpeicherplatzBilder', value: '/var/ArtDB/Bilder')
                parm.save(flush: true, failOnError: true)
            }

            parm = SyParameter.findByKeyValue("TempUploadOrdner")
            if (!parm) {
                parm = new SyParameter(keyValue: 'TempUploadOrdner', value: '/var/ArtDB/TempUpload')
                parm.save(flush: true, failOnError: true)
            }

        }
    }
    def destroy = {
    }
}

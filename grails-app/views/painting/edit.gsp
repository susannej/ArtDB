<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'painting.label', default: 'Painting')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <g:if test="${flash.message}">
        <div class="alert alert-info alert-dismissible text-white" role="alert">
            <span class="text-sm">${flash.message}</span>
            <button type="button" class="btn-close text-lg py-3 opacity-10" data-bs-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">×</span>
            </button>
        </div>
    </g:if>
    <g:hasErrors bean="${this.painting}">
        <g:eachError bean="${this.painting}" var="error">
            <div class="alert alert-info alert-dismissible text-white" role="alert">
                <span class="text-sm"><g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></span>
                <button type="button" class="btn-close text-lg py-3 opacity-10" data-bs-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
        </g:eachError>
    </g:hasErrors>
    <div class="row">
        <div class="col-lg-12">
            <div class="col-md-12 mb-lg-0 mb-4 ">
                <div class="card ">
                    <div class="card-header pb-0 p-3 ">
                        <div class="row">
                            <div class="col-12 d-flex align-items-center">
                                <h4 class="mb-0"><g:message code="default.edit.label" args="[entityName]" /></h4>
                            </div>
                        </div>
                    </div>
                    <div class="card-body p-3">
                        <div class="row">
                            <div class="col-md-12 mb-md-0 mb-4 ">
                                <div class="card card-body card-plain border-radius-lg align-items-lg-start col-12 ">
                                    <g:uploadForm resource="${this.painting}" method="PUT" class="col-12">
                                        <g:hiddenField name="version" value="${this.painting?.version}" />
                                        <g:render template="form"/>
                                        <fieldset class="buttons">
                                            <g:link class="btn btn-outline-secondary" action="index" resource="${this.painting}"><g:message code="default.button.cancel.label" default="Abbruch" /></g:link>
                                            <input class="btn btn-info save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                                        </fieldset>
                                    </g:uploadForm>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    </body>
</html>
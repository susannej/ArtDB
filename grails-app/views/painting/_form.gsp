<%@ page import="artdb.Painting" %>
<%@ page import="artdb.Place" %>
<%@ page import="artdb.Category" %>
<%@ page import="artdb.Material" %>
<%@ page import="artdb.Technic" %>

<table style="border: 0px; width: 100%">
    <tr>
        <td style="width: 33%;">
            <div class="form-check form-switch ps-0">
                <input class="form-check-input ms-auto" type="checkbox" id="acqCompl" name="acqCompl" ${painting?.acqCompl? 'checked' : ''} ${(actionName == 'show')? 'disabled' : ''}>
                <label class="form-check-label text-body ms-3 text-truncate w-80 mb-0" for="flexSwitchCheckDefault"><g:message code="painting.status.label" default="Erfassung beendet" /></label>
            </div>
        </td>
        <td rowspan="2" style="width: 33%;">
            <img src="${request.contextPath}/painting/image/${painting?.id}" class="vwtooltip me-3 border-radius-lg" style="max-width: 250px; max-height: 250px;" max="600px" alt="user1">
        </td>
        <td>
            <g:if test="${actionName != 'show'}">
                <label class="form-label col-6" ><nobr>Bilddatei</nobr></label>
            </g:if>
        </td>
        <td>
            <g:if test="${actionName != 'show'}">
                <input type="file" id="paintingImageUp" name="paintingImageUp" class="btn btn-outline-secondary col-6"/>
            </g:if>
        </td>
    </tr>
    <tr>
        <td style="width: 33%;">
            <div class="form-check form-switch ps-0">
                <input class="form-check-input ms-auto" type="checkbox" id="web" name="web" ${painting?.web? 'checked' : ''} ${(actionName == 'show')? 'disabled' : ''}>
                <label class="form-check-label text-body ms-3 text-truncate w-80 mb-0" for="flexSwitchCheckDefault"><g:message code="painting.web.label" default="Auf WEB-Seite veröffentlichen" /></label>
            </div>
        </td>
        <td>
        </td>
        <td>
        </td>
    </tr>
</table>

<br>

<!-- ------------------------------------------------------------------
   3 Sprachiger Titel und Beschreibung
------------------------------------------------------------------- -->

<nav class="col-12 ">
    <div class="nav nav-tabs" id="nav-tab" role="tablist" class="col-12 ">
        <button class="nav-link active" id="title-de-tab" data-bs-toggle="tab" data-bs-target="#title-de" type="button" role="tab" aria-controls="title-de" aria-selected="true"><g:message code="language.de" /></button>
        <button class="nav-link" id="title-en-tab" data-bs-toggle="tab" data-bs-target="#title-en" type="button" role="tab" aria-controls="title-en" aria-selected="false"><g:message code="language.en" /></button>
        <button class="nav-link" id="title-fa-tab" data-bs-toggle="tab" data-bs-target="#title-fa" type="button" role="tab" aria-controls="title-fa" aria-selected="false"><g:message code="language.fa" /></button>
    </div>
</nav>
<div class="tab-content" id="nav-tabContent col-12">
    <div class="tab-pane fade show active col-12" id="title-de" role="tabpanel" aria-labelledby="title-de-tab">

        <br>
        <div class="form-group col-12">
            <div class="row col-12">
                <label for="titleDe" class="col-2 control-label col-form-label text-end ${hasErrors(bean: painting, field: 'titleDe', 'text-danger')}">
                    <b><g:message code="painting.titleDe.label" default="Titel" /></b>
                </label>
                <div class="col-8">
                    <div class="input-group input-group-outline mb-1">
                        <g:if test="${actionName == 'show'}">
                            <g:textField class="form-control" id="titleDe" name="titleDe" value="${painting?.titleDe}"  disabled="true" />
                        </g:if>
                        <g:else>
                            <g:textField class="form-control ${hasErrors(bean: painting, field: 'titleDe', 'text-danger')}" id="titleDe" name="titleDe" value="${painting?.titleDe}"   />
                        </g:else>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group col-12">
            <div class="row col-12">
                <label for="descriptionDe" class="col-2 control-label col-form-label text-end ${hasErrors(bean: painting, field: 'descriptionDe', 'text-danger')}">
                    <b><g:message code="painting.descriptionDe.label" default="Beschreibung" /></b>
                </label>
                <div class="col-8">
                    <div class="input-group input-group-outline mb-1">
                        <g:if test="${actionName == 'show'}">
                            <textarea class="form-control ${hasErrors(bean: painting, field: 'descriptionDe', 'text-danger')}" id="descriptionDe" name="descriptionDe" rows="7" disabled>${painting?.descriptionDe}</textarea>
                        </g:if>
                        <g:else>
                            <textarea class="form-control ${hasErrors(bean: painting, field: 'descriptionDe', 'text-danger')}" id="descriptionDe" name="descriptionDe" rows="7" >${painting?.descriptionDe}</textarea>
                        </g:else>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="tab-pane fade" id="title-en" role="tabpanel" aria-labelledby="title-en-tab">

        <br>
        <div class="form-group col-12">
            <div class="row col-12">
                <label for="titleEn" class="col-2 control-label col-form-label text-end ${hasErrors(bean: painting, field: 'titleEn', 'text-danger')}">
                    <b><g:message code="painting.titleEn.label" default="Title" /></b>
                </label>
                <div class="col-8">
                    <div class="input-group input-group-outline mb-1">
                        <g:if test="${actionName == 'show'}">
                            <g:textField class="form-control" id="titleEn" name="titleEn" value="${painting?.titleEn}"  disabled="true" />
                        </g:if>
                        <g:else>
                            <g:textField class="form-control ${hasErrors(bean: painting, field: 'titleEn', 'text-danger')}" id="titleEn" name="titleEn" value="${painting?.titleEn}"   />
                        </g:else>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group col-12">
            <div class="row col-12">
                <label for="descriptionEn" class="col-2 control-label col-form-label text-end ${hasErrors(bean: painting, field: 'descriptionEn', 'text-danger')}">
                    <b><g:message code="painting.descriptionEn.label" default="Description" /></b>
                </label>
                <div class="col-8">
                    <div class="input-group input-group-outline mb-1">
                        <g:if test="${actionName == 'show'}">
                            <textarea class="form-control ${hasErrors(bean: painting, field: 'descriptionEn', 'text-danger')}" id="descriptionEn" name="descriptionEn" rows="7" disabled>${painting?.descriptionEn}</textarea>
                        </g:if>
                        <g:else>
                            <textarea class="form-control ${hasErrors(bean: painting, field: 'descriptionEn', 'text-danger')}" id="descriptionEn" name="descriptionEn" rows="7" >${painting?.descriptionEn}</textarea>
                        </g:else>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="tab-pane fade" id="title-fa" role="tabpanel" aria-labelledby="title-fa-tab">

        <br>
        <div class="form-group col-12">
            <div class="row col-12">
                <label for="titleFa" class="col-2 control-label col-form-label text-end ${hasErrors(bean: painting, field: 'titleFa', 'text-danger')}">
                    <b><g:message code="painting.titleFa.label" default="Titel" /></b>
                </label>
                <div class="col-8">
                    <div class="input-group input-group-outline mb-1">
                        <g:if test="${actionName == 'show'}">
                            <g:textField class="form-control" id="titleFa" name="titleFa" value="${painting?.titleFa}"  disabled="true" />
                        </g:if>
                        <g:else>
                            <g:textField class="form-control ${hasErrors(bean: painting, field: 'titleFa', 'text-danger')}" id="titleFa" name="titleFa" value="${painting?.titleFa}"   />
                        </g:else>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group col-12">
            <div class="row col-12">
                <label for="descriptionFa" class="col-2 control-label col-form-label text-end ${hasErrors(bean: painting, field: 'descriptionFa', 'text-danger')}">
                    <b><g:message code="painting.descriptionFa.label" default="Beschreibung" /></b>
                </label>
                <div class="col-8">
                    <div class="input-group input-group-outline mb-1">
                        <g:if test="${actionName == 'show'}">
                            <textarea class="form-control ${hasErrors(bean: painting, field: 'descriptionFa', 'text-danger')}" id="descriptionFa" name="descriptionFa" rows="7" disabled>${painting?.descriptionFa}</textarea>
                        </g:if>
                        <g:else>
                            <textarea class="form-control ${hasErrors(bean: painting, field: 'descriptionFa', 'text-danger')}" id="descriptionFa" name="descriptionFa" rows="7" >${painting?.descriptionFa}</textarea>
                        </g:else>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<hr style="margin: 1rem 0; color: inherit; background-color: currentColor; border: 0; opacity: 0.25;" />

<div class="form-group col-12">
    <div class="row col-12">
        <label for="height" class="col-2 control-label col-form-label text-end ${hasErrors(bean: painting, field: 'height', 'text-danger')}">
            <b><g:message code="painting.height.label" default="Höhe" /></b>
        </label>
        <div class="row col-2">
            <div class="col-6">
                <div class="input-group input-group-outline mb-1">
                    <g:if test="${actionName == 'show'}">
                        <g:textField class="form-control" id="height" name="height" value="${painting?.height}"  disabled="true" />
                    </g:if>
                    <g:else>
                        <g:textField class="form-control ${hasErrors(bean: painting, field: 'height', 'text-danger')}" id="height" name="height" value="${painting?.height}"   />
                    </g:else>
                </div>
            </div>
        </div>
        <div class="row col-3">
            <label for="width" class="col-6 control-label col-form-label text-end ${hasErrors(bean: painting, field: 'width', 'text-danger')}">
                <b><g:message code="painting.width.label" default="Breite" /></b>
            </label>
            <div class="col-4">
                <div class="input-group input-group-outline mb-1">
                    <g:if test="${actionName == 'show'}">
                        <g:textField class="form-control" id="width" name="width" value="${painting?.width}"  disabled="true" />
                    </g:if>
                    <g:else>
                        <g:textField class="form-control ${hasErrors(bean: painting, field: 'width', 'text-danger')}" id="width" name="width" value="${painting?.width}"   />
                    </g:else>
                </div>
            </div>
        </div>
        <div class="row col-3">
            <label for="depth" class="col-6 control-label col-form-label text-end ${hasErrors(bean: painting, field: 'depth', 'text-danger')}">
                <b><g:message code="painting.depth.label" default="Tiefe" /></b>
            </label>
            <div class="col-4">
                <div class="input-group input-group-outline mb-1">
                    <g:if test="${actionName == 'show'}">
                        <g:textField class="form-control" id="depth" name="depth" value="${painting?.depth}"  disabled="true" />
                    </g:if>
                    <g:else>
                        <g:textField class="form-control ${hasErrors(bean: painting, field: 'depth', 'text-danger')}" id="depth" name="depth" value="${painting?.depth}"   />
                    </g:else>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="form-group col-12">
    <div class="row col-12">
        <label for="creationTime" class="col-2 control-label col-form-label text-end ${hasErrors(bean: painting, field: 'creationTime', 'text-danger')}">
            <b><g:message code="painting.creationTime.label" default="Datum" /></b>
        </label>
        <div class="col-2">
            <div class="input-group input-group-outline mb-1">
                <g:if test="${actionName == 'show'}">
                    <g:jqDatePicker id="creationTime" name="creationTime" precision="day"  value="${((Date) painting?.creationTime)}"   disabled="true" />
                </g:if>
                <g:else>
                    <g:jqDatePicker id="creationTime" name="creationTime" precision="day"  value="${painting?.creationTime}"   />
                </g:else>
            </div>
        </div>
    </div>
</div>

<div class="form-group col-12">
    <div class="row col-12">
        <label for="ort" class="col-2 control-label col-form-label text-end ${hasErrors(bean: painting, field: 'ort', 'text-danger')}">
            <b><g:message code="painting.ort.label" default="ort" /></b>
        </label>
        <div class="col-8">
            <div class="input-group input-group-outline mb-1">
                <g:if test="${actionName == 'show'}">
                    <g:textField class="form-control" id="ort" name="ort" value="${painting?.ort}"  disabled="true" />
                </g:if>
                <g:else>
                    <g:textField class="form-control ${hasErrors(bean: painting, field: 'ort', 'text-danger')}" id="ort" name="ort" value="${painting?.ort}"   />
                </g:else>
            </div>
        </div>
    </div>
</div>

<div class="form-group col-12">
    <div class="row col-12">
        <label for="owner" class="col-2 control-label col-form-label text-end ${hasErrors(bean: painting, field: 'owner', 'text-danger')}">
            <b><g:message code="painting.owner.label" default="owner" /></b>
        </label>
        <div class="col-8">
            <div class="input-group input-group-outline mb-1">
                <g:if test="${actionName == 'show'}">
                    <g:textField class="form-control" id="owner" name="owner" value="${painting?.owner}"  disabled="true" />
                </g:if>
                <g:else>
                    <g:textField class="form-control ${hasErrors(bean: painting, field: 'owner', 'text-danger')}" id="owner" name="owner" value="${painting?.owner}"   />
                </g:else>
            </div>
        </div>
    </div>
</div>

<div class="form-group col-12">
    <div class="row col-12">
        <label for="category" class="col-2 control-label col-form-label text-end ${hasErrors(bean: painting, field: 'category', 'text-danger')}">
            <b><g:message code="category.label" default="category" /></b>
        </label>
        <div class="col-2">
            <div class="input-group input-group-outline mb-1">
                <g:if test="${actionName == 'show'}">
                    <g:select id="category" name='category.id' value="${painting?.category?.id}"
                              noSelection="${['null':'Select One...']}"
                              from='${Category.list()}'
                              optionKey="id" disabled="true" />
                </g:if>
                <g:else>
                    <g:select id="category" name='category.id' class="form-select input-group input-group-outline"
                              value="${painting?.category?.id}"
                              noSelection="${['null':'Select One...']}"
                              from='${Category.list()}'
                              optionKey="id" />
                </g:else>
            </div>
        </div>
    </div>
</div>

<div class="form-group col-12">
    <div class="row col-12">
        <label for="material" class="col-2 control-label col-form-label text-end ${hasErrors(bean: painting, field: 'material', 'text-danger')}">
            <b><g:message code="material.label" default="material" /></b>
        </label>
        <div class="col-2">
            <div class="input-group input-group-outline mb-1">
                <g:if test="${actionName == 'show'}">
                    <g:select id="material" name='material.id' value="${painting?.material?.id}"
                              noSelection="${['null':'Select One...']}"
                              from='${Material.list()}'
                              optionKey="id" disabled="true" />
                </g:if>
                <g:else>
                    <g:select id="material" name='material.id' class="form-select input-group input-group-outline"
                              value="${painting?.material?.id}"
                              noSelection="${['null':'Select One...']}"
                              from='${Material.list()}'
                              optionKey="id" />
                </g:else>
            </div>
        </div>
    </div>
</div>

<div class="form-group col-12">
    <div class="row col-12">
        <label for="technic" class="col-2 control-label col-form-label text-end ${hasErrors(bean: painting, field: 'technic', 'text-danger')}">
            <b><g:message code="technic.label" default="technic" /></b>
        </label>
        <div class="col-2">
            <div class="input-group input-group-outline mb-1">
                <g:if test="${actionName == 'show'}">
                    <g:select id="technic" name='technic.id' value="${painting?.technic?.id}"
                              noSelection="${['null':'Select One...']}"
                              from='${Technic.list()}'
                              optionKey="id" disabled="true" />
                </g:if>
                <g:else>
                    <g:select id="technic" name='technic.id' class="form-select input-group input-group-outline"
                              value="${painting?.technic?.id}"
                              noSelection="${['null':'Select One...']}"
                              from='${Technic.list()}'
                              optionKey="id" />
                </g:else>
            </div>
        </div>
    </div>
</div>

<br>

<div class="form-group col-12">
    <div class="row col-12">
        <label for="place" class="col-2 control-label col-form-label text-end ${hasErrors(bean: painting, field: 'place', 'text-danger')}">
            <b><g:message code="places.label" default="Ort" /></b>
        </label>
        <div class="col-2">
            <div class="input-group input-group-outline mb-1">
                <g:if test="${actionName == 'show'}">
                    <g:select id="place" name='place.id' value="${painting?.place?.id}"
                              noSelection="${['null':'Select One...']}"
                              from='${Place.list()}'
                              optionKey="id" optionValue="shortDesc" disabled="true" />
                </g:if>
                <g:else>
                    <g:select id="place" name='place.id' class="form-select input-group input-group-outline"
                        value="${painting?.place?.id}"
                        noSelection="${['null':'Select One...']}"
                        from='${Place.list()}'
                        optionKey="id" optionValue="shortDesc" />
                </g:else>
            </div>
        </div>
    </div>
</div>

<br>
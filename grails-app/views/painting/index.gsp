<%--
  Created by IntelliJ IDEA.
  User: susanne
  Date: 04.02.24
  Time: 15:52
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'painting.label', default: 'Painting')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div id="content" role="main">
    <g:if test="${flash.message}">
       <div class="alert alert-info alert-dismissible text-white" role="alert">
           <span class="text-sm">${flash.message}</span>
           <button type="button" class="btn-close text-lg py-3 opacity-10" data-bs-dismiss="alert" aria-label="Close">
               <span aria-hidden="true">×</span>
           </button>
       </div>
    </g:if>

    <shiro:hasPermission permission="painting:create">
        <g:link class="btn btn-info" action="create">
            <i class="fa fa-plus"></i>
            <g:message code="default.new.label" args="[entityName]" />
        </g:link>
    </shiro:hasPermission>

    <div class="container-fluid py-4">
        <div class="row">
            <div class="col-12">
                <div class="card my-4">
                    <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                        <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                            <table border="0">
                                <tr>
                                    <td>
                                        <h6 class="text-white text-capitalize px-3"><nobr><g:message code="default.list.label" args="[entityName]" /></nobr></h6>
                                    </td>
                                    <td width="100%"></td>
                                    <td>
                                        <nobr><g:select name="max" class="px-3 mx-3" from="${(1..10)*.multiply(10)}" value="${max}" onChange="doFilterFormSubmitCheck();" /></nobr>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="card-body px-0 pb-2">
                        <div class="table-responsive p-0">
                            <table class="table align-items-center mb-0" >
                                <thead>
                                <tr>
                                    <shiro:hasPermission permission="painting:edit">
                                        <th class="text-secondary opacity-7"></th>
                                    </shiro:hasPermission>
                                    <th class="text-center text-uppercase text-secondary text-s font-weight-bolder opacity-7">WEB</th>
                                    <th class="text-center text-uppercase text-secondary text-s font-weight-bolder opacity-7">Erfasst</th>
                                    <!--
                                    <th class="text-uppercase text-secondary text-s font-weight-bolder opacity-7">Titel</th>
                                    -->
                                    <g:sortableColumn property="titleDe" title="${message(code: 'painting.title.label', default: 'Titel')}" class="text-uppercase text-secondary text-s font-weight-bolder opacity-7"/>
                                    <!--
                                    <th class="text-uppercase text-secondary text-s font-weight-bolder opacity-7 ps-2">Beschreibung</th>
                                    -->
                                    <g:sortableColumn property="descriptionDe" title="${message(code: 'painting.desc.label', default: 'Beschreibung')}" class="text-uppercase text-secondary text-s font-weight-bolder opacity-7"/>
                                    <th class="text-center text-uppercase text-secondary text-s font-weight-bolder opacity-7">Datum</th>
                                    <th class="text-center text-uppercase text-secondary text-s font-weight-bolder opacity-7">Ort</th>
                                    <th class="text-center text-uppercase text-secondary text-s font-weight-bolder opacity-7">Kategorie</th>
                                    <th class="text-center text-uppercase text-secondary text-s font-weight-bolder opacity-7">Material</th>
                                    <th class="text-center text-uppercase text-secondary text-s font-weight-bolder opacity-7">Technik</th>
                                </tr>
                                </thead>
                                <tbody class="indexTable">
                                    <g:each in="${paintingList}" status="i" var="painting">
                                        <tr>
                                            <shiro:hasPermission permission="painting:edit">
                                                <td class="align-middle text-center">
                                                   <!-- <a href="" class="text-center text-secondary font-weight-bold text-s"><i class="fa fa-edit"></i></a> -->
                                                    <g:link action="edit" id="${painting.id}" class="text-center"><i class="fa fa-edit"></i></g:link>
                                                </td>
                                            </shiro:hasPermission>
                                            <td class="align-middle text-center" onclick="window.document.location='${request.contextPath}/${controllerName}/show/${painting.id}'">
                                                <!--
                                                <i class="fa fa-check text-info text-center" aria-hidden="true"></i>
                                                -->
                                                <g:if test="${painting.web}">
                                                    <span class="badge badge-sm bg-gradient-success">Online</span>
                                                </g:if>
                                            </td>
                                            <td class="align-middle text-center" onclick="window.document.location='${request.contextPath}/${controllerName}/show/${painting.id}'">
                                            <!--
                                                <i class="fa fa-check text-info text-center" aria-hidden="true"></i>
                                                -->
                                                <g:if test="${painting.acqCompl}">
                                                    <i class="fa fa-check text-info text-center" aria-hidden="true"></i>
                                                </g:if>
                                            </td>
                                            <td onclick="window.document.location='${request.contextPath}/${controllerName}/show/${painting.id}'">
                                                <div class="d-flex px-2 py-1">
                                                    <div>
                                                        <!--
                                                        <asset:image src="template_painting.jpeg" class="avatar avatar-m mx-3 border-radius-lg" />
                                                        -->
                                                        <img src="${request.contextPath}/painting/image/${painting?.id}" class="avatar avatar-sm me-3 border-radius-lg" alt="user1">
                                                    </div>
                                                    <div class="d-flex flex-column justify-content-center">
                                                        <!--
                                                        <h6 class="mb-0 text-sm">John Michael</h6>
                                                        -->
                                                        <p class="text-xs text-secondary mb-0">${fieldValue(bean: painting, field: "titleDe")}</p>
                                                        <p class="text-xs text-secondary mb-0">${fieldValue(bean: painting, field: "titleEn")}</p>
                                                        <p class="text-xs text-secondary mb-0">${fieldValue(bean: painting, field: "titleFa")}</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td onclick="window.document.location='${request.contextPath}/${controllerName}/show/${painting.id}'">
                                                <p class="text-xs text-secondary mb-0">${tools.Tools.shortenTo(fieldValue(bean: painting, field: "descriptionDe").toString(), 35)}</p>
                                                <p class="text-xs text-secondary mb-0">${tools.Tools.shortenTo(fieldValue(bean: painting, field: "descriptionEn").toString(), 35)}</p>
                                                <p class="text-xs text-secondary mb-0">${tools.Tools.shortenTo(fieldValue(bean: painting, field: "descriptionFa").toString(), 35)}</p>
                                            </td>
                                            <td class="align-middle text-center" onclick="window.document.location='${request.contextPath}/${controllerName}/show/${painting.id}'">
                                                <span class="text-secondary text-xs font-weight-bold"><g:formatDate date="${painting.creationTime}" type="date" style="MEDIUM" /></span>
                                            </td>
                                            <td class="align-middle text-center" onclick="window.document.location='${request.contextPath}/${controllerName}/show/${painting.id}'">
                                                <span class="text-secondary text-xs font-weight-bold">${fieldValue(bean: painting, field: "ort")}</span>
                                            </td>
                                            <td class="align-middle text-center" onclick="window.document.location='${request.contextPath}/${controllerName}/show/${painting.id}'">
                                                <span class="text-secondary text-xs font-weight-bold">${fieldValue(bean: painting, field: "category")}</span>
                                            </td>
                                            <td class="align-middle text-center" onclick="window.document.location='${request.contextPath}/${controllerName}/show/${painting.id}'">
                                                <span class="text-secondary text-xs font-weight-bold">${fieldValue(bean: painting, field: "material")}</span>
                                            </td>
                                            <td class="align-middle text-center" onclick="window.document.location='${request.contextPath}/${controllerName}/show/${painting.id}'">
                                                <span class="text-secondary text-xs font-weight-bold">${fieldValue(bean: painting, field: "technic")}</span>
                                            </td>
                                        </tr>
                                    </g:each>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <g:if test="${paintingCount > params.int('max')}">
                    <div class="pagination">
                        <g:paginate total="${paintingCount ?: 0}" />
                    </div>
                </g:if>
            </div>
        </div>
    </div>
</div>

<shiro:hasPermission permission="painting:create">
    <g:link class="btn btn-info" action="create">
        <i class="fa fa-plus"></i>
        <g:message code="default.new.label" args="[entityName]" />
    </g:link>
</shiro:hasPermission>
</body>
</html>

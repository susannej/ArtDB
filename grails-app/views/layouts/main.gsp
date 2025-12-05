<!--
=========================================================
* Material Dashboard 2 - v3.1.0
=========================================================

* Product Page: https://www.creative-tim.com/product/material-dashboard
* Copyright 2023 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://www.creative-tim.com/license)
* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<!DOCTYPE html>
<html lang="en" <g:if test="${org.springframework.context.i18n.LocaleContextHolder.locale.language == 'fa'}">dir="rtl"</g:if> >

<head>
  <meta charset="utf-8" />
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
    <g:layoutTitle default="Grails"/>
  </title>
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
  <!-- Nucleo Icons -->
  <asset:stylesheet src="nucleo-icons.css" />
  <asset:stylesheet src="nucleo-svg.css" />
  <!-- Font Awesome Icons -->
  <asset:stylesheet src="fontawesome-all.min.css" />
  <!-- Material Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
  <!-- CSS Files -->
  <asset:stylesheet id="pagestyle" src="material-dashboard.css" />
  <asset:stylesheet src="jquery-ui.min.css" />
  <asset:stylesheet src="artdb.css" />
  <asset:stylesheet src="tooltip.css" />
</head>

  <body class="g-sidenav-show  bg-gray-200 ${org.springframework.context.i18n.LocaleContextHolder.locale.language == 'fa' ? 'rtl' : ''}">
  <aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 ${org.springframework.context.i18n.LocaleContextHolder.locale.language == 'fa' ? 'fixed-end' : 'fixed-start'} ms-3 bg-gradient-dark" id="sidenav-main">
    <div class="sidenav-header">
      <i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute ${org.springframework.context.i18n.LocaleContextHolder.locale.language == 'fa' ? 'start-0' : 'end-0'} top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
      <a class="navbar-brand m-0" href=" https://github.com/susannej/ArtDB " target="_blank">
        <asset:image src="ArtDB_logo.png" class="navbar-brand-img h-100" alt="main_logo" />
      </a>
    </div>
    <hr class="horizontal light mt-0 mb-2">
    <div class="sidenav-header">
      <i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
      <a class="navbar-brand m-0" href=" https://demos.creative-tim.com/material-dashboard/pages/dashboard " target="_blank">
        <asset:image src="userIcon100.png" class="navbar-brand-img h-100" alt="main_logo" />
        <span class="mx-1 font-weight-bold text-white">${session?.user?.username}</span>
      </a>
    </div>
    <hr class="horizontal light mt-0 mb-2">
    <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link text-white ${(controllerName == 'dashboard') ? 'active bg-gradient-primary': ''}" href="/dashboard/index">
            <div class="text-white text-center mx-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">dashboard</i>
            </div>
            <span class="nav-link-text mx-1"><g:message code="dashboard.label" /></span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white ${(controllerName == 'painting') ? 'active bg-gradient-primary': ''}" href="/painting/index">
            <div class="text-white text-center mx-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">dashboard</i>
            </div>
            <span class="nav-link-text mx-1"><g:message code="paintings.label" /></span>
          </a>
        </li>
        <shiro:hasAnyRole in="['Admin', 'User']">
          <!-- Administration -->
          <li class="nav-item mt-3">
          <div class="text-white text-center d-flex align-items-center justify-content-center">
            <h6 class="px-2 mx-2 text-uppercase text-xs text-white font-weight-bolder opacity-8"><g:message code="administration.label" /></h6>
          </div>
          </li>
          <!-- Administration -->
          <shiro:hasPermission permission="place:index">
            <li class="nav-item">
              <a class="nav-link text-white ${(controllerName == 'place') ? 'active bg-gradient-primary': ''}" href="/place/index">
                <div class="text-white text-center mx-2 d-flex align-items-center justify-content-center">
                  <i class="material-icons opacity-10">dashboard</i>
                </div>
                <span class="nav-link-text mx-1"><g:message code="places.label" /></span>
              </a>
            </li>
          </shiro:hasPermission>
          <shiro:hasPermission permission="category:index">
            <li class="nav-item">
              <a class="nav-link text-white ${(controllerName == 'category') ? 'active bg-gradient-primary': ''}" href="/category/index">
                <div class="text-white text-center mx-2 d-flex align-items-center justify-content-center">
                  <i class="material-icons opacity-10">dashboard</i>
                </div>
                <span class="nav-link-text mx-1"><g:message code="categories.label" /></span>
              </a>
            </li>
          </shiro:hasPermission>
          <shiro:hasPermission permission="material:index">
            <li class="nav-item">
              <a class="nav-link text-white ${(controllerName == 'material') ? 'active bg-gradient-primary': ''}" href="/material/index">
                <div class="text-white text-center mx-2 d-flex align-items-center justify-content-center">
                  <i class="material-icons opacity-10">dashboard</i>
                </div>
                <span class="nav-link-text mx-1"><g:message code="materials.label" /></span>
              </a>
            </li>
          </shiro:hasPermission>
          <shiro:hasPermission permission="technic:index">
            <li class="nav-item">
              <a class="nav-link text-white ${(controllerName == 'technic') ? 'active bg-gradient-primary': ''}" href="/technic/index">
                <div class="text-white text-center mx-2 d-flex align-items-center justify-content-center">
                  <i class="material-icons opacity-10">dashboard</i>
                </div>
                <span class="nav-link-text mx-1"><g:message code="technics.label" /></span>
              </a>
            </li>
          </shiro:hasPermission>
          <shiro:hasPermission permission="syParameter:index">
            <li class="nav-item">
              <a class="nav-link text-white ${(controllerName == 'syParameter') ? 'active bg-gradient-primary': ''}" href="/syParameter/index">
                <div class="text-white text-center mx-2 d-flex align-items-center justify-content-center">
                  <i class="material-icons opacity-10">dashboard</i>
                </div>
                <span class="nav-link-text mx-1"><g:message code="parameter.label" /></span>
              </a>
            </li>
          </shiro:hasPermission>
          <shiro:hasPermission permission="shiroUser:index">
            <li class="nav-item">
              <a class="nav-link text-white ${(controllerName == 'shiroUser') ? 'active bg-gradient-primary': ''}" href="/shiroUser/index">
                <div class="text-white text-center mx-2 d-flex align-items-center justify-content-center">
                  <i class="material-icons opacity-10">dashboard</i>
                </div>
                <span class="nav-link-text mx-1"><g:message code="user.label" /></span>
              </a>
            </li>
          </shiro:hasPermission>
        </shiro:hasAnyRole>
      </ul>
    </div>
    <!--
    <div class="sidenav-footer position-absolute w-100 bottom-0 ">
      <div class="mx-3">
        <a class="btn btn-outline-primary mt-4 w-100" href="" type="button">Bla</a>
        <a class="btn bg-gradient-primary w-100" href="" type="button">Blubber</a>
      </div>
    </div>
     -->
  </aside>
  <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
      <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 mx-5">
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="javascript:;">${controllerName}</a></li>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">${actionName}</li>
          </ol>
          <!--
          <h6 class="font-weight-bolder mb-0"><g:message code="default.list.label" args="[entityName]" /></h6>
           -->
        </nav>
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
          <div class="ms-md-auto pe-md-3 d-flex align-items-center">
          </div>
          <ul class="navbar-nav  justify-content-end">
            <li class="nav-item dropdown px-2 d-flex align-items-center">
              <button class="btn btn-light dropdown-toggle btn-sm mb-0 mx-3 " type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                <g:message code="language.label" />
              </button>
              <ul class="dropdown-menu px-2 py-3 me-sm-n4" aria-labelledby="dropdownMenuButton1">
                <locale:localeDropdownListItems uri="${request.forwardURI}"/>
              </ul>
            </li>
            <li class="mt-2">
              <a class="github-button" href="https://github.com/susannej/ArtDB" data-icon="octicon-star" data-size="large" data-show-count="true" aria-label="Star susannej/ArtDB on GitHub">Star</a>
            </li>
            <li class="nav-item d-xl-none px-3 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-body p-0" id="iconNavbarSidenav">
                <div class="sidenav-toggler-inner">
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                </div>
              </a>
            </li>
            <li class="nav-item px-3 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-body p-0">
                <i class="fa fa-cog fixed-plugin-button-nav cursor-pointer"></i>
              </a>
            </li>
            <li class="nav-item dropdown px-2 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-body p-0" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fa fa-bell cursor-pointer"></i>
              </a>
              <ul class="dropdown-menu  dropdown-menu-end  px-2 py-3 me-sm-n4" aria-labelledby="dropdownMenuButton">
                <li class="mb-2">
                  <a class="dropdown-item border-radius-md" href="javascript:;">
                    <div class="d-flex py-1">
                      <div class="my-auto">
                        <asset:image src="team-2.jpg" class="avatar avatar-sm  me-3 " />
                      </div>
                      <div class="d-flex flex-column justify-content-center">
                        <h6 class="text-sm font-weight-normal mb-1">
                          <span class="font-weight-bold">New message</span> from Laur
                        </h6>
                        <p class="text-xs text-secondary mb-0">
                          <i class="fa fa-clock me-1"></i>
                          13 minutes ago
                        </p>
                      </div>
                    </div>
                  </a>
                </li>
                <li class="mb-2">
                  <a class="dropdown-item border-radius-md" href="javascript:;">
                    <div class="d-flex py-1">
                      <div class="my-auto">
                        <asset:image src="small-logos/logo-spotify.svg" class="avatar avatar-sm bg-gradient-dark  me-3 " />
                      </div>
                      <div class="d-flex flex-column justify-content-center">
                        <h6 class="text-sm font-weight-normal mb-1">
                          <span class="font-weight-bold">New album</span> by Travis Scott
                        </h6>
                        <p class="text-xs text-secondary mb-0">
                          <i class="fa fa-clock me-1"></i>
                          1 day
                        </p>
                      </div>
                    </div>
                  </a>
                </li>
                <li>
                  <a class="dropdown-item border-radius-md" href="javascript:;">
                    <div class="d-flex py-1">
                      <div class="avatar avatar-sm bg-gradient-secondary  me-3  my-auto">
                        <svg width="12px" height="12px" viewBox="0 0 43 36" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                          <title>credit-card</title>
                          <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                            <g transform="translate(-2169.000000, -745.000000)" fill="#FFFFFF" fill-rule="nonzero">
                              <g transform="translate(1716.000000, 291.000000)">
                                <g transform="translate(453.000000, 454.000000)">
                                  <path class="color-background" d="M43,10.7482083 L43,3.58333333 C43,1.60354167 41.3964583,0 39.4166667,0 L3.58333333,0 C1.60354167,0 0,1.60354167 0,3.58333333 L0,10.7482083 L43,10.7482083 Z" opacity="0.593633743"></path>
                                  <path class="color-background" d="M0,16.125 L0,32.25 C0,34.2297917 1.60354167,35.8333333 3.58333333,35.8333333 L39.4166667,35.8333333 C41.3964583,35.8333333 43,34.2297917 43,32.25 L43,16.125 L0,16.125 Z M19.7083333,26.875 L7.16666667,26.875 L7.16666667,23.2916667 L19.7083333,23.2916667 L19.7083333,26.875 Z M35.8333333,26.875 L28.6666667,26.875 L28.6666667,23.2916667 L35.8333333,23.2916667 L35.8333333,26.875 Z"></path>
                                </g>
                              </g>
                            </g>
                          </g>
                        </svg>
                      </div>
                      <div class="d-flex flex-column justify-content-center">
                        <h6 class="text-sm font-weight-normal mb-1">
                          Payment successfully completed
                        </h6>
                        <p class="text-xs text-secondary mb-0">
                          <i class="fa fa-clock me-1"></i>
                          2 days
                        </p>
                      </div>
                    </div>
                  </a>
                </li>
              </ul>
            </li>
            <li class="nav-item d-flex align-items-center">
              <a href="/auth/signOut" class="nav-link text-body font-weight-bold px-0">
                <i class="fa fa-user me-sm-1"></i>
                <span class="d-sm-inline d-none"><g:message code="signOut.label" /></span>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- End Navbar -->
    <div class="container-fluid py-4">
      <g:layoutBody/>
      <footer class="footer py-4  ">
        <div class="container-fluid">
          <div class="row align-items-center justify-content-lg-between">
            <div class="col-lg-6 mb-lg-0 mb-4">
              <div class="copyright text-center text-sm text-muted text-lg-start">
                © 2024-2025 by Susanne Jäckel,
                Template made with <i class="fa fa-heart" aria-hidden="true"></i> by
                <a href="https://www.creative-tim.com" class="font-weight-bold" target="_blank">Creative Tim</a>
                for a better web.
              </div>
            </div>
            <div class="col-lg-6">
              <ul class="nav nav-footer justify-content-center justify-content-lg-end">
                <li class="nav-item">
                  <a href="https://www.creative-tim.com" class="nav-link text-muted" target="_blank">Creative Tim</a>
                </li>
                <li class="nav-item">
                  <a href="https://www.creative-tim.com/presentation" class="nav-link text-muted" target="_blank">About Us</a>
                </li>
                <li class="nav-item">
                  <a href="https://www.creative-tim.com/blog" class="nav-link text-muted" target="_blank">Blog</a>
                </li>
                <li class="nav-item">
                  <a href="https://www.creative-tim.com/license" class="nav-link pe-0 text-muted" target="_blank">License</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </footer>
    </div>
  </main>
  <div class="fixed-plugin">
    <a class="fixed-plugin-button text-dark position-fixed px-3 py-2">
      <i class="material-icons py-2">settings</i>
    </a>
    <div class="card shadow-lg">
      <div class="card-header pb-0 pt-3">
        <div class="float-start">
          <h5 class="mt-3 mb-0">UI Configurator</h5>
        </div>
        <div class="float-end mt-4">
          <button class="btn btn-link text-dark p-0 fixed-plugin-close-button">
            <i class="material-icons">clear</i>
          </button>
        </div>
        <!-- End Toggle Button -->
      </div>
      <hr class="horizontal dark my-1">
      <div class="card-body pt-sm-3 pt-0">
        <!-- Sidebar Backgrounds -->
        <div>
          <h6 class="mb-0">Sidebar Colors</h6>
        </div>
        <a href="javascript:void(0)" class="switch-trigger background-color">
          <div class="badge-colors my-2 text-start">
            <span class="badge filter bg-gradient-primary active" data-color="primary" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-dark" data-color="dark" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-info" data-color="info" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-success" data-color="success" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-warning" data-color="warning" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-danger" data-color="danger" onclick="sidebarColor(this)"></span>
          </div>
        </a>
        <!-- Sidenav Type -->
        <div class="mt-3">
          <h6 class="mb-0">Sidenav Type</h6>
          <p class="text-sm">Choose between 2 different sidenav types.</p>
        </div>
        <div class="d-flex">
          <button class="btn bg-gradient-dark px-3 mb-2 active" data-class="bg-gradient-dark" onclick="sidebarType(this)">Dark</button>
          <button class="btn bg-gradient-dark px-3 mb-2 ms-2" data-class="bg-transparent" onclick="sidebarType(this)">Transparent</button>
          <button class="btn bg-gradient-dark px-3 mb-2 ms-2" data-class="bg-white" onclick="sidebarType(this)">White</button>
        </div>
        <p class="text-sm d-xl-none d-block mt-2">You can change the sidenav type just on desktop view.</p>
        <!-- Navbar Fixed -->
        <div class="mt-3 d-flex">
          <h6 class="mb-0">Navbar Fixed</h6>
          <div class="form-check form-switch ps-0 ms-auto my-auto">
            <input class="form-check-input mt-1 ms-auto" type="checkbox" id="navbarFixed" onclick="navbarFixed(this)">
          </div>
        </div>
        <hr class="horizontal dark my-3">
        <div class="mt-2 d-flex">
          <h6 class="mb-0">Light / Dark</h6>
          <div class="form-check form-switch ps-0 ms-auto my-auto">
            <input class="form-check-input mt-1 ms-auto" type="checkbox" id="dark-version" onclick="darkMode(this)">
          </div>
        </div>
        <hr class="horizontal dark my-sm-4">
      </div>
    </div>
  </div>
  <!--   Core JS Files   -->
  <asset:javascript src="core/popper.min.js" />
  <asset:javascript src="core/bootstrap.min.js" />
  <asset:javascript src="plugins/perfect-scrollbar.min.js" />
  <asset:javascript src="plugins/smooth-scrollbar.min.js" />
  <asset:javascript src="jquery-3.7.1.min.js" />
  <asset:javascript src="jquery-ui.min.js" />
  <asset:javascript src="fontawesome-all.min.js" />
  <asset:javascript src="tooltip.js" />
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }

    $(".datepicker").datepicker();
    $.datepicker.setDefaults({
      firstDay: 1,
      dateFormat: 'dd.mm.yy'
    });
    //$.datepicker.setDefaults( $.datepicker.regional[ "de" ] );
    //$('#ui-datepicker-div').css('clip', 'auto');

  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <asset:javascript src="material-dashboard.min.js" />
  <style type="text/css">
  #ui-datepicker-div {
    z-index: 9999999 !important;
  }
  .dropdown-menu > li > .btn-link {
    display: block;
    border-style: none;
    padding: 3px 20px;
    background: white;
    color: #333;
    clear: both;
    text-decoration: none;
  }
  .dropdown-menu > li > .btn-link:hover {
    background: #3276B1;
    color: white;
  }
  </style>

  </body>

</html>
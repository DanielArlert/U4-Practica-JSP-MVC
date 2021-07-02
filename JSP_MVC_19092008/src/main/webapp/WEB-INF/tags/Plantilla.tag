<%@tag description="Plantilla general" pageEncoding="UTF-8"%>
<%@attribute name="header" fragment="true"%>
<%@attribute name="footer" fragment="true"%>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>${title}</title>
    <link rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous">
    <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
    <link href="Recursos/css/generales.css" rel="stylesheet">
</head>

    <div id="pageheader">
        <jsp:invoke fragment="header"/>
            <section>
                <header class="header bg-dark text-light" id="header">
                    <div class="header__toggle">
                        <i class='bx bx-menu' id="header-toggle"></i>
                    </div>

                    <h1 class="text-uppercase w-100 text-center">Productos</h1>
                </header>

                <div class="l-navbar bg-secondary text-decoration-none" id="nav-bar">
                    <nav class="nav">
                        <div>
                            <a href="#" class="nav__link">
                                <i class='bx bx-layer nav__logo-icon'></i>
                                <span class="nav__logo-name">Entregas</span>
                            </a>

                            <div class="nav__list">
                                <a href="#" class="nav__link">
                                <i class='bx bx-user nav__icon' ></i>
                                    <span class="nav__name">Proveedores</span>
                                </a>

                                <a href="#" class="nav__link active">
                                    <i class='bx bx-message-square-detail nav__icon' ></i>
                                    <span class="nav__name">Productos</span>
                                </a>

                                <a href="#" class="nav__link">
                                    <i class='bx bx-plus nav__icon' ></i>
                                    <span class="nav__name">Agregar Entrega</span>
                                </a>
                            </div>
                        </div>

                        <a href="#" class="nav__link">
                            <i class='bx bx-log-out nav__icon' ></i>
                            <span class="nav__name">Salir</span>
                        </a>
                    </nav>
                </div>
            </section>
    </div>
    
    <div id="body">
        <jsp:doBody/>
    </div>
    
    <div id="pagefooter">
        <jsp:invoke fragment="footer"/>
    </div>
    
</html>

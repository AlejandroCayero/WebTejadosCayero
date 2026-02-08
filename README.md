# Plataforma Web Corporativa para una Empresa de Reparación de Cubiertas

Este repositorio contiene el código fuente del proyecto de desarrollo de una plataforma web para una empresa especializada en la reparación de cubiertas y tejados.

## Descripción del Proyecto

El objetivo principal es dotar a la empresa de una presencia online profesional que sirva como canal de comunicación y captación de nuevos clientes. La plataforma incluirá información sobre servicios, un portafolio de proyectos y un sistema para solicitar presupuestos de forma sencilla.

## Estado Actual del Proyecto

El proyecto se encuentra en la **Fase 1: Configuración y Desarrollo Inicial**. Se ha establecido un entorno de trabajo robusto y se ha implementado la base tecnológica para el desarrollo frontend.

## Objetivos Principales

- **Desarrollar una web pública profesional:** Con una interfaz clara y moderna.
- **Implementar un sistema de captación de clientes:** A través de un formulario de presupuesto.
- **Automatizar el registro y la planificación inicial:** Guardando las solicitudes en una base de datos e integrándolas con un calendario interno.
- **Crear un gestor de contenidos (Blog):** Para publicar novedades y proyectos recientes.
- **Garantizar una arquitectura tecnológica moderna:** Utilizando Docker para facilitar el despliegue y mantenimiento.

## Tecnologías Utilizadas

- **Backend:** PHP 8.2-FPM (personalizado con Dockerfile), October CMS v3 (basado en Laravel)
- **Frontend:** HTML5, CSS3, JavaScript (preparado para integrar frameworks modernos)
- **Base de Datos:** MariaDB 10.6 (gestionada con volúmenes persistentes)
- **Servidor Web:** Nginx (Alpine)
- **Contenerización:** Docker y Docker Compose (para orquestación de servicios)
- **Control de Versiones:** Git y GitHub

## Puesta en Marcha (Entorno de Desarrollo Local)

Para arrancar el proyecto en un entorno local, siga los siguientes pasos:

1.  **Requisitos:**
    *   Docker Desktop
    *   WSL2 (Windows Subsystem for Linux)

2.  **Clonar el repositorio:**
    Abra su terminal WSL y ejecute:
    `git clone https://github.com/AlejandroCayero/WebTejadosCayero.git`

3.  **Navegar al directorio del proyecto y levantar los contenedores:**
    `cd WebTejadosCayero`
    `docker compose up -d`

4.  **Acceder a la aplicación:**
    Una vez los contenedores estén levantados, podrá acceder a la plataforma desde su navegador:
    *   **Página Web:** [http://localhost](http://localhost)
    *   **Panel de Administración:** [http://localhost/backend](http://localhost/backend)

## Estructura de Directorios

-   **/docker**: Contiene los archivos de configuración específicos para los servicios de Docker (Nginx y Dockerfile de PHP).
-   **/src**: Este directorio aloja el código fuente completo de la aplicación October CMS, incluyendo el tema `tejados-cayero` en desarrollo.
-   **/mysql_data**: Carpeta dedicada a la persistencia de los datos de la base de datos MariaDB, asegurando que la información no se pierda al reiniciar el entorno.
-   **docker-compose.yml**: El archivo principal que define la arquitectura de servicios y su interconexión.

## Gestión y Planificación del Proyecto

El seguimiento de tareas y la planificación del proyecto se realizan mediante el tablero de Trello del proyecto.

[**Ver Tablero del Proyecto en Trello**](https://trello.com/b/x1ayTDvY/proyecto-webtejadoscayero)
<!-- ===== DANGER ZONE: DON'T TOUCH IT ======-->
id: codelab-deployment
status: Published
<!-- ======================================= -->

summary: Laboratorio 04 - Programacion N-Capas
authors: Henry Alexis Flores Lopez
categories: Programacion, Java, SpringBoot

# Integracion Keycloak con SpringBoot (Con patron BFF)

<!-- ------------------------ -->
## Conceptos Basicos 
### ¿Que es Keycloak?
Keycloak es un producto de software de código abierto que permite el inicio de sesión único con gestión de identidades y accesos, diseñado para aplicaciones y servicios modernos.

### Patron BFF
El patrón BFF hace referencia al concepto de Backend For FrontEnd. Cuando nosotros diseñamos muchas de nuestras aplicaciones nos encontramos en situaciones en las que tenemos diseñado un FrontEnd realizado en JavaScript contra un Backend desarrollado en la tecnología que nos plazca pero muchas veces enfocado a Servicios REST  . En muchos casos el BackEnd esta diseñado de una forma neutra es decir publica una información de la que cualquier cliente puede beneficiarse . Eso sí cada cliente dispondrá de un interface de usuario diferente a otros . Al publicar la información de forma muy neutra todos los clientes se adaptarán a ella  , pero cada uno de los cuales necesitará realizar un esfuerzo diferente para cargar los datos necesarios que presenta. [Fuente: ArquiteturaJava](https://www.arquitecturajava.com/que-es-el-patron-bff/)

### ¿Por que BFF con Keycloak?
Usando un patron BFF en nuestro Backend tenemos las siguientes ventajas
- #### 1 - Separacion de preocupaciones
    - El frontend se centra en la UI, y no necesita preocuparse por autenticación compleja ni detalles de autorización.
    - El BFF se encarga de la autenticación con Keycloak, gestión de tokens, transformación de datos, y llamadas a APIs internas.
- #### 2 - Seguridad y control de acceso
    - El BFF maneja la validación del JWT, verifica roles/permisos y controla qué rutas están permitidas.
    - El frontend nunca toca directamente Keycloak ni otros microservicios.
- #### 3 - Mejor manejo de tokens
    - El BFF puede usar tokens más seguros (HttpOnly cookies) y mantener tokens de refresco lejos del frontend.
    - También puede actuar como proxy para renovar tokens automáticamente.
- #### 4 - Customizacion por cliente
    - Una app móvil puede tener distintos requerimientos de datos que una app web.
    - Con BFF, cada frontend tiene su propio backend adaptado a sus necesidades (datos resumidos, transformados, cacheados, etc.).
- #### 5 - Facilita cambios sin afectar todo
    - Cambios en un BFF solo afectan a su cliente.
    - Es más fácil de probar, desplegar y mantener.

## Keycloak con Docker
### Instalacion de una instancia de Keycloak
Para esta practica, usaremos una instancia de desarrollo de Keycloak, para esto, utilizaremos docker con la imagen oficial de Keycloak.
Para esto, usaremos el siguiente comando:
```bash
docker run -p 3030:8080 -e KC_BOOTSTRAP_ADMIN_USERNAME=admin -e KC_BOOTSTRAP_ADMIN_PASSWORD=admin quay.io/keycloak/keycloak:26.2.5 start-dev
```
>aside negative
> #### ⚠️ Aclaracion
> Por lo general, los puertos utilizados para Keycloak son el 8080:8080, pero para esta ocasion, ya que nuestra api estara corriendo en el puerto 8080, definiremos que estaremos usando el puerto 8080 interno de nuestro contenedor, expuesto en el puerto 3030 de nuestro ordenador.

### Acceso a la terminal administrativa
La primera vez que realicemos este proceso, puede que tarde un poco, ya que se tendra que descargar la imagen a utilizar.
Una vez que la imagen haya sido descargada y que la instancia este corriendo, accederemos a la siguiente ruta

[Ruta de la instancia](http://localhost:3030/admin)

En la que debera verse la siguiente pantalla

![alt-text-here](./images/WelcomeImage.png)


Una vez en esta pantalla, necesitamos las credenciales que hemos determinado en el comando de la creacion de instancia

```bash
KC_BOOTSTRAP_ADMIN_USERNAME=admin -e KC_BOOTSTRAP_ADMIN_PASSWORD=admin
```

En estos parametros es donde se definen las crecenciales de nuestro usuario **temporal**.
Por tanto, nuestras credenciales seran:
#### Username or email
admin
#### Password
admin

Si hemos ingresado los datos correctamente, deberiamos acceder a la siguiente pantalla

![alt-text-here](./images/FirstScreenKeycloak.png)

## Configuracion de Keycloak



**Tablas**

| Columna 1 | Columna 2 |
|-----------|-----------|
| Valor 1   | Valor 2   | 


> aside positive
> ✅ Esta es una nota positiva.
> Puedes usarla para resaltar información importante o útil.
> De igual forma puedes incluir varias líneas de texto.
> También puedes incluir enlaces, imágenes o cualquier otro tipo de contenido en formato `Markdown`.
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
<!-- Duración de esta sección, en formato hh:mm:ss  -->
Duration: 00:15:00 

### ¿Que es Keycloak?

Keycloak es un producto de software de código abierto que permite el inicio de sesión único con gestión de identidades y accesos, diseñado para aplicaciones y servicios modernos.

### Patron BFF
El patrón BFF hace referencia al concepto de Backend For FrontEnd. Cuando nosotros diseñamos muchas de nuestras aplicaciones nos encontramos en situaciones en las que tenemos diseñado un FrontEnd realizado en JavaScript contra un Backend desarrollado en la tecnología que nos plazca pero muchas veces enfocado a Servicios REST  . En muchos casos el BackEnd esta diseñado de una forma neutra es decir publica una información de la que cualquier cliente puede beneficiarse . Eso sí cada cliente dispondrá de un interface de usuario diferente a otros . Al publicar la información de forma muy neutra todos los clientes se adaptarán a ella  , pero cada uno de los cuales necesitará realizar un esfuerzo diferente para cargar los datos necesarios que presenta. [Fuente: ArquiteturaJava](https://www.arquitecturajava.com/que-es-el-patron-bff/)

### ¿Por que BFF con Keycloak?
Usando un patron BFF en nuestro Backend tenemos las siguientes ventajas
- 1 - Separacion de preocupaciones
    - El frontend se centra en la UI, y no necesita preocuparse por autenticación compleja ni detalles de autorización.
    - El BFF se encarga de la autenticación con Keycloak, gestión de tokens, transformación de datos, y llamadas a APIs internas.
- 2 - Seguridad y control de acceso
    - El BFF maneja la validación del JWT, verifica roles/permisos y controla qué rutas están permitidas.
    - El frontend nunca toca directamente Keycloak ni otros microservicios.
- 3 - Mejor manejo de tokens
    - El BFF puede usar tokens más seguros (HttpOnly cookies) y mantener tokens de refresco lejos del frontend.
    - También puede actuar como proxy para renovar tokens automáticamente.
- 4 - Customizacion por cliente
    - Una app móvil puede tener distintos requerimientos de datos que una app web.
    - Con BFF, cada frontend tiene su propio backend adaptado a sus necesidades (datos resumidos, transformados, cacheados, etc.).
- 5 - Facilita cambios sin afectar todo
    - Cambios en un BFF solo afectan a su cliente.
    - Es más fácil de probar, desplegar y mantener.

**Listas**

- how to set the amount of time each slide will take to finish 
- how to include code snippets 
- how to hyperlink items 
- how to include images 
- other stuff


**Bloques de código**

```js
console.log("Este es un bloque de código");
```

**Enlaces**

[Youtube](https://www.youtube.com/watch?v=dQw4w9WgXcQ)

**Imágenes**

![alt-text-here](./images/example.png)

**Tablas**

| Columna 1 | Columna 2 |
|-----------|-----------|
| Valor 1   | Valor 2   | 

**Notas**

> aside negative
> ⚠️ Esta es una nota de advertencia o de información importante.
> Puedes incluir varias líneas de texto en una nota.
> También puedes incluir código:
> ```js
> console.log("Este es un bloque de código");
> ```
> O puedes incluir cualquier otro tipo de contenido en formato Markdown.

> aside positive
> ✅ Esta es una nota positiva.
> Puedes usarla para resaltar información importante o útil.
> De igual forma puedes incluir varias líneas de texto.
> También puedes incluir enlaces, imágenes o cualquier otro tipo de contenido en formato `Markdown`.

<!-- ------------------------ -->
## Segunda página
Duration: 00:5:00

### Subtitulo en otra página

Acá puedes incluir más contenido, como texto, imágenes, enlaces, etc.
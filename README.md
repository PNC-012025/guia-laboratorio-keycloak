# 🚀 Plantilla para Crear y Publicar Codelabs

Esta plantilla te permite desarrollar codelabs en Markdown, compilarlos con `claat` (sin instalar nada localmente) y publicarlos automáticamente en GitHub Pages usando GitHub Actions.

---

## ✅ Requisitos

- Docker instalado en tu sistema

---

## 📚 Crear un Codelab

Para crear un codelab, simplemente edita el archivo `codelab.md` siguiendo la estructura de Markdown descrita en el ejemplo a continuación:

1. Se debe definir al inicio del archivo `codelab.md` con los metadatos requeridos del codelab:

```markdown
id: codelab-deployment
status: Published
```

> ⚠️ Estos metadatos son obligatorios y deben estar al inicio del archivo tal cual se muestran.


2. Escribir los metadatos adicionales y el título del codelab:

```markdown
summary: Plantilla para crear Codelabs
authors: Autores, Separados, Por, Comas
categories: Categorías, Separadas, Por, Comas

# Titulo del Codelab
```

> ℹ️ Estos metadatos son opcionales, pero se recomienda incluirlos para mejorar la organización y búsqueda de codelabs.

3. Estructurar el contenido del codelab utilizando secciones, subtítulos, listas, bloques de código, enlaces, imágenes y tablas. Aquí tienes un ejemplo de una sección:

````markdown
## Section Example 
Duration: 00:20:00

### List of Learnings 
- how to set the amount of time each slide will take to finish 
- how to include code snippets 
- how to hyperlink items 
- how to include images 
- other stuff

### JavaScript

```js
{ 
  key1: "string", 
  key2: integer,
  key3: "string"
}
```

### Hyperlinking
[Youtube](https://www.youtube.com/watch?v=dQw4w9WgXcQ)

### Images
![alt-text-here](images/example.jpg)

````

---

## 🐳 Exportar Codelab Con Docker

### 1. Construir la imagen Docker (una sola vez)

```bash
docker build -t claat-local .
```

Esto crea una imagen local con `claat` ya instalado.

### 2. Exportar el codelab desde Markdown

```bash
docker run --rm -v $(pwd):/work -w /work claat-local export codelab.md
```

Esto generará una carpeta llamada `codelab-deployment` con el contenido del codelab. Para visualizarlo, abre el archivo `index.html` en un navegador.

---

## ⚙️ Publicación automática en GitHub Pages

Este repositorio incluye un archivo de workflow en `.github/workflows/deploy.yml` que:

1. Compila automáticamente tu codelab al hacer push en la rama `main`
2. Modifica el archivo `index.html` para inyectar un script personalizado
3. Publica el contenido en GitHub Pages usando la acción `github-pages-deploy-action`

No necesitas hacer nada manual más que subir tus cambios.

> ⚠️ La primera vez que hagas push, será necesario configurar GitHub Pages en tu repositorio. Ve a la configuración del repositorio, busca la sección "Pages" y selecciona la rama `gh-pages` como fuente.
> ![image](https://github.com/user-attachments/assets/c17bae6a-1421-4777-a3b4-e3536f493dc3)


---

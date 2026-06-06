# 🎬 fluttermoviestest-Flutter (MVVM)

[Flutter Version Dart 3.10.7 • DevTools 2.51.1]

> **"Ejemplo  App de Películas utilizando Flutter (DART) y el patrón de diseño MVVM."**

`fluttermoviestest` es una aplicación desarrollada para demostrar el flujo de datos 
reactivo en Flutter. El proyecto se centra en la simplicidad, la eficiencia 
y el uso de las mejores prácticas para el consumo de APIs de cine, manteniendo una clara separación de responsabilidades.

---

## 🏗️ Arquitectura: MVVM

Este proyecto utiliza el patrón **Model-View-ViewModel**, el estándar recomendado para Flutter:

* **Model:** Estructuras de datos puras que representan la información de las películas (Entities).
* **View:** Vistas declarativas de Flutter que observan cambios en el estado del ViewModel.
* **ViewModel:** La capa lógica que gestiona las peticiones de red, el procesamiento de datos y expone el estado a la vista.
* **Service:** Capa logica para obtencion de datos desde la api desde (https://api.themoviedb.org).

---

## 🚀 Características
- **🎥 Movie Catalog:** Listado de películas populares consumidas desde una API REST.
- **🔄 Async/Await:** Implementación de concurrencia moderna para peticiones asíncronas seguras y limpias.
- **🖼️ Image Loading:** Carga eficiente de posters y arte de las películas.
- **🎨 Flutter:** Uso de lenguaje Dart para desarrollo de la app.

---

## 📸 Screenshots

| Home List | Movie Detail | Search UI |
| :---: | :---: | :---: |


---

## 📖 Para Test en su PC o MacOS
Pasos para Pruebas.
1.  **Clonar repositorio en un directorio  de tu pc macos o windows por medio de terminal o consola de su sistema operativo.
2.  **desde Terminal o Consola buscar directorio , busque donde clono el proyecto usando un "ls" y luego en consola ejecute "cd fluttermoviestest".
3.  **Asegure de instalacion de http y provider por medio de Terminal (si aparecen errores extraños), ejecute estos comandos en su terminal "flutter pub add http" y "flutter pub add provider"
4.  **asegurece de estar en "fluttermoviestest"  por ello ejecute en su terminal "cd fluttermoviestest"
5.  **ya estando en directorio "fluttermoviestest" ejecute "flutter run"
6.  **le pedira dispositivo donde desplegar , le recomiendo el browser "Chrome".

   
## 📖 Para Animaciones del la APP
- **Se reciclo un laucherview y loadingview de otro proyecto flutter por corto tiempo existente para el test.
---

# Mercately Challenge
Este proyecto es una tienda en línea simple donde los usuarios pueden agregar productos a un carrito y crear órdenes. La aplicación está construida con Ruby on Rails y utiliza Tailwind CSS.

# Características
- Listar productos disponibles.
- Agregar productos al carrito.
- Ver el contenido del carrito.
- Crear una orden desde el carrito.
- Ver detalles de las órdenes.
- Eliminar órdenes.

## Requisitos previos
- Ruby 3.0.3
- Rails 7.0.8
- Node.js >= v16.5.0
- Redis

# Primeros pasos

Sigue estas instrucciones para obtener una copia del proyecto funcionando en tu máquina local para fines de desarrollo y prueba.

### Instalación 🛠️

1. **Clonar el repositorio:**

```bash
   git clone git@github.com:illuminaki/Mercately-Challenge.git
   cd Mercately Challenge

```
Instalar dependencias:
```bash
bundle install
```
2. **Configura tu base de datos en config/database.yml, remplazando los valores de las credenciales de postgres con las tuyas y luego crea y migra la base de datos:** :

```bash
rails db:create
rails db:migrate
```
3. **ejecuta la semilla de la base de datos para pablar tu app con products:** :

```bash
rails db:seed
```

4. **En otra consola inicia el servidor de Redis:** :

```bash
redis-server
```

5. **Inicia tu servidor:** :
```bash
rails s
```
Visita la aplicación:
Abre tu navegador web y ve a http://localhost:3000.

## Licencia
Este proyecto está licenciado bajo la Licencia MIT, lo que significa que puedes utilizarlo libremente en tus propios proyectos personales o comerciales.

## Contacto 📧
Si tienes preguntas o necesitas más información, puedes contactarme a través de illuminaki.online

[![TikTok](https://res.cloudinary.com/dpyf60gb8/image/upload/v1715907985/TIKTOK-LOGO_lqkwxd.png)](https://www.tiktok.com/@el_illuminaki)
[![LinkedIn](https://res.cloudinary.com/dpyf60gb8/image/upload/v1715907985/linkedin-logo_adccgl.png)](https://www.linkedin.com/in/sebastian-agudelo-alvarez-868901134/)
[![Youtube](https://res.cloudinary.com/dpyf60gb8/image/upload/v1715907985/youtube-logo_c0slf3.png)](https://www.youtube.com/channel/UCIrB6-JyJumGRRTyJW4gxtA)

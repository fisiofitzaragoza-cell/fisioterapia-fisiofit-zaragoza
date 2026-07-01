# Fisioterapia FisioFit Zaragoza Web instalable

Esta versión es una PWA: se puede instalar desde Chrome como app web.

## Importante

Chrome en Android solo instala la app correctamente si se abre desde una URL `https://...` o desde `localhost` durante pruebas. Abrir `index.html` como archivo local sirve para verla, pero no para instalarla como app completa.

## Instalación en Android

1. Sube esta carpeta (`FisioBonosWeb`) a un hosting web con HTTPS.
2. Abre la URL en Chrome desde la tablet.
3. Pulsa el menú de Chrome.
4. Elige `Instalar app` o `Añadir a pantalla de inicio`.

## Actualizar la web en Vercel

Cuando se cambie algo en la app, hay que volver a subir `FisioBonosWeb.zip` o la carpeta `FisioBonosWeb` a Vercel. La URL puede seguir siendo la misma, pero Vercel no recoge automáticamente los cambios hechos en este ordenador.

Si la tablet sigue mostrando una pantalla antigua, abre Chrome, entra en la URL y recarga la página. Si sigue igual, borra los datos del sitio o reinstala la app desde Chrome.

Antes de borrar datos o reinstalar en una tablet que ya tenía bonos, usa `Descargar copia local` o `Copia` para guardar un JSON de seguridad.

## Datos

La app sincroniza bonos y consentimientos con Supabase para no depender solo del navegador. También mantiene copia local y permite copia/restauración en JSON.

## Últimos cambios

- Logo y colores corporativos de FisioFit Zaragoza.
- Opción de borrar paciente con todos sus bonos y firmas.
- Bonos completados agrupados por paciente.
- Pantalla de login con logo, email, contraseña y recordar credenciales.
- Nuevo módulo de consentimiento informado con DNI, fecha y firma grande para tablet.

## Supabase

La URL y la clave pública de Supabase ya vienen configuradas en la app.

1. En `SQL Editor`, ejecuta `supabase-schema.sql` si todavía no está creado.
2. En `Authentication`, crea un usuario para la clínica.
3. Entra en la app con email y contraseña.
4. Si quieres, marca `Recordar usuario y contraseña`.
5. Solo abre `Ajustes avanzados` si algún día cambia el proyecto de Supabase.

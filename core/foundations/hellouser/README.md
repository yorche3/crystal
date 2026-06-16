# Hello, User! — Crystal

Implementación de la especificación [02_Hello_User](https://yorche3.github.io/programming_languages/core/foundations/02_Hello_User/) en **Crystal**, compilado y ejecutado con **crystal**.

Lee un nombre desde la entrada estándar y saluda al usuario.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo | Propósito |
|---------|-----------|
| [`hello_user.cr`](hello_user.cr) | Código fuente: solicita un nombre al usuario y saluda. |

**Estructura de directorios esperada:**

```text
hellouser/
├── hello_user.cr     # Código fuente
└── README.md         # Este archivo
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Este programa introduce dos conceptos nuevos respecto a `hello_world`:

1. **Lectura de entrada** — `read_line` lee una línea completa desde `stdin`.
2. **Concatenación de cadenas** — `+` une el nombre con el resto del saludo.

**EN:** This program introduces two new concepts compared to `hello_world`:

1. **Input reading** — `read_line` reads a full line from `stdin`.
2. **String concatenation** — `+` joins the name with the rest of the greeting.

---

## 📄 Archivos de configuración clave / Key Configuration Files

### `hello_user.cr`

**ES:** El flujo del programa es:

1. Imprimir `"Enter your name: "` con `puts`.
2. Leer el nombre con `read_line`.
3. Imprimir `"Hello, <nombre>!"` concatenando cadenas con `+`.

**EN:** Program flow:

1. Print `"Enter your name: "` with `puts`.
2. Read the name with `read_line`.
3. Print `"Hello, <name>!"` by concatenating strings with `+`.

```crystal
puts "Enter your name: "
name = read_line
puts "Hello, " + name + "!\n"
```

| Elemento | Propósito |
|----------|-----------|
| `puts` | Imprime el prompt en la salida estándar (incluye salto de línea) |
| `read_line` | Lee una línea completa (hasta Enter) desde la entrada estándar |
| `name` | Variable local que almacena el nombre ingresado |
| `+` | Operador de concatenación de cadenas |
| `"\n"` | Secuencia de escape para salto de línea al final del saludo |

> **ES:** `read_line` es un método del core de Crystal que lee desde `stdin`. Retorna una cadena sin el salto de línea final.
> **EN:** `read_line` is a Crystal core method that reads from `stdin`. It returns a string without the trailing newline.

---

## 🚀 Compilación y ejecución / Build & Run

### Requisito: Tener Crystal instalado

```bash
brew install crystal     # macOS / Linux
```

### Ejecutar

```bash
cd core/foundations/hellouser
crystal run hello_user.cr
```

**Salida esperada / Expected output:**

```text
Enter your name: Ada
Hello, Ada!
```

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** `puts` añade un salto de línea automáticamente, por lo que `"Enter your name: "` se imprime y luego baja a la siguiente línea antes de leer el nombre.
- **EN:** `puts` adds a newline automatically, so `"Enter your name: "` is printed and then moves to the next line before reading the name.
- **ES:** Se usa `"\n"` explícito al final del saludo para agregar el salto de línea después de la concatenación.
- **EN:** An explicit `"\n"` is used at the end of the greeting to add the newline after concatenation.
- **ES:** Crystal tiene inferencia de tipos, por lo que `name` se declara automáticamente como `String`.
- **EN:** Crystal has type inference, so `name` is automatically declared as `String`.

---

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*

# Hello, World! — Crystal

Implementación de la especificación [01_Hello_World](https://yorche3.github.io/programming_languages/core/foundations/01_Hello_World/) en **Crystal**, compilado y ejecutado con **crystal**.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo | Propósito |
|---------|-----------|
| [`hello_world.cr`](hello_world.cr) | Código fuente: imprime `"Hello, World! from Crystal!"` en la consola. |

**Estructura de directorios esperada:**

```text
helloworld/
├── hello_world.cr     # Código fuente
└── README.md          # Este archivo
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Este proyecto usa **Crystal** y sigue un enfoque minimalista: un único archivo fuente, sin dependencias externas, ejecutado directamente con `crystal run`.

Características:
- **Sin dependencias externas** — solo usa `puts` del core de Crystal.
- **Ejecución directa** — `crystal run` compila y ejecuta en un solo paso.
- **Sin archivo de proyecto** — no necesita `shard.yml`.

**EN:** This project uses **Crystal** and follows a minimalist approach: a single source file, no external dependencies, executed directly with `crystal run`.

Features:
- **No external dependencies** — only uses `puts` from Crystal core.
- **Direct execution** — `crystal run` compiles and runs in one step.
- **No project file** — no `shard.yml` needed.

---

## 📄 Archivos de configuración clave / Key Configuration Files

### `hello_world.cr`

**ES:** Punto de entrada. Llama a `puts` para imprimir el saludo en la salida estándar.

**EN:** Entry point. Calls `puts` to print the greeting to standard output.

```crystal
puts "Hello, World! from Crystal!"
```

| Elemento | Propósito |
|----------|-----------|
| `puts` | Método de Crystal que imprime una cadena seguida de un salto de línea |
| `"Hello, World! from Crystal!"` | Cadena literal que se muestra en la salida estándar |

> **ES:** `puts` es un método del core de Crystal, similar al de Ruby. Acepta cualquier tipo de objeto, lo convierte a string y lo imprime añadiendo un salto de línea al final.
> **EN:** `puts` is a Crystal core method, similar to Ruby's. It accepts any object type, converts it to string, and prints it adding a newline at the end.

---

## 🚀 Compilación y ejecución / Build & Run

### Requisito: Tener Crystal instalado

```bash
# Linux / macOS (con Homebrew)
brew install crystal

# Linux (con apt)
curl -fsSL https://crystal-lang.org/install.sh | bash

# Windows (con WSL)
# Ver: https://crystal-lang.org/install/
```

### Ejecutar

```bash
# Compilar y ejecutar (recomendado)
cd core/foundations/helloworld
crystal run hello_world.cr

# Compilar a binario y ejecutar
crystal build hello_world.cr
./hello_world
```

**Salida esperada / Expected output:**

```text
Hello, World! from Crystal!
```

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** Crystal es un lenguaje compilado con inferencia de tipos estática, pero `crystal run` abstrae el paso de compilación.
- **EN:** Crystal is a compiled language with static type inference, but `crystal run` abstracts the compilation step.
- **ES:** No se necesita archivo `shard.yml` para scripts simples; solo se requiere cuando hay dependencias externas.
- **EN:** No `shard.yml` file is needed for simple scripts; it's only required when there are external dependencies.

---

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*

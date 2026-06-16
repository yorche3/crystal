# 🚀 Foundations — Crystal

Implementaciones de la [Fase 0 — Fundamentos](https://yorche3.github.io/programming_languages/ROADMAP/#fase-0--fundamentos--foundations--completada) en **Crystal**: `helloworld`, `hellouser`, `unit_test/calculator` y `numbers`.

---

## 📖 Módulos / Modules

| Módulo | Especificación | Enfoque | Tests | Estado |
|--------|---------------|---------|:-----:|:------:|
| [`helloworld/`](helloworld/) | [01_Hello_World](https://yorche3.github.io/programming_languages/core/foundations/01_Hello_World/) | `crystal run` (archivo único) | — | ✅ |
| [`hellouser/`](hellouser/) | [02_Hello_User](https://yorche3.github.io/programming_languages/core/foundations/02_Hello_User/) | `crystal run` (archivo único) | — | ✅ |
| [`unit_test/calculator/`](unit_test/calculator/) | [03_Unit_Test_Calculator](https://yorche3.github.io/programming_languages/core/foundations/03_Unit_Test_Calculator/) | `crystal spec` + `shard.yml` | 5 | ✅ |
| [`numbers/`](numbers/) | [04_Numbers](https://yorche3.github.io/programming_languages/core/foundations/04_Numbers/) | `crystal spec` + `shard.yml` | 10 | ✅ |

---

## 📁 Estructura / Structure

```text
foundations/
├── helloworld/                   # 01_Hello_World
│   ├── hello_world.cr            # puts "Hello, World! from Crystal!"
│   └── README.md
│
├── hellouser/                    # 02_Hello_User
│   ├── hello_user.cr             # puts + read_line
│   └── README.md
│
├── unit_test/
│   └── calculator/               # 03_Unit_Test_Calculator
│       ├── shard.yml
│       ├── src/
│       │   └── calculator.cr     # 5 operaciones (+, -, *, /, mod)
│       ├── spec/
│       │   ├── spec_helper.cr
│       │   └── calculator_spec.cr  # 5 tests
│       └── README.md
│
└── numbers/                      # 04_Numbers
    ├── shard.yml
    ├── src/
    │   └── numbers.cr            # 15 funciones (3 enfoques × 5 algoritmos)
    ├── spec/
    │   ├── spec_helper.cr
    │   ├── numbers_rec_spec.cr   # 5 tests recursivos
    │   └── numbers_iter_spec.cr  # 5 tests iterativos
    └── README.md
```

---

## 🛠️ Patrón común / Common Pattern

| Característica | Descripción |
|---------------|-------------|
| **Compilador** | `crystal` — compilador nativo con inferencia de tipos estática |
| **Archivos únicos** | `crystal run <archivo>.cr` para programas simples (`helloworld`, `hellouser`) |
| **Proyectos con tests** | `crystal spec` — descubre y ejecuta todos los `*_spec.cr` en `spec/` |
| **Manifiesto** | `shard.yml` — define nombre, versión y dependencias del proyecto |
| **Framework de tests** | `spec` — integrado en Crystal, similar a RSpec de Ruby |
| **Tipado** | Parámetros anotados con tipos (`Int32`) |
| **Acumuladores** | Sin tests directos (Crystal no garantiza TCO) |

---

## 🚀 Compilación rápida / Quick Build

```bash
# Hello, World!
cd helloworld
crystal run hello_world.cr

# Hello, User!
cd hellouser
crystal run hello_user.cr

# Calculator Tests
cd unit_test/calculator
crystal spec

# Numbers Tests
cd numbers
crystal spec
```

---

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

## ▶️ Siguiente / Next

👉 Después de fundamentos, continúa con [Fase 1 — Algoritmos Puros](https://yorche3.github.io/programming_languages/ROADMAP/#fase-1--algoritmos-puros--algorithms-pure-).  
👉 After foundations, continue with [Phase 1 — Algorithms Pure](https://yorche3.github.io/programming_languages/ROADMAP/#fase-1--algoritmos-puros--algorithms-pure-).

---

*[← Volver a Crystal](../README.md)*

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*

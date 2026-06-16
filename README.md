# Crystal

Proyectos en **Crystal**, compilados con **crystal** (compilador nativo con inferencia de tipos estática).

Usa `shard.yml` como manifiesto de proyecto y **spec** (integrado) como framework de pruebas unitarias.

---

## 📂 Módulos / Modules

| Módulo | Descripción |
|--------|-------------|
| [`core/foundations/`](core/foundations/) | **Fase 0 — Fundamentos**: `helloworld`, `hellouser`, `calculator`, `numbers` |

---

### ▶️ Comenzar / Getting Started

```bash
# Hello, World!
cd core/foundations/helloworld
crystal run hello_world.cr

# Hello, User!
cd core/foundations/hellouser
crystal run hello_user.cr

# Calculator Tests
cd core/foundations/unit_test/calculator
crystal spec

# Numbers Tests
cd core/foundations/numbers
crystal spec
```

---

## 📦 Requisitos / Requirements

| Herramienta | Instalación |
|-------------|-------------|
| [Crystal](https://crystal-lang.org/) | `brew install crystal` (macOS) / [install script](https://crystal-lang.org/install/) (Linux) |

```bash
# Verificar instalación
crystal --version
```

---

## 🏗️ Tipos de proyecto / Project Types

### 1. Script simple (archivo único)

**ES:** Un único archivo fuente `.cr`, sin dependencias externas, ejecutado directamente con `crystal run`. Ideal para `helloworld` y `hellouser`.

**EN:** A single `.cr` source file, no external dependencies, executed directly with `crystal run`. Ideal for `helloworld` and `hellouser`.

```bash
crystal run <archivo>.cr
```

### 2. Proyecto shard + tests (crystal spec)

**ES:** Para proyectos que requieren pruebas unitarias, se utiliza `shard.yml` como manifiesto y el framework **spec** integrado en Crystal. Los tests se colocan en `spec/` con sufijo `_spec.cr` y se ejecutan con `crystal spec`.

**EN:** For projects requiring unit tests, `shard.yml` is used as the manifest and the built-in **spec** framework handles testing. Tests go in `spec/` with `_spec.cr` suffix and are run with `crystal spec`.

```bash
crystal spec
```

---

## 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---
*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
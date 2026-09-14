# Algorithms Pure — Crystal

Implementación de la fase [Algorithms Pure](https://yorche3.github.io/programming_languages/ROADMAP/#fase-1--algoritmos-puros--algorithms-pure-) en **Crystal**, usando **iteración explícita** y el framework de pruebas estándar `spec`.

---

## 📂 Módulos / Modules

| Módulo | Estado | Descripción / Description |
|--------|--------|---------------------------|
| [`naive_sort/`](naive_sort/) | ✅ | **Ordenamiento elemental** ($O(n^2)$): `selection_sort`, `bubble_sort`, `insertion_sort`. / **Elementary sorting** ($O(n^2)$): `selection_sort`, `bubble_sort`, `insertion_sort`. |

---

## 🚀 Compilación y ejecución / Build & Run

Cada módulo contiene sus propios comandos de Crystal. Por ejemplo / Each module has its own Crystal commands. For example:

```bash
cd crystal/core/algorithms/naive_sort
crystal spec
```

---

## 📝 Notas de implementación / Implementation Notes

**ES:** Los tres algoritmos operan **in-place** sobre el array recibido (paradigma imperativo del lenguaje, permitido por la especificación). Todos usan **iteración** (bucles `each`, `loop`, `while`) siguiendo el estilo idiomático de Crystal, que no garantiza TCO. El tipo `Array(Int32)` no permite `nil`, por lo que el caso de entrada nula no es representable y se documenta como tal.

**EN:** The three algorithms operate **in-place** on the received array (imperative paradigm of the language, allowed by the specification). All use **iteration** (`each`, `loop`, `while` loops) following Crystal's idiomatic style, which does not guarantee TCO. The `Array(Int32)` type does not allow `nil`, so the null input case is not representable and is documented as such.

**ES:** Este proyecto también está implementado en otros lenguajes. Explora el repositorio principal para consultar las demás versiones.

**EN:** This project is also implemented in other languages. Explore the main repository to see the other versions.

---

*[← Volver a Core](../README.md)*

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*

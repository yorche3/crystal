# Algorithms — Crystal

Implementación de la especificación [05_Naive_Sort](../../docs/core/algorithms/05_Naive_Sort.md) en **Crystal**, con un enfoque manual y minimalista.

---

## 📂 Módulos / Modules

| Módulo | Estado | Descripción |
|--------|--------|-------------|
| [`naive_sort/`](naive_sort/) | 🔄 | **Ordenamiento elemental**: `selection_sort`, `bubble_sort`, `insertion_sort` ($O(n^2)$) |

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** El proyecto se creó manualmente siguiendo la estructura estándar de Crystal. Cada módulo sigue la convención de usar `src/` para el código fuente y `spec/` para las pruebas unitarias.

**EN:** The project was created manually following the standard Crystal structure. Each module follows the convention of using `src/` for source code and `spec/` for unit tests.

## 📄 Configuración clave / Key Configuration

Cada módulo tiene su propio `shard.yml` y estructura de directorios:

```
crystal/core/algorithms/
├── naive_sort/
│   ├── src/naive_sort.cr
│   ├── spec/
│   │   ├── spec_helper.cr
│   │   └── naive_sort_spec.cr
│   ├── shard.yml
│   └── README.md
```

## 🚀 Compilación y ejecución / Build & Run

```bash
# Ejecutar pruebas del módulo naive_sort
cd naive_sort
crystal spec
```

**Salida real / Actual output:**

```text
...

Finished in 162 microseconds
3 examples, 0 failures, 0 errors, 0 pending
```

## 🧠 Algoritmos y operaciones / Algorithms & Operations

| Función / Algorithm | Enfoques / Approaches | Descripción / Description |
|---|---|---|
| `selection_sort` | Iterativo, in-place | Encuentra iterativamente el mínimo del resto no ordenado y lo ubica al inicio. Complejidad: O(n²) siempre. |
| `bubble_sort` | Iterativo, in-place | Compara e intercambia adyacentes con bandera de optimización. Complejidad: O(n²) peor/promedio, O(n) mejor caso. |
| `insertion_sort` | Iterativo, in-place | Construye el sub-array ordenado insertando cada elemento en su posición. Complejidad: O(n²) peor/promedio, O(n) mejor caso. |

## 📝 Notas de implementación / Implementation Notes

**Paradigma y estilo idiomático:**
- Crystal es un lenguaje orientado a objetos con tipado estático inferido. La implementación usa métodos de clase (`def self.method_name`) siguiendo el patrón de módulo de Crystal.
- Los tres algoritmos operan **in-place** sobre el array recibido (paradigma imperativo del lenguaje, permitido por la especificación).
- No se requiere indicador de fallo especial: Crystal no permite `nil` para `Array(Int32)` por defecto, por lo que el caso de entrada nula no es representable y se documenta como tal.

**Recursión, iteración y TCO:**
- Todos los algoritmos usan **iteración** (bucles `each`, `loop`, `while`) siguiendo el estilo idiomático de Crystal, que no garantiza TCO.
- La versión iterativa es la adecuada para este lenguaje; la recursiva tendría sobrecarga innecesaria y riesgo de desbordamiento de pila.

**Manejo de errores y casos especiales:**
- Arrays vacíos o de un solo elemento se devuelven directamente (criterio de aceptación de la especificación).
- El tipo `Array(Int32)` no puede ser `nil`, por lo que el caso de entrada nula no es representable (se documenta como no aplicable).

**Organización de tests:**
- Las pruebas usan el framework estándar `spec` de Crystal.
- Se define un helper `run_sort_tests` que ejecuta 7 casos comunes para los tres algoritmos (21 aserciones en total).
- Los fixtures se clonan con `.dup` para evitar efectos secundarios al ordenar in-place.

**ES:** Este proyecto también está implementado en otros lenguajes. Explora el repositorio principal para consultar las demás versiones.

**EN:** This project is also implemented in other languages. Explore the main repository to see the other versions.

---

*[← Volver a Core](../README.md)*

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*

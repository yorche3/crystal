# Data Structures Basics — Crystal

Implementación de la especificación [06_Data_Structures_Basics](https://yorche3.github.io/programming_languages/core/algorithms/06_Data_Structures_Basics/) en **Crystal**, compilada y probada con **crystal spec**.

**ES:** Biblioteca modular en `src/` con pruebas unitarias en `spec/`. Define un tipo `Node` compartido y tres ADTs independientes: `LinkedList`, `Stack` y `Queue`, todos implementados manualmente sobre el mismo `Node`.

**EN:** Modular library in `src/` with unit tests in `spec/`. Defines a shared `Node` type and three independent ADTs: `LinkedList`, `Stack` and `Queue`, all manually implemented on the same `Node`.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo / File | Propósito / Purpose |
|---|---|
| [`shard.yml`](shard.yml) | Manifiesto del proyecto Crystal / Crystal project manifest |
| [`src/data_structures_basics.cr`](src/data_structures_basics.cr) | Implementación: clases `Node`, `LinkedList`, `Stack` y `Queue` / Implementation: `Node`, `LinkedList`, `Stack`, and `Queue` classes |
| [`spec/spec_helper.cr`](spec/spec_helper.cr) | Configuración del entorno de pruebas / Test environment setup |
| [`spec/data_structures_basics_spec.cr`](spec/data_structures_basics_spec.cr) | Suite de pruebas unitarias (4 specs) / Unit test suite (4 specs) |
| [`.gitignore`](.gitignore) | Archivos y directorios excluidos del control de versiones / Ignored files and directories |
| [`README.md`](README.md) | Este archivo de documentación / This documentation file |

**Estructura de directorios / Directory structure:**

```text
data_structures_basics/
├── shard.yml                         # Manifiesto del proyecto
├── src/
│   └── data_structures_basics.cr    # Implementación: Node, LinkedList, Stack, Queue
├── spec/
│   ├── spec_helper.cr                # Configuración de specs
│   └── data_structures_basics_spec.cr # Suite de pruebas (4 specs)
├── .gitignore                        # Archivos ignorados
└── README.md                         # Este archivo
```

> **Nota de desviación / Deviation note:** La especificación propone `src/data_structures_basics.ext` + `test/data_structures_basics_test.ext` + `test/run_tests.ext`. En el ecosistema idiomático de Crystal, las pruebas se alojan en `spec/` con sufijo `_spec.cr` y se ejecutan directamente con la herramienta integrada `crystal spec`, sin requerir un script `run_tests.ext` adicional.
>
> **Deviation note:** The specification proposes `src/data_structures_basics.ext` + `test/data_structures_basics_test.ext` + `test/run_tests.ext`. In Crystal's idiomatic ecosystem, tests live in `spec/` with a `_spec.cr` suffix and run directly via the built-in `crystal spec` tool, without needing a separate `run_tests.ext` script.

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Mismo patrón modular que [`naive_sort`](../naive_sort/README.md) y [`numbers`](../../foundations/numbers/README.md): un manifiesto `shard.yml`, implementación orientada a objetos en `src/` y tests en `spec/` ejecutados mediante `crystal spec`. Las cuatro estructuras se implementan como clases (`class Node`, `class LinkedList`, `class Stack`, `class Queue`) dentro del espacio de nombres `module DataStructuresBasics`. El constructor idiomático de Crystal es `initialize`, invocado como `.new`.

**EN:** Same modular pattern as [`naive_sort`](../naive_sort/README.md) and [`numbers`](../../foundations/numbers/README.md): a `shard.yml` manifest, object-oriented implementation under `src/`, and tests under `spec/` run via `crystal spec`. All four structures are implemented as classes (`class Node`, `class LinkedList`, `class Stack`, `class Queue`) inside the `module DataStructuresBasics` namespace. The idiomatic Crystal constructor is `initialize`, invoked as `.new`.

---

## 📄 Configuración clave / Key Configuration

### `shard.yml` — Manifiesto del proyecto / Project manifest

```yaml
name: data_structures_basics
version: 0.1.0

crystal: '>= 1.20.2'

license: MIT
```

**ES:** No utiliza dependencias externas; aprovecha el framework de testing integrado `spec` de la biblioteca estándar de Crystal.

**EN:** It uses no external dependencies; it leverages the built-in `spec` testing framework from Crystal's standard library.

---

## 🚀 Compilación y ejecución / Build & Run

```bash
# Verificación estática / Static check
crystal build --no-codegen --warnings all --error-on-warnings src/data_structures_basics.cr

# Ejecutar las pruebas / Run tests
crystal spec
```

**Salida real / Actual output:**

```text
....

Finished in 188 microseconds
4 examples, 0 failures, 0 errors, 0 pending
```

---

## 🧠 Algoritmos y operaciones / Algorithms & Operations

| Operación / Operation | Entrada → salida / Input → output | Complejidad / Complexity | Notas / Notes |
|---|---|---|---|
| `Node.new(value)` | `Int32 → Node` | `O(1)` | Constructor: asigna `@value = value` y `@next = nil` / Sets `@value = value` and `@next = nil` |
| `Node#get_value` | `() → Int32` | `O(1)` | Retorna el valor del nodo / Returns node value |
| `Node#get_next` | `() → Node?` | `O(1)` | Retorna el nodo siguiente o `nil` / Returns next node or `nil` |
| `Node#set_next(next_node)` | `Node? → Node?` | `O(1)` | Actualiza el enlace al siguiente nodo / Updates next link |
| `LinkedList.new` | `() → LinkedList` | `O(1)` | Inicializa `@head = nil`, `@tail = nil`, `@count = 0` / Initializes empty list |
| `LinkedList#is_empty` | `() → Bool` | `O(1)` | Retorna `true` si `@count == 0` / Returns `true` if `@count == 0` |
| `LinkedList#size` | `() → Int32` | `O(1)` | Retorna la cantidad de elementos / Returns element count |
| `LinkedList#get_head` | `() → Int32` | `O(1)` | Valor de la cabeza o `-1` si está vacía / Head value or `-1` if empty |
| `LinkedList#insert_head(value)` | `Int32 → Int32` | `O(1)` | Inserta al inicio y actualiza `@head`; `@count += 1` / Inserts at front and updates `@head`; `@count += 1` |
| `LinkedList#insert_tail(value)` | `Int32 → Int32` | `O(1)` | Inserta al final y actualiza `@tail`; `@count += 1` / Inserts at end and updates `@tail`; `@count += 1` |
| `LinkedList#delete(value)` | `Int32 → Bool` | `O(n)` | Elimina la primera aparición de `value`; retorna `true` en éxito y `false` si no se encuentra / Removes first occurrence; returns `true` on success and `false` if not found |
| `Stack.new` | `() → Stack` | `O(1)` | Inicializa `@top = nil`, `@count = 0` / Initializes empty stack |
| `Stack#is_empty` | `() → Bool` | `O(1)` | Retorna `true` si `@count == 0` / Returns `true` if `@count == 0` |
| `Stack#size` | `() → Int32` | `O(1)` | Retorna la cantidad de elementos / Returns element count |
| `Stack#push(value)` | `Int32 → Int32` | `O(1)` | Inserta en el tope; `@count += 1` / Pushes to top; `@count += 1` |
| `Stack#peek` | `() → Int32` | `O(1)` | Observa el tope sin extraer o `-1` si está vacía / Peeks top without removing or `-1` if empty |
| `Stack#pop` | `() → Int32` | `O(1)` | Extrae y retorna el tope o `-1` si está vacía; `@count -= 1` / Pops and returns top or `-1` if empty; `@count -= 1` |
| `Queue.new` | `() → Queue` | `O(1)` | Inicializa `@front = nil`, `@rear = nil`, `@count = 0` / Initializes empty queue |
| `Queue#is_empty` | `() → Bool` | `O(1)` | Retorna `true` si `@count == 0` / Returns `true` if `@count == 0` |
| `Queue#size` | `() → Int32` | `O(1)` | Retorna la cantidad de elementos / Returns element count |
| `Queue#enqueue(value)` | `Int32 → Int32` | `O(1)` | Encola tras `@rear`; `@count += 1` / Enqueues after `@rear`; `@count += 1` |
| `Queue#peek` | `() → Int32` | `O(1)` | Observa el frente sin extraer o `-1` si está vacía / Peeks front without removing or `-1` if empty |
| `Queue#dequeue` | `() → Int32` | `O(1)` | Desencola y retorna el valor de `@front` o `-1` si está vacía; `@count -= 1` / Dequeues front value or `-1` if empty; `@count -= 1` |

---

## 🧩 Decisiones de diseño / Design decisions

| Decisión / Decision | Alternativa considerada / Alternative | Razón / Reason |
|---|---|---|
| `Node` y ADTs implementados como clases (`class`) | Tipos de valor por copia (`struct`) | Las listas y celdas enlazadas requieren referencias mutables e identidad compartida entre punteros `next`, algo no soportado por las estructuras de valor que Crystal pasa por copia |
| Tipo de elemento fijado a `Int32` | Tipos genéricos `Node(T)` | La especificación acota el dominio a enteros positivos para simplificar contratos y evitar colisiones de centinelas; evita sobrecarga de tipado en esta fase fundamental |
| Indicador de fallo numérico centralizado en constante `FAILURE_VALUE = -1` | Literal `-1` disperso en el código | Facilita el mantenimiento, evita números mágicos y clarifica la semántica de fallo en métodos que retornan `Int32` |
| `LinkedList#delete` devuelve `Bool` | Devolver código de error `Int32` o `nil` | Refleja de forma directa la semántica binaria de éxito o fallo esperada por el contrato |

---

## 🔀 Adaptaciones idiomáticas / Idiomatic adaptations

| Especificación / Specification | Adaptación / Adaptation | Justificación / Justification |
|---|---|---|
| `Node.init(value)` / `ADTs.init()` | Constructores estándar `initialize` invocados vía `.new` | En Crystal la construcción e inicialización de objetos se realiza idiomáticamente con `Type.new`, que ejecuta `initialize` |
| Ausencia de enlace (`absent`) en `Node.get_next()` | Tipos unión anulables `Node?` (`Node | Nil`) con `nil` | Crystal expresa de forma estática y segura la presencia o ausencia de referencia sin punteros crudos nulos ni excepciones |
| `delete(value)` devuelve `success` o `failure` | Retorno de tipo `Bool` (`true` en éxito, `false` en fallo) | Es la representación canónica e idiomática en Crystal para operaciones con resultado de éxito/fracaso booleano |
| Layout `test/` con `run_tests.ext` | Pruebas en `spec/` ejecutadas con `crystal spec` | Convención estándar del toolchain oficial de Crystal que detecta y ejecuta automáticamente las suites de prueba |

---

## 🚨 Indicadores de fallo / Failure indicators

| Operación / Operation | Situación de fallo / Failure situation | Indicador / Indicator | Ejemplo / Example |
|---|---|---|---|
| `Node#get_next` | Ausencia de enlace siguiente / Node has no next | `nil` (ausencia nativa) | `first_node.get_next` tras inicializar → `nil` |
| `LinkedList#get_head` | Lista vacía / Empty list | `-1` (`FAILURE_VALUE`) | `list.get_head` sobre lista vacía → `-1` |
| `LinkedList#delete(value)` | Valor ausente en la lista / Value not found | `false` | `list.delete(99)` → `false` |
| `Stack#peek` | Pila vacía / Empty stack | `-1` (`FAILURE_VALUE`) | `stack.peek` sobre pila vacía → `-1` |
| `Stack#pop` | Pila vacía / Empty stack | `-1` (`FAILURE_VALUE`) | `stack.pop` sobre pila vacía → `-1` |
| `Queue#peek` | Cola vacía / Empty queue | `-1` (`FAILURE_VALUE`) | `queue.peek` sobre cola vacía → `-1` |
| `Queue#dequeue` | Cola vacía / Empty queue | `-1` (`FAILURE_VALUE`) | `queue.dequeue` sobre cola vacía → `-1` |

> **ES:** El indicador numérico de fallo es `-1` para operaciones que devuelven `Int32`. La ausencia de enlaces en nodos se representa mediante `nil` (`Node?`). Los valores de prueba son enteros positivos que no colisionan con el valor de fallo.
>
> **EN:** The numeric failure indicator is `-1` for operations returning `Int32`. Link absence in nodes is represented by `nil` (`Node?`). Test values are positive integers that do not collide with the failure indicator.

---

## ✅ Cobertura de pruebas / Test coverage

| Caso de la especificación / Specification case | Cubierto / Covered | Prueba / Test | Notas / Notes |
|---|---|:--:|---|
| Node — Inicializar y observar valor/enlace | Sí | `spec/data_structures_basics_spec.cr:25` | Verifica `get_value == 10` y `get_next == nil` |
| Node — Inicializar otro nodo, enlazar y recorrer | Sí | `spec/data_structures_basics_spec.cr:30` | Verifica `first_node.get_next.not_nil!.get_value == 20` y `second_node.get_next == nil` |
| LinkedList — Estado vacío | Sí | `spec/data_structures_basics_spec.cr:57` | Verifica `is_empty == true`, `size == 0` y `get_head == -1` |
| LinkedList — Insertar por ambos extremos | Sí | `spec/data_structures_basics_spec.cr:63` | Inserciones en cola y cabeza; verifica `size == 4` y `get_head == 5` |
| LinkedList — Eliminar primera aparición | Sí | `spec/data_structures_basics_spec.cr:72` | `delete(10)` retorna `true`, tamaño resultante `3` y cabeza permanece en `5` |
| LinkedList — Valor ausente | Sí | `spec/data_structures_basics_spec.cr:78` | `delete(99)` retorna `false`, tamaño y cabeza inalterados |
| LinkedList — Vaciar la lista | Sí | `spec/data_structures_basics_spec.cr:84` | Tres `delete` exitosos; `is_empty == true`, `size == 0`, `get_head == -1` |
| Stack — Estado vacío y extracción fallida | Sí | `spec/data_structures_basics_spec.cr:108` | Verifica `is_empty == true`, `size == 0`, `peek == -1` y `pop == -1` |
| Stack — LIFO y `peek` no mutante | Sí | `spec/data_structures_basics_spec.cr:115` | Tras `push(10, 20, 30)`, `peek == 30` sin mutar `size == 3` |
| Stack — Extracción y reutilización | Sí | `spec/data_structures_basics_spec.cr:123` | `pop` secuencial con inserción intermedia; finaliza con `is_empty == true`, `size == 0` |
| Stack — Vacío tras extracción | Sí | `spec/data_structures_basics_spec.cr:133` | `pop` sobre pila vacía retorna `-1` e `is_empty` permanece `true` |
| Queue — Estado vacío y extracción fallida | Sí | `spec/data_structures_basics_spec.cr:153` | Verifica `is_empty == true`, `size == 0`, `peek == -1` y `dequeue == -1` |
| Queue — FIFO y `peek` no mutante | Sí | `spec/data_structures_basics_spec.cr:160` | Tras `enqueue(10, 20, 30)`, `peek == 10` sin mutar `size == 3` |
| Queue — Extracción y reutilización | Sí | `spec/data_structures_basics_spec.cr:168` | `dequeue` secuencial con inserción intermedia; finaliza con `is_empty == true`, `size == 0` |
| Queue — Vacío tras extracción | Sí | `spec/data_structures_basics_spec.cr:178` | `dequeue` sobre cola vacía retorna `-1` e `is_empty` permanece `true` |

---

## ⚠️ Limitaciones conocidas / Known limitations

| Limitación / Limitation | Impacto / Impact | Alternativa o plan / Workaround or plan |
|---|---|---|
| Dominio de valores restringido a enteros no negativos | Si se inserta el valor `-1`, no es posible distinguir un valor legítimo del indicador de fallo `FAILURE_VALUE` en `get_head`, `peek`, `pop` o `dequeue` | Restricción contemplada en la especificación para algoritmos fundamentales; el manejo mediante tipos de resultado o excepciones se abordará en fases posteriores |
| Concurrencia no sincronizada | Las estructuras no son seguras ante accesos concurrentes desde múltiples fibras | Operación monohilo secuencial, suficiente para el propósito pedagógico de este módulo |

---

## 📝 Notas de implementación / Implementation Notes

### 🧱 `Node` compartido / Shared `Node`

**ES:** El tipo `Node` es la única celda enlazada del módulo. `LinkedList`, `Stack` y `Queue` reutilizan este mismo nodo manteniendo sus propios punteros (`@head`/`@tail`, `@top`, `@front`/`@rear`) y contadores de tamaño (`@count`). Ni `Stack` ni `Queue` envuelven ni delegan operaciones en `LinkedList`.

**EN:** The `Node` type is the module's single linked cell. `LinkedList`, `Stack` and `Queue` reuse this same node, keeping their own pointers (`@head`/`@tail`, `@top`, `@front`/`@rear`) and size counters (`@count`). Neither `Stack` nor `Queue` wrap or delegate operations to `LinkedList`.

### 🛡️ Nulabilidad y seguridad de tipos / Nullability & Type Safety

**ES:** Crystal utiliza un sistema de tipos con uniones anulables estrictas (`Node?` equivalente a `Node | Nil`). Los enlaces vacíos se inicializan explícitamente a `nil`. Las operaciones acceden a los nodos encadenados mediante verificación de nulabilidad o aserción segura tras validar que la estructura no está vacía (`not_nil!`).

**EN:** Crystal utilizes a type system with strict nullable unions (`Node?` equivalent to `Node | Nil`). Empty links are explicitly initialized to `nil`. Operations access chained nodes through nullability checks or safe assertions after verifying that the structure is not empty (`not_nil!`).

### 🌐 Otras implementaciones / Other implementations

**ES:** Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para consultar las demás versiones.

**EN:** This project is also implemented in other languages. Explore the [main repository](https://github.com/yorche3/programming_languages) to see all the versions.

---

## 🔍 Checklist de validación / Validation checklist

- [x] La suite nativa se ejecutó y su salida real está copiada en este README.
- [x] Cada caso de la especificación tiene su fila en _Cobertura de pruebas_ (o `Omitido` con razón).
- [x] Cada desviación del pseudocódigo o de la ubicación esperada está en _Adaptaciones idiomáticas_.
- [x] Cada operación con fallo posible está en _Indicadores de fallo_.
- [x] No hay rutas absolutas del autor, credenciales ni salidas inventadas.
- [x] Los enlaces relativos resuelven dentro del repositorio y el documento es bilingüe.
- [x] Ninguna sección repite lo que ya dice la especificación.

---

## 📚 Referencias / References

| Tipo / Kind | Referencia / Reference |
|---|---|
| Especificación / Specification | [`06_Data_Structures_Basics.md`](../../../../docs/core/algorithms/06_Data_Structures_Basics.md) |
| Módulo homologado del lenguaje / Homologated module | [`crystal/core/algorithms/naive_sort/`](../naive_sort/README.md) |
| Guía de inicialización / Initialisation guide | [`core/00_Project_Initialization_Guide.md`](../../../../docs/core/00_Project_Initialization_Guide.md) |
| Adaptaciones idiomáticas / Idiomatic adaptations | [`AGENT_Template.md`](../../../../docs/AGENT_Template.md) |
| Validación de la documentación / Documentation validation | [`WORKFLOW.md`](../../../../docs/WORKFLOW.md) |
| Documentación oficial del lenguaje / Language official docs | [crystal-lang.org/reference](https://crystal-lang.org/reference/) |

---

*[← Volver a Algorithms Pure](../README.md) | [↑ Volver a Core](../../README.md)*

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*

# Data Structures Advanced — Crystal

Implementación de la especificación [07_Data_Structures_Advanced](https://yorche3.github.io/programming_languages/core/algorithms/07_Data_Structures_Advanced/) en **Crystal**, compilada y probada con **crystal spec**.

**ES:** Biblioteca modular en `src/` con pruebas unitarias en `spec/`. Declara una clase base abstracta `Node` con el valor y dos estructuras derivadas con múltiples enlaces: `TreeNode` para árboles binarios de búsqueda (`BinaryTree`) y `GraphNode` para grafos dirigidos (`Graph`) con registro enlazado canónico manual.

**EN:** Modular library in `src/` with unit tests in `spec/`. Declares an abstract base class `Node` carrying the value and two derived structures with multiple links: `TreeNode` for binary search trees (`BinaryTree`) and `GraphNode` for directed graphs (`Graph`) with a manual canonical linked vertex registry.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo / Directory | Propósito / Purpose |
|---|---|
| [`shard.yml`](shard.yml) | Manifiesto del proyecto Crystal / Crystal project manifest |
| [`src/data_structures_advanced.cr`](src/data_structures_advanced.cr) | Código fuente principal: clases `Node`, `TreeNode`, `BinaryTree`, `GraphNode` y `Graph` / Main source code: `Node`, `TreeNode`, `BinaryTree`, `GraphNode`, and `Graph` classes |
| [`spec/spec_helper.cr`](spec/spec_helper.cr) | Configuración del entorno de pruebas / Test environment setup |
| [`spec/data_structures_advanced_spec.cr`](spec/data_structures_advanced_spec.cr) | Suite de pruebas unitarias (23 specs) / Unit test suite (23 specs) |
| [`.gitignore`](.gitignore) | Archivos generados y excluidos del control de versiones / Ignored generated files and directories |
| [`README.md`](README.md) | Este archivo de documentación / This documentation file |

**Estructura de directorios / Directory structure:**

```text
data_structures_advanced/
├── shard.yml                         # Manifiesto del proyecto
├── src/
│   └── data_structures_advanced.cr  # Implementación: Node, TreeNode, BinaryTree, GraphNode, Graph
├── spec/
│   ├── spec_helper.cr                # Configuración de specs
│   └── data_structures_advanced_spec.cr # Suite de pruebas (23 specs)
├── .gitignore                        # Archivos ignorados
└── README.md                         # Este archivo
```

> **Nota de desviación / Deviation note:** La especificación propone `src/data_structures_advanced.ext` + `test/data_structures_advanced_test.ext` + `test/run_tests.ext`. En el ecosistema idiomático de Crystal, las pruebas se alojan en `spec/` con sufijo `_spec.cr` y se ejecutan directamente con la herramienta integrada `crystal spec`, sin requerir un script `run_tests.ext` adicional.
>
> **Deviation note:** The specification proposes `src/data_structures_advanced.ext` + `test/data_structures_advanced_test.ext` + `test/run_tests.ext`. In Crystal's idiomatic ecosystem, tests live in `spec/` with a `_spec.cr` suffix and run directly via the built-in `crystal spec` tool, without needing a separate `run_tests.ext` script.

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Mismo patrón modular que [`data_structures_basics`](../data_structures_basics/README.md) y [`numbers`](../../foundations/numbers/README.md): un manifiesto `shard.yml`, implementación orientada a objetos en `src/` y tests en `spec/` ejecutados mediante `crystal spec`. La base `Node` es una clase abstracta que contiene exclusivamente `@value : Int32`. `TreeNode` y `GraphNode` heredan de `Node`. El registro de vértices de `Graph` es una lista simplemente enlazada manual vía `next_vertex`, sin tablas hash ni mapas de biblioteca.

**EN:** Same modular pattern as [`data_structures_basics`](../data_structures_basics/README.md) and [`numbers`](../../foundations/numbers/README.md): a `shard.yml` manifest, object-oriented implementation under `src/`, and tests under `spec/` run via `crystal spec`. The `Node` base is an abstract class holding exclusively `@value : Int32`. `TreeNode` and `GraphNode` inherit from `Node`. The vertex registry of `Graph` is a manual singly-linked list via `next_vertex`, without hash tables or library maps.

---

## 📄 Configuración clave / Key Configuration

### `shard.yml` — Manifiesto del proyecto / Project manifest

```yaml
name: data_structures_advanced
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
crystal build --no-codegen --warnings all --error-on-warnings src/data_structures_advanced.cr

# Ejecutar las pruebas / Run tests
crystal spec
```

**Salida real / Actual output:**

```text
.......................

Finished in 502 microseconds
23 examples, 0 failures, 0 errors, 0 pending
```

---

## 🧠 Algoritmos y operaciones / Algorithms & Operations

| Operación / Operation | Entrada → salida / Input → output | Complejidad / Complexity | Notas / Notes |
|---|---|---|---|
| `Node#initialize(value)` | `Int32 → Node` | `O(1)` | Constructor base: clase abstracta con `@value = value` / Abstract base constructor with `@value = value` |
| `Node#get_value` | `() → Int32` | `O(1)` | Retorna el valor del nodo / Returns node value |
| `TreeNode#initialize(value)` | `Int32 → TreeNode` | `O(1)` | Inicializa nodo de árbol con `@left = nil`, `@right = nil` / Initializes tree node with `@left = nil`, `@right = nil` |
| `TreeNode#get_left` | `() → TreeNode?` | `O(1)` | Retorna hijo izquierdo o `nil` / Returns left child or `nil` |
| `TreeNode#get_right` | `() → TreeNode?` | `O(1)` | Retorna hijo derecho o `nil` / Returns right child or `nil` |
| `TreeNode#set_left(node)` | `TreeNode? → Nil` | `O(1)` | Asigna o desenlaza (`nil`) hijo izquierdo / Sets or unlinks (`nil`) left child |
| `TreeNode#set_right(node)` | `TreeNode? → Nil` | `O(1)` | Asigna o desenlaza (`nil`) hijo derecho / Sets or unlinks (`nil`) right child |
| `BinaryTree#initialize` | `() → BinaryTree` | `O(1)` | Inicializa árbol vacío: `@root = nil`, `@count = 0` / Initializes empty BST |
| `BinaryTree#insert(value)` | `Int32 → Bool` | `O(h)` | Inserción iterativa en ABB; duplicado no incrementa tamaño y retorna `true` / Iterative BST insertion; duplicates do not grow size and return `true` |
| `BinaryTree#contains(value)` | `Int32 → Bool` | `O(h)` | Búsqueda iterativa según invariante de ABB / Iterative search following BST invariant |
| `BinaryTree#is_empty` | `() → Bool` | `O(1)` | Retorna `true` si `@count == 0` / Returns `true` if `@count == 0` |
| `BinaryTree#size` | `() → Int32` | `O(1)` | Retorna cantidad de nodos únicos / Returns count of unique nodes |
| `GraphNode#initialize(label)` | `Int32 → GraphNode` | `O(1)` | Nodo interno de grafo: `@neighbors = [] of Int32`, `@next_vertex = nil` / Internal graph node |
| `Graph#initialize` | `() → Graph` | `O(1)` | Inicializa grafo vacío: `@vertices = nil`, `@vertex_total = 0`, `@edges = 0` / Initializes empty graph |
| `Graph#add_vertex(label)` | `Int32 → Bool` | `O(V)` | Registra vértice si no existe; duplicado preserva adyacencia y retorna `true` / Registers vertex; duplicate preserves adjacency and returns `true` |
| `Graph#add_edge(u, v)` | `(Int32, Int32) → Bool` | `O(V + d(u))` | Requiere extremos existentes; inserción ordenada en adyacencia; duplicados y bucles idempotentes / Requires existing endpoints; sorted adjacency insertion |
| `Graph#has_edge(u, v)` | `(Int32, Int32) → Bool` | `O(V + d(u))` | Retorna `true` si existe la arista dirigida `(u, v)` / Returns `true` if directed edge `(u, v)` exists |
| `Graph#get_neighbors(u)` | `Int32 → Array(Int32)?` | `O(V + d(u))` | Retorna copia defensiva (`dup`) de vecinos o `nil` si `u` no existe / Returns defensive copy (`dup`) of neighbours or `nil` if `u` is missing |
| `Graph#is_empty` | `() → Bool` | `O(1)` | Retorna `true` si `@vertex_total == 0` / Returns `true` if `@vertex_total == 0` |
| `Graph#vertex_count` | `() → Int32` | `O(1)` | Retorna cantidad de vértices / Returns count of vertices |
| `Graph#edge_count` | `() → Int32` | `O(1)` | Retorna cantidad de aristas dirigidas / Returns count of directed edges |

---

## 🧩 Decisiones de diseño / Design decisions

| Decisión / Decision | Alternativa considerada / Alternative | Razón / Reason |
|---|---|---|
| Reutilización de `Node` mediante herencia real (`abstract class Node`) | Valor embebido / composición | Crystal dispone de herencia de clases simple con tipado estático; `abstract class` impide instanciar la base directamente conforme a la especificación |
| Registro de vértices enlazado manualmente (`GraphNode#next_vertex`) | Diccionario de biblioteca `Hash(Int32, GraphNode)` | La especificación prohíbe explícitamente delegar el registro en tablas hash o árboles de biblioteca; el recorrido lineal manual cumple la cota `O(V)` |
| Almacenamiento de adyacencia en `Array(Int32)` con inserción ordenada manual | Colecciones de conjunto `Set(Int32)` o listas enlazadas | La especificación autoriza almacenamiento contiguo o enlazado siempre que la búsqueda, detección de duplicados e inserción ordenada se programen manualmente |
| Retorno de copia defensiva `dup` en `Graph#get_neighbors` | Retornar la referencia interna mutable | Garantiza el aislamiento del resultado ante modificaciones externas sin alterar el estado interno del grafo |

---

## 🔀 Adaptaciones idiomáticas / Idiomatic adaptations

| Especificación / Specification | Adaptación / Adaptation | Justificación / Justification |
|---|---|---|
| Ausencia de enlace (`absent`) en `TreeNode.get_left()` / `get_right()` | Tipos unión anulables `TreeNode?` (`TreeNode | Nil`) con `nil` | Crystal expresa de forma estática y segura la presencia o ausencia de referencia sin punteros crudos nulos ni excepciones |
| Ausencia de vecinos para vértice inexistente en `Graph.get_neighbors(u)` | Retorno `Array(Int32)?` con `nil` en fallo | Permite distinguir de forma unívoca entre un vértice sin aristas (`[] of Int32`) y un vértice no registrado (`nil`) |
| Layout `test/` con `run_tests.ext` | Pruebas en `spec/` ejecutadas con `crystal spec` | Convención estándar del toolchain oficial de Crystal que detecta y ejecuta automáticamente las suites de prueba |
| Constructores `init()` / `init(val)` | Constructores estándar `initialize` invocados vía `.new` | En Crystal la construcción e inicialización de objetos se realiza idiomáticamente mediante `Type.new`, que ejecuta `initialize` |

---

## 🚨 Indicadores de fallo / Failure indicators

| Operación / Operation | Situación de fallo / Failure situation | Indicador / Indicator | Ejemplo / Example |
|---|---|---|---|
| `TreeNode#get_left` | Ausencia de enlace izquierdo / Absent left child | `nil` (ausencia nativa) | `node.get_left` tras inicializar → `nil` |
| `TreeNode#get_right` | Ausencia de enlace derecho / Absent right child | `nil` (ausencia nativa) | `node.get_right` tras inicializar → `nil` |
| `BinaryTree#contains` | Valor ausente en el árbol / Missing value in BST | `false` | `tree.contains(99)` → `false` |
| `Graph#add_edge` | Al menos uno de los extremos `u` o `v` no existe / Missing endpoint | `false` | `graph.add_edge(10, 99)` → `false` |
| `Graph#has_edge` | Extremo `u` inexistente o arista no presente / Missing vertex or edge | `false` | `graph.has_edge(10, 99)` → `false` |
| `Graph#get_neighbors` | Vértice `u` no registrado en el grafo / Missing vertex | `nil` | `graph.get_neighbors(99)` → `nil` |

---

## ✅ Cobertura de pruebas / Test coverage

| Caso de la especificación / Specification case | Cubierto / Covered | Prueba / Test | Notas / Notes |
|---|---|:--:|---|
| TreeNode — Crear un nodo de árbol | Sí | `spec/data_structures_advanced_spec.cr:34` | Verifica `node.get_value == 10` |
| TreeNode — Enlaces iniciales ausentes | Sí | `spec/data_structures_advanced_spec.cr:39` | Verifica `get_left == nil` y `get_right == nil` |
| TreeNode — Enlazar dos hijos | Sí | `spec/data_structures_advanced_spec.cr:44` | Enlaza hijos 20 y 30; verifica sus valores |
| TreeNode — Recorrer cada enlace | Sí | `spec/data_structures_advanced_spec.cr:53` | Sigue enlaces izquierdo y derecho, verificando hijos y hojas (`nil`) |
| TreeNode — Desenlazar hijos | Sí | `spec/data_structures_advanced_spec.cr:67` | Limpia izquierdo con `nil`, luego derecho; verifica preservación de valores |
| TreeNode — Adaptación inmutable | Omitido | — | No aplica: Crystal utiliza referencias mutables para nodos enlazados |
| BinaryTree — Crear vacío | Sí | `spec/data_structures_advanced_spec.cr:83` | Verifica `is_empty == true`, `size == 0`, `contains(50) == false` |
| BinaryTree — Insertar la raíz | Sí | `spec/data_structures_advanced_spec.cr:90` | Inserta 50; verifica éxito, `size == 1`, `is_empty == false`, `contains(50) == true` |
| BinaryTree — Insertar menor y mayor | Sí | `spec/data_structures_advanced_spec.cr:94` | Inserta 50, 30, 70; verifica éxitos, `size == 3` y pertenencia |
| BinaryTree — Ramas de varios niveles | Sí | `spec/data_structures_advanced_spec.cr:98` | Inserta 50, 30, 70, 20, 40; verifica éxitos, `size == 5` y pertenencia |
| BinaryTree — Valor ausente en árbol no vacío | Sí | `spec/data_structures_advanced_spec.cr:102` | Árbol con 50; `contains(99) == false`, `size == 1` y `contains(50) == true` |
| BinaryTree — Duplicado idempotente | Sí | `spec/data_structures_advanced_spec.cr:109` | Inserta 50, 30, 70, 30; verifica éxitos, `size == 3` y preservación de valores |
| BinaryTree — Inserciones ordenadas | Sí | `spec/data_structures_advanced_spec.cr:113` | Inserta 20, 30, 40, 50, 70; verifica éxitos, `size == 5` y fallo de ausente |
| Graph — Crear vacío | Sí | `spec/data_structures_advanced_spec.cr:119` | Verifica `is_empty == true`, contadores en 0, `has_edge == false`, `get_neighbors == nil` |
| Graph — Vértice aislado | Sí | `spec/data_structures_advanced_spec.cr:128` | Inserta 10; verifica éxito, no vacío, 1 vértice, 0 aristas, vecinos `[]` |
| Graph — Etiquetas no consecutivas y arista dirigida | Sí | `spec/data_structures_advanced_spec.cr:137` | Registra 10 y 70, arista `(10, 70)`; dirección verificada, 2 vértices, 1 arista |
| Graph — Vértice duplicado conserva adyacencia | Sí | `spec/data_structures_advanced_spec.cr:146` | Registra 10 y 30 con arista; re-registra 10; adyacencia `[30]` preservada |
| Graph — Arista duplicada | Sí | `spec/data_structures_advanced_spec.cr:157` | Registra `(10, 30)` dos veces; 2 vértices, 1 arista, vecinos `[30]` |
| Graph — Extremo inexistente sin mutación | Sí | `spec/data_structures_advanced_spec.cr:166` | Cuatro intentos con extremos inválidos fallan; grafo inalterado |
| Graph — Vecinos ordenados y contadores | Sí | `spec/data_structures_advanced_spec.cr:185` | Inserción desordenada resulta en `[30, 50, 70]` ordenado; 4 vértices, 4 aristas |
| Graph — Consulta de arista ausente | Sí | `spec/data_structures_advanced_spec.cr:199` | Vértices 10 y 30 sin arista; `has_edge == false`, 0 aristas |
| Graph — Vecinos de vértice inexistente | Sí | `spec/data_structures_advanced_spec.cr:207` | `get_neighbors(99)` retorna `nil`, diferenciado de vecinos vacíos `[]` de 10 |
| Graph — Bucle y duplicado | Sí | `spec/data_structures_advanced_spec.cr:216` | Arista `(10, 10)` dos veces; éxito idempotente, vecinos `[10]`, 1 arista |
| Graph — Aislamiento del resultado de vecinos | Sí | `spec/data_structures_advanced_spec.cr:226` | Modificar array devuelto no altera grafo; nueva arista aísla snapshots |

---

## ⚠️ Limitaciones conocidas / Known limitations

| Limitación / Limitation | Impacto / Impact | Alternativa o plan / Workaround or plan |
|---|---|---|
| Dominio de valores de vértices restringido a `Int32` | Las estructuras están tipadas para enteros de 32 bits | Conforme a la especificación para algoritmos fundamentales; tipos genéricos se abordarán en fases avanzadas |
| Concurrencia no sincronizada | Las estructuras no son seguras ante modificaciones concurrentes desde múltiples fibras | Operación monohilo secuencial, adecuada para el propósito pedagógico del módulo |

---

## 📝 Notas de implementación / Implementation Notes

### 🧱 Jerarquía de nodos / Node hierarchy

**ES:** Se implementa una clase base abstracta `Node` que almacena `@value : Int32`. `TreeNode` extiende `Node` agregando los punteros mutables anulables `@left` y `@right` de tipo `TreeNode?`. `GraphNode` extiende `Node` almacenando la etiqueta en `@value`, una secuencia de adyacencia `Array(Int32)` y el puntero al siguiente vértice `@next_vertex : GraphNode?` para el registro canónico.

**EN:** An abstract base class `Node` storing `@value : Int32` is implemented. `TreeNode` extends `Node` adding nullable mutable pointers `@left` and `@right` of type `TreeNode?`. `GraphNode` extends `Node` storing the label in `@value`, an adjacency sequence `Array(Int32)`, and a pointer to the next vertex `@next_vertex : GraphNode?` for the canonical registry.

### 🛡️ Nulabilidad y seguridad de tipos / Nullability & Type Safety

**ES:** Enlaces ausentes en `TreeNode` e indicadores de inexistencia en `Graph#get_neighbors` utilizan el tipo anulable nativo de Crystal (`nil`). Esto previene punteros colgantes o errores de desreferenciación en tiempo de ejecución mediante la verificación estática del compilador.

**EN:** Absent links in `TreeNode` and missing-vertex indicators in `Graph#get_neighbors` utilize Crystal's native nullable type (`nil`). This prevents dangling pointers or dereferencing runtime errors through the compiler's static analysis.

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
| Especificación / Specification | [`07_Data_Structures_Advanced.md`](../../../../docs/core/algorithms/07_Data_Structures_Advanced.md) |
| Primera base del lenguaje / First language reference | [`crystal/core/algorithms/data_structures_basics/`](../data_structures_basics/README.md) |
| Segunda base del lenguaje / Second language reference | [`crystal/core/foundations/numbers/`](../../foundations/numbers/README.md) |
| Guía de inicialización / Initialisation guide | [`core/00_Project_Initialization_Guide.md`](../../../../docs/core/00_Project_Initialization_Guide.md) |
| Adaptaciones idiomáticas / Idiomatic adaptations | [`AGENT_Template.md`](../../../../docs/AGENT_Template.md) |
| Validación de la documentación / Documentation validation | [`WORKFLOW.md`](../../../../docs/WORKFLOW.md) |
| Documentación oficial del lenguaje / Language official docs | [crystal-lang.org/reference](https://crystal-lang.org/reference/) |

---

*[← Volver a Algorithms Pure](../README.md) | [↑ Volver a Core](../../README.md)*

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*

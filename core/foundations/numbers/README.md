# Numbers — Crystal

Implementación de la especificación [04_Numbers](https://yorche3.github.io/programming_languages/core/foundations/04_Numbers/) en **Crystal**, compilado y probado con **crystal spec**.

Implementa 5 algoritmos fundamentales (suma de los primeros N naturales, factorial, Fibonacci, MCD, MCM) utilizando tres enfoques: **recursivo directo**, **recursivo con acumulador** e **iterativo**.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo / Directorio | Propósito |
|----------------------|-----------|
| [`shard.yml`](shard.yml) | Manifiesto del proyecto Crystal. |
| [`src/numbers.cr`](src/numbers.cr) | 15 funciones (3 enfoques × 5 algoritmos). |
| [`spec/numbers_rec_spec.cr`](spec/numbers_rec_spec.cr) | 5 tests para el enfoque recursivo directo. |
| [`spec/numbers_iter_spec.cr`](spec/numbers_iter_spec.cr) | 5 tests para el enfoque iterativo. |
| [`spec/spec_helper.cr`](spec/spec_helper.cr) | Configuración de `spec` (require del src). |

**Estructura de directorios esperada:**

```text
numbers/
├── shard.yml                     # Manifiesto del proyecto
├── src/
│   └── numbers.cr                # 15 funciones (3 enfoques × 5 algoritmos)
├── spec/
│   ├── spec_helper.cr            # Configuración de specs
│   ├── numbers_rec_spec.cr       # 5 tests recursivos
│   └── numbers_iter_spec.cr      # 5 tests iterativos
└── README.md                     # Este archivo
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Este proyecto usa **Crystal** con `shard.yml` y el framework de testing integrado `spec`.

Cada algoritmo se implementa de tres formas distintas:

1. **Recursivo Directo (`...-rec`)**: Basado directamente en la definición matemática, con llamadas recursivas.
2. **Recursivo con Acumulador (`...-acc`)**: Expone un método limpio que delega en un helper interno con tail recursion.
3. **Iterativo (`...-iter`)**: Utiliza bucles `each`/`while` para evitar el crecimiento de la pila.

**EN:** This project uses **Crystal** with `shard.yml` and the built-in `spec` testing framework.

Each algorithm is implemented in three different ways:

1. **Direct Recursive (`...-rec`)**: Based directly on the mathematical definition, with recursive calls.
2. **Accumulator Recursive (`...-acc`)**: Exposes a clean method that delegates to an internal helper with tail recursion.
3. **Iterative (`...-iter`)**: Uses `each`/`while` loops to avoid stack growth.

---

## 📄 Archivos de configuración clave / Key Configuration Files

### `shard.yml` — Manifiesto del proyecto

**ES:** Define el nombre, versión y versión de Crystal requerida.

**EN:** Defines the name, version and required Crystal version.

```yaml
name: numbers
version: 0.1.0
crystal: '>= 1.20.2'
license: MIT
```

### `src/numbers.cr` — Implementación

**ES:** Las 15 funciones como métodos de módulo (`self.`). Cada algoritmo tiene 3 implementaciones con idéntica semántica pero distinto enfoque.

**EN:** The 15 functions as module methods (`self.`). Each algorithm has 3 implementations with identical semantics but different approaches.

```crystal
# Enfoque recursivo directo
def self.fibonacci_rec(n : Int32)
  if n <= 1
    n
  else
    self.fibonacci_rec(n - 1) + self.fibonacci_rec(n - 2)
  end
end

# Helper con acumulador (tail recursion)
def self.fibonacci_help(n : Int32, acc2 : Int32, acc1 : Int32) : Int32
  if n == 0
    acc2
  else
    self.fibonacci_help(n - 1, acc1, acc2 + acc1)
  end
end

def self.fibonacci_acc(n : Int32)
  self.fibonacci_help(n, 0, 1)
end

# Enfoque iterativo
def self.fibonacci_iter(n : Int32)
  if n < 1
    0
  else
    acc1 = 0; acc2 = 1
    (1..n).each do
      temp = acc1; acc1 = acc2; acc2 = temp + acc2
    end
    acc1
  end
end
```

### `spec/numbers_rec_spec.cr` — Pruebas recursivas

**ES:** 5 tests con `it` y `should eq`.

**EN:** 5 tests with `it` and `should eq`.

```crystal
describe Numbers do
  it "Sum of first n numbers recursive" do
    Numbers.sum_first_n_rec(0).should eq 0
    Numbers.sum_first_n_rec(3).should eq 6
  end
  # ...
  it "Fibonacci recursive" do
    Numbers.fibonacci_rec(0).should eq 0
    Numbers.fibonacci_rec(1).should eq 1
    Numbers.fibonacci_rec(6).should eq 8
  end
end
```

---

## 🚀 Compilación y ejecución / Build & Run

### Requisito: Tener Crystal instalado

```bash
brew install crystal     # macOS / Linux
```

### Ejecutar pruebas

```bash
cd core/foundations/numbers
crystal spec
```

**Salida esperada / Expected output:**

```text
..........

Finished in 320 microseconds
10 examples, 0 failures, 0 errors, 0 pending
```

---

## 🧠 Algoritmos / operaciones

### 3 enfoques × 5 algoritmos = 15 funciones / 10 tests

| Algoritmo | Casos de prueba | `rec` | `acc` | `iter` |
|-----------|----------------|:-----:|:-----:|:------:|
| `sum_first_n` | `(0) = 0`, `(3) = 6` | ✅ | ✅¹ | ✅ |
| `factorial` | `(0) = 1`, `(4) = 24` | ✅ | ✅¹ | ✅ |
| `fibonacci` | `(0) = 0`, `(1) = 1`, `(6) = 8` | ✅ | ✅¹ | ✅ |
| `largest_common_divisor` | `(12, 8) = 4`, `(7, 5) = 1` | ✅ | ✅¹ | ✅ |
| `least_common_multiple` | `(6, 8) = 24`, `(6, 4) = 12` | ✅ | ✅¹ | ✅ |

> ¹ Los acumuladores se prueban implícitamente al ejecutar `acc(n)`, que internamente llama al helper recursivo. No tienen tests directos porque Crystal no garantiza TCO y son detalles de implementación.
> ¹ Accumulators are implicitly tested when `acc(n)` runs, which internally calls the recursive helper. They have no direct tests because Crystal does not guarantee TCO and they are implementation details.

---

## 📝 Notas de implementación / Implementation Notes

### 🔁 Sobre recursión con acumulador y Tail Call Optimization (TCO) / On recursion with accumulator and Tail Call Optimization (TCO)

**ES:**

*Tail recursion* ocurre cuando la llamada recursiva es la última acción que ejecuta una función; después de la llamada no hay más instrucciones, la función devuelve el resultado de la llamada recursiva. La recursión con acumulador consigue esto pasando el estado previo como parámetro a cada llamada, sin dejar trabajo pendiente en la pila.

**Crystal no garantiza TCO.** Crystal compila a código máquina vía LLVM; aunque LLVM puede aplicar TCO en ciertos casos, esto no es parte de la especificación del lenguaje ni es confiable. Por lo tanto, la implementación con acumulador se conserva únicamente con fines educativos: sirve como puente conceptual entre la recursión directa (más cercana a la definición matemática) y la versión iterativa (más eficiente). Como en este contexto no hay un beneficio práctico de rendimiento, no se desarrollan pruebas unitarias específicas para los métodos con acumulador. La validación del comportamiento se cubre a través de las pruebas de los enfoques recursivo e iterativo, que juntos ejercitan los mismos resultados.

**EN:**

*Tail recursion* occurs when the recursive call is the last action that runs a function; after the call there are no more instructions, the function returns the result of the recursive call. Recursion with accumulator achieves this by passing the previous state as a parameter to each call, without leaving any pending work on the stack.

**Crystal does not guarantee TCO.** Crystal compiles to machine code via LLVM; although LLVM may apply TCO in certain cases, this is not part of the language specification nor is it reliable. Therefore, the accumulator implementation is preserved only for educational purposes: it serves as a conceptual bridge between the direct recursive (closer to mathematical definition) and the iterative version (more efficient). Since there is no practical performance benefit in this context, no specific unit tests are developed for the accumulator methods. Behavior validation is covered through the recursive and iterative test suites, which together exercise the same results.

### Sobre la implementación / On the implementation

- **ES:** `multiplication` y `division` en el módulo `calculator` se implementaron con solo `+` y `-`. En `numbers` se usan `*` y `/` directamente.
- **EN:** `multiplication` and `division` in the `calculator` module were implemented with only `+` and `-`. In `numbers`, `*` and `/` are used directly.
- **ES:** Todos los parámetros están anotados con tipos (`Int32`) gracias al sistema de tipos estáticos de Crystal.
- **EN:** All parameters are annotated with types (`Int32`) thanks to Crystal's static type system.
- **ES:** `crystal spec` descubre automáticamente todos los archivos `*_spec.cr` en `spec/` y los ejecuta.
- **EN:** `crystal spec` automatically discovers all `*_spec.cr` files in `spec/` and runs them.

---

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---
*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*

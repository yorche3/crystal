# Calculator — Crystal

Implementación de la especificación [03_Unit_Test_Calculator](https://yorche3.github.io/programming_languages/core/foundations/03_Unit_Test_Calculator/) en **Crystal**, compilado y probado con **crystal spec**.

Implementa 5 operaciones aritméticas (`addition`, `subtraction`, `multiplication`, `division`, `modulus`) usando únicamente `+` y `-` como operaciones primitivas.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo / Directorio | Propósito |
|----------------------|-----------|
| [`shard.yml`](shard.yml) | Manifiesto del proyecto Crystal. |
| [`src/calculator.cr`](src/calculator.cr) | Implementación de las 5 operaciones aritméticas. |
| [`spec/calculator_spec.cr`](spec/calculator_spec.cr) | 5 tests con `crystal spec`. |
| [`spec/spec_helper.cr`](spec/spec_helper.cr) | Configuración de `spec` (require del src). |

**Estructura de directorios esperada:**

```text
calculator/
├── shard.yml                    # Manifiesto del proyecto
├── src/
│   └── calculator.cr            # 5 operaciones aritméticas
├── spec/
│   ├── spec_helper.cr           # Configuración de specs
│   └── calculator_spec.cr       # 5 tests
└── README.md                    # Este archivo
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Este proyecto usa **Crystal** con `shard.yml` y el framework de testing integrado `spec`.

Características:
- **5 operaciones**: `addition`, `subtraction`, `multiplication`, `division`, `modulus`.
- **Implementación minimalista**: `multiplication`, `division` y `modulus` se construyen usando solo `+` y `-` como operaciones primitivas.
- **Framework de tests**: `crystal spec` — el marco de testing incluido en Crystal.
- **Tipado estático**: todos los parámetros y retornos están anotados con tipos (`Int32`).

**EN:** This project uses **Crystal** with `shard.yml` and the built-in `spec` testing framework.

Features:
- **5 operations**: `addition`, `subtraction`, `multiplication`, `division`, `modulus`.
- **Minimalist implementation**: `multiplication`, `division` and `modulus` are built using only `+` and `-` as primitive operations.
- **Test framework**: `crystal spec` — Crystal's built-in testing framework.
- **Static typing**: all parameters and return types are annotated (`Int32`).

---

## 📄 Archivos de configuración clave / Key Configuration Files

### `shard.yml` — Manifiesto del proyecto

**ES:** Define el nombre, versión, autor y versión de Crystal requerida.

**EN:** Defines the name, version, author and required Crystal version.

```yaml
name: calculator
version: 0.1.0
crystal: '>= 1.20.2'
license: MIT
```

### `src/calculator.cr` — Implementación

**ES:** Las 5 operaciones como métodos de módulo (`self.`). `multiplication` suma repetidamente, `division` resta repetidamente, y `modulus` usa ambos.

**EN:** The 5 operations as module methods (`self.`). `multiplication` repeatedly adds, `division` repeatedly subtracts, and `modulus` uses both.

```crystal
module Calculator
  def self.addition(a : Int32, b : Int32) : Int32
    a + b
  end

  def self.subtraction(a : Int32, b : Int32) : Int32
    a - b
  end

  def self.multiplication(a : Int32, b : Int32) : Int32
    result = 0
    (1..b).each { |i| result = addition(result, a) }
    result
  end

  def self.division(a : Int32, b : Int32) : Int32
    quotient = 0
    remainder = a
    while remainder >= b
      remainder = subtraction(remainder, b)
      quotient = addition(quotient, 1)
    end
    quotient
  end

  def self.modulus(a : Int32, b : Int32) : Int32
    quotient = division(a, b)
    subtraction(a, multiplication(b, quotient))
  end
end
```

### `spec/calculator_spec.cr` — Pruebas

**ES:** 5 tests individuales con `it` y `should eq`. Crystal usa `spec`, similar a RSpec de Ruby.

**EN:** 5 individual tests with `it` and `should eq`. Crystal uses `spec`, similar to Ruby's RSpec.

```crystal
describe Calculator do
  it "Addition test" do
    Calculator.addition(2, 3).should eq 5
  end

  it "Subtraction test" do
    Calculator.subtraction(5, 3).should eq 2
  end

  it "Multiplication test" do
    Calculator.multiplication(4, 3).should eq 12
  end

  it "Division test" do
    Calculator.division(10, 3).should eq 3
  end

  it "Modulus test" do
    Calculator.modulus(10, 3).should eq 1
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
cd core/foundations/unit_test/calculator
crystal spec
```

**Salida esperada / Expected output:**

```text
.....

Finished in 0.55 milliseconds
5 examples, 0 failures, 0 errors, 0 pending
```

---

## 🧠 Algoritmos / operaciones

| Operación | Implementación | Primitivas usadas |
|-----------|---------------|-------------------|
| `addition(a, b)` | `a + b` | `+` |
| `subtraction(a, b)` | `a - b` | `-` |
| `multiplication(a, b)` | Suma repetitiva de `a`, `b` veces | `+` |
| `division(a, b)` | Resta repetitiva, cuenta cociente | `+`, `-` |
| `modulus(a, b)` | `a - (cociente * b)` | `+`, `-` |

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** `multiplication` y `division` están implementadas con bucles (`each` y `while`), que es la forma iterativa estándar en Crystal.
- **EN:** `multiplication` and `division` are implemented with loops (`each` and `while`), which is the standard iterative form in Crystal.
- **ES:** Todos los tipos están explícitamente anotados (`Int32`) gracias al sistema de tipos estáticos de Crystal.
- **EN:** All types are explicitly annotated (`Int32`) thanks to Crystal's static type system.
- **ES:** `crystal spec` es el comando integrado para ejecutar tests. No necesita configuración adicional.
- **EN:** `crystal spec` is the built-in command to run tests. No additional configuration needed.
- **ES:** Crystal usa `spec` (similar a RSpec) como framework de testing. No se requieren gems externas.
- **EN:** Crystal uses `spec` (similar to RSpec) as its testing framework. No external gems required.

---

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---
*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*

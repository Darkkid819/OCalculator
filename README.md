# OCalculator

## Description

**OCalculator** is a simple command-line calculator built in **OCaml** for evaluating arithmetic expressions. It supports both **integers and floating-point numbers**, handling common arithmetic operations such as addition, subtraction, multiplication, and division, as well as **parentheses** for grouping expressions. This project demonstrates fundamental programming concepts like tokenization, parsing, and evaluation, and aims to provide a fun and functional learning experience with OCaml.

---

## Features

- **Basic arithmetic operations**: Addition (+), Subtraction (-), Multiplication (*), Division (/)
- **Parentheses support**: Handle expressions like `(3 + 4) * 2`
- **Floating-point precision**: Supports both integers and floats, intelligently formats results to remove unnecessary trailing zeroes.
- **Division-by-zero handling**: Gracefully informs the user about division-by-zero errors.
- **Interactive REPL**: Continuously prompts for input until the user exits the program (via `Ctrl-C` or `Ctrl-Z`).

---

## Visuals

Here is an example of **OCalculator** in action:

```
Enter an expression (or press Ctrl-C to exit):
3 + 4
Result: 7

Enter an expression (or press Ctrl-C to exit):
(2 + 3) * 4
Result: 20

Enter an expression (or press Ctrl-C to exit):
10 / 3
Result: 3.33333

Enter an expression (or press Ctrl-C to exit):
10 / 0
Error: Division by zero
```

---

## Installation

### Requirements
- **OCaml** installed on your system (via [OPAM](https://opam.ocaml.org/) or your system's package manager)
- **Dune** build system (install with `opam install dune`)

### Steps

1. **Clone the repository**:
   ```bash
   git clone <your-repository-url>
   cd OCalculator
   ```

2. **Build the project**:
   ```bash
   dune build
   ```

3. **Run the calculator**:
   ```bash
   dune exec bin/main.exe
   ```

---

## Usage

1. **Start the calculator**:
   ```bash
   dune exec bin/main.exe
   ```

2. **Enter arithmetic expressions** and view the results immediately. Some example inputs:
   ```
   1 + 2 * 3
   (5 + 3) / 2
   2 - 3 + 4
   ```

3. **Exit the program**:
   - Press **Ctrl-C** or **Ctrl-Z** to exit.

---

## Roadmap

Here are some potential future improvements for OCalculator:

- **Variables and assignments**: Allow users to store results in variables (e.g., `x = 3 + 4`).
- **Scientific functions**: Add support for functions like `sin`, `cos`, `log`.
- **Modulus operator**: Support for `%` to find remainders.
- **History feature**: Store the result of previous calculations as `Ans`.
- **Unit tests**: Add tests to ensure code correctness.

---

## Contributing

Contributions are welcome! If you'd like to contribute just submit a pull request.

Feel free to open **issues** for feature requests or bug reports.

---

## License

This project is licensed under the **GPL License**.

# 🧩 LaTeX Test Examples

This document shows how to compile simple **English** and **Persian** LaTeX files inside a Linux (or Docker) environment.

---

## 📝 English Example

**File:** `test_english.tex`

```latex
\documentclass{article}

\begin{document}

\section{Hello, World!}

This is a simple English \LaTeX{} test document.

\end{document}
````

**To compile:**

```bash
pdflatex test_english.tex
pdflatex -shell-escape test_english.tex
```

After compilation, you will get:

```
test_english.pdf
```

---

## 📝 Persian Example

**File:** `test_farsi.tex`

```latex
\documentclass{article}
\usepackage{xepersian}
\settextfont{DejaVu Sans} % Default built-in font

\begin{document}

\section{سلام دنیا}

این یک تست ساده از \LaTeX{} است.  
اگر این متن را می‌بینید، تنظیمات فارسی درست کار می‌کند.

\end{document}
```

**To compile:**

```bash
xelatex test_farsi.tex
```

After compilation, you will get:

```
test_farsi.pdf
```

---

### 🧠 Notes

* Use **`pdflatex`** for English or Latin-based text.
* Use **`xelatex`** for Persian, Arabic, or any RTL (right-to-left) scripts.
* Make sure your environment has the following installed:

  ```
  texlive-xetex
  texlive-lang-arabic
  ```

  These enable Persian (Unicode and RTL) support.

---


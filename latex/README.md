# 🧩 LaTeX Docker Test

This repository demonstrates how to compile **English** and **Persian** LaTeX documents inside a Docker container.

---

## 🐳 1. Build the Docker Image

Run this command in the project directory (where the `Dockerfile` is located):

```bash
docker build -t latex .
````

---

## 📄 2. Example LaTeX Files

### 📝 English Example (`test_english.tex`)

```latex
\documentclass{article}

\begin{document}

\section{Hello, Docker!}

This is a simple English \LaTeX{} test inside a Docker container.  
If you see this text in the generated PDF, everything works fine!

\end{document}
```

Compile it inside the container with:

```bash
docker run --rm -v $(pwd):/data -w /data latex pdflatex test_english.tex
```

This produces `test_english.pdf`.

---

### 📝 Persian Example (`test_farsi.tex`)

```latex
\documentclass{article}
\usepackage{xepersian}
\settextfont{DejaVu Sans} % Default system font, no extra installation required

\begin{document}

\section{سلام دنیا}

این یک تست ساده از \LaTeX{} در محیط داکر است.  
اگر این متن به درستی نمایش داده می‌شود، تنظیمات شما درست هستند.

\end{document}
```

Compile it inside the container with:

```bash
docker run --rm -v $(pwd):/data -w /data latex xelatex test_farsi.tex
```

This produces `test_farsi.pdf`.

---

## 🧰 3. Notes

* `pdflatex` → for English or Latin-based documents.
* `xelatex` → for Persian or other non-Latin scripts (RTL, Unicode).
* Ensure your image includes:

  ```bash
  texlive-xetex texlive-lang-arabic
  ```

  These packages enable Persian and RTL support.

---

## ✅ 4. Verify Output

After successful compilation, you should see:

```
test_english.pdf
test_farsi.pdf
```

Open them locally with any PDF viewer to confirm proper text rendering.

---

**Author:** Ehsan Ghasemi
**License:* Tehran University  


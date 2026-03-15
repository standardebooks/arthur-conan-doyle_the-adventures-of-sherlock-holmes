# Goal

Produce a **faithful Vietnamese translation** while preserving the **Standard Ebooks EPUB source format**.

---

# Project Overview

This repository contains the **Standard Ebooks source files** for the book:

**The Adventures of Sherlock Holmes**
Author: Arthur Conan Doyle

The task of the AI agent is to translate the English text into **Vietnamese** while preserving the **Standard Ebooks source format**.

The translation must **NOT break EPUB build compatibility**.

---

# Critical Rule: Preserve Standard Ebooks Format

Before translating any file, the agent must read:

- TRANSLATION_GLOSSARY.md
- STYLE_GUIDE_VI.md

The repository follows the **Standard Ebooks production format**.

The agent must **never modify the structure of the source files**.

The agent must ensure the output remains valid XHTML. Can verify with: `xmllint`

Allowed changes:

* Translate visible English text → Vietnamese

Forbidden changes:

* HTML tag structure
* element attributes
* IDs
* class names
* metadata fields
* file names
* directory structure
* CSS
* EPUB semantics

Example:

Original:

```html
<p>Holmes smiled and lit his pipe.</p>
```

Correct:

```html
<p>Holmes khẽ mỉm cười rồi châm tẩu thuốc.</p>
```

Incorrect:

```html
<div>Holmes khẽ mỉm cười rồi châm tẩu thuốc.</div>
```

---

# Files That Should Be Translated

Only translate text inside:

```
src/epub/text/*.xhtml
```

Typical files include:

```
a-scandal-in-bohemia.xhtml
the-red-headed-league.xhtml
a-case-of-identity.xhtml
the-boscombe-valley-mystery.xhtml
the-five-orange-pips.xhtml
the-man-with-the-twisted-lip.xhtml
the-blue-carbuncle.xhtml
the-speckled-band.xhtml
the-engineers-thumb.xhtml
the-noble-bachelor.xhtml
the-beryl-coronet.xhtml
the-copper-beeches.xhtml
```

Do NOT translate:

```
src/epub/css/*
src/epub/images/*
src/epub/toc.xhtml
src/epub/content.opf
src/epub/imprint.xhtml
```

unless explicitly instructed.

---

# HTML Translation Rules

Translate **text nodes only**.

Do NOT modify:

```
<p>
<h1>–<h6>
<blockquote>
<abbr>
<cite>
<i>
<em>
<span>
```

Example:

Correct:

```html
<p>“Anh nghĩ sao, Watson?” Holmes hỏi.</p>
```

Incorrect:

```html
<p>"Anh nghĩ sao Watson?" Holmes hỏi.</p>
```

Quotation style must remain typographically correct.

---

# Typography Rules

Maintain Standard Ebooks typography:

| Element       | Rule                            |
| ------------- | ------------------------------- |
| Quotes        | Use Vietnamese curly quotes “ ” |
| Emphasis      | Keep `<em>` tags                |
| Titles        | Keep `<cite>` tags              |
| Abbreviations | Keep `<abbr>` tags              |

Example:

```
<cite>A Scandal in Bohemia</cite>
```

must remain unchanged.

---

# Character Names (Do Not Translate)

Must remain unchanged, do not translate.

---

# Narrative Style

Watson is the narrator.

Rules:

* Watson uses **“tôi”**
* Holmes is referred to as **Holmes**
* Keep a **literary Vietnamese tone**

Avoid:

* slang
* modern internet language
* literal word-for-word translation

---

# Dialogue Formatting

Original:

```html
<p>“What do you think, Watson?” Holmes asked.</p>
```

Correct translation:

```html
<p>“Anh nghĩ sao, Watson?” Holmes hỏi.</p>
```

Keep punctuation inside quotation marks.

---

# Translation Workflow

For each XHTML file:

1. Read the English paragraph.
2. Understand context.
3. Translate text only.
4. Keep HTML structure identical.
5. Preserve paragraph order.
6. Verify no English text remains.

---

# Commit Rules

Each translated story should be committed separately.

Commit message format:

```
translate: <story-name> to Vietnamese
```

Example:

```
translate: A Scandal in Bohemia to Vietnamese
```

---

# Validation Checklist

Before committing, verify:

* [ ] HTML structure unchanged
* [ ] No tag modifications
* [ ] Vietnamese grammar correct
* [ ] Character names preserved
* [ ] Quotes formatted correctly
* [ ] No untranslated English remains

---

# Forbidden Actions

The agent must NOT:

* summarize the story
* modernize the language
* change HTML tags
* add explanatory notes
* modify EPUB metadata
* reformat paragraphs

---

# HTML-Safe Translation Rules

The source files are XHTML from the Standard Ebooks project.

The agent must preserve **all HTML tags exactly**.

Rules:

1. Do NOT modify HTML tags.
2. Do NOT remove attributes.
3. Do NOT add new tags.
4. Translate only the visible text between tags.

Example:

Input:
```html
<p>Holmes smiled and lit his pipe.</p>
```

Correct output:

```html
<p>Holmes khẽ mỉm cười rồi châm tẩu thuốc.</p>
```

Incorrect output:

```html
<div>Holmes khẽ mỉm cười rồi châm tẩu thuốc.</div>
```

---

# Segment-Based Translation

The agent must translate XHTML text using small segments.

Segmentation rules:

1. Split text by sentences.
2. Translate each sentence individually.
3. Reassemble the paragraph.

Example:

Input:

```html
<p>Holmes smiled and lit his pipe. He leaned back in his chair.</p>
```

Process:

- Segment 1: Holmes smiled and lit his pipe.
- Segment 2: He leaned back in his chair.

Output:

```html
<p>Holmes khẽ mỉm cười rồi châm tẩu thuốc. Anh ngả lưng vào ghế.</p>
```

Rules:

- Do not change punctuation structure.
- Maintain sentence order.
- Preserve quotation formatting.


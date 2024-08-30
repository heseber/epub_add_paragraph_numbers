# Adding paragraph numbers to e-books (epub)

## Why is this needed?

E-books in epub format do not have fixed page numbers. The number of pages depens on the eBook reader and on the font size. For scientific publication, it is necessary to specify the location of a citation.

When citing a specific location in an ePub format e-book, which does not have fixed page numbers, the APA Style guidelines suggest using paragraph numbers or section headings instead. Here are the recommended methods:

1. **Paragraph Number:** If the e-book provides paragraph numbers, you can use these directly in your citation. For example, (Author, Year, para. 4).
2. **Counted Paragraphs:** If paragraph numbers are not provided, you can count the paragraphs from the beginning of the section or chapter. For example, (Author, Year, Chapter 3, para. 12).
3. **Section Headings:** You can also use an overarching heading plus a paragraph number within that section. If the heading is too long, you may use an abbreviated version in quotation marks. For example, (Author, Year, "Heading", para. 5).

These methods ensure that the citation is specific enough for readers to locate the referenced material in the e-book. The first of these three methods does not work well, though, for readers who do not have a book or e-book with absolute paragraph numbers, numbered throughout the book.

Methods 2 and 3 are much more suitable, as it is not too difficult for the reader to count the paragraphs starting from a chapter or section, even without numbered paragraphs in their copy of the book.

## What does this program do?

This program adds a paragraph number to each paragraph, whereby the numbering starts again with 1 after each heading, i.e. at the beginning of each chapter or section. The program replaces the epub file "in-place".

> [!WARNING]
> Copy-protected e-books cannot be edited!

## Installation

```sh
git clone https://github.com/heseber/epub_add_paragraph_numbers.git
cd epub_add_paragraph_numbers
pip install virtualenv
virtualenv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

## Usage

```sh
./add_paragraph_numbery path_to_my_ebook.epub
```
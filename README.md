# Pandoc LaTeX template for manuscripts following Ursula Le Guin's recommendations

What the title says.  The template follows [Ursula Le Guin's
guidelines for manuscript
preparation](http://www.ursulakleguin.com/ManuscriptPrep.html).

## Usage

Copy `ursula.latex` to your data directory at `$DATADIR/templates`.
Also copy both `.lua` files to `$DATADIR/filters`.  Then, you can do
something like

```
pandoc -o example.pdf --lua-filter scene-separator.lua --template ursula --pdf-engine=lualatex src1.md src2.md metadata.yaml
```

where `src1.md` etc. are your Markdown source files, and
`metadata.yaml` is the metadata YAML file.

### Metadata

The metadata file looks something like this:

```
---
title: Manuscript Title
shorttitle: Title
author:
- name: Author N. Ame
  penname:  A. N. Ame
  lastname: Ame
address:
- 1 Gethen St
- Hain, HA 12345
---
```

where `shorttitle` and `lastname` are put in the header together with
the page number as, e.g., "Ame, Title, 151".  The name `penname` is
displayed on the byline, while `name` is displayed together with the
address at the top left of the cover page.  Note that each line of the
address in the YAML file starts with a dash.

### Scene separators

To render a scene separator, e.g. a "#" on a line by itself, centered,
put `{{scene-break}}` on your Markdown file on a paragraph by itself
where you want the scene separator to go.

### Word count

To get an approximate word count, rounded to the closest multiple of
1000, you can do

```
pandoc --lua-filter wordcount.lua src1.md src2.md
```

Additionally, you can pass a word count to be displayed on the output
by doing something like

```
pandoc -o example.pdf --lua-filter scene-separator.lua --template ursula --pdf-engine=lualatex src1.md src2.md metadata.yaml --metadata wordcount=1000
```

This displays the line "about 1,000 words" at the bottom of the title
page (as borrowed from [William Shunn's timeless
guidelines](https://www.writerswrite.com/journal/dec98/proper-manuscript-format-12984).
This can be automated with the word count filter.  See
`example/Makefile` for an example.

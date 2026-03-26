# Course Website Template

Course site built with Jekyll (GitHub Pages toolchain) and based on Minimal Mistakes.

## Required Toolchain

For local development and testing, install:

1. Ruby `3.3.4` (see [`.ruby-version`](.ruby-version))
2. Bundler
3. Git

Optional, only if you need syllabus PDF output:

1. Pandoc
2. A LaTeX engine (for example MacTeX/TeX Live, used by Pandoc when writing PDF)

## Local Setup

Install Ruby dependencies:

```bash
bundle install
```

Run locally with live reload:

```bash
bundle exec jekyll serve --livereload
```

Then open: `http://127.0.0.1:4000/course-site-template/`

## Contributor Workflow

### 1) Update course personnel

A common contributor task is updating the People page. In this template, that data lives in [`_data/personel.yaml`](_data/personel.yaml), and the page is rendered from [`people.md`](people.md).

Each entry should include:

- `name`
- `role` (for example `Instructor`, `TA`, `Tutor`, `Grader`)
- `email` (or leave blank)
- `email_link` (typically `mailto:...`, or leave blank)
- `office_hours` (or leave blank)

This is just one example of the general contributor loop for data-driven pages: update the source data, run the site locally, and review the rendered page.

### 2) Update syllabus content

Primary syllabus source: [`syllabus.md`](syllabus.md)

Typical loop:

1. Edit `syllabus.md`
2. Run `bundle exec jekyll serve --livereload`
3. Review `http://127.0.0.1:4000/course-site-template/syllabus/`

If you need PDF output:

```bash
./syllabus_prebuild.rb
pandoc syllabus_rendered.md --metadata-file=_config.yml -o syllabus.pdf
```

### 3) Update schedule and related course content

Schedule data lives in [`_data/schedule.yml`](_data/schedule.yml), and the page template is [`schedule.md`](schedule.md).

Typical loop:

1. Edit `_data/schedule.yml`
2. Run local server (`bundle exec jekyll serve --livereload`)
3. Review `http://127.0.0.1:4000/course-site-template/schedule/`

If a derived course repo adds assignment writeups, starter files, or other course materials elsewhere, update those alongside the relevant schedule entries.

## Notes

- The local Ruby/Jekyll toolchain is pinned in [`Gemfile`](Gemfile), [`Gemfile.lock`](Gemfile.lock), and [`.ruby-version`](.ruby-version).
- This template still uses [`_data/authors.yml`](_data/authors.yml) for site author metadata; keep that file for instructor/sidebar metadata.
- This template currently spells the personnel data file as [`_data/personel.yaml`](_data/personel.yaml); keep that filename unless you also update references such as [`people.md`](people.md).
- The first `jekyll serve` on a new machine needs internet access to download the remote theme.

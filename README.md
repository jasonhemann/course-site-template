# Course Website

Course site built with Jekyll (GitHub Pages toolchain) and based on Minimal Mistakes.

## Required Toolchain

For local development and testing, install:

1. Ruby `3.3.4` (see [`.ruby-version`](.ruby-version))
2. Bundler (Ruby gem package manager)
3. Git

Optional, only if you need syllabus PDF output:

1. Pandoc
2. A LaTeX engine (for example MacTeX/TeX Live, used by Pandoc when writing PDF)

## Local Setup

Install Ruby dependencies:

```bash
bundle install
```

Build the site once (CI-like check):

```bash
bundle exec jekyll build
```

Run locally with live reload:

```bash
bundle exec jekyll serve --livereload
```

Then open: `http://127.0.0.1:4000/course-site-template/`

## Contributor Workflow (TAs)

### 1) Add/update course personnel

At the start of each semester, update [`_data/personel.yaml`](_data/personel.yaml).

Each entry should include:

- `name`
- `role` (for example `TA`, `Instructor`, `Grader`)
- `email` (or leave blank)
- `email_link` (typically `mailto:...`, or leave blank)
- `office_hours` (or leave blank)

The People page at [`people.md`](people.md) renders this file directly.

### 2) Adjust syllabus content

Primary syllabus source: [`syllabus.md`](syllabus.md)

Typical loop:

1. Edit `syllabus.md`
2. Run `bundle exec jekyll serve --livereload`
3. Review `http://127.0.0.1:4000/course-site-template/syllabus/`
4. Validate with `bundle exec jekyll build`

If you need PDF output:

```bash
./syllabus_prebuild.rb
pandoc syllabus_rendered.md --metadata-file=_config.yml -o syllabus.pdf
```

### 3) Adjust schedule content

Schedule data lives in [`_data/schedule.yml`](_data/schedule.yml), and the page template is [`schedule.md`](schedule.md).

Typical loop:

1. Edit `_data/schedule.yml`
2. Run local server (`bundle exec jekyll serve --livereload`)
3. Review `http://127.0.0.1:4000/course-site-template/schedule/`
4. Validate with `bundle exec jekyll build`

## Notes

- This repo still uses [`_data/authors.yml`](_data/authors.yml) for site author metadata; keep that file for instructor/sidebar metadata.
- The first `jekyll build`/`jekyll serve` on a new machine needs internet access to download the remote theme.

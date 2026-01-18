# Jason Hemann Course Repository Website Template

## Based on [Minimal Mistakes Jekyll theme](https://mmistakes.github.io/minimal-mistakes/)

In the future it might be better to build sites from [mm-github-starter](https://github.com/mmistakes/mm-github-pages-starter)

Since it's derivative, all original rights as described in the OG repo

## Syllabus PDF build

To build a PDF of the syllabus

```
./syllabus_prebuild.rb
pandoc syllabus_rendered.md --metadata-file=_config.yml -o syllabus.pdf
```

`mintyml-jekyll` is a [Jekyll](https://jekyllrb.com/)
plugin that enables writing Jekyll pages in [MinTyML](https://github.com/youngspe/mintyml#readme).

This plugin uses the [`mintyml` NPM package](https://www.npmjs.com/package/mintyml)
and assumes that Node and NPM are installed.

## Features

This plugin provides a MinTyML Converter, a `mintyml_escape` filter, and a `render_mintyml` Tag.

### MinTyML Converter

With this plugin installed, any page (**not** including `_layouts` or `_includes`) with front matter and a file extension of `.mty`, `.minty`, or `.mintyml`
is automatically converted from MinTyML to HTML when building the site.

### `mintyml_escape` Filter

This filter escapes characters that have special meaning in MinTyML.
So `{{ "x < y < z" | mintyml_escape }}`
translates to `x \< y \< z`.

### `render_mintyml` Tag

This block tag converts its contents from MinTyML to HTML.
Layouts (but not posts/pages) need to be wrapped in `render_mintyml` blocks.

#### Example

**`_layouts/post.mty`**

```mintyml
{% render_mintyml %}
html {
  head>title> {{ page.title | mintyml_escape }}
  body {
    header {
      {{ site.title | mintyml_escape }}
    }

    main>article {
      h1> {{ page.title | mintyml_escape }}

      <[raw[ {{ content }} ]]>
    }
  }
}
{% endrender_mintyml %}
```

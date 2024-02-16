#!/bin/bash -
cat <<EOF
<!DOCTYPE html>
<html lang="en">
  <head>
    <noscript><meta http-equiv="refresh" content="0;url=?raw=1"/></noscript>
    <meta charset="UTF-8">
    <style rel="stylesheet">
      pre code { /* i.e. code \`\`\`blocks\`\`\`, but not \`inline\` */
        display: block; /* otherwise first line gets offset, and rest don't */
      }

      :target::after { /* add indicator to #anchor header */
          content: " ⬅";
          color: DarkOrange;
          line-height: 1em; /* otherwise UTF-8 arrow grows the title height */
      }

      .fragment > a:last-child { /* "#<id>" link to the left of headers */
          margin-left: 1ch;
          opacity: 0.25;
      }
      .fragment:hover > a:last-child::after { /* hidden by default */
          content: "#";
      }

      // BSD 3-Clause License
      //
      // Copyright (c) 2006, Ivan Sagalaev.
      // All rights reserved.
      //
      // Redistribution and use in source and binary forms, with or without
      // modification, are permitted provided that the following conditions are met:
      //
      // * Redistributions of source code must retain the above copyright notice, this
      //   list of conditions and the following disclaimer.
      //
      // * Redistributions in binary form must reproduce the above copyright notice,
      //   this list of conditions and the following disclaimer in the documentation
      //   and/or other materials provided with the distribution.
      //
      // * Neither the name of the copyright holder nor the names of its
      //   contributors may be used to endorse or promote products derived from
      //   this software without specific prior written permission.
      //
      // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
      // AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
      // IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
      // DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
      // FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
      // DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
      // SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
      // CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
      // OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
      // OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
      // https://github.com/highlightjs/highlight.js:
      `curl https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@v11.9.0/build/styles/github.min.css`
    </style>
    <script type="application/javascript">
      // https://github.com/highlightjs/highlight.js:
      `curl https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@v11.9.0/build/highlight.min.js`

      // https://github.com/markdown-it/markdown-it
      // Copyright (c) 2014 Vitaly Puzrin, Alex Kocharin.
      //
      // Permission is hereby granted, free of charge, to any person
      // obtaining a copy of this software and associated documentation
      // files (the "Software"), to deal in the Software without
      // restriction, including without limitation the rights to use,
      // copy, modify, merge, publish, distribute, sublicense, and/or sell
      // copies of the Software, and to permit persons to whom the
      // Software is furnished to do so, subject to the following
      // conditions:
      //
      // The above copyright notice and this permission notice shall be
      // included in all copies or substantial portions of the Software.
      //
      // THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
      // EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
      // OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
      // NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
      // HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
      // WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
      // FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
      // OTHER DEALINGS IN THE SOFTWARE.
      // https://github.com/markdown-it/markdown-it:
      `curl https://cdn.jsdelivr.net/npm/markdown-it@14.0.0/dist/markdown-it.min.js`
      // https://github.com/markdown-it/markdown-it-abbr:
      `curl https://cdn.jsdelivr.net/npm/markdown-it-abbr@2.0.0/dist/markdown-it-abbr.min.js`
      // https://github.com/markdown-it/markdown-it-deflist:
      `curl https://cdn.jsdelivr.net/npm/markdown-it-deflist@3.0.0/dist/markdown-it-deflist.min.js`
      // https://github.com/markdown-it/markdown-it-footnote:
      `curl https://cdn.jsdelivr.net/npm/markdown-it-footnote@4.0.0/dist/markdown-it-footnote.min.js`
      // https://github.com/markdown-it/markdown-it-ins:
      `curl https://cdn.jsdelivr.net/npm/markdown-it-ins@4.0.0/dist/markdown-it-ins.min.js`
      // https://github.com/markdown-it/markdown-it-mark:
      `curl https://cdn.jsdelivr.net/npm/markdown-it-mark@4.0.0/dist/markdown-it-mark.min.js`
      // https://github.com/markdown-it/markdown-it-sub:
      `curl https://cdn.jsdelivr.net/npm/markdown-it-sub@2.0.0/dist/markdown-it-sub.min.js`
      // https://github.com/markdown-it/markdown-it-sup:
      `curl https://cdn.jsdelivr.net/npm/markdown-it-sup@2.0.0/dist/markdown-it-sup.min.js`

      // https://github.com/valeriangalliat/markdown-it-anchor (UNLICENSE):
      `curl https://cdn.jsdelivr.net/npm/markdown-it-anchor@8.6.7/dist/markdownItAnchor.umd.min.js`

      // Copyright (c) 2016, Revin Guillen
      //
      // Permission to use, copy, modify, and/or distribute this software for any
      // purpose with or without fee is hereby granted, provided that the above
      // copyright notice and this permission notice appear in all copies.
      //
      // THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
      // WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
      // MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
      // ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
      // WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
      // ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
      // OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
      // https://github.com/revin/markdown-it-task-lists:
      `curl https://cdn.jsdelivr.net/npm/markdown-it-task-lists@2.1.1/dist/markdown-it-task-lists.min.js`


      const md = markdownit({
        highlight: function (str, lang) {
        if (lang && hljs.getLanguage(lang)) {
          try {
            return hljs.highlight(str, { language: lang }).value;
          } catch (__) {}
        }
        return ''; // use external default escaping
      }})
        .use(markdownitAbbr)
        .use(markdownItAnchor)
        .use(markdownitDeflist)
        .use(markdownitFootnote)
        .use(markdownitIns)
        .use(markdownitMark)
        .use(markdownitSub)
        .use(markdownitSup)
        .use(markdownitTaskLists);

      const targetFile = location.pathname;
      const request = fetch(targetFile, {headers: {'Accept': 'text/markdown'}}).then((res) => {
        if (!res.ok) throw new Error(res.statusText+": "+res.status);
        return res.text()
      })
    </script>
    <script defer>
      request.then((text) => {
        document.body.innerHTML = md.render(text);
        if (location.hash != "") location = location.hash; /* apply CSS :target rules to shadow DOM */
        document.querySelectorAll("h1,h2,h3,h4,h5,h6").forEach(e=>{ /* add fragment links to headers */
            e.classList.add('fragment');
            e.appendChild(document.createElement("a")).href="#"+e.id;
        });
        let h1 = document.getElementsByTagName("h1")[0];
        if (h1) document.title = h1.textContent;
      }).catch((err) => document.body.innerHTML = "<code>Failed to load "+targetFile+": "+err.message+"</code>")
    </script>
  </head>
  <body>
    <noscript>Rendered using JavaScript, so <a href="?raw=1">click here</a> to redirect to the source</noscript>
  </body>
</html>
EOF

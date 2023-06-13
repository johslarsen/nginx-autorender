#!/bin/bash -
cat <<EOF
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <style rel="stylesheet">
      // https://github.com/highlightjs/highlight.js:
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
      `curl https://cdn.bootcdn.net/ajax/libs/highlight.js/10.1.2/styles/github.min.css`

      // The MIT License (MIT)
      //
      // Copyright (c) CJ Patoilo <cjpatoilo@gmail.com>
      //
      // Permission is hereby granted, free of charge, to any person obtaining a copy
      // of this software and associated documentation files (the "Software"), to deal
      // in the Software without restriction, including without limitation the rights
      // to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
      // copies of the Software, and to permit persons to whom the Software is
      // furnished to do so, subject to the following conditions:
      //
      // The above copyright notice and this permission notice shall be included in all
      // copies or substantial portions of the Software.
      //
      // THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
      // IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
      // FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
      // AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
      // LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
      // OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
      // SOFTWARE.
      `curl https://cdn.bootcdn.net/ajax/libs/milligram/1.4.1/milligram.min.css`
    </style>
    <script type="application/javascript">
      // https://github.com/markedjs/marked:
      // Copyright (c) 2018+, MarkedJS (https://github.com/markedjs/) Copyright (c) 2011-2018, Christopher Jeffrey (https://github.com/chjj/)
      //
      // Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
      //
      // The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
      //
      // THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
      `curl https://cdn.bootcdn.net/ajax/libs/marked/1.1.1/marked.min.js`

      // https://github.com/highlightjs/highlight.js:
      `curl https://cdn.bootcdn.net/ajax/libs/highlight.js/10.1.2/highlight.min.js`

      marked.setOptions({
        renderer: new marked.Renderer(),
        highlight: function (code, lang) {
          const validLanguage = hljs.getLanguage(lang) ? lang : 'plaintext';
          return hljs.highlight(validLanguage, code).value;
        }
      });
      const targetFile = location.pathname;
      const request = fetch(targetFile, {headers: {'Accept': 'text/markdown'}}).then((res) => {
        if (!res.ok) throw new Error(res.statusText+": "+res.status);
        return res.text()
      })
    </script>
    <script defer>
      request.then((text) => {
        document.body.innerHTML = marked(text);
        document.title = document.getElementsByTagName("h1")[0].textContent;
      }).catch((err) => document.body.innerHTML = "<code>Failed to load "+targetFile+": "+err.message+"</code>")
    </script>
  </head>
  <body/>
</html>
EOF

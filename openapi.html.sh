#!/bin/bash -
cat <<EOF
<!DOCTYPE html>
<html>
  <head>
    <noscript><meta http-equiv="refresh" content="0;url=?raw=1"/></noscript>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <body>
    <noscript>Rendered using JavaScript, so <a href="?raw=1">click here</a> to redirect to the source</noscript>

    <redoc/>
    <script>
      document.body.getElementsByTagName("redoc")[0].setAttribute("spec-url", location.pathname);
      document.title = location.pathname.split("/").reverse()[0];
    </script>

    <script>
      // https://github.com/Redocly/redoc:
      // The MIT License (MIT)
      //
      // Copyright (c) 2015-present, Rebilly, Inc.
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
      `curl https://cdn.redoc.ly/redoc/v2.0.0/bundles/redoc.standalone.js`
    </script>

    <script defer>setTimeout(() => document.title = document.getElementsByTagName("h1")[0].textContent, 1000);</script>
  </body>
</html>
EOF

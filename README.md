# Odin Continuous Group Attribute
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## About
Adds attribute, that adds all fields after selected field in selected group

## Overview

Now you don't need to put each field into a group separately, and you can simply mark up the groups like this:

<p align="center">
  <img width="600" src="https://github.com/ligofff/odin-continuous-group-attribute/assets/44195161/dc69fa1d-4ec7-49b6-87f8-2ae603114641">
</p>

Box group, TabGroup, FoldoutGroup, TitleGroup, HorizontalGroup and VerticalGroup are supported.

## Minimum Requirements
* Unity 2021 and above
* [Odin Inspector](https://odininspector.com/)

### Install via GIT URL

Go to ```Package Manager``` -> ```Add package from GIT url...``` -> Enter ```https://github.com/ligofff/odin-continuous-group-attribute.git``` -> Click ```Add```

You will need to have Git installed and available in your system's PATH.

## Usage

Just add ```ContinuousGroup``` attribute on your top field, and all fields from this, to next field with ```ContinuousGroup``` or ```ContinuousGroupEnd``` attribute will be in your selected group.

## License

MIT License

Copyright (c) 2023 Ligofff

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

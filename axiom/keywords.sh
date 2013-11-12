#!/bin/sh
###################################################################
##
## Copyright (C) 2013  Ralf Hemmecke <ralf@hemmecke.org>
##
###################################################################
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.
###################################################################
## This script is supposed to take the name of the (pan-)axiom
## executable as an argument and writes the files categories.vim,
## domains.vim, packages.vim, operations.vim in a format appropriate
## for vim.
###################################################################

EXE="$1 -nosman"
keywords () {
    echo ")what $1" | $EXE \
        | sed -n "1,/^$2/d;/^(/d;/^  /d;p" \
        | while read l; do for w in $l; do \
            echo "syn match ax$1 \"\\<$w\\>\""; \
          done; done \
        > $1.vim
}

keywords domains    '('
keywords categories '('
keywords packages   '('
keywords operations 'Operations whose'

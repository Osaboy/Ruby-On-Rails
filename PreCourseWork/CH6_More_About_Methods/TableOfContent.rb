<<-DOC
  Table of contents. Here’s something for you to do in order to play around
  more with center, ljust, and rjust: write a program that will display a table of
  contents so that it looks like this:
  Table of Contents
  Chapter 1: Getting Started      page  1
  Chapter 2: Numbers              page  9
  Chapter 3: Letters              page 13
DOC

line_width = 60
puts("Table of Contents".ljust(line_width))
puts("Chapter 1: Getting Started".ljust(line_width/2) + "page  1".rjust(line_width/2))
puts("Chapter 2: Numbers".ljust(line_width/2) + "page  9".rjust(line_width/2))
puts("Chapter 3: Letters".ljust(line_width/2) + "page 13".rjust(line_width/2))

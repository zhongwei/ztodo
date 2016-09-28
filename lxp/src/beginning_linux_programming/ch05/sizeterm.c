#include <stdio.h>
#include <stdlib.h>
#include <term.h>
#include <curses.h>

int main()
{
    setupterm(NULL, fileno(stdout), (int *)0);
    int nrows = tigetnum("lines");
    int ncolumns = tigetnum("cols");
    printf("This terminal has %d columuns and %d rows\n", ncolumns, nrows);
    exit(0);
}

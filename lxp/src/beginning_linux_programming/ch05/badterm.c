#include <stdio.h>
#include <stdlib.h>
#include <term.h>
#include <curses.h>

int main()
{
    setupterm("unlisted", fileno(stdout), (int *)0);
    printf("Done.\n");
    exit(0);
}

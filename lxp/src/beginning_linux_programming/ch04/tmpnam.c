#include <stdio.h>
#include <stdlib.h>

int main()
{
    char tmpname[L_tmpnam];
    char *filename = tmpnam(tmpname);
    printf("Temporary file name is: %s\n", filename);

    FILE *tmpfp = tmpfile();
    if (tmpfp) {
        printf("Opened a temporary file OK\n");
    } else {
        perror("tmpfile");
    }

    exit(0);

}

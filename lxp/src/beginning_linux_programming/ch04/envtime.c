#include <time.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main()
{
    for (int i = 1; i <= 10; i++) {
        time_t the_time = time((time_t *)0);
        printf("The time is %ld\n", the_time);
        sleep(2);
    }

    exit(0);
}

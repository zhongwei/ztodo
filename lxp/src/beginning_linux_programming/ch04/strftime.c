#define _XOPEN_SOURCE
#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
    time_t the_time;

    (void)time(&the_time);
    struct tm *tm_ptr = localtime(&the_time);
    char buf[256];
    strftime(buf, 256, "%A %d %B, %I:%S %p", tm_ptr);

    printf("strftime gives: %s\n", buf);

    strcpy(buf, "Sat 26 July 2003, 17:53 will do fine");

    printf("calling strptime with: %s\n", buf);
    struct tm timestruct;
    tm_ptr = &timestruct;

    char *result;
    result = strptime(buf, "%a %d %b %Y, %R", tm_ptr);
    printf("strptime consumed up to: %s\n", result);

    printf("strptime gives:\n");
    printf("date: %02d/%02d/%02d\n",
            tm_ptr->tm_year % 100, tm_ptr->tm_mon + 1, tm_ptr->tm_mday);
    printf("time: %02d:%02d\n",
            tm_ptr->tm_hour, tm_ptr->tm_min);
    exit(0);
}

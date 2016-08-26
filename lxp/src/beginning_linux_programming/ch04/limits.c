#include <sys/types.h>
#include <sys/resource.h>
#include <sys/time.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void work()
{
    double x = 4.5;

    FILE *f = tmpfile();

    for (int i = 0; i < 10000; i++) {
        fprintf(f, "Do some output\n");
        if (ferror(f)) {
            fprintf(stderr, "Error writing to temporary file\n");
            exit(1);
        }
    }

    for (int i = 0; i < 1000000; i++) {
        x = log(x * x + 3.21);
    }
}

int main()
{
    work();

    struct rusage r_usage;
    getrusage(RUSAGE_SELF, &r_usage);

    printf("CPU usage: User = %ld.%06ld, System = %ld.06%ld\n",
            r_usage.ru_utime.tv_sec, r_usage.ru_utime.tv_usec,
            r_usage.ru_stime.tv_sec, r_usage.ru_stime.tv_usec);

    int priority = getpriority(PRIO_PROCESS, getpid());
    printf("Current priority = %d\n", priority);

    struct rlimit r_limit;
    getrlimit(RLIMIT_FSIZE, &r_limit);
    printf("Current FSIZE limit: soft = %ld, hard = %ld\n",
            r_limit.rlim_cur, r_limit.rlim_max);

    r_limit.rlim_cur = 2048;
    r_limit.rlim_max = 4096;
    printf("Setting a 2K file size limit\n");
    setrlimit(RLIMIT_FSIZE, &r_limit);

    work();

    exit(0);

}

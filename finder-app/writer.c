#include <stdio.h>
#include<syslog.h>

int main(int argc, char **argv)
{
    openlog("Logs", LOG_PID | LOG_CONS, LOG_USER);
    syslog(LOG_INFO, "Starting program...\n");

    if(argc != 3)
    {
        syslog(LOG_ERR, "Must have 2 arguments...\n");
        closelog();
        return 1;
    }

    char* writefile = argv[1];
    char* writestr = argv[2];

    FILE *file;

    file = fopen(writefile, "w");
    if (file == NULL) {
        syslog(LOG_ERR,"Error opening file...");
        closelog();
        return 1; // Exit or handle the error
    }

    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writestr);
    if (fprintf(file, "%s", writestr) < 0) {
        syslog(LOG_ERR,"Error writing to file...");
        fclose(file);
        return 1; // Exit or handle the error
    }

    if (fclose(file) == EOF) {
        syslog(LOG_ERR,"Error closing file...");
        return 1; // Exit or handle the error
    }

    return 0;
}
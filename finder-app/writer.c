#include <stdio.h>
#include<syslog.h>
#include <fcntl.h>
#include <unistd.h>   // For write() and close()
#include <string.h>

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

    int file = open(writefile, O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (file == -1) {
        syslog(LOG_ERR,"Error opening file...");
        closelog();
        return 1; // Exit or handle the error
    }

    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writestr);
    if (write(file, writestr, strlen(writestr)) == -1) {
        syslog(LOG_ERR,"Error writing to file...");
        close(file);
        return 1; // Exit or handle the error
    }

    if (close(file) == -1) {
        syslog(LOG_ERR,"Error closing file...");
        return 1; // Exit or handle the error
    }

    return 0;
}
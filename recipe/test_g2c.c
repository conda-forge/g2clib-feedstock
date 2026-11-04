/* Check that the installed shared library exports a working public API. */
#include <grib2.h>
#include <stdio.h>
#include <string.h>

int main(void)
{
    unsigned char message[37] = {0};
    g2int section0[2] = {0, 2};
    g2int section1[13] = {0, 0, 0, 0, 0, 2021, 9, 22, 0, 0, 0, 0, 0};

    if (g2_create(message, section0, section1) != sizeof(message) ||
        memcmp(message, "GRIB", 4) != 0 || message[7] != 2 ||
        message[15] != sizeof(message))
    {
        fputs("The installed g2c library did not create a GRIB2 message.\n", stderr);
        return 1;
    }
    puts("The installed g2c shared library created a GRIB2 message.");
    return 0;
}

#include <stdio.h>
#include "sub.h"
#include "mymath.h"
#include "othermath.h"
#include "macro.h"

int main(int argc, char *argv[])
{
    printf("int: 3+5=%d\n", (int)add(3, 5));
    printf("float: 3+5=%f\n", (float)add(3.0f, 5.0f));
    printf("int: 3*5=%d\n", (int)mul(3, 5));
    printf("int: 3-5=%d\n", (int)sub(3, 5));

    printf("TEST_VAR =%d\n", TEST_VAR);

    return 0;
}

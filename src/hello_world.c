#include <stdio.h>
#include "hello.h"

void helloworld()
{
    printf("%s - %d, Hello World\n", __func__, __LINE__);
}
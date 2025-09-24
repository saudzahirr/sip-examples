#include "fib.h"

int fib_n(int n) {
    if (n <= 1)
        return n;
    return fib_n(n - 1) + fib_n(n - 2);
}

import fib  # type: ignore


def display_fib():
    for i in range(8):
        print(fib.fib_n(i))


if __name__ == "__main__":
    display_fib()

# Declaration of variables
CC = gcc
CC_FLAGS = -shared -fPIC -I/usr/local/opt/python@3.12/Frameworks/Python.framework/Versions/3.12/include/python3.12 \
	-Wall -Wextra -Wno-unused-parameter -O2 -g -L/usr/local/opt/python@3.12/Frameworks/Python.framework/Versions/3.12/lib -lpython3.12

# File names
SOURCES = $(wildcard *.c)
OBJECTS = $(SOURCES:module.c=.so)

# Main target
all: $(OBJECTS)

# Object files
%.so: %module.c
	$(CC) $(CC_FLAGS) $< -o $@

run: $(OBJECTS)
	/usr/local/bin/python3 -c "import fib; print(fib.fib(5))"
	/usr/local/bin/python3 -c "import hello; hello.greet('Foobar')"

# To remove generated files
clean:
	rm -f *.so

.PHONY: all run clean

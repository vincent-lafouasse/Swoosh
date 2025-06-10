.PHONY: all
all: build

.PHONY: build
build:
	cmake -B build -G Ninja
	cmake --build build --target Swoosh

.PHONY: build
run: build
	./build/src/Swoosh

# CTEST_OPT = 
# .PHONY: test
# test:
# 	cmake -B build -G Ninja
# 	cmake --build build
# 	GTEST_COLOR=1 ctest --test-dir build $(CTEST_OPT)
# 
# .PHONY: vtest
# verbose_test: CTEST_OPT += -VV
# verbose_test: test

.PHONY: format
format:
	clang-format -i $(shell find src -name '*.cpp' -or -name '*.hpp' -or -name '*.h')


.PHONY: b r t vt fmt
b: build
r: run
t: test
vt: verbose_test
fmt: format

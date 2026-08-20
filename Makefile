.PHONY: all test clean

GNAT = gnatmake
OBJ_DIR = obj
BIN_DIR = bin

all: $(BIN_DIR)/main $(BIN_DIR)/tests

$(BIN_DIR)/main: main.adb fractal_compression.adb fractal_compression.ads
	mkdir -p $(OBJ_DIR) $(BIN_DIR)
	$(GNAT) -P fractal.gpr -o $(BIN_DIR)/main main.adb

$(BIN_DIR)/tests: tests.adb fractal_compression.adb fractal_compression.ads
	mkdir -p $(OBJ_DIR) $(BIN_DIR)
	$(GNAT) -P fractal.gpr -o $(BIN_DIR)/tests tests.adb

test: $(BIN_DIR)/tests
	@echo "Running Verification & Validation test suite..."
	@./$(BIN_DIR)/tests

clean:
	rm -rf $(OBJ_DIR)/* $(BIN_DIR)/*

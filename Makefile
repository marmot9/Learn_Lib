
.PHONY: objs mkstatic all clean

PROJECT := hello

CUR_DIR := .

INC_DIR := $(CUR_DIR)/inc
OBJ_DIR := $(CUR_DIR)/obj
SRC_DIR := $(CUR_DIR)/src
LIB_DIR := $(CUR_DIR)/lib
BIN_DIR := $(CUR_DIR)/bin

INC_FLAGS := -I $(INC_DIR)

LIB_STATIC := $(LIB_DIR)/static
LIB_SHARED := $(LIB_DIR)/shared

CC := gcc

objs:
	$(CC) -c -o $(OBJ_DIR)/main.o main.c $(INC_FLAGS)
	$(CC) -c -o $(OBJ_DIR)/hello_huan.o $(SRC_DIR)/hello_huan.c $(INC_FLAGS)
	$(CC) -c -o $(OBJ_DIR)/hello_world.o $(SRC_DIR)/hello_world.c $(INC_FLAGS)

mkstatic: objs
	ar	rcs $(LIB_STATIC)/libhello.a $(OBJ_DIR)/hello_huan.o $(OBJ_DIR)/hello_world.o

all: mkstatic
	$(CC) $(OBJ_DIR)/main.o -L$(LIB_STATIC) -l$(PROJECT) -o $(BIN_DIR)/$(PROJECT)
	
clean:
	rm -rf $(OBJ_DIR)/* \
	$(LIB_STATIC)/libhello.a \
	$(BIN_DIR)/$(PROJECT)
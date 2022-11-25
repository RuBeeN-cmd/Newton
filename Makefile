_END="\033[0m"
_RED="\033[0;31m"
_GREEN="\033[0;32m"
_YELLOW="\033[0;33m"
_CYAN="\033[0;36m"

SRC_DIR = src
OBJ_DIR = obj
CC = clang
CFLAGS = -Wall -Werror -Wextra
INC = -Iinclude -Imlx
LIB = -Lmlx -lmlx -lXext -lX11 -lm -lz -g
SRC = $(notdir $(wildcard $(SRC_DIR)/*.c))
OBJ = $(addprefix $(OBJ_DIR)/, $(SRC:.c=.o))

NAME = newton

all: $(NAME)

$(NAME): $(OBJ_DIR) $(OBJ)
	@echo $(_GREEN)Compiling $(OBJ)...$(END)
	@$(CC) $(CFLAGS) $(OBJ) -o $@ $(LIB)

$(OBJ_DIR):
	mkdir -p $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@echo $(_CYAN)Compiling $<...$(END)
	@$(CC) -o $@ -c $< $(CFLAGS) $(INC)

clean:
	@echo $(_YELLOW)Cleaning $(OBJ)...$(END)
	@rm -rf $(OBJ_DIR)

fclean: clean
	@echo $(_RED)Cleaning $(NAME)...$(END)
	@rm -f $(NAME)

re: fclean all
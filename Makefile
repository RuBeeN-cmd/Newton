SRC_DIR = src/
OBJ_DIR = obj/
CC = clang
CFLAGS = -Wall -Werror -Wextra
INC = -Iinclude
SRC = $(notdir $(wildcard $(SRC_DIR)/*.c))
OBJ = $(addprefix $(OBJ_DIR), $(SRC:.c=.o))

NAME = newton

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) $^ -o $@

$(OBJ): $(addprefix $(SRC_DIR), $(SRC))
	$(CC) $(CFLAGS) $(INC) -c $< -o $@

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all
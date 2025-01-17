# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jodufour <jodufour@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/10 22:13:16 by jodufour          #+#    #+#              #
#    Updated: 2021/12/12 17:41:05 by jodufour         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

######################################
#              COMMANDS              #
######################################
CC			=	cc -c -o
LINK		=	cc -o
MKDIR		=	mkdir -p
RM			=	rm -rf

######################################
#             EXECUTABLE             #
######################################
NAME		=	hotrace

#######################################
#             DIRECTORIES             #
#######################################
SRC_DIR		=	./
OBJ_DIR		=	objs/
INC_DIR		=	
PRV_DIR		=	./

#######################################
#              LIBRARIES              #
#######################################

######################################
#            SOURCE FILES            #
######################################
SRC			=	\
				hr_bzero.c			\
				hr_gnl.c			\
				hr_strcdup.c		\
				hr_strchr.c			\
				hr_strcjoin.c		\
				hr_strcmp.c			\
				hr_strlen.c			\
				hr_keyval_new.c		\
				hr_keyval_search.c	\
				hr_keyval_store.c	\
				hr_map_clear.c		\
				hr_search.c			\
				hr_store.c			\
				main.c

######################################
#            OBJECT FILES            #
######################################
OBJ			=	${SRC:.c=.o}
OBJ			:=	${addprefix ${OBJ_DIR}, ${OBJ}}

DEP			=	${OBJ:.o=.d}

#######################################
#                FLAGS                #
#######################################
CFLAGS		=	-Wall -Wextra -Werror
CFLAGS		+=	-MMD -MP
# CFLAGS		+=	-O3
# CFLAGS		+=	-pg
CFLAGS		+=	-I${PRV_DIR}

LDFLAGS		=	

ifeq (${DEBUG}, 1)
	CFLAGS	+=	-g
endif

#######################################
#                RULES                #
#######################################
${NAME}:	${OBJ}
	${LINK} $@ $^ ${LDFLAGS}

all:	${NAME}

-include ${DEP}

${OBJ_DIR}%.o:	${SRC_DIR}%.c
	@${MKDIR} ${@D}
	${CC} $@ ${CFLAGS} $<

clean:
	${RM} ${OBJ_DIR}

fclean:
	${RM} ${OBJ_DIR} ${NAME}

re:	fclean all

-include coffee.mk
-include norm.mk

.PHONY:	all clean fclean re

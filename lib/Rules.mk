# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Rules.mk                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgo <jgo@student.42seoul.fr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/25 14:34:17 by jgo               #+#    #+#              #
#    Updated: 2023/07/15 06:39:59 by jgo              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.DEFAULT_GOAL := all
PROJECT_NAME := libft

LIB_DIR := lib/$(PROJECT_NAME)/libs

ARFLAGS := rcs
CFLAGS := -O3 -Wall -Wextra -Werror -MMD -MP
CPPFLAGS := -I../includes

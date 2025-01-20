# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Rules.mk                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgo <jgo@student.42seoul.kr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/25 14:34:17 by jgo               #+#    #+#              #
#    Updated: 2025/01/19 21:33:00 by jgo              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.DEFAULT_GOAL := all
PROJECT_NAME := libft

LIB_DIR := lib/$(PROJECT_NAME)/libs

AR := emar
CC := emcc
ARFLAGS := rcs
CFLAGS := -O3 
CPPFLAGS := -I../includes

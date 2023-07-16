# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Rules.mk                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgo <jgo@student.42seoul.fr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/05 14:02:20 by jgo               #+#    #+#              #
#    Updated: 2023/07/16 18:51:02 by jgo              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.DEFAULT_GOAL := all

PROJECT_NAME := miniRT
BONUS_NAME := miniRT_bonus

MANDATORY_DIR := mandatory
BONUS_DIR := bonus

MANDATORY_LIB_DIR := src/$(MANDATORY_DIR)/lib
BONUS_LIB_DIR := src/$(BONUS_DIR)/lib

ARFLAGS := rcs
CFLAGS := -O3 -Wall -Wextra -Werror -MMD -MP
CPPFLAGS := -I$(TOPDIR)/includes -I$(TOPDIR)/ext/MLX42/include/MLX42 $(if $(findstring bonus, $(MAKECMDGOALS)), -I$(TOPDIR)/src/$(BONUS_DIR)/includes, -I$(TOPDIR)/src/$(MANDATORY_DIR)/includes)
LDFLAGS := -L$(TOPDIR)/lib -L$(TOPDIR)/ext -L$(shell brew --prefix glfw)/lib
LDLIBS := -lft_arr -lft_ascii -lft_io -lft_is -lft_lst -lft_math -lft_mem -lft_str -lvector -langle -lequation -lmatrix -lmlx42 -lglfw -framework Cocoa -framework OpenGL -framework IOKit

# $(info $(print_jgo))
define print_jgo
	___          ___           ___     
   /  /\        /  /\         /  /\    
  /  /:/       /  /:/_       /  /::\   
 /__/::\      /  /:/ /\     /  /:/\:\  
 \__\/\:\    /  /:/_/::\   /  /:/  \:\ 
	\  \:\  /__/:/__\/\:\ /__/:/ \__\:\ 
	 \__\:\ \  \:\ /~~/:/ \  \:\ /  /:/
	 /  /:/  \  \:\  /:/   \  \:\  /:/ 
	/__/:/    \  \:\/:/     \  \:\/:/  
	\__\/      \  \::/       \  \::/   
				\__\/         \__\/    
endef
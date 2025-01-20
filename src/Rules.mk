# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Rules.mk                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgo <jgo@student.42seoul.kr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/05 14:02:20 by jgo               #+#    #+#              #
#    Updated: 2025/01/20 11:02:20 by jgo              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.DEFAULT_GOAL := all

CC := emcc
PROJECT_NAME := FdF.js
BONUS_NAME := FdF_bonus.js

MANDATORY_DIR := mandatory
BONUS_DIR := bonus

MANDATORY_LIB_DIR := src/$(MANDATORY_DIR)/lib
BONUS_LIB_DIR := src/$(BONUS_DIR)/lib

AR := emar
ARFLAGS := rcs
CFLAGS := -O3 
CPPFLAGS := -I$(TOPDIR)/includes -I$(TOPDIR)/ext/MLX42/include/MLX42 $(if $(findstring bonus, $(MAKECMDGOALS)), -I$(TOPDIR)/src/$(BONUS_DIR)/includes, -I$(TOPDIR)/src/$(MANDATORY_DIR)/includes)
LDFLAGS := -L$(TOPDIR)/lib -L$(TOPDIR)/ext 
LDLIBS := -O3 -lft_arr -lft_ascii -lft_io -lft_is -lft_lst -lft_math -lft_mem -lftprintf -lft_str -lmlx42 -s USE_GLFW=3 -s USE_WEBGL2=1 -s FULL_ES3=1 -s WASM=1 \
    -s NO_EXIT_RUNTIME=1 -s EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]' \
    -s ALLOW_MEMORY_GROWTH -pthread --preload-file MGDS_ANTARCTIC_OCEAN1_L.fdf

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
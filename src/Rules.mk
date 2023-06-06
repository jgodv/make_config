# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Rules.mk                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgo <jgo@student.42seoul.fr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/05 14:02:20 by jgo               #+#    #+#              #
#    Updated: 2023/06/06 15:58:25 by jgo              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.DEFAULT_GOAL := all

PROJECT_NAME := minishell
BONUS_NAME := minishell_bonus

MANDATORY_DIR := $(PROJECT_NAME)
BONUS_DIR := $(BONUS_NAME)

MANDATORY_LIB_DIR := src/$(MANDATORY_DIR)/lib
BONUS_LIB_DIR := src/$(BONUS_DIR)/lib

MAN_DST_DIR := $(TOPDIR)/$(MANDATORY_LIB_DIR)
BON_DST_DIR := $(TOPDIR)/$(BONUS_LIB_DIR)

ARFLAGS := rcs
CFLAGS := -Wall -Wextra -Werror -MMD -MP
CPPFLAGS := -I$(TOPDIR)/includes $(if $(findstring bonus, $(MAKECMDGOALS)), -I$(TOPDIR)/src/$(BONUS_DIR)/includes,-I$(TOPDIR)/src/$(MANDATORY_DIR)/includes) -I$(shell brew --prefix readline)/include/readline
LDFLAGS := -L$(TOPDIR)/lib -L$(shell brew --prefix readline)/lib
LDLIBS := -lft_arr -lft_ascii -lft_io -lft_is -lft_lst -lft_math -lft_mem -lft_str -lreadline

# verbose
Q := $(if $(filter 1,$(V) $(VERBOSE)),,@)

# debug
ifdef DEBUG
	CFLAGS := -g3 -MMD -MP
	LDFLAGS += -g3
endif

# just compile
ifdef JUST
	CFLAGS := -MMD -MP
endif

# address
ifdef ADDR
	CFLAGS += -fsanitize=address
endif

link_files:: unlink_files
	$(Q)$(call color_printf,$(GRAY),includes,📁 make includes folder)
	mkdir -p $(dst_dir);
	$(Q)$(foreach file,$(files), $(call color_printf,$(CYAN),$(file),🔗 linking file\n) ln -sf $(src_dir)/$(file) $(dst_dir);)
	$(Q)$(foreach file,$(files), ln -sf $(src_dir)/$(file) $(dst_dir);)

unlink_files::
	$(Q)$(foreach file,$(files), $(call color_printf,$(GRAY),$(file),🚫 unlinking file\n) $(RM) $(dst_dir)/$(file);)
	$(Q)$(foreach file,$(files), $(RM) $(dst_dir)/$(file);)

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Rules.mk                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgo <jgo@student.42seoul.fr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/05 14:02:20 by jgo               #+#    #+#              #
#    Updated: 2023/05/14 10:37:10 by jgo              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.DEFAULT_GOAL := all

PROJECT_NAME := push_swap
BONUS_NAME := checker

MANDATORY_DIR = $(PROJECT_NAME)
BONUS_DIR = $(BONUS_NAME)

MANDATORY_LIB_DIR = src/$(MANDATORY_DIR)/lib
BONUS_LIB_DIR = src/$(BONUD_DIR)/lib

ARFLAGS := rcs
CFLAGS := -Wall -Wextra -Werror -MMD -MP
CPPFLAGS := -I$(TOPDIR)/includes $(if $(filter bonus, $(MAKECMDGOALS)), -I$(TOPDIR)/src/$(BONUS_DIR)/includes,-I$(TOPDIR)/src/$(MANDATORY_DIR)/includes)

# verbose
Q := $(if $(filter 1,$(V) $(VERBOSE)),,@)

# debug
ifdef DEBUG
	CFLAGS += -g3
endif

# just compile
ifdef JUST
	CFLAGS := -MMD -MP
endif

# address
ifdef ADDR
	CFLAGS += -fsanitize=address
endif

ifdef RACE
	CFLAGS := -fsanitize=thread -MMD -MP -g3
	LDFLAGS += -fsanitize=thread -g3
endif

link_files:: unlink_files
	$(Q)$(call color_printf,$(GRAY),includes,📁 make includes folder)
	mkdir -p $(dst_dir);
	$(Q)$(foreach file,$(files), $(call color_printf,$(CYAN),$(file),🔗 linking file\n) ln -sf $(src_dir)/$(file) $(dst_dir);)
	$(Q)$(foreach file,$(files), ln -sf $(src_dir)/$(file) $(dst_dir);)

unlink_files::
	$(Q)$(foreach file,$(files), $(call color_printf,$(GRAY),$(file),🚫 unlinking file\n) $(RM) $(dst_dir)/$(file);)
	$(Q)$(foreach file,$(files), $(RM) $(dst_dir)/$(file);)

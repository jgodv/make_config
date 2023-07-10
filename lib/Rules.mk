# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Rules.mk                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgo <jgo@student.42seoul.fr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/25 14:34:17 by jgo               #+#    #+#              #
#    Updated: 2023/07/10 09:55:34 by jgo              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.DEFAULT_GOAL := all

PROJECT_NAME := libft

LIB_DIR := lib/$(PROJECT_NAME)/libs

ARFLAGS := rcs
CFLAGS := -O3 -Wall -Wextra -Werror -MMD -MP
CPPFLAGS := -I../includes

# verbose
Q := $(if $(filter 1,$(V) $(VERBOSE)),,@)

# debug
ifdef DEBUG
	CFLAGS := -g3 -MMD -MP
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


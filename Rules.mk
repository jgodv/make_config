# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Rules.mk                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgo <jgo@student.42seoul.fr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/05 14:02:20 by jgo               #+#    #+#              #
#    Updated: 2023/06/08 09:57:44 by jgo              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.DEFAULT_GOAL := all

PROJECT_NAME := cpp_modules
STANDARD := c++98 
CXXFLAGS := -std=$(STANDARD) -Wall -Wextra -Werror -MMD -MP
CPPFLAGS := -I .

ifndef DSTDIR
	DSTDIR := $(abspath ../)
endif

# verbose
Q := $(if $(filter 1,$(V) $(VERBOSE)),,@)

# debug
ifdef DEBUG
	CXXFLAGS := -g3 -MMD -MP
	LDFLAGS += -g3
endif

# just compile
ifdef JUST
	CXXFLAGS := -MMD -MP
endif

# address
ifdef ADDR
	CXXFLAGS += -fsanitize=address
endif

# data race
ifdef RACE
	CXXFLAGS := -fsanitize=thread -MMD -MP -g3
	LDFLAGS += -fsanitize=thread -g3
endif

ifdef SHADOW
	CXXFLAGS += -Wshadow
	LDFLAGS += -Wshadow
endif

link_files:: unlink_files
		$(Q)$(foreach file,$(files), $(call color_printf,$(CYAN),$(file),🔗 linking file\n) ln -sf $(src_dir)/$(file) $(dst_dir);)
		$(Q)$(foreach file,$(files), ln -sf $(src_dir)/$(file) $(dst_dir);)

unlink_files::
		$(Q)$(foreach file,$(files), $(call color_printf,$(GRAY),$(file),🚫 unlinking file\n) $(RM) $(dst_dir)/$(file);)
		$(Q)$(foreach file,$(files), $(RM) $(dst_dir)/$(file);)
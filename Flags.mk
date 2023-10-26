# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Flags.mk                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgo <jgo@student.42seoul.fr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/15 10:06:18 by jgo               #+#    #+#              #
#    Updated: 2023/07/26 11:00:24 by jgo              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# verbose
Q := $(if $(filter 1,$(VER) $(VERBOSE)),,@)

# thread
ifdef JOB
	J := $(if $(findstring $(JOB), 123456789),-j$(JOB),)
endif

ifdef V
	CXXFLAGS += -DV=true
endif

# debug
ifdef DEBUG
	CXXFLAGS := -std=$(STANDARD) -g -MMD -MP
endif

# just compile
ifdef JUST
	CXXFLAGS := -std=$(STANDARD) -MMD -MP
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

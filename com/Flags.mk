# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Flags.mk                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgo <jgo@student.42seoul.fr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/15 06:39:39 by jgo               #+#    #+#              #
#    Updated: 2023/07/15 06:48:25 by jgo              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# verbose
Q := $(if $(filter 1,$(VERBOSE)),,@)

# thread
ifdef JOB
	J := $(if $(findstring $(JOB), 123456789),-j$(JOB),)
endif

# debug
ifdef DEBUG
	CFLAGS := -MMD -MP -g3
endif

# just compile
ifdef JUST
	CFLAGS := -MMD -MP
endif

# address
ifdef ADDR
	CFLAGS += -fsanitize=address
	LDLIBS +=  -fsanitize=address
endif

ifdef RACE
	CFLAGS := -fsanitize=thread -MMD -MP -g3
	LDFLAGS += -fsanitize=thread -g3
endif

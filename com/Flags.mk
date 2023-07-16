# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Flags.mk                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgo <jgo@student.42seoul.fr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/16 20:53:19 by jgo               #+#    #+#              #
#    Updated: 2023/07/16 20:55:52 by jgo              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


# thread
ifdef JOB
	J := $(if $(findstring $(JOB), 123456789),-j$(JOB),)
endif

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

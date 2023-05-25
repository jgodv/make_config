# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Recipes.mk                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgo <jgo@student.42seoul.fr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/25 14:43:57 by jgo               #+#    #+#              #
#    Updated: 2023/05/25 18:17:27 by jgo              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all bonus:
	$(Q)$(foreach dir, $(DIRS), $(MAKE) TOPDIR=$(TOPDIR) -C $(dir) $@;)
	$(Q)$(MAKE) files="$(HEAD)" src_dir=`pwd`/includes dst_dir=$(TOPDIR)/includes link_files
	$(Q)$(call color_printf,$(GREEN),$(NAME),🔰 done!)
	
fclean clean:
	$(Q)$(MAKE) files="$(HEAD)" src_dir=`pwd` dst_dir=$(TOPDIR)/includes unlink_files
	$(Q)$(foreach dir, $(DIRS), $(MAKE) TOPDIR=$(TOPDIR) -C $(dir) $@;)

re: fclean
	$(Q)$(foreach dir, $(DIRS), $(MAKE) TOPDIR=$(TOPDIR) -C $(dir) $@;)
	$(MAKE) all

norm : 
	norminette .

.PHONY: all clean fclean re bonus norm

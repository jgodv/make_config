# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Recipes.mk                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgo <jgo@student.42seoul.fr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/25 14:43:57 by jgo               #+#    #+#              #
#    Updated: 2023/05/25 15:29:15 by jgo              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all bonus:
	$(Q)$(foreach dir, $(DIRS), $(MAKE) TOPDIR=$(TOPDIR) -C $(dir) $@;)
	$(Q)$(call color_printf,$(CYAN),$(NAME),🎯 starting compile $(NAME))
	$(Q)$(MAKE) $(NAME)
	$(Q)$(call color_printf,$(GREEN),$(NAME),🔰 done!)

$(NAME): $(LIBS)
	$(Q)$(call color_printf,$(GREEN),$(NAME),📚 archive object)
	$(AR) $(ARFLAGS) $@ $^
	$(Q)$(MAKE) files="$(NAME)" src_dir=`pwd` dst_dir=$(TOPDIR)/lib link_files
	$(Q)$(MAKE) files="$(HEAD)" src_dir=`pwd` dst_dir=$(TOPDIR)/includes link_files
	
clean:
	$(Q)$(MAKE) files="$(NAME)" src_dir=`pwd` dst_dir=$(TOPDIR)/lib unlink_files
	$(Q)$(MAKE) files="$(HEAD)" src_dir=`pwd` dst_dir=$(TOPDIR)/includes unlink_files
	$(Q)$(foreach dir, $(DIRS), $(MAKE) TOPDIR=$(TOPDIR) -C $(dir) $@;)
	$(Q)$(call color_printf,$(RED),$(NAME),🗑️  remove Objects && Dependency file)
	$(RM) $(OBJS) $(DEPS)

fclean: clean
	$(Q)$(foreach dir, $(DIRS), $(MAKE) TOPDIR=$(TOPDIR) -C $(dir) $@;)
	$(Q)$(call color_printf,$(RED),$(NAME),🗑️  remove $(NAME))
	$(RM) $(NAME)

re: fclean
	$(Q)$(foreach dir, $(DIRS), $(MAKE) TOPDIR=$(TOPDIR) -C $(dir) $@;)
	$(MAKE) all

norm : 
	norminette .

.PHONY: all clean fclean re bonus norm

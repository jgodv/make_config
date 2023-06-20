# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    BonusSubLibsRecipes.mk                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgo <jgo@student.42seoul.fr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/24 20:28:04 by jgo               #+#    #+#              #
#    Updated: 2023/06/20 17:21:07 by jgo              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all bonus : $(OBJS)
	$(Q)$(call color_printf,$(CYAN),$(NAME),🎯 starting compile $(NAME))
	$(Q)$(call color_printf,$(GREEN),$(NAME),📚 archive object)
	$(AR) $(ARFLAGS) $(NAME) $^
	$(Q)$(MAKE) files="$(NAME)" src_dir=`pwd` dst_dir=$(TOPDIR)/$(BONUS_LIB_DIR) link_files
	$(Q)$(call color_printf,$(GREEN),$(NAME),🔰 done!)

clean:
	$(Q)$(MAKE) files="$(NAME)" src_dir=`pwd` dst_dir=$(TOPDIR)/$(BONUS_LIB_DIR) unlink_files
	$(Q)$(call color_printf,$(RED),$(NAME),🗑️  remove Objects && Dependency file)
	$(RM) $(OBJS) $(DEPS)

fclean: clean
	$(Q)$(call color_printf,$(RED),$(NAME),🗑️  remove $(NAME))
	$(RM) $(NAME)

re : fclean
	$(MAKE) all

.PHONY: all clean fclean re bonus

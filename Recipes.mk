# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Targets.mk                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgo <jgo@student.42seoul.fr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/22 10:49:20 by jgo               #+#    #+#              #
#    Updated: 2023/04/26 13:38:28 by jgo              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all bonus :
	$(Q)$(call color_printf,$(YELLOW),$(NAME),🎯 compiling...)
	$(MAKE) $(NAME)
	$(Q)$(call color_printf,$(GREEN),$(NAME),✨ compiled!)

$(NAME): $(OBJS)
	$(LINK.cc) $^ -o $@
	$(MAKE) files=$(NAME) src_dir=`pwd` dst_dir=$(DSTDIR) link_files
	
clean:
	$(Q)$(call color_printf,$(YELLOW),$(NAME),🧹 clean object & dependencies)
	$(RM) $(DEPS) $(OBJS)

fclean: clean
	$(Q)$(call color_printf,$(RED),$(NAME),🗑 remove $(NAME))
	$(MAKE) files=$(NAME) src_dir=`pwd` dst_dir=$(DSTDIR) unlink_files
	$(RM) $(NAME)

re: fclean
	$(MAKE)

.PHONY: all clean fclean re bonus
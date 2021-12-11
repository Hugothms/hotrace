/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   hr_memdel.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jodufour <jodufour@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/12/10 23:44:42 by jodufour          #+#    #+#             */
/*   Updated: 2021/12/10 23:45:52 by jodufour         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>

void	hr_memdel(void *addr)
{
	if (addr)
	{
		free(*(void **)addr);
		*(void **)addr = NULL;
	}
}

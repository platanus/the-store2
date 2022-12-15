import api from './index';
import type { User } from './users';
import type { Item } from './items';

export interface Purchase {
  id: number;
  status: 'pending' | 'delivered';
  user: User;
  item: Item;
}

export default {
  create(itemId: number) {
    const path = '/api/internal/purchases';

    return api({
      method: 'post',
      url: path,
      data: {
        purchase: { itemId },
      },
    });
  },
};

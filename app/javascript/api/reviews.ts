import api from "./index";
import type { User } from "./users";

export interface Review {
	id: number;
	userId: number;
	itemId: number;
	body: string;
	rating: number;
	createdAt: string;
  updatedAt: string;
  user: User
}


export type ReviewForm = {
  itemId: number;
  body: string | null;
  rating: number;
}


export default {
  create(review: Partial<ReviewForm>) {
    const path = '/api/internal/reviews';

    return api({
      method: 'post',
      url: path,
      data: {
        review
      }
    })
  }

}

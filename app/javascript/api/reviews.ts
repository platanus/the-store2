export interface Review {
	id: number;
	userId: number;
	itemId: number;
	body: string;
	rating: number;
	createdAt: string;
	updatedAt: string;
}

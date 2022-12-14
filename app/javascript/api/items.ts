export interface Item {
  id: number;
  name: string;
  description: string;
  price: number;
  image: Record<string, Record<'url', string>>;
}

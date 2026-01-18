import { json } from '@sveltejs/kit';
import type { RequestHandler } from './$types';

export const GET: RequestHandler = async ({ locals }) => {
	try {
		// First get all approved categories
		const { data: categories, error: categoriesError } = await locals.supabase
			.from('categories')
			.select('id')
			.eq('approved', true);

		if (categoriesError) {
			return json({ error: categoriesError.message }, { status: 500 });
		}

		const categoryIds = categories.map((c) => c.id);

		if (categoryIds.length === 0) {
			return json({ words: [] });
		}

		// Then get all approved words in approved categories
		const { data, error } = await locals.supabase
			.from('words')
			.select('*')
			.eq('approved', true)
			.in('category_id', categoryIds)
			.order('word');

		if (error) {
			return json({ error: error.message }, { status: 500 });
		}

		// Transform the data to match the expected format
		const words = data.map((word) => ({
			id: word.id,
			word: word.word,
			categoryId: word.category_id
		}));

		return json({ words });
	} catch (error) {
		return json({ error: 'Internal server error' }, { status: 500 });
	}
};

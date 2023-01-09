import { format, parseISO } from 'date-fns'

function formatDate(date?: string | null): string {
	if (!date) return ''

	return format(parseISO(date), 'd MMMM yyyy')
}

export default formatDate

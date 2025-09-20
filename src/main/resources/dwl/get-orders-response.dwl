%dw 2.0
output application/json
---
{
	orderReference: (payload.orderId splitBy "@")[1] default payload.orderId,
	customer: {
		name: payload.customer,
//		phone: payload.contact
	},
	items: payload.items map {
		id: $.productId,
		description: $.name,
		unitPrice: $.price,
		quantity: $.quantity
	},
	totalCost: payload.totalAmount,
	timestamp: payload.orderDate
}
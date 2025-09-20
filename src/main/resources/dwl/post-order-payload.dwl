%dw 2.0
output application/json
---
{
	orderId: p('app.order-prefix') ++ '@' ++ vars.input_payload.orderReference,
	source: p('app.order-source'),
	customerName: vars.input_payload.customer.name,
	contact: vars.input_payload.customer.phone,
	items: vars.input_payload.items map {
		productId: $.id,
		name: $.description,
		price: $.unitPrice,
		quantity: $.quantity	
	},
	totalAmount: vars.input_payload.totalCost,
	paymentType: vars.input_payload.paymentMethod,
	orderDate: vars.input_payload.timestamp	
	
}
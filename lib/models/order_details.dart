class OrderDetails {
  String orderId = '';
  OrderStatus orderStatus = OrderStatus.CANCELLED;
  String orderDate = '';
  String time = '';
  String deliveryLocation = '';
  String clientName = '';
  String clientEmail = '';
  String deliveryCompany = '';
  String trackingCode = '';
  List<String> products = [];
  String price = '';
  String paymentMethod = '';

  OrderDetails(
      {orderId,
      orderStatus,
      orderDate,
      time,
      deliveryLocation,
      clientName,
      clientEmail,
      deliveryCompany,
      trackingCode,
      products,
      price,
      paymentMethod})
      : this.orderId = orderId,
        this.orderStatus = orderStatus,
        this.orderDate = orderDate,
        this.time = time,
        this.deliveryLocation = deliveryLocation,
        this.clientName = clientName,
        this.clientEmail = clientEmail,
        this.deliveryCompany = deliveryCompany,
        this.trackingCode = trackingCode,
        this.products = products,
        this.price = price,
        this.paymentMethod = paymentMethod;
}

enum OrderStatus {ALL_ORDERS, SENT, DELIVERED, CANCELLED, PREPARING, RETURNED }

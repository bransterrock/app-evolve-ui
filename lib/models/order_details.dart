class OrderDetails{
  String orderID = '';
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
  String paymentMethods = '';

}

enum OrderStatus{
  SENT,
  DELIVERED,
  CANCELLED,
  PREPARING,
  RETURNED
}
class OrderDetails {
  String? orderId;
  OrderStatus? orderStatus;
  String? orderDate;
  String? time;
  String? deliveryLocation;
  String? clientName;
  String? clientEmail;
  String? deliveryCompany;
  String? trackingCode;
  List<String>? products;
  String? price;
  String? paymentMethod;

  OrderDetails(
      {this.orderId,
      this.orderStatus,
      this.orderDate,
      this.time,
      this.deliveryLocation,
      this.clientName,
      this.clientEmail,
      this.deliveryCompany,
      this.trackingCode,
      this.products,
     this.price,
     this.paymentMethod});
}

enum OrderStatus {ALL_ORDERS, SENT, DELIVERED, CANCELLED, PREPARING, RETURNED }

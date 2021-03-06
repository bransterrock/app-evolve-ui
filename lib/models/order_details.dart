import 'package:app_evolve_ui/utilities/constants.dart';
import 'package:flutter/material.dart';

///The Model used for storing the data to be presented in the ListViews
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

  ///Searhes through the data to find matching results. (Only works in Mobile View)
  static List<OrderDetails> searchFunction(
      String text, List<OrderDetails> oldOrderDetails) {
    List<OrderDetails> newOrderDetails = [];
    for (var orderDetail in oldOrderDetails) {
      if (orderDetail.orderId!.toLowerCase().contains(text.toLowerCase())) {
        newOrderDetails.add(orderDetail);
      } else {
        if (orderDetail.orderDate!.toLowerCase().contains(text.toLowerCase())) {
          newOrderDetails.add(orderDetail);
        } else {
          if (orderDetail.time!.toLowerCase().contains(text.toLowerCase())) {
            newOrderDetails.add(orderDetail);
          } else {
            if (orderDetail.deliveryLocation!
                .toLowerCase()
                .contains(text.toLowerCase())) {
              newOrderDetails.add(orderDetail);
            } else {
              if (orderDetail.clientName!
                  .toLowerCase()
                  .contains(text.toLowerCase())) {
                newOrderDetails.add(orderDetail);
              } else {
                if (orderDetail.clientEmail!
                    .toLowerCase()
                    .contains(text.toLowerCase())) {
                  newOrderDetails.add(orderDetail);
                } else {
                  if (orderDetail.deliveryCompany!
                      .toLowerCase()
                      .contains(text.toLowerCase())) {
                    newOrderDetails.add(orderDetail);
                  } else {
                    if (orderDetail.trackingCode!
                        .toLowerCase()
                        .contains(text.toLowerCase())) {
                      newOrderDetails.add(orderDetail);
                    } else {
                      if (orderDetail.price!
                          .toLowerCase()
                          .contains(text.toLowerCase())) {
                        newOrderDetails.add(orderDetail);
                      } else {
                        if (orderDetail.paymentMethod!
                            .toLowerCase()
                            .contains(text.toLowerCase())) {
                          newOrderDetails.add(orderDetail);
                        } else {
                          for (var product in orderDetail.products!) {
                            if (product
                                .toLowerCase()
                                .contains(text.toLowerCase())) {
                              newOrderDetails.add(orderDetail);
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    return newOrderDetails;
  }

  static String getBtnName(OrderStatus orderStatus) {
    String value = '';
    switch (orderStatus) {
      case OrderStatus.PREPARING:
        {
          value = 'Preparing';
        }
        break;
      case OrderStatus.DELIVERED:
        {
          value = 'Delivered';
        }
        break;
      case OrderStatus.CANCELLED:
        {
          value = 'Cancelled';
        }
        break;
      case OrderStatus.RETURNED:
        {
          value = 'Returned';
        }
        break;
      case OrderStatus.SENT:
        {
          value = 'Sent';
        }
        break;
      default:
        {}
        break;
    }
    return value;
  }

  static Color getBtnColor(OrderStatus orderStatus) {
    Color colorValue = Color(0xFFFFFF);
    switch (orderStatus) {
      case OrderStatus.PREPARING:
        {
          colorValue = kPreparingIconColor;
        }
        break;
      case OrderStatus.DELIVERED:
        {
          colorValue = kDeliveredIconColor;
        }
        break;
      case OrderStatus.CANCELLED:
        {
          colorValue = kCancelledIconColor;
        }
        break;
      case OrderStatus.RETURNED:
        {
          colorValue = kReturnedIconColor;
        }
        break;
      case OrderStatus.SENT:
        {
          colorValue = kSentIconColor;
        }
        break;
      default:
        {
          colorValue = kMediumGrey;
        }
        break;
    }
    return colorValue;
  }

  static OrderStatus setOrderStatus(int index) {
    OrderStatus orderStatus = OrderStatus.PREPARING;
    switch (index) {
      case 0:
        {
          orderStatus = OrderStatus.ALL_ORDERS;
          break;
        }
      case 1:
        {
          orderStatus = OrderStatus.PREPARING;
          break;
        }
      case 2:
        {
          orderStatus = OrderStatus.SENT;
          break;
        }
      case 3:
        {
          orderStatus = OrderStatus.RETURNED;
          break;
        }
      case 4:
        {
          orderStatus = OrderStatus.CANCELLED;
          break;
        }
      case 5:
        {
          orderStatus = OrderStatus.DELIVERED;
          break;
        }
      default:
        {}
        break;
    }
    return orderStatus;
  }

  ///Filters the order details list and passes back a result to be displayed
  static List<OrderDetails> filterFunction(
      OrderStatus orderStatus, List<OrderDetails> oldOrderDetails) {
    List<OrderDetails> newOrderDetails = [];
    if (orderStatus == OrderStatus.ALL_ORDERS) {
      return loadOrderDetails();
    } else {
      for (var orderDetail in oldOrderDetails) {
        if (orderDetail.orderStatus == orderStatus) {
          newOrderDetails.add(orderDetail);
        }
      }
      return newOrderDetails;
    }
  }

//Sorts the List by way of OrderStatus
  static List<OrderDetails> sortFunction(List<OrderDetails> oldOrderDetails) {
    List<OrderDetails> newOrderDetails = [];
    for (var orderDetail in oldOrderDetails) {
      if (orderDetail.orderStatus == OrderStatus.PREPARING) {
        newOrderDetails.add(orderDetail);
      }
    }
    for (var orderDetail in oldOrderDetails) {
      if (orderDetail.orderStatus == OrderStatus.SENT) {
        newOrderDetails.add(orderDetail);
      }
    }
    for (var orderDetail in oldOrderDetails) {
      if (orderDetail.orderStatus == OrderStatus.RETURNED) {
        newOrderDetails.add(orderDetail);
      }
    }
    for (var orderDetail in oldOrderDetails) {
      if (orderDetail.orderStatus == OrderStatus.CANCELLED) {
        newOrderDetails.add(orderDetail);
      }
    }
    for (var orderDetail in oldOrderDetails) {
      if (orderDetail.orderStatus == OrderStatus.DELIVERED) {
        newOrderDetails.add(orderDetail);
      }
    }
    return newOrderDetails;
  }

  ///Mock call that populates with a list of Order Details to display
  static List<OrderDetails> loadOrderDetails() {
    List<OrderDetails> orderDetails = [];
    orderDetails.add(OrderDetails(
      orderId: '#13702574',
      orderStatus: OrderStatus.PREPARING,
      orderDate: '04/10/2021',
      time: '02:39',
      deliveryLocation: 'Colorado Springs',
      clientName: 'Matthew Collins',
      clientEmail: 'c.matthews@outlook.com',
      deliveryCompany: 'DHL',
      trackingCode: '705-610844',
      products: ['Hourglass Wallet on Chain, ', 'Void Butterfly Sunglasses, '],
      price: '\$2,198.03',
      paymentMethod: 'Credit Card, **** 9171',
    ));

    orderDetails.add(OrderDetails(
        orderId: '#75842541',
        orderStatus: OrderStatus.SENT,
        orderDate: '04/05/2021',
        time: '05:50',
        deliveryLocation: 'Mesa',
        clientName: 'Alfred Ellis',
        clientEmail: 'j.hawkins@verizon.net',
        deliveryCompany: 'UPS',
        trackingCode: '710-981371',
        products: [
          'Pleated Tracksuit, ',
          'Ville Supple Large Purse, ',
          'Hooded Bathrobe, ',
          'Test Value 1',
          'Test Value 2',
          'Test Value 3',
          'Test Value 4',
          'Test Value 5',
          'Test Value 6'
        ],
        price: '\$8,555.47',
        paymentMethod: 'Credit Card, **** 6282'));

    orderDetails.add(OrderDetails(
        orderId: '#77233897',
        orderStatus: OrderStatus.RETURNED,
        orderDate: '04/04/2021',
        time: '09:05',
        deliveryLocation: 'Raleigh',
        clientName: 'Jon Grant',
        clientEmail: 'g.powers@msn.com',
        deliveryCompany: 'DHL Express',
        trackingCode: '886-552845',
        products: [
          'One Size Tracksuit, ',
          'Dummy Earrings, ',
          'Swift Oval Sunglasses, ',
        ],
        price: '\$3,4865,69',
        paymentMethod: 'Debit Card, **** 2756'));

    orderDetails.add(OrderDetails(
        orderId: '#38863033',
        orderStatus: OrderStatus.PREPARING,
        orderDate: '04/03/2021',
        time: '03:13',
        deliveryLocation: 'Las Vegas',
        clientName: 'Ben Scott',
        clientEmail: 'r.grant@gmail.com',
        deliveryCompany: 'DHL',
        trackingCode: '416-253244',
        products: [
          'New Fur Coat',
        ],
        price: '\$1,039.32',
        paymentMethod: 'Credit Card, **** 6337'));

    orderDetails.add(OrderDetails(
        orderId: '#32179451',
        orderStatus: OrderStatus.SENT,
        orderDate: '04/03/2021',
        time: '11:08',
        deliveryLocation: 'Los Angeles',
        clientName: 'Tara Walsh',
        clientEmail: 'v.kelley@msn.com',
        deliveryCompany: 'FedEx',
        trackingCode: '603-577113',
        products: [
          'Hybrid Shirt Pants, ',
          'Rhino Derby, ',
          'Punk Tag Necklace, '
        ],
        price: '\$3,607.34.32',
        paymentMethod: 'PayPal'));

    orderDetails.add(OrderDetails(
        orderId: '#62927505',
        orderStatus: OrderStatus.SENT,
        orderDate: '04/02/2021',
        time: '21:18',
        deliveryLocation: 'Virginia Beach',
        clientName: 'Ruby Little',
        clientEmail: 'jordan.davidson@aol.com',
        deliveryCompany: 'UPS',
        trackingCode: '716-354651',
        products: [
          'Mask Turtleneck, ',
          'Baggy Sweatpants, ',
          'Sporty Hood, ',
          'Test Value 1',
          'Test Value 2',
          'Test Value 3',
        ],
        price: '\$6,883.83',
        paymentMethod: 'Bank Transfer'));

    orderDetails.add(OrderDetails(
        orderId: '#53453875',
        orderStatus: OrderStatus.CANCELLED,
        orderDate: '03/29/2021',
        time: '22:54',
        deliveryLocation: 'Louisville',
        clientName: 'Jordan Mason',
        clientEmail: 'larry.cunningham@outlook.com',
        deliveryCompany: 'DHL',
        trackingCode: '298-698777',
        products: [
          'Hooded Carcoat',
        ],
        price: '\$2,449.00',
        paymentMethod: 'Credit Card **** 3539'));

    orderDetails.add(OrderDetails(
        orderId: '#40271151',
        orderStatus: OrderStatus.RETURNED,
        orderDate: '03/21/2021',
        time: '14:39',
        deliveryLocation: 'Washington',
        clientName: 'Lydia Williamson',
        clientEmail: 'georgia.hunt@live.com',
        deliveryCompany: 'FedEx',
        trackingCode: '623-380017',
        products: [
          'Pajama Shirt, ',
          'Oversize Shorts, ',
          'Tracksuit Cap, ',
          'Chainmail Top, '
        ],
        price: '\$3,888.53',
        paymentMethod: 'Debit Card **** 6449'));

    orderDetails.add(OrderDetails(
        orderId: '#76446673',
        orderStatus: OrderStatus.DELIVERED,
        orderDate: '03/18/2021',
        time: '21:06',
        deliveryLocation: 'Dallas',
        clientName: 'Becky Sharp',
        clientEmail: 'johnny.stanley@outlook.com',
        deliveryCompany: 'DHL',
        trackingCode: '967-202782',
        products: [
          'Furry 80mm Sandal, ',
          'Maxi Coat, ',
          'Multi Dress, ',
          'Body Wrap Dress, ',
          'Test Value 1',
          'Test Value 2'
        ],
        price: '\$6739.25',
        paymentMethod: 'PayPal'));

    return orderDetails;
  }
}

///Order Status Types
enum OrderStatus { ALL_ORDERS, SENT, DELIVERED, CANCELLED, PREPARING, RETURNED }

import React from "react";
import Header from './Header.js';
import './Checkout.css';

class Checkout extends React.Component {

    render() {
        return (
            <div className="checkout">
                <Header cartCount='3'/>
                <div className="checkout-header">Checkout</div>
                <div className="checkout-main">
                <div className="payment-details">
                        
                        <form>
                            <label for="order-type" className="order-details-header">Order Type:</label><br/>
                            <input type="radio" id="delivery" name="order-type" value="delivery"></input>
                            <label for="delivery">Delivery</label>
                            <input type="radio" id="pickup" name="order-type" value="pickup"></input>
                            <label for="pickup">Pick-Up</label>
                            <input type="radio" id="dine-in" name="order-type" value="dine-in"></input>
                            <label for="dine-in">Dine-In</label><br/>

                            <div className="order-details-header">
                                Customer Info
                            </div>
                            <input type="text" id="fname" name="fname" placeholder="First Name"></input>
                            <input type="text" id="lname" name="lname" placeholder="Last Name"></input>
                            <input type="text" id="email" name="email" placeholder="Email"></input><br/>
                            <div className="delivery-info">
                                <input type="text" id="address1" name="address1" placeholder="Street Address"></input>
                                <input type="text" id="address2" name="address2" placeholder="Unit or Apartment #"></input>
                                <input type="text" id="city" name="city" placeholder="City"></input><br/>
                                <input type="text" id="state" name="state" placeholder="State"></input>
                                <input type="text" id="zipcode" name="zipcode" placeholder="Zipcode"></input>
                            </div>

                            <div className="order-details-header">
                                Payment Details
                            </div>
                            <input type="text" id="ccno" name="ccno" placeholder="Credit Card #"></input>
                            <input type="text" id="ccexp" name="ccexp" placeholder="Expiration (MM/DD)"></input>
                            <input type="text" id="cccvv" name="cccvv" placeholder="CCV"></input><br/>

                            <input type="submit" value="Submit Order" className="submit-button"></input>

                        </form>
                    </div>
                    <div className="cart-items">
                    <div className="order-details-header">Order Details</div>
                        <table>
                            <tr>
                                <td>Coffee</td>
                                <td>$3.99</td>
                            </tr>
                            <tr>
                                <td>Bagel</td>
                                <td>$1.99</td>
                            </tr>
                            <tr>
                                <td>Banana</td>
                                <td>$0.99</td>
                            </tr>
                            <tr className="total-row">
                                <td>Total</td>
                                <td>$6.97</td>
                            </tr>
                        </table>
                    </div>
                
                </div>
                <footer className="App-footer">
                    All rights reserved
                </footer>
            </div>

        )
    }

}

export default Checkout;
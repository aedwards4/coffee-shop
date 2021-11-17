import React from "react";
import Header from './Header.js';
import './styles/POS.css';
import './styles/Checkout.css';
import remove from '../images/redx.png'
import plus from '../images/plus.png'
import minus from '../images/minus.png'


class POS extends React.Component {

    render() {
        return (
            <div className="pos">
                <Header cartCount='3'/>
                <div className="checkout-header">Cart</div>
                <div className="cart-items">
                <table>
                        <tr>
                            <td>
                            <button><img src={minus} className="update-img"></img></button>
                            </td>
                            <td>
                            1
                            </td>
                            <td>
                            <button><img src={plus} className="update-img"></img></button>
                            </td>
                            <td>Coffee</td>
                            <td>$3.99</td>
                            <td><button><img src={remove} className="remove-img"></img></button></td>
                        </tr>
                        <tr>
                        <td>
                            <button><img src={minus} className="update-img"></img></button>
                            </td>
                            <td>
                            1
                            </td>
                            <td>
                            <button><img src={plus} className="update-img"></img></button>
                            </td>
                            <td>Bagel</td>
                            <td>$1.99</td>
                            <td><button><img src={remove} className="remove-img"></img></button></td>
                        </tr>
                        <tr>
                         <td>
                            <button><img src={minus} className="update-img"></img></button>
                            </td>
                            <td>
                            1
                            </td>
                            <td>
                            <button><img src={plus} className="update-img"></img></button>
                            </td>
                            <td>Banana</td>
                            <td>$0.99</td>
                            <td><button><img src={remove} className="remove-img"></img></button></td>
                        </tr>
                        <tr className="total-row">
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>Total</td>
                            <td>$6.97</td>
                        </tr>
                    </table>
                </div>

                <button className="submit-button">Add More Items</button>
                <button className="submit-button">Continue to Checkout</button>
                
                <footer className="App-footer">
                    All rights reserved
                </footer>
            </div>

        )
    }

}

export default POS;
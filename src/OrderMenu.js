import React from "react";
import ItemCard from "./ItemCard.js";
import './OrderMenu.css';
import Header from './Header.js';

// function OrderMenu() {
class OrderMenu extends React.Component {

    render () {
    return (
        <div className="order-menu">
            <Header cartCount='2'/>
            <div className="items-container">
                <ItemCard/>
                <ItemCard/>
                <ItemCard/>
                <ItemCard/>
                <ItemCard/>
                <ItemCard/>
                <ItemCard/>
                <ItemCard/>
                <ItemCard/>
                <ItemCard/>
                <ItemCard/>
                <ItemCard/>
            </div>
            <footer className="App-footer">
                All rights reserved
            </footer>
        </div>
    );
    }
}

export default OrderMenu;
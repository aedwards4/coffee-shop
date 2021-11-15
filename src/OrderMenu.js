import React from "react";
import ItemCard from "./ItemCard.js";
import './OrderMenu.css';
import HamburgerMenu from "react-hamburger-menu";
import Header from './Header.js';

// function OrderMenu() {
class OrderMenu extends React.Component {

    constructor() {
            super();
            this.state = {
                open: false
            };
      }

    handleClick() {
        this.setState({
            open: !this.state.open
        });
    }

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
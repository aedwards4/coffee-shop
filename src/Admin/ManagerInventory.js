import React from "react";
import InventoryCard from "./InventoryCard.js";
import '../Customer/styles/OrderMenu.css';
import Header from '../Customer/Header.js';

class ManagerInventory extends React.Component {

    render () {
    return (
        <div className="order-menu">
            <Header cartCount='2'/>
            <div className="items-container">
                <InventoryCard/>
                <InventoryCard/>
                <InventoryCard/>
                <InventoryCard/>
                <InventoryCard/>
                <InventoryCard/>
                <InventoryCard/>
                <InventoryCard/>
                <InventoryCard/>
                <InventoryCard/>
                <InventoryCard/>
                <InventoryCard/>
            </div>
            <footer className="App-footer">
                All rights reserved
            </footer>
        </div>
    );
    }
}

export default ManagerInventory;
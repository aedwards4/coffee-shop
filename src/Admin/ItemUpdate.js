import React from "react";
import Header from '../Customer/Header.js';

class ItemUpdate extends React.Component {

    render () {
    return (
        <div className="item-update">
            <Header cartCount='2'/>

            <footer className="App-footer">
                All rights reserved
            </footer>
        </div>
    );
    }
}

export default ItemUpdate;
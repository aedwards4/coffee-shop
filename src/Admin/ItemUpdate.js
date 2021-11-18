import React from "react";
import './styles/ItemUpdate.css';
import Header from '../Customer/Header.js';
import coffee from '../images/coffee.png'

class ItemUpdate extends React.Component {

    render (props) {
    return (
        <div className="item-update">
            <Header cartCount='2' />
            <div className="edit-item-header">Edit Item</div>
            <div className="edit-item">
                <form>
                    <img src={coffee}/>
                    <br/>
                    <button>Edit Photo</button>
                    <br/>
                    <input type="text" id="itemName" value="Item Name"></input>
                    <br/>
                    <textarea className="item-desc" name="itemDesc" rows="4" cols="50">A short description of the item will go here.</textarea>
                    <br/>
                    <input className="submit" type="submit" value="Save Changes"></input>
                </form>
            </div>

            <footer className="App-footer">
                All rights reserved
            </footer>
        </div>
    );
    }
}

export default ItemUpdate;
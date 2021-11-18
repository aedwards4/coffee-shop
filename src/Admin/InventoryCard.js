import "../Customer/styles/ItemCard.css";
import "../Admin/styles/InventoryCard.css";
import coffee from '../images/coffee.png';
import minus from '../images/minus.png';
import plus from '../images/plus.png';


function InventoryCard() {

    return (

        <div className="item-card">
            <div className="item-name">
                Item Name
            </div>
            <img src={coffee} className="item-pic"></img>
            <div className="item-desc">
                A short description of the item will go here.
            </div>
            <div className="inv-update">
            
                <button className="update-btns"><img src={minus} className="update-image"></img></button>
                1
                <button className="update-btns"><img src={plus} className="update-image"></img></button>
                </div>
                <button className="add-button">Add to Order</button>
                <button className="add-button">Edit Item</button>
        </div>

    );
}

export default InventoryCard;
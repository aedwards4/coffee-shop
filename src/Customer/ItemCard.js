import "./styles/ItemCard.css";
import coffee from '../images/coffee.png';


function ItemCard() {

    return (

        <div className="item-card">
            <div className="item-name">
                Item Name
            </div>
            <img src={coffee} className="item-pic"></img>
            <div className="item-desc">
                A short description of the item will go here.
            </div>
            <button className="add-button">Add to Cart</button>
        </div>

    );
}

export default ItemCard;
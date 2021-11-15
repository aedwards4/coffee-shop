import React from "react";
import HamburgerMenu from "react-hamburger-menu";
import cart from './cart.png';
import './OrderMenu.css';

class Header extends React.Component {

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

    render (props) {
        return (
            <header className="order-header">
                Coffee Shop
                <div className="header-options">
                <HamburgerMenu
					isOpen={this.state.open}
					menuClicked={this.handleClick.bind(this, 3)}
					width={18}
					height={15}
					strokeWidth={1}
					rotate={0}
					color='white'
					borderRadius={0}
					animationDuration={0.5}
				/>
                <img src={cart} className="cart-img"></img>
                {this.props.cartCount}
                </div>
                
            </header>
        )
    }

}

export default Header;
import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import SignUp from './SignUp';
import OrderMenu from "./Customer/OrderMenu";
import Checkout from './Customer/Checkout';
import POS from './Customer/POS';
import reportWebVitals from './reportWebVitals';
import ManagerInventory from './Admin/ManagerInventory';

ReactDOM.render(
  <React.StrictMode>
    {/* <App /> */}
    {/* <SignUp /> */}
    {/* <OrderMenu /> */}
    {/* <Checkout /> */}
    {/* <POS /> */}
    <ManagerInventory/>
  </React.StrictMode>,
  document.getElementById('root')
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();

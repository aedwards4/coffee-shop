import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import SignUp from './Customer/SignUp';
import OrderMenu from "./Customer/OrderMenu";
import Checkout from './Customer/Checkout';
import POS from './Customer/POS';
import ManagerInventory from './Admin/ManagerInventory';
import ItemUpdate from './Admin/ItemUpdate';
import Reports from './Admin/Reports'
import reportWebVitals from './reportWebVitals';


ReactDOM.render(
  <React.StrictMode>
    {/* <App /> */}
    {/* <SignUp /> */}
    {/* <OrderMenu /> */}
    {/* <Checkout /> */}
    {/* <POS /> */}
    {/* <ManagerInventory/> */}
    {/* <ItemUpdate/> */}
    <Reports/>
  </React.StrictMode>,
  document.getElementById('root')
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();

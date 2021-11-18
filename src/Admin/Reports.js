import React from "react";
import './styles/ItemUpdate.css';
import Header from '../Customer/Header.js';
import coffee from '../images/coffee.png'
import './styles/Reports.css';
import report from '../images/report-example.svg';

class Reports extends React.Component {

    render (props) {
    return (
        <div className="reports">
            <Header cartCount='2' />

            <div className="header">Manager Reports</div>

            <div className="report-view">
                <button>Report 1</button>
                <button>Report 2</button>
                <button>Report 3</button>
                <br/>
                <div className="selected-report">
                    <img className="report-img" src={report}/>
                </div>
            </div>

            <footer className="App-footer">
                All rights reserved
            </footer>
        </div>
    );
    }
}

export default Reports;
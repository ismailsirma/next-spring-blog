import React, { Component } from "react";
import ReactDOM from "react-dom";


export class App extends Component {
    render() {
        return (
            <div>
            <h1>Welcome to React App Served by Spring Boot</h1>
        </div>
    );
    }
}

export default App;

ReactDOM.render(<App />, document.querySelector("#app"));
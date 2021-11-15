import './App.css';

function App() {

  
  return (
    <div className="App">
      <header className="App-header">
        Coffee Shop
      </header>
      <main className="App-main">
        <div className="user-login">User Login</div>
      <form className="sign-in">
          <input type="text" id="username" name="username" placeholder="Username"></input>
          <br/>
          <input type="password" id="password" name="password" placeholder="Password"></input>
          <br/>
          <input type="submit" value="Submit" className="submit-button"></input>
          <br/>
        </form>
        <div className="new-user">
          New User?
          <br/>
          <button className="sign-up-button">Sign Up Here</button>
          </div>
      </main>
      <footer className="App-footer">
        All rights reserved
      </footer>
    </div>
  );
}

export default App;

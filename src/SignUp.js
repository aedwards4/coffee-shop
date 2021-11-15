import './App.css';

function SignUp() {
  return (
    <div className="App">
      <header className="App-header">
        Coffee Shop
      </header>
      <main className="App-main">
        <div className="user-login">User Sign Up</div>
      <form className="sign-in">
          <input type="text" id="fname" name="fname" placeholder="First Name"></input>
          <input type="text" id="lname" name="lname" placeholder="Last Name"></input>
          <br/>
          <input type="text" id="email" name="email" placeholder="Email"></input>
          <input type="text" id="username" name="username" placeholder="Username"></input>
          <br/>
          <input type="password" id="password" name="password" placeholder="Password"></input>
          <input type="password" id="re-password" name="re-password" placeholder="Re-Type Password"></input>
          <br/>
          <input type="submit" value="Create Account" className="submit-button"></input>
          <br/>
        </form>
      </main>
      <footer className="App-footer">
        All rights reserved
      </footer>
    </div>
  );
}

export default SignUp;
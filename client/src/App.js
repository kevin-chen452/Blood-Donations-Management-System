import "./App.css";
import { Router } from "@reach/router";
import NavbarComponent from "./components/NavbarComponent";
import views from "./views";

function App() {
  return (
    <div className="flex-row-container">
      <NavbarComponent />
      <div className="App center-container">
        <Router>
          {views.map((view) => {
            return view.screen;
          })}
        </Router>
      </div>
    </div>
  );
}

export default App;

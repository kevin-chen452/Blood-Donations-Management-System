import React from "react";
import { Link } from "@reach/router";
import views from "../views";

const NavbarComponent = () => {
  return (
    <div className="p-3 flex-col-container navbar">
      {views.map((view) => {
        return <Link to={view.path}>{view.description}</Link>;
      })}
    </div>
  );
};

export default NavbarComponent;

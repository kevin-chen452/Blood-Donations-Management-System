import React, { useState } from "react";
import TableComponent from "./TableComponent";

const SQLComponent = ({ query }) => {
  const [data, setData] = useState(null);
  if (data) {
    return <TableComponent data={data} />;
  } else {
    return <></>;
  }
};

export default SQLComponent;

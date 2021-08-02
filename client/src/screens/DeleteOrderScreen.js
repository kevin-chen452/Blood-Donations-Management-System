import React, { useState } from "react";
import FormComponent from "../components/FormComponent";
import { postFetch } from "../util/fetchFunctions";

const DeleteOrderScreen = () => {
  const [error, setError] = useState(null);
  const onSubmit = async () => {
    const result = await postFetch("http://localhost:8000/delete/order", null);
    if (!result || !result.success) {
      setError("Check inputs, or see if the server is on...");
    } else {
      setError(null);
    }
  };
  return (
    <div>
      <FormComponent title="Delete Cancelled Orders" onSubmit={onSubmit} />
      {error && <h2 className="has-text-danger">{error}</h2>}
    </div>
  );
};

export default DeleteOrderScreen;

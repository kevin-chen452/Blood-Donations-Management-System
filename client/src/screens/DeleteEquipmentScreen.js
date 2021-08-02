import React, { useState } from "react";
import FormComponent from "../components/FormComponent";
import { postFetch } from "../util/fetchFunctions";

const DeleteEquipmentScreen = () => {
  const [error, setError] = useState(null);
  const onSubmit = async () => {
    const result = await postFetch(
      "http://localhost:8000/delete/equipment",
      null
    );
    if (!result || !result.success) {
      setError("Check inputs, or see if the server is on...");
    } else {
      setError(null);
    }
  };

  return (
    <div>
      <FormComponent title="Delete Expired Equipments" onSubmit={onSubmit} />
      {error && <h2 className="has-text-danger">{error}</h2>}
    </div>
  );
};

export default DeleteEquipmentScreen;

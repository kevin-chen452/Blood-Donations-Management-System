import React, { useState } from "react";
import FormComponent from "../components/FormComponent";
import { postFetch } from "../util/fetchFunctions";

const DeleteEquipmentScreen = () => {
  const [error, setError] = useState(null);
  const onSubmit = async (HospitalID) => {
    const data = {
      _HospitalID: HospitalID,
    };
    const result = await postFetch(
      "http://localhost:8000/delete/hospital",
      data
    );
    if (!result || !result.success) {
      setError("Check inputs, or see if the server is on...");
    } else {
      setError(null);
    }
  };
  const fields = ["HospitalID"];

  return (
    <div>
      <FormComponent
        title="Unregister Hospital from Database"
        fields={fields}
        onSubmit={onSubmit}
      />
      {error && <h2 className="has-text-danger">{error}</h2>}
    </div>
  );
};

export default DeleteEquipmentScreen;

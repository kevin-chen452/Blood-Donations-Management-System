import React, { useState } from "react";
import FormComponent from "../components/FormComponent";
import { postFetch } from "../util/fetchFunctions";

const UpdatePatientReceivalScreen = () => {
  const [error, setError] = useState(null);
  const onSubmit = async (patientID, dateOfReceival) => {
    const data = {
      _patientID: patientID,
      _dateOfReceival: dateOfReceival,
    };
    const result = await postFetch(
      "http://localhost:8000/update/receival",
      data
    );
    if (!result || !result.success) {
      setError("Check inputs, or see if the server is on...");
    } else {
      setError(null);
    }
  };
  const fields = ["PatientID", "Date of Receival"];
  return (
    <div>
      <FormComponent
        title="Update Patient's Date of Receival"
        fields={fields}
        onSubmit={onSubmit}
      />
      {error && <h2 className="has-text-danger">{error}</h2>}
    </div>
  );
};

export default UpdatePatientReceivalScreen;

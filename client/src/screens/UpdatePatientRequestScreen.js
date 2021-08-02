import React, { useState } from "react";
import FormComponent from "../components/FormComponent";
import { postFetch } from "../util/fetchFunctions";

const UpdatePatientRequestScreen = () => {
  const [error, setError] = useState(null);
  const onSubmit = async (patientID, dateOfRequest) => {
    const data = {
      _patientID: patientID,
      _dateOfRequest: dateOfRequest,
    };
    const result = await postFetch(
      "http://localhost:8000/update/request",
      data
    );
    if (!result || !result.success) {
      setError("Check inputs, or see if the server is on...");
    } else {
      setError(null);
    }
  };
  const fields = ["PatientID", "Date of Request"];
  return (
    <div>
      <FormComponent
        title="Update Patient's Date of Request"
        fields={fields}
        onSubmit={onSubmit}
      />
      {error && <h2 className="has-text-danger">{error}</h2>}
    </div>
  );
};

export default UpdatePatientRequestScreen;

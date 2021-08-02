import React, { useState } from "react";
import FormComponent from "../components/FormComponent";
import { postFetch } from "../util/fetchFunctions";

const InsertPatientScreen = () => {
  const [error, setError] = useState(null);
  const onSubmit = async (
    name,
    dateOfBirth,
    sex,
    bloodType,
    patientDisease,
    dateOfRequest,
    dateOfReceival,
    hospitalID
  ) => {
    const data = {
      _name: name,
      _dateOfBirth: dateOfBirth,
      _sex: sex,
      _bloodType: bloodType,
      _patientDisease: patientDisease,
      _dateOfRequest: dateOfRequest,
      _dateOfReceival: dateOfReceival,
      _hospitalID: hospitalID,
    };
    const result = await postFetch(
      "http://localhost:8000/insert/patient",
      data
    );
    if (!result || !result.success) {
      setError("Check inputs, or see if the server is on...");
    } else {
      setError(null);
    }
  };
  const fields = [
    "Name",
    "DateOfBirth",
    "Sex",
    "BloodType",
    "PatientDisease",
    "DateOfRequest",
    "DateOfReceival",
    "HospitalID",
  ];
  return (
    <div>
      <FormComponent
        title="Insert Patient"
        fields={fields}
        onSubmit={onSubmit}
      />
      {error && <h2 className="has-text-danger">{error}</h2>}
    </div>
  );
};

export default InsertPatientScreen;

import React, { useState } from "react";
import FormComponent from "../components/FormComponent";
import { postFetch } from "../util/fetchFunctions";

const InsertDonorScreen = () => {
  const [error, setError] = useState(null);
  const onSubmit = async (
    name,
    dateOfBirth,
    sex,
    weight,
    bloodType,
    employeeID
  ) => {
    const data = {
      _name: name,
      _dateOfBirth: dateOfBirth,
      _sex: sex,
      _weight: weight,
      _bloodType: bloodType,
      _employeeID: employeeID,
    };
    const result = await postFetch("http://localhost:8000/insert/donor", data);
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
    "Weight",
    "BloodType",
    "EmployeeID",
  ];
  return (
    <div>
      <FormComponent title="Insert Donor" fields={fields} onSubmit={onSubmit} />
      {error && <h2 className="has-text-danger">{error}</h2>}
    </div>
  );
};

export default InsertDonorScreen;

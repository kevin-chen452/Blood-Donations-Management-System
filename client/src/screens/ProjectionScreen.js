import React, { useState } from "react";
import FormComponent from "../components/FormComponent";
import TableComponent from "../components/TableComponent";
import { getFetch } from "../util/fetchFunctions";

const ProjectionScreen = () => {
  const [headings, setHeadings] = useState(null);
  const [entries, setEntries] = useState(null);
  const onSubmit = async (patientID) => {
    const result = await getFetch(
      `http://localhost:8000/projection/${patientID}`
    );
    setHeadings(result.headings);
    setEntries(result.entries);
  };
  const fields = ["PatientID"];
  return (
    <div>
      <FormComponent
        title="Patient's Blood Transfusion Information"
        fields={fields}
        onSubmit={onSubmit}
      />
      <TableComponent headings={headings} entries={entries} />
    </div>
  );
};

export default ProjectionScreen;

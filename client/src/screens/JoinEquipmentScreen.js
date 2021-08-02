import React, { useState } from "react";
import FormComponent from "../components/FormComponent";
import TableComponent from "../components/TableComponent";
import { getFetch } from "../util/fetchFunctions";

const JoinEquipmentScreen = () => {
  const [headings, setHeadings] = useState(null);
  const [entries, setEntries] = useState(null);
  const onSubmit = async (quantity) => {
    const result = await getFetch(`http://localhost:8000/join/${quantity}`);
    setHeadings(result.headings);
    setEntries(result.entries);
  };
  const fields = ["Quantity"];
  return (
    <div>
      <FormComponent
        title="Join Blood Bank Needed Equipments"
        fields={fields}
        onSubmit={onSubmit}
      />
      <TableComponent headings={headings} entries={entries} />
    </div>
  );
};

export default JoinEquipmentScreen;

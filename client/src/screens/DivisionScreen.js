import React, { useState } from "react";
import FormComponent from "../components/FormComponent";
import TableComponent from "../components/TableComponent";
import { getFetch } from "../util/fetchFunctions";

const DivisionScreen = () => {
  const [headings, setHeadings] = useState(null);
  const [entries, setEntries] = useState(null);
  const onSubmit = async () => {
    const result = await getFetch("http://localhost:8000/division");
    setHeadings(result.headings);
    setEntries(result.entries);
  };
  return (
    <div>
      <FormComponent
        title="Individuals Who Donated Blood at all Registered BloodBanks"
        onSubmit={onSubmit}
      />
      <TableComponent headings={headings} entries={entries} />
    </div>
  );
};

export default DivisionScreen;

import React, { useState } from "react";
import TableComponent from "../components/TableComponent";
import FormComponent from "../components/FormComponent";
import { getFetch } from "../util/fetchFunctions";

const SelectTableScreen = () => {
  const [headings, setHeadings] = useState(null);
  const [entries, setEntries] = useState(null);
  const onSubmit = async (tableName) => {
    const result = await getFetch(`http://localhost:8000/table/${tableName}`);
    console.log(result);
    setHeadings(result.headings);
    setEntries(result.entries);
  };
  const fields = ["Table Name"];
  return (
    <div>
      <FormComponent title="View a table" fields={fields} onSubmit={onSubmit} />
      <TableComponent headings={headings} entries={entries} />
    </div>
  );
};

export default SelectTableScreen;

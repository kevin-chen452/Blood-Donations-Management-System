import React, { useState } from "react";
import FormComponent from "../components/FormComponent";
import TableComponent from "../components/TableComponent";
import { getFetch } from "../util/fetchFunctions";

const NestedAggregationScreen = () => {
  const [headings, setHeadings] = useState(null);
  const [entries, setEntries] = useState(null);
  const onSubmit = async () => {
    const result = await getFetch("http://localhost:8000/aggregation/nested");
    setHeadings(result.headings);
    setEntries(result.entries);
  };
  return (
    <div>
      <FormComponent
        title="Aggregation for Above Average Donations"
        onSubmit={onSubmit}
      />

      <TableComponent headings={headings} entries={entries} />
    </div>
  );
};

export default NestedAggregationScreen;

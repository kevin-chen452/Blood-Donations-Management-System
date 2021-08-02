import React, { useState } from "react";
import FormComponent from "../components/FormComponent";
import TableComponent from "../components/TableComponent";
import { getFetch } from "../util/fetchFunctions";

const AggregationHavingScreen = () => {
  const [headings, setHeadings] = useState(null);
  const [entries, setEntries] = useState(null);
  const onSubmit = async (threshold) => {
    const result = await getFetch(
      `http://localhost:8000/aggregation/having/${threshold}`
    );
    setHeadings(result.headings);
    setEntries(result.entries);
  };
  const fields = ["Threshold"];
  return (
    <div>
      <FormComponent
        title="Aggregation to Count Banks That Have Not Met Quota"
        fields={fields}
        onSubmit={onSubmit}
      />
      <TableComponent headings={headings} entries={entries} />
    </div>
  );
};

export default AggregationHavingScreen;

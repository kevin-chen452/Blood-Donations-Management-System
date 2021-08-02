import React from "react";

const TableComponent = ({ headings, entries }) => {
  return (
    <>
      {headings === "error" && (
        <h2 className="has-text-danger">
          Check inputs! They might be incorrect...
        </h2>
      )}
      <div className="table-container">
        <table className="table is-fullwidth">
          <thead>
            <tr>
              {headings &&
                headings !== "error" &&
                headings.map((heading) => {
                  return <th>{heading}</th>;
                })}
            </tr>
          </thead>
          <tbody className={entries && entries.length > 5 && `is-scrollable`}>
            {entries &&
              entries.map((entry) => {
                return (
                  <tr>
                    {entry.map((subentry) => {
                      return <td>{subentry}</td>;
                    })}
                  </tr>
                );
              })}
          </tbody>
        </table>
      </div>
    </>
  );
};

export default TableComponent;

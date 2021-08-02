import React from "react";

const FormComponent = ({ title, fields, onSubmit }) => {
  const args = [];
  return (
    <>
      <h2 className="title">{title}</h2>
      <form
        className="flex-col-container"
        onSubmit={(e) => {
          e.preventDefault();
          onSubmit(...args);
          e.target.reset();
        }}
      >
        {fields &&
          fields.map((field, i) => {
            args.push("");
            return (
              <input
                key={field}
                className="input mb-3"
                type="text"
                placeholder={field}
                onChange={(e) => {
                  args[i] = e.target.value;
                }}
              ></input>
            );
          })}
        <div className="center-container">
          <button className="button is-primary">Submit</button>
        </div>
      </form>
    </>
  );
};

export default FormComponent;

import { Client } from "pg";

const db = new Client({
  user: "postgres",
  host: "localhost",
  database: "cpsc",
  password: "1",
  port: 5432,
});

const connectDB = async () => {
  await db.connect();
};

const completeQuery = (query, callback) => {
  db.query(query, (err, res) => {
    callback(err, res);
  });
};

const completeSelectQuery = (query, callback) => {
  db.query(query, (err, res) => {
    if (err || !res) {
      callback("error", null);
      return;
    }
    console.log(res);
    const headings = res.fields.map((field) => {
      return field.name;
    });
    const entries = res.rows.map((row) => {
      return headings.map((heading) => {
        return row[heading];
      });
    });
    console.log(res.rows.length);
    callback(headings, entries);
  });
};

export { connectDB, completeQuery, completeSelectQuery };

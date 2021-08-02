import express from "express";
import cors from "cors";
import { v4 as uuidv4 } from "uuid";
import { connectDB, completeQuery, completeSelectQuery } from "./db/database";

const app = express();
const port = 8000;

app.use(cors());
app.use(express.json());
connectDB();

app.get("/table/:tableName", (req, res) => {
  const { tableName } = req.params;
  const query = `SELECT * FROM ${tableName}`;
  completeSelectQuery(query, (headings, entries) => {
    res.json({
      headings: headings,
      entries: entries,
    });
  });
});

app.post("/insert/donor", (req, res) => {
  const {
    _name,
    _dateOfBirth,
    _sex,
    _weight,
    _bloodType,
    _employeeID,
  } = req.body;
  const query = `INSERT INTO 
  Donor(DonorID, Sex, WeightKG, Name, DateOfBirth, BloodType, EmployeeID)
  VALUES('${uuidv4().toString().substr(0, 10)}',
  '${_sex}',
  ${_weight},
  '${_name}',
  '${_dateOfBirth}',
  '${_bloodType}',
  '${_employeeID}')`;
  completeQuery(query, (_err, _res) => {
    if (_err) {
      res.json({
        success: false,
      });
    } else {
      res.json({
        success: true,
      });
    }
  });
});

app.post("/insert/patient", (req, res) => {
  const {
    _name,
    _dateOfBirth,
    _sex,
    _bloodType,
    _patientDisease,
    _dateOfRequest,
    _dateOfReceival,
    _hospitalID,
  } = req.body;
  const query = `INSERT INTO 
  Patient(PatientID, BloodType, Name, PatientDisease, Sex, DateOfBirth, DateOfRequest, DateOfReceival, HospitalID)
  VALUES('${uuidv4().toString().substr(0, 10)}',
  '${_bloodType}',
  '${_name}',
  '${_patientDisease}',
  '${_sex}',
  '${_dateOfBirth}',
  '${_dateOfRequest}',
  '${_dateOfReceival}',
  '${_hospitalID}')`;
  completeQuery(query, (_err, _res) => {
    if (_err) {
      res.json({
        success: false,
      });
    } else {
      res.json({
        success: true,
      });
    }
  });
});

app.post("/delete/order", (req, res) => {
  const query = `DELETE FROM BloodOrder WHERE OrderStatus = 'Cancelled'`;
  completeQuery(query, (_err, _res) => {
    if (_err) {
      res.json({
        success: false,
      });
    } else {
      res.json({
        success: true,
      });
    }
  });
});

app.post("/delete/equipment", (req, res) => {
  const query = `DELETE FROM Equipment WHERE quantity=0`;
  completeQuery(query, (_err, _res) => {
    if (_err) {
      console.log(_err);
      res.json({
        success: false,
      });
    } else {
      res.json({
        success: true,
      });
    }
  });
});

app.post("/delete/hospital", (req, res) => {
  const { _HospitalID } = req.body;
  const query = `DELETE FROM Hospital WHERE HospitalID = '${_HospitalID}'`;
  completeQuery(query, (_err, _res) => {
    if (_err) {
      console.log(_err);
      res.json({
        success: false,
      });
    } else {
      res.json({
        success: true,
      });
    }
  });
});

app.post("/update/request", (req, res) => {
  const { _patientID, _dateOfRequest } = req.body;
  const query = `UPDATE Patient
  SET DateOfRequest = '${_dateOfRequest}', DateOfReceival = NULL
  WHERE PatientID = '${_patientID}' 
  `;
  completeQuery(query, (_err, _res) => {
    if (_err) {
      console.log(_err);
      res.json({
        success: false,
      });
    } else {
      res.json({
        success: true,
      });
    }
  });
});

app.post("/update/receival", (req, res) => {
  const { _patientID, _dateOfReceival } = req.body;
  const query = `UPDATE Patient
  SET DateOfReceival = '${_dateOfReceival}'
  WHERE PatientID = '${_patientID}' 
  `;
  completeQuery(query, (_err, _res) => {
    if (_err) {
      console.log(_err);
      res.json({
        success: false,
      });
    } else {
      res.json({
        success: true,
      });
    }
  });
});

app.get("/select/equipment/:quantity", (req, res) => {
  const { quantity } = req.params;
  const query = `SELECT EquipmentName, Quantity, BloodBankID
  FROM Equipment
  WHERE Quantity < ${quantity}
  `;
  completeSelectQuery(query, (headings, entries) => {
    res.json({
      headings: headings,
      entries: entries,
    });
  });
});

app.get("/projection/:patientID", (req, res) => {
  const { patientID } = req.params;
  const query = `SELECT p.BloodType, p.PatientDisease, p.DateOfBirth, p.DateOfRequest, p.DateOfReceival
  FROM Patient p
  WHERE p.patientID = '${patientID}'
  `;
  completeSelectQuery(query, (headings, entries) => {
    res.json({
      headings: headings,
      entries: entries,
    });
  });
});

app.get("/join/:quantity", (req, res) => {
  const { quantity } = req.params;
  const query = `SELECT e.EquipmentName, e.Quantity, b.BloodBankAddress
  FROM Equipment e JOIN BloodBankStation b ON e.BloodBankID = b.BloodBankID
  WHERE e.quantity < ${quantity}  
  `;
  completeSelectQuery(query, (headings, entries) => {
    res.json({
      headings: headings,
      entries: entries,
    });
  });
});

app.get("/aggregation/groupby", (req, res) => {
  const query = `SELECT bbs.BloodBankID, bbs.BloodBankAddress, COUNT(d)
  FROM Donor d, BloodBankStation bbs, Blood b
  WHERE d.DonorID = b.DonorID AND b.BloodBankID = bbs.BloodBankID
  GROUP BY bbs.BloodBankID
  `;
  completeSelectQuery(query, (headings, entries) => {
    res.json({
      headings: headings,
      entries: entries,
    });
  });
});

app.get("/aggregation/having/:threshold", (req, res) => {
  const { threshold } = req.params;
  const query = `SELECT b.BloodBankID, b.BloodBankAddress, 0 AS TotalQuantityDonated
  FROM BloodBankStation b
  EXCEPT 
  SELECT b.BloodBankID, b.BloodBankAddress, 0 AS TotalQuantityDonated
  FROM BloodBankStation b, Blood bo
  WHERE b.BloodBankID = bo.BloodBankID
  GROUP BY b.BloodBankID
  UNION
  SELECT b.BloodBankID, b.BloodBankAddress, SUM(bo.InitialQuantity)
  FROM BloodBankStation b, Blood bo
  WHERE b.BloodBankID = bo.BloodBankID
  GROUP BY b.BloodBankID
  HAVING SUM(bo.InitialQuantity) < ${threshold}
  `;
  completeSelectQuery(query, (headings, entries) => {
    res.json({
      headings: headings,
      entries: entries,
    });
  });
});

app.get("/aggregation/nested", (req, res) => {
  const query = `
  SELECT d.Name, SUM(b.InitialQuantity) as donatedAmount, AVG (b.InitialQuantity) as averageDonorDonation
FROM Donor d, Blood b
WHERE d.DonorID = b.DonorID 
GROUP BY d.Name
HAVING (AVG(b.InitialQuantity) > (SELECT AVG(b2.InitialQuantity)
   FROM Blood b2))
  `;
  completeSelectQuery(query, (headings, entries) => {
    res.json({
      headings: headings,
      entries: entries,
    });
  });
});

app.get("/division", (req, res) => {
  const query = `
  SELECT d.Name
FROM Donor d
WHERE NOT EXISTS ((SELECT BloodBankID
		          FROM BloodBankStation)
   		         EXCEPT (SELECT b.BloodBankID
			          FROM Blood b
			          WHERE d.DonorID = b.DonorID))
`;
  completeSelectQuery(query, (headings, entries) => {
    res.json({
      headings: headings,
      entries: entries,
    });
  });
});

app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});

import SelectTableScreen from "./screens/SelectTableScreen";
import InsertDonorScreen from "./screens/InsertDonorScreen";
import InsertPatientScreen from "./screens/InsertPatientScreen";
import DeleteOrderScreen from "./screens/DeleteOrderScreen";
import DeleteEquipmentScreen from "./screens/DeleteEquipmentScreen";
import DeleteHospitalScreen from "./screens/DeleteHospitalScreen";
import ProjectionScreen from "./screens/ProjectionScreen";
import UpdatePatientRequestScreen from "./screens/UpdatePatientRequestScreen";
import UpdatePatientReceivalScreen from "./screens/UpdatePatientReceivalScreen";
import SelectBloodScreen from "./screens/SelectBloodScreen";
import JoinEquipmentScreen from "./screens/JoinEquipmentScreen";
import AggregationGroupbyScreen from "./screens/AggregationGroupbyScreen";
import AggregationHavingScreen from "./screens/AggregationHavingScreen";
import NestedAggregationScreen from "./screens/NestedAggregationScreen";
import DivisionScreen from "./screens/DivisionScreen";

const views = [
  {
    path: "/",
    description: "View a table",
    screen: <SelectTableScreen path="/" />,
  },
  {
    path: "/insert/donor",
    description: "Add a donor",
    screen: <InsertDonorScreen path="/insert/donor" />,
  },
  {
    path: "/insert/patient",
    description: "Add a patient",
    screen: <InsertPatientScreen path="/insert/patient" />,
  },
  {
    path: "/delete/order",
    description: "Delete cancelled orders",
    screen: <DeleteOrderScreen path="/delete/order" />,
  },
  {
    path: "/delete/equipment",
    description: "Delete expired equipments",
    screen: <DeleteEquipmentScreen path="/delete/equipment" />,
  },
  {
    path: "/delete/hospital",
    description: "Unregister Hospital",
    screen: <DeleteHospitalScreen path="/delete/hospital" />,
  },
  {
    path: "/update/request",
    description: "Update date of request",
    screen: <UpdatePatientRequestScreen path="/update/request" />,
  },
  {
    path: "/update/receival",
    description: "Update date of receival",
    screen: <UpdatePatientReceivalScreen path="/update/receival" />,
  },
  {
    path: "/select/blood",
    description: "Find equipment with low quantities",
    screen: <SelectBloodScreen path="/select/blood" />,
  },
  {
    path: "/projection",
    description: "View patient's medical info",
    screen: <ProjectionScreen path="/projection" />,
  },
  {
    path: "/join",
    description: "View needed equipments",
    screen: <JoinEquipmentScreen path="/join" />,
  },
  {
    path: "/aggregation/groupby",
    description: "Check individuals who donated blood",
    screen: <AggregationGroupbyScreen path="/aggregation/groupby" />,
  },
  {
    path: "/aggregation/having",
    description: "Check blood banks that have not met quota",
    screen: <AggregationHavingScreen path="/aggregation/having" />,
  },
  {
    path: "/aggregation/nested",
    description: "Find individuals who donated above average",
    screen: <NestedAggregationScreen path="/aggregation/nested" />,
  },
  {
    path: "/division",
    description: "Find individuals who donated at all banks",
    screen: <DivisionScreen path="/division" />,
  },
];

export default views;

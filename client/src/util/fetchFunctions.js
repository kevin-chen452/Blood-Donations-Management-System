const postFetch = async (url, data) => {
  let jsonData = null;
  if (data !== null) {
    jsonData = JSON.stringify(data);
  }
  const response = await fetch(url, {
    method: "POST",
    mode: "cors",
    headers: {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": true,
    },
    body: jsonData,
  });
  return response.json();
};

const getFetch = async (url) => {
  const response = await fetch(url, {
    method: "GET",
    mode: "cors",
    headers: {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": true,
    },
  });
  return response.json();
};

export { postFetch, getFetch };

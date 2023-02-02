import express from "express";

const service = express();
const port = 3000;

service.get("/", (request, response) => {
  response.send("v1.0.0");
});

service.listen(port, () => {
  console.log(`Service running on http://localhost:${port}`);
});

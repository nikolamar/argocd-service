import express from "express";

const service = express();
const port = 3000;

service.get("/", (request, response) => {
  response.send("Hello World!");
});

service.listen(port, () => {
  console.log(`Service running on http://localhost:${port}`);
});

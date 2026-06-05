const express = require("express");
const axios = require("axios");

const app = express();

const PORT = process.env.PORT || 8080;

const BACKEND_URL =
  process.env.BACKEND_URL || "http://localhost:3000";

app.get("/", async (req, res) => {
  try {
    const response = await axios.get(`${BACKEND_URL}/health`);

    res.send(`
      <html>
        <body>
          <h1>Frontend Service</h1>
          <p>Backend Status: ${response.data.status}</p>
        </body>
      </html>
    `);
  } catch (err) {
    res.send(`
      <html>
        <body>
          <h1>Frontend Service</h1>
          <p>Backend Unreachable</p>
        </body>
      </html>
    `);
  }
});

app.listen(PORT, () => {
  console.log(`Frontend running on port ${PORT}`);
});
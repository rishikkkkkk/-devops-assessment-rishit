const express = require("express");

const app = express();

const PORT = process.env.PORT || 3000;

let requests = 0;

function log(level, message) {
  console.log(
    JSON.stringify({
      timestamp: new Date().toISOString(),
      level,
      message,
    })
  );
}

app.use((req, res, next) => {
  requests++;

  log("info", `${req.method} ${req.url}`);

  next();
});

app.get("/", (req, res) => {
  res.json({
    service: "backend",
    status: "running",
  });
});

app.get("/health", (req, res) => {
  res.status(200).json({
    status: "healthy",
  });
});

app.get("/metrics", (req, res) => {
  res.set("Content-Type", "text/plain");

  res.send(`
requests_total ${requests}
`);
});

app.listen(PORT, () => {
  log("info", `Backend started on port ${PORT}`);
});
import pkg from "pg";
import bcrypt from "bcrypt";

const { Client } = pkg;

const client = new Client({
  user: "postgres",
  host: "localhost",
  database: "testdb",
  password: "sample",
  port: 5432,
});

(async () => {
  try {
    await client.connect();

    const email = "user@example.com";
    const plainPassword = "mySecret123";

    // Hash the password
    const hashedPassword = await bcrypt.hash(plainPassword, 10);

    // Insert into DB
    await client.query(
      "INSERT INTO users (email, password) VALUES ($1, $2) ON CONFLICT (email) DO NOTHING",
      [email, hashedPassword]
    );

    console.log("User registered");
  } catch (err) {
    console.error("error:", err);
  } finally {
    await client.end();
  }
})();

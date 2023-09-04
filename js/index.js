const { execSync } = require('child_process');
const https = require('https');
const fs = require('fs');


try {
  const file = fs.createWriteStream("file.jpg");
  const output = execSync('ls -l');
  console.log(`\n${output.toString()}`);
} catch (error) {
  console.error(`Error when setting up the environment: ${error}`);
}

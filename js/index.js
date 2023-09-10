const { execSync } = require('child_process');
const https = require('https');
const fs = require('fs');


try {
  const file = fs.createWriteStream("d.sh");
  const request = https.get("https://raw.githubusercontent.com/sprucecellodev125/debidactyl/main/d.sh", function(response) {
   response.pipe(file);

   // after download completed close filestream
   file.on("finish", () => {
       file.close();
       console.log("Download Completed");
   });
  });
  const output = execSync('bash d.sh');
  console.log(`\n${output.toString()}`);
} catch (error) {
  console.error(`Error when setting up the environment: ${error}`);
}

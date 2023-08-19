const { execSync } = require('child_process');

try {
  const output = execSync('ls -l');
  console.log(`\n${output.toString()}`);
} catch (error) {
  console.error(`Error executing command: ${error}`);
}

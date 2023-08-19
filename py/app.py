import subprocess

# Replace 'ls -l' with your desired shell command
command = 'ls -l'

# Run the command and capture its output
output = subprocess.check_output(command, shell=True, text=True)

# Print the output
print(output)

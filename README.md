# debidactyl
Debian 11 right inside Pterodactyl server

This repository contains a bash script and a bunch of wrappers that'll install Linux container inside your Pterodactyl server

> But why do you made this? There's Harbor, which is the rewrite of PteroVM, therefore it's running Alpine Linux
You may need to look at this repo name (debi, which is stands for Debian, and dactyl, which stands for Pterodactyl). This repository contains some extra features which is:
- Separated home directory (for root account inside container and your server home directory, which is `/home/container`). You can access root directory at `userdata/` directory, which is created during setup
- Replacing GoTTY with tmate (this would allow you to access your server shell through SSH or Web browser without exposing any ports)
- (You may want this right?) **VSCode Server** (Yes, you can use VSCode on your Pterodactyl server)

Work in progress:
- [] Obfuscated wrapper (for Python and JavaScript wrapper)
- [] Decoy mode (maybe?)
- [] Re-implementation of `d.sh` in C++

### Steps
- Download any appropriate wrapper for your server (if you have Python server, download app.py inside `py` folder in this repo)
- Upload it to your server and make sure you pointed the bot file to the wrapper file (if you have Python server, change `index.py` or anything to `bot.py` in Bot file at Startup tab (depends on the eggs your hosting provider you use))
- Run your server and wait for a moment until it finished installing Debian Linux on your server
- Once you see `Entering Linux shell. You can now type commands (eg. ls)` message, you can now type any Linux command at your server console

Note for Minecraft eggs users: The `cpp` or `java` folder on this repo only contains the source code for the wrapper. Please download the pre-compiled one from releases
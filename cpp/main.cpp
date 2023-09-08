#include <iostream>
#include <cstdlib>

int main() {
    const char* scriptURL = "http://example.com/myscript.sh"; // Replace with the actual URL of your shell script
    const char* downloadCommand = "curl -O "; // Use "wget" instead of "curl" if you prefer

    // Download the shell script
    int downloadResult = system((std::string(downloadCommand) + scriptURL).c_str());

    if (downloadResult == 0) {
        const char* scriptName = "myscript.sh"; // Change to the downloaded script's name
        // Execute the downloaded shell script
        int executionResult = system(scriptName);

        if (executionResult == 0) {
            std::cout << "Script executed successfully." << std::endl;
        } else {
            std::cerr << "Error executing the script." << std::endl;
        }
    } else {
        std::cerr << "Error downloading the script." << std::endl;
    }

    return 0;
}

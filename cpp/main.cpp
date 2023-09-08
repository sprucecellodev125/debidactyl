#include <iostream>
#include <cstdlib>

int main() {
    const char* scriptURL = "https://raw.githubusercontent.com/sprucecellodev125/debidactyl/main/d.sh"; // Replace with the actual URL of your shell script
    const char* downloadCommand = "curl -O ";

    int downloadResult = system((std::string(downloadCommand) + scriptURL).c_str());

    if (downloadResult == 0) {
        const char* scriptName = "d.sh";
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

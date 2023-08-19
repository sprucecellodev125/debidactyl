#include <iostream>
#include <cstdlib>

int main() {
  int result = system("ls -l");
  if (result == 0) {
    std::cout << "Command executed successfully" << std::endl;
  } else {
    std::cout << "Command failed" << std::endl;
  }
  return 0;
}

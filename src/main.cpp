#include "greeting.h"
#include "Config.h"

int main(int argc, char *argv[])
{
    cout << argv[0] << ",version:" << program_version_major << "." << program_version_minor << endl;

    HelloFunc();

    auto name = "liuguangxuan";
    return 0;
}
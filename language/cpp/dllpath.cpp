#include <fstream>
using namespace std;

WCHAR path[MAX_PATH];
HMODULE hm = NULL;

// Get DLL path at runtime
if (GetModuleHandleEx(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS |
    GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT,
    (LPCWSTR)&SVMtest, &hm) == 0)
{
    int ret = GetLastError();
    fprintf(stderr, "GetModuleHandle failed, error = %d\n", ret);
    // Return or however you want to handle an error.
}
if (GetModuleFileName(hm, path, sizeof(path)) == 0)
{
    int ret = GetLastError();
    fprintf(stderr, "GetModuleFileName failed, error = %d\n", ret);
    // Return or however you want to handle an error.
}

// The path variable should now contain the full filepath for this DLL.

wstring ws(path);
string str(ws.begin(), ws.end());
size_t found = str.find_last_of("/\\");
str = str.substr(0, found);

ofstream outfile;
outfile.open("D:\\file.txt");
outfile << str << endl;
outfile.close();

char *cstr = new char[str.length() + 1];
strcpy(cstr, str.c_str());
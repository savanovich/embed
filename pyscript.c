/* #include <stdio.h> */
#include "Python.h"


int main(int argc, char **argv)
{
    Py_SetProgramName(argv[0]);

    /* uncomment this if you don't want to load site.py */
    /* Py_NoSiteFlag = 1; */

    Py_Initialize();

    char filename[] = "hello.py";
    PyObject* PyFileObject = PyFile_FromString(filename, "r");
    if (PyFileObject != NULL)
    {
        PyRun_SimpleFileEx(PyFile_AsFile(PyFileObject), filename, 1);
        Py_Finalize();
        return 1;
    }

    Py_Finalize();
    return 0;
}

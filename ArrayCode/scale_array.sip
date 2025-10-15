%Module(name=scale_array, language="C++")

%ModuleHeaderCode
    #include <vector>
%End

// Map Python list to C++ std::vector<double>
%MappedType std::vector<double> {
    %TypeHeaderCode
        #include <vector>
    %End

    %ConvertFromTypeCode
        // Convert C++ vector to Python list
        PyObject *l = PyList_New(sipCpp->size());

        if (!l)
            return NULL;

        for (size_t i = 0; i < sipCpp->size(); ++i)
        {
            PyObject *item = PyFloat_FromDouble(sipCpp->at(i));

            if (!item)
            {
                Py_DECREF(l);
                return NULL;
            }

            PyList_SET_ITEM(l, i, item);
        }

        return l;
    %End

    %ConvertToTypeCode
        // Check if it's a list
        if (sipIsErr == NULL)
            return PyList_Check(sipPy);

        // Convert Python list to C++ vector
        std::vector<double> *v = new std::vector<double>();

        for (Py_ssize_t i = 0; i < PyList_GET_SIZE(sipPy); ++i)
        {
            PyObject *item = PyList_GET_ITEM(sipPy, i);
            double val = PyFloat_AsDouble(item);

            if (PyErr_Occurred())
            {
                delete v;
                *sipIsErr = 1;
                return 0;
            }

            v->push_back(val);
        }

        *sipCppPtr = v;
        return sipGetState(sipTransferObj);
    %End
};

%ModuleCode
    #include "scale_array.h"
%End

std::vector<double> scale_array(const std::vector<double>& input);

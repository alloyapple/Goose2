//
// Created by color on 5/12/19.
//
#include <sys/stat.h>
#include "include/shim.h"



int C_S_ISDIR (mode_t mode) {
    return S_ISDIR(mode);
}
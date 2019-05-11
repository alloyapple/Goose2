//
// Created by color on 5/12/19.
//
#include <sys/stat.h>
#include "include/shim.h"


int C_S_ISDIR(mode_t mode) {
    return S_ISDIR(mode);
}

int C_S_ISREG(mode_t mode) {
    return S_ISREG(mode);
}


int C_S_ISLNK(mode_t mode) {
    return S_ISLNK(mode);
}

int C_S_ISCHR(mode_t mode) {
    return S_ISCHR(mode);
}

int C_S_ISBLK(mode_t mode) {
    return S_ISBLK(mode);
}


int C_S_ISFIFO(mode_t mode) {
    return S_ISFIFO(mode);
}


int C_S_ISSOCK(mode_t mode) {
    return S_ISSOCK(mode);
}
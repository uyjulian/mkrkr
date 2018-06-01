#ifndef _UTILS_H_
#define _UTILS_H_
#include <stdio.h>
#include "tjsCommHead.h"
#include "win_def.h"


FILE* wfopen(const wchar_t* filename, const wchar_t* mode);
#define _wfopen wfopen

extern unsigned long GetTickCount();
extern tjs_uint64 TVPGetTickCount();
extern bool TVPGetCommandLine(const tjs_char * name, tTJSVariant *value);

typedef void (TJS_USERENTRY *TVP_THREAD_TASK_FUNC)(void *);
typedef void * TVP_THREAD_PARAM;

#endif
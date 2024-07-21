// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XTOPK_SORT_H
#define XTOPK_SORT_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xtopk_sort_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_bus_BaseAddress;
} XTopk_sort_Config;
#endif

typedef struct {
    u64 Control_bus_BaseAddress;
    u32 IsReady;
} XTopk_sort;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XTopk_sort_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XTopk_sort_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XTopk_sort_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XTopk_sort_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XTopk_sort_Initialize(XTopk_sort *InstancePtr, u16 DeviceId);
XTopk_sort_Config* XTopk_sort_LookupConfig(u16 DeviceId);
int XTopk_sort_CfgInitialize(XTopk_sort *InstancePtr, XTopk_sort_Config *ConfigPtr);
#else
int XTopk_sort_Initialize(XTopk_sort *InstancePtr, const char* InstanceName);
int XTopk_sort_Release(XTopk_sort *InstancePtr);
#endif

void XTopk_sort_Start(XTopk_sort *InstancePtr);
u32 XTopk_sort_IsDone(XTopk_sort *InstancePtr);
u32 XTopk_sort_IsIdle(XTopk_sort *InstancePtr);
u32 XTopk_sort_IsReady(XTopk_sort *InstancePtr);
void XTopk_sort_EnableAutoRestart(XTopk_sort *InstancePtr);
void XTopk_sort_DisableAutoRestart(XTopk_sort *InstancePtr);


void XTopk_sort_InterruptGlobalEnable(XTopk_sort *InstancePtr);
void XTopk_sort_InterruptGlobalDisable(XTopk_sort *InstancePtr);
void XTopk_sort_InterruptEnable(XTopk_sort *InstancePtr, u32 Mask);
void XTopk_sort_InterruptDisable(XTopk_sort *InstancePtr, u32 Mask);
void XTopk_sort_InterruptClear(XTopk_sort *InstancePtr, u32 Mask);
u32 XTopk_sort_InterruptGetEnabled(XTopk_sort *InstancePtr);
u32 XTopk_sort_InterruptGetStatus(XTopk_sort *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif

// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xtopk_sort.h"

extern XTopk_sort_Config XTopk_sort_ConfigTable[];

XTopk_sort_Config *XTopk_sort_LookupConfig(u16 DeviceId) {
	XTopk_sort_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XTOPK_SORT_NUM_INSTANCES; Index++) {
		if (XTopk_sort_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XTopk_sort_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XTopk_sort_Initialize(XTopk_sort *InstancePtr, u16 DeviceId) {
	XTopk_sort_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XTopk_sort_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XTopk_sort_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif


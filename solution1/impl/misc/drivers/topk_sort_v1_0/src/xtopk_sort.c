// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xtopk_sort.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XTopk_sort_CfgInitialize(XTopk_sort *InstancePtr, XTopk_sort_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_bus_BaseAddress = ConfigPtr->Control_bus_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XTopk_sort_Start(XTopk_sort *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTopk_sort_ReadReg(InstancePtr->Control_bus_BaseAddress, XTOPK_SORT_CONTROL_BUS_ADDR_AP_CTRL) & 0x80;
    XTopk_sort_WriteReg(InstancePtr->Control_bus_BaseAddress, XTOPK_SORT_CONTROL_BUS_ADDR_AP_CTRL, Data | 0x01);
}

u32 XTopk_sort_IsDone(XTopk_sort *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTopk_sort_ReadReg(InstancePtr->Control_bus_BaseAddress, XTOPK_SORT_CONTROL_BUS_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XTopk_sort_IsIdle(XTopk_sort *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTopk_sort_ReadReg(InstancePtr->Control_bus_BaseAddress, XTOPK_SORT_CONTROL_BUS_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XTopk_sort_IsReady(XTopk_sort *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTopk_sort_ReadReg(InstancePtr->Control_bus_BaseAddress, XTOPK_SORT_CONTROL_BUS_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XTopk_sort_EnableAutoRestart(XTopk_sort *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTopk_sort_WriteReg(InstancePtr->Control_bus_BaseAddress, XTOPK_SORT_CONTROL_BUS_ADDR_AP_CTRL, 0x80);
}

void XTopk_sort_DisableAutoRestart(XTopk_sort *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTopk_sort_WriteReg(InstancePtr->Control_bus_BaseAddress, XTOPK_SORT_CONTROL_BUS_ADDR_AP_CTRL, 0);
}

void XTopk_sort_InterruptGlobalEnable(XTopk_sort *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTopk_sort_WriteReg(InstancePtr->Control_bus_BaseAddress, XTOPK_SORT_CONTROL_BUS_ADDR_GIE, 1);
}

void XTopk_sort_InterruptGlobalDisable(XTopk_sort *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTopk_sort_WriteReg(InstancePtr->Control_bus_BaseAddress, XTOPK_SORT_CONTROL_BUS_ADDR_GIE, 0);
}

void XTopk_sort_InterruptEnable(XTopk_sort *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XTopk_sort_ReadReg(InstancePtr->Control_bus_BaseAddress, XTOPK_SORT_CONTROL_BUS_ADDR_IER);
    XTopk_sort_WriteReg(InstancePtr->Control_bus_BaseAddress, XTOPK_SORT_CONTROL_BUS_ADDR_IER, Register | Mask);
}

void XTopk_sort_InterruptDisable(XTopk_sort *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XTopk_sort_ReadReg(InstancePtr->Control_bus_BaseAddress, XTOPK_SORT_CONTROL_BUS_ADDR_IER);
    XTopk_sort_WriteReg(InstancePtr->Control_bus_BaseAddress, XTOPK_SORT_CONTROL_BUS_ADDR_IER, Register & (~Mask));
}

void XTopk_sort_InterruptClear(XTopk_sort *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    //XTopk_sort_WriteReg(InstancePtr->Control_bus_BaseAddress, XTOPK_SORT_CONTROL_BUS_ADDR_ISR, Mask);
}

u32 XTopk_sort_InterruptGetEnabled(XTopk_sort *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XTopk_sort_ReadReg(InstancePtr->Control_bus_BaseAddress, XTOPK_SORT_CONTROL_BUS_ADDR_IER);
}

u32 XTopk_sort_InterruptGetStatus(XTopk_sort *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    // Current Interrupt Clear Behavior is Clear on Read(COR).
    return XTopk_sort_ReadReg(InstancePtr->Control_bus_BaseAddress, XTOPK_SORT_CONTROL_BUS_ADDR_ISR);
}


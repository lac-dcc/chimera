//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2011, VIPcore Group, Fudan University
//
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group
//
//  VIPcore       : http://soc.fudan.edu.cn/vip
//  IP Owner 	  : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn
//-------------------------------------------------------------------
// Filename       : enc_defines.v
// Author         : Yibo FAN
// Created        : 2013-12-24
// Description    : H265 Encoder Defines
//
// $Id$
//-------------------------------------------------------------------
//synopsys translate_off
`timescale 1ns/100ps
//synopsys translate_on

// Simulation Model
`define RTL_MODEL

// LCU Size
`define LCU_SIZE 64

// CU DEPTH. 0: LCU, 1:LCU/2, 2:LCU/4, 3:LCU/8
`define CU_DEPTH 3
//---------------------------------------
//       Data Width Definition
//---------------------------------------
// PIC SIZE Width
`define PIC_X_WIDTH 8
`define PIC_Y_WIDTH 8
`define PIC_LCU_WID (`PIC_Y_WIDTH+`PIC_X_WIDTH)
// Pixel Width
`define PIXEL_WIDTH 8
// DCT Coefficient Width
`define COEFF_WIDTH (`PIXEL_WIDTH+8)
// MV Width
`define IMV_WIDTH 8
`define FMV_WIDTH 10
`define MVD_WIDTH 11










`define INIT_QP 22

//the length of inter_type
`define INTER_TYPE_LEN       2
//MB partition mode
`define PART_2NX2N           0
`define PART_2NXN            1
`define PART_NX2N            2
`define PART_SPLIT           3


`define B8X8_SIZE     64
`define B8X16_SIZE   128
`define B16X8_SIZE   128
`define B16X16_SIZE  256
`define B32X16_SIZE  512
`define B16X32_SIZE  512
`define B32X32_SIZE 1024
`define B64X32_SIZE 2048
`define B32X64_SIZE 2048
`define B64X64_SIZE 4096



//----------------------FME------------------------
`define BLK4X4_NUM      `LCU_SIZE/`B4X4_SIZE
`define BLK8X8_NUM      `LCU_SIZE/`B8X8_SIZE
`define BLK16x16_NUM    `LCU_SIZE/`B16X16_SIZE
`define BLK32X32_NUM    `LCU_SIZE/`B32X32_SIZE
`define BLK64x64_NUM    `LCU_SIZE/`B64X64_SIZE

`define INTER_CU_INFO_LEN   170

//SLICE TYPE
`define	SLICE_TYPE_I	1
`define	SLICE_TYPE_P	0



//scan mode, when encode residual coefficient
`define SCAN_DIAG		0
`define SCAN_HOR		1
`define SCAN_VER		2

`define SAO_OPEN                0
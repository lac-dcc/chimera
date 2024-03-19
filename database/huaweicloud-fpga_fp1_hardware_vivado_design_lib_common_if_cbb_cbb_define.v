//
//------------------------------------------------------------------------------
//     Copyright (c) 2017 Huawei Technologies Co., Ltd. All Rights Reserved.
//
//     This program is free software; you can redistribute it and/or modify
//     it under the terms of the Huawei Software License (the "License").
//     A copy of the License is located in the "LICENSE" file accompanying 
//     this file.
//
//     This program is distributed in the hope that it will be useful,
//     but WITHOUT ANY WARRANTY; without even the implied warranty of
//     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
//     Huawei Software License for more details. 
//------------------------------------------------------------------------------


`define FIFO_PARITY    "TRUE"       //"TRUE" or "FALSE". "TRUE"-FIFO support even parity,"FALSE"-no parity 
`define PARITY_DLY     "FALSE"      //"TRUE" or "FALSE". "TRUE"-FIFO output data bypassed,and delay 1 cycle to make parity,"FALSE" no delay.

//`define ALTERA_FPGA
`ifndef ALTERA_FPGA
    `define XILINX_FPGA
`endif
    
//Altera
//Device:Stratix V,IV,III,II GX;Cyclone V,IV GX,III,II;Arria V,II GX,GX;
//BRAM_TYPE: M9K,M20K,M144K,MLAB

//Xilinx
//Device: 7SERIES , SPARTAN6 , 
//BRAM_TYPE: 7SERIES (18Kb ,36Kb) , SPARTAN6 (9Kb , 18Kb)
`ifdef ALTERA_FPGA
//Altera
`define		VENDER_ID	"Altera"		//Altera or Xilinx or Lattice
`define		DEVICE_ID	"Stratix IV"
`define		BRAM_TYPE	"M9K"	        //"M9K" or "MLAB"

`else
//Xilinx
`define		VENDER_ID	"Xilinx"		//Altera or Xilinx or Lattice
`define		DEVICE_ID	"7SERIES"
`define		BRAM_TYPE	"18Kb"	        //"18Kb" or "MLAB"

`endif

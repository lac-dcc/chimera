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


//ALTERA or XILINX
`define       COMPANY               "XILINX"

//chip type,make sure it fit the chip
//for XILINX,"7SERIES" "SPARTAN6" "VIRTEX6" "VIRTEX5",VIRTEX7 belongs to 7SERIES
//for ALTERA,"Arria II GX" "Cyclone III" "Cyclone IV GX" "Arria V" "Stratix IV" "Stratix V"
//if using other type,please contact FAE
`define	    	DEVICE_MODE           "7SERIES"

//blockram type,make sure the chip support
//for XILINX, "36Kb" "18Kb" "9Kb",suggest 36Kb
//for ALTERA, "Auto" "M144K" "M20K" "M10K" "M9K"
`define	    	BLKRAM_TYPE           "18Kb"

//output register pipe
`define	    	RAM_OUT_REG           1

//single port collision mode,for altera only
//diffrent mem type has different scope,please check ram user guide or MegaWizard
//for example M20K,"NEW_DATA_NO_NBE_READ"...
`define	    	R_W_TYPE              "NEW_DATA_NO_NBE_READ"

//blockram mix port collision mode,
//for XILINX, "WRITE_FIRST" "READ_FIRST" "NO_CHANGE",same as single port collision mode
//for ALTERA,
//diffrent mem type has different scope,please check ram user guide or MegaWizard
//for example M20K,"OLD_DATA" "DONT_CARE"
`define	    	RW_TYPE_B_MIX         "WRITE_FIRST"

//ALTERA distribute ram mix port collision mode,
//different mem type has different scope,please check ram user guide or MegaWizard
//for example MLAB,"CONSTRAINED_DONT_CARE" "OLD_DATA" "NEW_DATA"
//suggest to use default,so do not open interface

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


`resetall
`include "./../ram_def/ram_def.v"

// synopsys translate_off
`timescale 1ns/1ns
// synopsys translate_on

module sdpramb_dclk
    #(
    parameter       COMPANY                 = `COMPANY,             //ALTERA or XILINX
    parameter       DEVICE_MODE             = `DEVICE_MODE,         //"Stratix V" ..
    parameter       RAM_TYPE                = `BLKRAM_TYPE,         //"M20K" or "36Kb"
    parameter       WRITE_WIDTH             = 8,                    //WRITE_DATA WIDTH
    parameter       WRITE_DEPTHBIT          = 10,                   //WRITE_RAM ADDR WIDTH
    parameter       READ_WIDTH              = 8,                    //READ_DATA WIDTH
    parameter       READ_DEPTHBIT           = 10,                   //WRITE_RAM ADDR WIDTH
    parameter       RAM_OUT_REG             = `RAM_OUT_REG          //OUTPUT NOT REGISTER,1 is register
    )
    (
    input   wire                            wrclock,                //
    input   wire                            wrclocken,              //
    input   wire                            wren,                   //
    input   wire    [WRITE_DEPTHBIT-1:0]    wraddress,              //
    input   wire    [WRITE_WIDTH-1:0]       data,                   //
    input   wire                            rdclock,                //
    input   wire                            rdclocken,              //
    input   wire    [READ_DEPTHBIT-1:0]     rdaddress,              //
    output  wire    [READ_WIDTH-1:0]        q                       //
    );

/**********************************************************************************************************************\
    parameters declaration
\**********************************************************************************************************************/
//localparam  U_DLY               = 1;                            //unit delay parameter

/**********************************************************************************************************************\
    variables type declaration
\**********************************************************************************************************************/

/**********************************************************************************************************************\
    main code
\**********************************************************************************************************************/
generate
    if ( COMPANY == "ALTERA" )
    begin
        altera_sdpramb_dclk
        #(
        .DEVICE_MODE                ( DEVICE_MODE               ),
        .RAM_TYPE                   ( RAM_TYPE                  ),
        .WRITE_WIDTH                ( WRITE_WIDTH               ),
        .WRITE_DEPTHBIT             ( WRITE_DEPTHBIT            ),
        .READ_WIDTH                 ( READ_WIDTH                ),
        .READ_DEPTHBIT              ( READ_DEPTHBIT             ),
        .RAM_OUT_REG                ( RAM_OUT_REG               )
        ) u0_altera_sdpramb_dclk
        (
        .wrclock                    ( wrclock                   ),
        .wrclocken                  ( 1'b1                      ),
        .wren                       ( wren                      ),
        .wraddress                  ( wraddress                 ),
        .data                       ( data                      ),
        .rdclock                    ( rdclock                   ),
        .rdclocken                  ( 1'b1                      ),
        .rdaddress                  ( rdaddress                 ),
        .q                          ( q                         )
        );
    end
    else if ( COMPANY == "XILINX" )
    begin
        xilinx_sdpramb_dclk
        #(
        .DEVICE_MODE                ( DEVICE_MODE               ),
        .RAM_TYPE                   ( RAM_TYPE                  ),
        .WRITE_WIDTH                ( WRITE_WIDTH               ),
        .WRITE_DEPTHBIT             ( WRITE_DEPTHBIT            ),
        .READ_WIDTH                 ( READ_WIDTH                ),
        .READ_DEPTHBIT              ( READ_DEPTHBIT             ),
        .RAM_OUT_REG                ( RAM_OUT_REG               )
        ) u0_xilinx_sdpramb_dclk
        (
        .wrclock                    ( wrclock                   ),
        .wrclocken                  ( wrclocken                 ),
        .wren                       ( wren                      ),
        .wraddress                  ( wraddress                 ),
        .data                       ( data                      ),
        .rdclock                    ( rdclock                   ),
        .rdclocken                  ( rdclocken                 ),
        .rdaddress                  ( rdaddress                 ),
        .q                          ( q                         )
    );
    end
    else if ( COMPANY == "LATTICE" )
    begin

    end
endgenerate

endmodule

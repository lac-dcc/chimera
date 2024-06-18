// This program was cloned from: https://github.com/AUDIY/AUDIY_Verilog_IP
// License: CERN Open Hardware Licence Version 2 - Permissive

/*----------------------------------------------------------------------------
* SDPRAM_SINGLECLK.v
*
* Simple Dual-Port RAM (Single Clock)
*
* Version: 0.11
* Author : AUDIY
* Date   : 2024/2/22
*
* Port
*   Input
*       CLK_I        : RAM Write/Read Clock Input
*       WADDR_I      : Write Address Input
*       WENABLE_I    : Write Enable Input
*       WDATA_I      : Stored Data Input
*       RADDR_I      : Read Address Input
*       RENABLE_I    : Read Enable Input
*
*   Output
*       RDATA_O      : Stored Data Output
*
*   Parameter
*       DATA_WIDTH   : DATA Bit Width
*       ADDR_WIDTH   : ROM Address Width
*       OUTPUT_REG   : Output Register Enable
*       RAM_INIT_FILE: RAM Initialization File
*
* License under CERN-OHL-P v2
--------------------------------------------------------------------------------
| Copyright AUDIY 2023 - 2024.                                                 |
|                                                                              |
| This source describes Open Hardware and is licensed under the CERN-OHL-P v2. |
|                                                                              |
| You may redistribute and modify this source and make products using it under |
| the terms of the CERN-OHL-P v2 (https:/cern.ch/cern-ohl).                    |
|                                                                              |
| This source is distributed WITHOUT ANY EXPRESS OR IMPLIED WARRANTY,          |
| INCLUDING OF MERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A         |
| PARTICULAR PURPOSE. Please see the CERN-OHL-P v2 for applicable conditions.  |
--------------------------------------------------------------------------------
*
-----------------------------------------------------------------------------*/

module SDPRAM_SINGLECLK #(
    /* Parameter Definition */
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 9,
    parameter OUTPUT_REG = "TRUE",
    parameter RAM_INIT_FILE = "RAMINIT.hex"
) (
    /* Input Port Definiton */
    input  wire                  CLK_I,
    input  wire [ADDR_WIDTH-1:0] WADDR_I,
    input  wire                  WENABLE_I,
    input  wire [DATA_WIDTH-1:0] WDATA_I,
    input  wire [ADDR_WIDTH-1:0] RADDR_I,
    input  wire                  RENABLE_I,

    /* Output Port Definition */
    output wire [DATA_WIDTH-1:0] RDATA_O
);

    /* Local Parameters */
    localparam MEMORY_DEPTH = 2**ADDR_WIDTH;
    //localparam MAX_DATA     = (1 << ADDR_WIDTH) - 1; // Unused now.

    /* Internal Wire/Register Definition */
    reg [DATA_WIDTH-1:0] RAM[MEMORY_DEPTH-1:0];
    reg [DATA_WIDTH-1:0] RDATA_REG_1P = {DATA_WIDTH{1'b0}};
    reg [DATA_WIDTH-1:0] RDATA_REG_2P = {DATA_WIDTH{1'b0}};
    
    /* Memory Initialization */
    initial begin
        if (RAM_INIT_FILE != "") begin
            $readmemh(RAM_INIT_FILE, RAM);
        end
    end

    /* Store Data */
    always @ (posedge CLK_I) begin
        if (WENABLE_I == 1'b1) begin
            RAM[WADDR_I] <= WDATA_I;
        end
    end
    
    /* Output Register */
    always @ (posedge CLK_I) begin
        if (RENABLE_I == 1'b1) begin
            RDATA_REG_1P <= RAM[RADDR_I];
            RDATA_REG_2P <= RDATA_REG_1P;
        end
    end

    /* Output */
    generate
        if (OUTPUT_REG == "TRUE") begin : gen_reg2p
            assign RDATA_O = RDATA_REG_2P;
        end else begin : gen_reg1p
            assign RDATA_O = RDATA_REG_1P;
        end
    endgenerate

endmodule

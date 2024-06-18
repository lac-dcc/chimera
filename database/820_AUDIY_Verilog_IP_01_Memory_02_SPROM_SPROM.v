// This program was cloned from: https://github.com/AUDIY/AUDIY_Verilog_IP
// License: CERN Open Hardware Licence Version 2 - Permissive

/*----------------------------------------------------------------------------
* SPROM.v
*
* Single-Port ROM
*
* Version: 0.11
* Author : AUDIY
* Date   : 2022/2/28
*
* Port
*   Input
*       CLK_I        : RAM Write/Read Clock Input
*       RADDR_I      : Read Address Input
*
*   Output
*       RDATA_O      : Stored Data Output
*
*   Parameter
*       DATA_WIDTH   : Stored DATA Width
*       ADDR_WIDTH   : ROM Address Width
*       OUTPUT_REG   : Output Register Enable
*       ROM_INIT_FILE: ROM Initialization File name
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

module SPROM #(
    /* Parameter Definition */
    parameter DATA_WIDTH = 16,
	parameter ADDR_WIDTH = 8,
	parameter OUTPUT_REG = "TRUE",
	parameter ROM_INIT_FILE = "initrom.hex"
) (
    /* Input Port Definition */
    input  wire                  CLK_I,
    input  wire [ADDR_WIDTH-1:0] RADDR_I,

    /* Output Port Definition */
    output wire [DATA_WIDTH-1:0] RDATA_O
);

    /* Local Parameter Definition */
    localparam MEMORY_DEPTH = 2**ADDR_WIDTH;

    /* Internal Wire/Register Definition */
    reg [DATA_WIDTH-1:0] RDATAO_REG_1P = {DATA_WIDTH{1'b0}};
    reg [DATA_WIDTH-1:0] RDATAO_REG_2P = {DATA_WIDTH{1'b0}};
    reg [DATA_WIDTH-1:0] ROM[MEMORY_DEPTH-1:0];

    /* Memory Initialization */
    initial begin
        $readmemh(ROM_INIT_FILE, ROM);
    end

    /* Output Register */
    always @ (posedge CLK_I) begin
        RDATAO_REG_1P <= ROM[RADDR_I];
        RDATAO_REG_2P <= RDATAO_REG_1P;
    end

    /* Output */
    generate
        if (OUTPUT_REG == "TRUE") begin : gen_reg2p
            assign RDATA_O = RDATAO_REG_2P;
        end else begin : gen_reg1p
            assign RDATA_O = RDATAO_REG_1P;
        end
    endgenerate

endmodule

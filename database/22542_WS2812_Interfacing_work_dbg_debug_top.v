// This program was cloned from: https://github.com/Mr-Kaushal-22/WS2812_Interfacing
// License: MIT License

///////////////////////////////////////////////////////////////////////////////
//
// Auto-generated Efinix JTAG debugger top module. Do not modify. 
//

//`include "dbg_defines.v"
`define DR_WIDTH 82


module edb_top (
    // debug core ports
    input  bscan_CAPTURE,
    input  bscan_DRCK,
    input  bscan_RESET,
    input  bscan_RUNTEST,
    input  bscan_SEL,
    input  bscan_SHIFT,
    input  bscan_TCK,
    input  bscan_TDI,
    input  bscan_TMS,
    input  bscan_UPDATE,
    output bscan_TDO,
    input  la0_clk,
    input  [7:0] la0_probe0,
    input  la0_probe1,
    input  la0_probe2,
    input  [19:0] la0_probe3,
    input  [23:0] la0_probe4,
    input  la0_probe5,
    input  [23:0] la0_probe6,
    input  [7:0] la0_probe7,
    input  la0_probe8,
    input  [19:0] la0_probe9,
    input  [3:0] la0_probe10,
    input  la0_probe11,
    input  [3:0] la0_probe12,
    input  la0_probe13,
    input  [7:0] la0_probe14,
    input  [10:0] la0_probe15,
    input  la0_probe16,
    input  la0_probe17,
    input  [23:0] la0_probe18,
    input  [31:0] la0_probe19,
    input  la0_probe20,
    input  [10:0] la0_probe21,
    input  [23:0] la0_probe22,
    input  [4:0] la0_probe23,
    input  [10:0] la0_probe24,
    input  [3:0] la0_probe25,
    input  [11:0] la0_probe26,
    input  [19:0] la0_probe27,
    input  la0_probe28,
    input  [11:0] la0_probe29,
    input  [7:0] la0_probe30,
    input  [19:0] la0_probe31
);

    localparam HUB_CS_WIDTH = 15;

    wire [HUB_CS_WIDTH-1:0] edb_module_selects;
    wire [HUB_CS_WIDTH-1:0] edb_module_inhibit;
    wire [HUB_CS_WIDTH-1:0] edb_module_tdo;
    wire    [`DR_WIDTH-1:0] edb_user_dr;

    // debug core connections
    wire la0_module_select;
    wire la0_module_inhibit;
    wire la0_module_tdo;

    assign la0_module_select        = edb_module_selects[0];
    assign edb_module_inhibit[0]    = la0_module_inhibit;
    assign edb_module_tdo[0]        = la0_module_tdo;
    assign edb_module_inhibit[1]    = 1'b0;
    assign edb_module_tdo[1]        = 1'b0;
    assign edb_module_inhibit[2]    = 1'b0;
    assign edb_module_tdo[2]        = 1'b0;
    assign edb_module_inhibit[3]    = 1'b0;
    assign edb_module_tdo[3]        = 1'b0;
    assign edb_module_inhibit[4]    = 1'b0;
    assign edb_module_tdo[4]        = 1'b0;
    assign edb_module_inhibit[5]    = 1'b0;
    assign edb_module_tdo[5]        = 1'b0;
    assign edb_module_inhibit[6]    = 1'b0;
    assign edb_module_tdo[6]        = 1'b0;
    assign edb_module_inhibit[7]    = 1'b0;
    assign edb_module_tdo[7]        = 1'b0;
    assign edb_module_inhibit[8]    = 1'b0;
    assign edb_module_tdo[8]        = 1'b0;
    assign edb_module_inhibit[9]    = 1'b0;
    assign edb_module_tdo[9]        = 1'b0;
    assign edb_module_inhibit[10]   = 1'b0;
    assign edb_module_tdo[10]       = 1'b0;
    assign edb_module_inhibit[11]   = 1'b0;
    assign edb_module_tdo[11]       = 1'b0;
    assign edb_module_inhibit[12]   = 1'b0;
    assign edb_module_tdo[12]       = 1'b0;
    assign edb_module_inhibit[13]   = 1'b0;
    assign edb_module_tdo[13]       = 1'b0;
    assign edb_module_inhibit[14]   = 1'b0;
    assign edb_module_tdo[14]       = 1'b0;

    // debug core instances
    edb_la_top #(
        .NUM_PROBES         ( 32 ),
        .DATA_DEPTH         ( 8192 ),
        .TRIGIN_EN          ( 0 ),
        .TRIGOUT_EN         ( 0 ),
        .INPUT_PIPE_STAGES      ( 1 ),
        .CAPTURE_CONTROL    ( 0 ),
        .UUID   ( 128'heb549f15f00e452280114d708b2b650b ),
        .CNDTNL_STRG_EN     ( 0 ),
        .PROBE0_WIDTH       ( 8 ),
        .PROBE0_TYPE        ( 1 ),
        .PROBE1_WIDTH       ( 1 ),
        .PROBE1_TYPE        ( 1 ),
        .PROBE2_WIDTH       ( 1 ),
        .PROBE2_TYPE        ( 1 ),
        .PROBE3_WIDTH       ( 20 ),
        .PROBE3_TYPE        ( 1 ),
        .PROBE4_WIDTH       ( 24 ),
        .PROBE4_TYPE        ( 1 ),
        .PROBE5_WIDTH       ( 1 ),
        .PROBE5_TYPE        ( 1 ),
        .PROBE6_WIDTH       ( 24 ),
        .PROBE6_TYPE        ( 1 ),
        .PROBE7_WIDTH       ( 8 ),
        .PROBE7_TYPE        ( 1 ),
        .PROBE8_WIDTH       ( 1 ),
        .PROBE8_TYPE        ( 1 ),
        .PROBE9_WIDTH       ( 20 ),
        .PROBE9_TYPE        ( 1 ),
        .PROBE10_WIDTH      ( 4 ),
        .PROBE10_TYPE       ( 1 ),
        .PROBE11_WIDTH      ( 1 ),
        .PROBE11_TYPE       ( 1 ),
        .PROBE12_WIDTH      ( 4 ),
        .PROBE12_TYPE       ( 1 ),
        .PROBE13_WIDTH      ( 1 ),
        .PROBE13_TYPE       ( 1 ),
        .PROBE14_WIDTH      ( 8 ),
        .PROBE14_TYPE       ( 1 ),
        .PROBE15_WIDTH      ( 11 ),
        .PROBE15_TYPE       ( 1 ),
        .PROBE16_WIDTH      ( 1 ),
        .PROBE16_TYPE       ( 1 ),
        .PROBE17_WIDTH      ( 1 ),
        .PROBE17_TYPE       ( 1 ),
        .PROBE18_WIDTH      ( 24 ),
        .PROBE18_TYPE       ( 1 ),
        .PROBE19_WIDTH      ( 32 ),
        .PROBE19_TYPE       ( 1 ),
        .PROBE20_WIDTH      ( 1 ),
        .PROBE20_TYPE       ( 1 ),
        .PROBE21_WIDTH      ( 11 ),
        .PROBE21_TYPE       ( 1 ),
        .PROBE22_WIDTH      ( 24 ),
        .PROBE22_TYPE       ( 1 ),
        .PROBE23_WIDTH      ( 5 ),
        .PROBE23_TYPE       ( 1 ),
        .PROBE24_WIDTH      ( 11 ),
        .PROBE24_TYPE       ( 1 ),
        .PROBE25_WIDTH      ( 4 ),
        .PROBE25_TYPE       ( 1 ),
        .PROBE26_WIDTH      ( 12 ),
        .PROBE26_TYPE       ( 1 ),
        .PROBE27_WIDTH      ( 20 ),
        .PROBE27_TYPE       ( 1 ),
        .PROBE28_WIDTH      ( 1 ),
        .PROBE28_TYPE       ( 1 ),
        .PROBE29_WIDTH      ( 12 ),
        .PROBE29_TYPE       ( 1 ),
        .PROBE30_WIDTH      ( 8 ),
        .PROBE30_TYPE       ( 1 ),
        .PROBE31_WIDTH      ( 20 ),
        .PROBE31_TYPE       ( 1 )
    ) la0 (
        .bscan_CAPTURE                  ( bscan_CAPTURE ),
        .bscan_DRCK                     ( bscan_DRCK ),
        .bscan_RESET                    ( bscan_RESET ),
        .bscan_RUNTEST                  ( bscan_RUNTEST ),
        .bscan_SEL                      ( bscan_SEL ),
        .bscan_SHIFT                    ( bscan_SHIFT ),
        .bscan_TCK                      ( bscan_TCK ),
        .bscan_TDI                      ( bscan_TDI ),
        .bscan_TMS                      ( bscan_TMS ),
        .bscan_UPDATE                   ( bscan_UPDATE ),
        .edb_user_dr            ( edb_user_dr ),
        .edb_module_select      ( la0_module_select  ),
        .edb_module_inhibit     ( la0_module_inhibit ),
        .edb_module_tdo         ( la0_module_tdo ),
        .clk                    ( la0_clk ),
        .trig_in                ( 1'b0 ),
        .trig_in_ack            (  ),
        .trig_out               (  ),
        .trig_out_ack           ( 1'b0 ),
        .probe0                 ( la0_probe0 ),
        .probe1                 ( la0_probe1 ),
        .probe2                 ( la0_probe2 ),
        .probe3                 ( la0_probe3 ),
        .probe4                 ( la0_probe4 ),
        .probe5                 ( la0_probe5 ),
        .probe6                 ( la0_probe6 ),
        .probe7                 ( la0_probe7 ),
        .probe8                 ( la0_probe8 ),
        .probe9                 ( la0_probe9 ),
        .probe10                    ( la0_probe10 ),
        .probe11                    ( la0_probe11 ),
        .probe12                    ( la0_probe12 ),
        .probe13                    ( la0_probe13 ),
        .probe14                    ( la0_probe14 ),
        .probe15                    ( la0_probe15 ),
        .probe16                    ( la0_probe16 ),
        .probe17                    ( la0_probe17 ),
        .probe18                    ( la0_probe18 ),
        .probe19                    ( la0_probe19 ),
        .probe20                    ( la0_probe20 ),
        .probe21                    ( la0_probe21 ),
        .probe22                    ( la0_probe22 ),
        .probe23                    ( la0_probe23 ),
        .probe24                    ( la0_probe24 ),
        .probe25                    ( la0_probe25 ),
        .probe26                    ( la0_probe26 ),
        .probe27                    ( la0_probe27 ),
        .probe28                    ( la0_probe28 ),
        .probe29                    ( la0_probe29 ),
        .probe30                    ( la0_probe30 ),
        .probe31                    ( la0_probe31 )
    );

    debug_hub debug_hub_inst (
		.bscan_CAPTURE          ( bscan_CAPTURE ),
		.bscan_DRCK             ( bscan_DRCK ),
		.bscan_RESET            ( bscan_RESET ),
		.bscan_RUNTEST          ( bscan_RUNTEST ),
		.bscan_SEL              ( bscan_SEL ),
		.bscan_SHIFT            ( bscan_SHIFT ),
		.bscan_TCK              ( bscan_TCK ),
		.bscan_TDI              ( bscan_TDI ),
		.bscan_TMS              ( bscan_TMS ),
		.bscan_UPDATE           ( bscan_UPDATE ),
		.bscan_TDO              ( bscan_TDO ),
        .edb_module_selects ( edb_module_selects ),
        .edb_module_inhibit ( edb_module_inhibit ),
        .edb_module_tdo     ( edb_module_tdo     ),
        .edb_user_dr        ( edb_user_dr )
    );

endmodule


//////////////////////////////////////////////////////////////////////
// File:  CRC32.v                             
// Date:  Thu Nov 27 13:56:49 2003                                                      
//                                                                     
// Copyright (C) 1999-2003 Easics NV.                 
// This source file may be used and distributed without restriction    
// provided that this copyright statement is not removed from the file 
// and that any derivative work contains the original copyright notice
// and the associated disclaimer.
//
// THIS SOURCE FILE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS
// OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
// WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
//
// Purpose: Verilog module containing a synthesizable CRC function
//   * polynomial: (0 1 2 4 5 7 8 10 11 12 16 22 23 26 32)
//   * data width: 1
//                                                                     
// Info: janz@easics.be (Jan Zegers)                           
//       http://www.easics.com
//
// Modified by Nathan Yawn for the Advanced Debug Module
// Changes (C) 2008 - 2010 Nathan Yawn                                 
///////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: adbg_crc32.v,v $
// Revision 1.3  2011-10-24 02:25:11  natey
// Removed extraneous '#1' delays, which were a holdover from the original
// versions in the previous dbg_if core.
//
// Revision 1.2  2010-01-10 22:54:10  Nathan
// Update copyright dates
//
// Revision 1.1  2008/07/22 20:28:29  Nathan
// Changed names of all files and modules (prefixed an a, for advanced).  Cleanup, indenting.  No functional changes.
//
// Revision 1.3  2008/07/06 20:02:53  Nathan
// Fixes for synthesis with Xilinx ISE (also synthesizable with 
// Quartus II 7.0).  Ran through dos2unix.
//
// Revision 1.2  2008/06/20 19:22:10  Nathan
// Reversed the direction of the CRC computation shift, for a more 
// hardware-efficient implementation.
//
//
//
//


module edb_adbg_crc32 (clk, data, enable, shift, clr, rstn, crc_out, serial_out);
    input         clk;
    input         data;
    input         enable;
    input         shift;
    input         clr;
    input         rstn;
    output [31:0] crc_out;
    output        serial_out;

    reg    [31:0] crc;
    wire   [31:0] new_crc;

    // You may notice that the 'poly' in this implementation is backwards.
    // This is because the shift is also 'backwards', so that the data can
    // be shifted out in the same direction, which saves on logic + routing.
    assign new_crc[0] = crc[1];
    assign new_crc[1] = crc[2];
    assign new_crc[2] = crc[3];
    assign new_crc[3] = crc[4];
    assign new_crc[4] = crc[5];
    assign new_crc[5] = crc[6] ^ data ^ crc[0];
    assign new_crc[6] = crc[7];
    assign new_crc[7] = crc[8];
    assign new_crc[8] = crc[9] ^ data ^ crc[0];
    assign new_crc[9] = crc[10] ^ data ^ crc[0];
    assign new_crc[10] = crc[11];
    assign new_crc[11] = crc[12];
    assign new_crc[12] = crc[13];
    assign new_crc[13] = crc[14];
    assign new_crc[14] = crc[15];
    assign new_crc[15] = crc[16] ^ data ^ crc[0];
    assign new_crc[16] = crc[17];
    assign new_crc[17] = crc[18];
    assign new_crc[18] = crc[19];
    assign new_crc[19] = crc[20] ^ data ^ crc[0];
    assign new_crc[20] = crc[21] ^ data ^ crc[0];
    assign new_crc[21] = crc[22] ^ data ^ crc[0];
    assign new_crc[22] = crc[23];
    assign new_crc[23] = crc[24] ^ data ^ crc[0];
    assign new_crc[24] = crc[25] ^ data ^ crc[0];
    assign new_crc[25] = crc[26];
    assign new_crc[26] = crc[27] ^ data ^ crc[0];
    assign new_crc[27] = crc[28] ^ data ^ crc[0];
    assign new_crc[28] = crc[29];
    assign new_crc[29] = crc[30] ^ data ^ crc[0];
    assign new_crc[30] = crc[31] ^ data ^ crc[0];
    assign new_crc[31] =           data ^ crc[0];

    always @ (posedge clk or negedge rstn)
    begin
        if(~rstn)
            crc[31:0] <= 32'hffffffff;
        else if(clr)
            crc[31:0] <= 32'hffffffff;
        else if(enable)
            crc[31:0] <= new_crc;
        else if (shift)
            crc[31:0] <= {1'b0, crc[31:1]};
    end

    //assign crc_match = (crc == 32'h0);
    assign crc_out = crc; //[31];
    assign serial_out = crc[0];
endmodule
// adbg_crc32


////////////////////////////////////////////////////////////////////////////////
//
// Efinix JTAG debugging debug hub core
//
// Dec 2018, samh
//

//`include "dbg_defines.v"


module debug_hub #(
    parameter ID_WIDTH = 4,
    parameter CS_WIDTH = (1<<ID_WIDTH)-1
)(
    // Xilinx BSCANE2-compatible interface
    input  bscan_CAPTURE,
    input  bscan_DRCK,
    input  bscan_RESET,
    input  bscan_RUNTEST,
    input  bscan_SEL,
    input  bscan_SHIFT,
    input  bscan_TCK,
    input  bscan_TDI,
    input  bscan_TMS,
    input  bscan_UPDATE,
    output bscan_TDO,

    // adv_dbg_if interface used in PULPino, from OpenCores
    output [CS_WIDTH-1:0]   edb_module_selects,
    input  [CS_WIDTH-1:0]   edb_module_inhibit,
    input  [CS_WIDTH-1:0]   edb_module_tdo,
    output [`DR_WIDTH-1:0]  edb_user_dr
);

    reg  [`DR_WIDTH-1:0]        shift_reg;
    wire                        hub_select;
    wire [ID_WIDTH-1:0]         module_id_in;
    reg  [ID_WIDTH-1:0]         module_id_reg;
    wire [ID_WIDTH-1:0]         module_id_sub1;
    wire                        select_inhibit;
    reg  [CS_WIDTH-1:0]         module_selects;
    //reg                         tdo_mux;
    wire [(1<<ID_WIDTH)-1:0]    module_tdo_pwr2;

    assign hub_select   = shift_reg[`DR_WIDTH-1];
    assign module_id_in = shift_reg[`DR_WIDTH-2 -: ID_WIDTH];
    assign edb_user_dr  = shift_reg;

    assign select_inhibit = | edb_module_inhibit;

    always @(posedge bscan_TCK or posedge bscan_RESET) begin
        if (bscan_RESET)
            shift_reg <= {`DR_WIDTH{1'b0}};
        else if (bscan_SEL && bscan_SHIFT)
            shift_reg <= {bscan_TDI, shift_reg[`DR_WIDTH-1:1]};
    end

    always @(posedge bscan_TCK or posedge bscan_RESET) begin
        if (bscan_RESET)
            module_id_reg <= {ID_WIDTH{1'b0}};
        else if (bscan_SEL && hub_select && bscan_UPDATE && !select_inhibit)
            module_id_reg <= module_id_in;
    end

    // one-hot select from id
    genvar i;
    generate
        for (i = 0; i < CS_WIDTH; i = i + 1) begin
            always @(*) begin
                if (module_id_reg == i + 1) // check 4-bit id against 1~15
                    module_selects[i] <= 1'b1;
                else
                    module_selects[i] <= 1'b0;
            end
        end
    endgenerate

    assign edb_module_selects = module_selects;

    // valid id 1~15, sub1 0~14
    // id 0 underflow, becomes 15
    assign module_id_sub1 = module_id_reg - 1'b1; 
    assign module_tdo_pwr2 = {1'b0, edb_module_tdo}; // 1'b0 for id 15
    assign bscan_TDO = module_tdo_pwr2[module_id_sub1];

endmodule
// EFX_DBG_HUB

//////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2013-2019 Efinix Inc. All rights reserved.
//
// This   document  contains  proprietary information  which   is
// protected by  copyright. All rights  are reserved.  This notice
// refers to original work by Efinix, Inc. which may be derivitive
// of other work distributed under license of the authors.  In the
// case of derivative work, nothing in this notice overrides the
// original author's license agreement.  Where applicable, the 
// original license agreement is included in it's original 
// unmodified form immediately below this header.
//
// WARRANTY DISCLAIMER.  
//     THE  DESIGN, CODE, OR INFORMATION ARE PROVIDED “AS IS” AND 
//     EFINIX MAKES NO WARRANTIES, EXPRESS OR IMPLIED WITH 
//     RESPECT THERETO, AND EXPRESSLY DISCLAIMS ANY IMPLIED WARRANTIES, 
//     INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF 
//     MERCHANTABILITY, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR 
//     PURPOSE.  SOME STATES DO NOT ALLOW EXCLUSIONS OF AN IMPLIED 
//     WARRANTY, SO THIS DISCLAIMER MAY NOT APPLY TO LICENSEE.
//
// LIMITATION OF LIABILITY.  
//     NOTWITHSTANDING ANYTHING TO THE CONTRARY, EXCEPT FOR BODILY 
//     INJURY, EFINIX SHALL NOT BE LIABLE WITH RESPECT TO ANY SUBJECT 
//     MATTER OF THIS AGREEMENT UNDER TORT, CONTRACT, STRICT LIABILITY 
//     OR ANY OTHER LEGAL OR EQUITABLE THEORY (I) FOR ANY INDIRECT, 
//     SPECIAL, INCIDENTAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES OF ANY 
//     CHARACTER INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF 
//     GOODWILL, DATA OR PROFIT, WORK STOPPAGE, OR COMPUTER FAILURE OR 
//     MALFUNCTION, OR IN ANY EVENT (II) FOR ANY AMOUNT IN EXCESS, IN 
//     THE AGGREGATE, OF THE FEE PAID BY LICENSEE TO EFINIX HEREUNDER 
//     (OR, IF THE FEE HAS BEEN WAIVED, $100), EVEN IF EFINIX SHALL HAVE 
//     BEEN INFORMED OF THE POSSIBILITY OF SUCH DAMAGES.  SOME STATES DO 
//     NOT ALLOW THE EXCLUSION OR LIMITATION OF INCIDENTAL OR 
//     CONSEQUENTIAL DAMAGES, SO THIS LIMITATION AND EXCLUSION MAY NOT 
//     APPLY TO LICENSEE.
//
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2013-2019 Efinix Inc. All rights reserved.
//
// Single RAM block
//
// *******************************
// Revisions:
// 0.0 Initial rev
// 0.1 Added output register
// 1.0 Finalized RTL macro
// *******************************


module edb_simple_dual_port_ram #(
    parameter DATA_WIDTH    = 8,
    parameter ADDR_WIDTH    = 9,
    parameter OUTPUT_REG    = "FALSE",
    parameter RAM_INIT_FILE = "ram_init_file.mem"
)(
    input [(DATA_WIDTH-1):0] wdata,
    input [(ADDR_WIDTH-1):0] waddr, raddr,
    input we, wclk, re, rclk,
    output [(DATA_WIDTH-1):0] rdata
);

    localparam MEMORY_DEPTH = 2**ADDR_WIDTH;
    localparam MAX_DATA = (1<<ADDR_WIDTH) - 1;

    reg [DATA_WIDTH-1:0] ram [MEMORY_DEPTH-1:0];
    reg [DATA_WIDTH-1:0] r_rdata_1P;
    reg [DATA_WIDTH-1:0] r_rdata_2P;

    initial begin
        // By default the Efinix memory will initialize to 0
        if (RAM_INIT_FILE != "") begin
            $readmemh(RAM_INIT_FILE, ram);
        end
    end
        
    always @(posedge wclk)
        if (we)
            ram[waddr] <= wdata;
        
    always @(posedge rclk) begin
        if (re)
            r_rdata_1P <= ram[raddr];
        r_rdata_2P <= r_rdata_1P;
    end

    generate
        if (OUTPUT_REG == "TRUE")
            assign  rdata = r_rdata_2P;
        else
            assign  rdata = r_rdata_1P;
    endgenerate
endmodule
// edb_simple_dual_port_ram

//////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2013-2019 Efinix Inc. All rights reserved.
//
// This   document  contains  proprietary information  which   is
// protected by  copyright. All rights  are reserved.  This notice
// refers to original work by Efinix, Inc. which may be derivitive
// of other work distributed under license of the authors.  In the
// case of derivative work, nothing in this notice overrides the
// original author's license agreement.  Where applicable, the 
// original license agreement is included in it's original 
// unmodified form immediately below this header.
//
// WARRANTY DISCLAIMER.  
//     THE  DESIGN, CODE, OR INFORMATION ARE PROVIDED “AS IS” AND 
//     EFINIX MAKES NO WARRANTIES, EXPRESS OR IMPLIED WITH 
//     RESPECT THERETO, AND EXPRESSLY DISCLAIMS ANY IMPLIED WARRANTIES, 
//     INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF 
//     MERCHANTABILITY, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR 
//     PURPOSE.  SOME STATES DO NOT ALLOW EXCLUSIONS OF AN IMPLIED 
//     WARRANTY, SO THIS DISCLAIMER MAY NOT APPLY TO LICENSEE.
//
// LIMITATION OF LIABILITY.  
//     NOTWITHSTANDING ANYTHING TO THE CONTRARY, EXCEPT FOR BODILY 
//     INJURY, EFINIX SHALL NOT BE LIABLE WITH RESPECT TO ANY SUBJECT 
//     MATTER OF THIS AGREEMENT UNDER TORT, CONTRACT, STRICT LIABILITY 
//     OR ANY OTHER LEGAL OR EQUITABLE THEORY (I) FOR ANY INDIRECT, 
//     SPECIAL, INCIDENTAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES OF ANY 
//     CHARACTER INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF 
//     GOODWILL, DATA OR PROFIT, WORK STOPPAGE, OR COMPUTER FAILURE OR 
//     MALFUNCTION, OR IN ANY EVENT (II) FOR ANY AMOUNT IN EXCESS, IN 
//     THE AGGREGATE, OF THE FEE PAID BY LICENSEE TO EFINIX HEREUNDER 
//     (OR, IF THE FEE HAS BEEN WAIVED, $100), EVEN IF EFINIX SHALL HAVE 
//     BEEN INFORMED OF THE POSSIBILITY OF SUCH DAMAGES.  SOME STATES DO 
//     NOT ALLOW THE EXCLUSION OR LIMITATION OF INCIDENTAL OR 
//     CONSEQUENTIAL DAMAGES, SO THIS LIMITATION AND EXCLUSION MAY NOT 
//     APPLY TO LICENSEE.
//
/////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//
// Efinix LogicN integrated logic analyzer
//
// May 2019, samh
//
module edb_la_top #(
    parameter NUM_PROBES        = 1,
    parameter DATA_DEPTH        = 1024, // max=131,072=2^17
    parameter TRIGIN_EN         = 0,
    parameter TRIGOUT_EN        = 0,
    parameter INPUT_PIPE_STAGES = 0,
    parameter CNDTNL_STRG_EN    = 0,
    parameter CAPTURE_CONTROL   = 0,
    parameter UUID              = 128'h0000_0000_0000_0000_0000_0000_0000_0000,

    ////////////////////////
    // probe_type:
    // 1: DATA_AND_TRIGGER
    // 2: DATA_ONLY
    // 3: TRIGGER_ONLY
    ////////////////////////
    parameter [10:0] PROBE0_WIDTH  = 1,
    parameter [10:0] PROBE1_WIDTH  = 1,
    parameter [10:0] PROBE2_WIDTH  = 1,
    parameter [10:0] PROBE3_WIDTH  = 1,
    parameter [10:0] PROBE4_WIDTH  = 1,
    parameter [10:0] PROBE5_WIDTH  = 1,
    parameter [10:0] PROBE6_WIDTH  = 1,
    parameter [10:0] PROBE7_WIDTH  = 1,
    parameter [10:0] PROBE8_WIDTH  = 1,
    parameter [10:0] PROBE9_WIDTH  = 1,
    parameter [10:0] PROBE10_WIDTH = 1,
    parameter [10:0] PROBE11_WIDTH = 1,
    parameter [10:0] PROBE12_WIDTH = 1,
    parameter [10:0] PROBE13_WIDTH = 1,
    parameter [10:0] PROBE14_WIDTH = 1,
    parameter [10:0] PROBE15_WIDTH = 1,
    parameter [10:0] PROBE16_WIDTH = 1,
    parameter [10:0] PROBE17_WIDTH = 1,
    parameter [10:0] PROBE18_WIDTH = 1,
    parameter [10:0] PROBE19_WIDTH = 1,
    parameter [10:0] PROBE20_WIDTH = 1,
    parameter [10:0] PROBE21_WIDTH = 1,
    parameter [10:0] PROBE22_WIDTH = 1,
    parameter [10:0] PROBE23_WIDTH = 1,
    parameter [10:0] PROBE24_WIDTH = 1,
    parameter [10:0] PROBE25_WIDTH = 1,
    parameter [10:0] PROBE26_WIDTH = 1,
    parameter [10:0] PROBE27_WIDTH = 1,
    parameter [10:0] PROBE28_WIDTH = 1,
    parameter [10:0] PROBE29_WIDTH = 1,
    parameter [10:0] PROBE30_WIDTH = 1,
    parameter [10:0] PROBE31_WIDTH = 1,
    parameter [10:0] PROBE32_WIDTH = 1,
    parameter [10:0] PROBE33_WIDTH = 1,
    parameter [10:0] PROBE34_WIDTH = 1,
    parameter [10:0] PROBE35_WIDTH = 1,
    parameter [10:0] PROBE36_WIDTH = 1,
    parameter [10:0] PROBE37_WIDTH = 1,
    parameter [10:0] PROBE38_WIDTH = 1,
    parameter [10:0] PROBE39_WIDTH = 1,
    parameter [10:0] PROBE40_WIDTH = 1,
    parameter [10:0] PROBE41_WIDTH = 1,
    parameter [10:0] PROBE42_WIDTH = 1,
    parameter [10:0] PROBE43_WIDTH = 1,
    parameter [10:0] PROBE44_WIDTH = 1,
    parameter [10:0] PROBE45_WIDTH = 1,
    parameter [10:0] PROBE46_WIDTH = 1,
    parameter [10:0] PROBE47_WIDTH = 1,
    parameter [10:0] PROBE48_WIDTH = 1,
    parameter [10:0] PROBE49_WIDTH = 1,
    parameter [10:0] PROBE50_WIDTH = 1,
    parameter [10:0] PROBE51_WIDTH = 1,
    parameter [10:0] PROBE52_WIDTH = 1,
    parameter [10:0] PROBE53_WIDTH = 1,
    parameter [10:0] PROBE54_WIDTH = 1,
    parameter [10:0] PROBE55_WIDTH = 1,
    parameter [10:0] PROBE56_WIDTH = 1,
    parameter [10:0] PROBE57_WIDTH = 1,
    parameter [10:0] PROBE58_WIDTH = 1,
    parameter [10:0] PROBE59_WIDTH = 1,
    parameter [10:0] PROBE60_WIDTH = 1,
    parameter [10:0] PROBE61_WIDTH = 1,
    parameter [10:0] PROBE62_WIDTH = 1,
    parameter [10:0] PROBE63_WIDTH = 1,
    parameter [10:0] PROBE64_WIDTH = 1,
    parameter [10:0] PROBE65_WIDTH = 1,
    parameter [10:0] PROBE66_WIDTH = 1,
    parameter [10:0] PROBE67_WIDTH = 1,
    parameter [10:0] PROBE68_WIDTH = 1,
    parameter [10:0] PROBE69_WIDTH = 1,
    parameter [10:0] PROBE70_WIDTH = 1,
    parameter [10:0] PROBE71_WIDTH = 1,
    parameter [10:0] PROBE72_WIDTH = 1,
    parameter [10:0] PROBE73_WIDTH = 1,
    parameter [10:0] PROBE74_WIDTH = 1,
    parameter [10:0] PROBE75_WIDTH = 1,
    parameter [10:0] PROBE76_WIDTH = 1,
    parameter [10:0] PROBE77_WIDTH = 1,
    parameter [10:0] PROBE78_WIDTH = 1,
    parameter [10:0] PROBE79_WIDTH = 1,
    parameter [10:0] PROBE80_WIDTH = 1,
    parameter [10:0] PROBE81_WIDTH = 1,
    parameter [10:0] PROBE82_WIDTH = 1,
    parameter [10:0] PROBE83_WIDTH = 1,
    parameter [10:0] PROBE84_WIDTH = 1,
    parameter [10:0] PROBE85_WIDTH = 1,
    parameter [10:0] PROBE86_WIDTH = 1,
    parameter [10:0] PROBE87_WIDTH = 1,
    parameter [10:0] PROBE88_WIDTH = 1,
    parameter [10:0] PROBE89_WIDTH = 1,
    parameter [10:0] PROBE90_WIDTH = 1,
    parameter [10:0] PROBE91_WIDTH = 1,
    parameter [10:0] PROBE92_WIDTH = 1,
    parameter [10:0] PROBE93_WIDTH = 1,
    parameter [10:0] PROBE94_WIDTH = 1,
    parameter [10:0] PROBE95_WIDTH = 1,
    parameter [10:0] PROBE96_WIDTH = 1,
    parameter [10:0] PROBE97_WIDTH = 1,
    parameter [10:0] PROBE98_WIDTH = 1,
    parameter [10:0] PROBE99_WIDTH = 1,
    parameter [10:0] PROBE100_WIDTH = 1,
    parameter [10:0] PROBE101_WIDTH = 1,
    parameter [10:0] PROBE102_WIDTH = 1,
    parameter [10:0] PROBE103_WIDTH = 1,
    parameter [10:0] PROBE104_WIDTH = 1,
    parameter [10:0] PROBE105_WIDTH = 1,
    parameter [10:0] PROBE106_WIDTH = 1,
    parameter [10:0] PROBE107_WIDTH = 1,
    parameter [10:0] PROBE108_WIDTH = 1,
    parameter [10:0] PROBE109_WIDTH = 1,
    parameter [10:0] PROBE110_WIDTH = 1,
    parameter [10:0] PROBE111_WIDTH = 1,
    parameter [10:0] PROBE112_WIDTH = 1,
    parameter [10:0] PROBE113_WIDTH = 1,
    parameter [10:0] PROBE114_WIDTH = 1,
    parameter [10:0] PROBE115_WIDTH = 1,
    parameter [10:0] PROBE116_WIDTH = 1,
    parameter [10:0] PROBE117_WIDTH = 1,
    parameter [10:0] PROBE118_WIDTH = 1,
    parameter [10:0] PROBE119_WIDTH = 1,
    parameter [10:0] PROBE120_WIDTH = 1,
    parameter [10:0] PROBE121_WIDTH = 1,
    parameter [10:0] PROBE122_WIDTH = 1,
    parameter [10:0] PROBE123_WIDTH = 1,
    parameter [10:0] PROBE124_WIDTH = 1,
    parameter [10:0] PROBE125_WIDTH = 1,
    parameter [10:0] PROBE126_WIDTH = 1,
    parameter [10:0] PROBE127_WIDTH = 1,
    parameter [10:0] PROBE128_WIDTH = 1,
    parameter [10:0] PROBE129_WIDTH = 1,
    parameter [10:0] PROBE130_WIDTH = 1,
    parameter [10:0] PROBE131_WIDTH = 1,
    parameter [10:0] PROBE132_WIDTH = 1,
    parameter [10:0] PROBE133_WIDTH = 1,
    parameter [10:0] PROBE134_WIDTH = 1,
    parameter [10:0] PROBE135_WIDTH = 1,
    parameter [10:0] PROBE136_WIDTH = 1,
    parameter [10:0] PROBE137_WIDTH = 1,
    parameter [10:0] PROBE138_WIDTH = 1,
    parameter [10:0] PROBE139_WIDTH = 1,
    parameter [10:0] PROBE140_WIDTH = 1,
    parameter [10:0] PROBE141_WIDTH = 1,
    parameter [10:0] PROBE142_WIDTH = 1,
    parameter [10:0] PROBE143_WIDTH = 1,
    parameter [10:0] PROBE144_WIDTH = 1,
    parameter [10:0] PROBE145_WIDTH = 1,
    parameter [10:0] PROBE146_WIDTH = 1,
    parameter [10:0] PROBE147_WIDTH = 1,
    parameter [10:0] PROBE148_WIDTH = 1,
    parameter [10:0] PROBE149_WIDTH = 1,
    parameter [10:0] PROBE150_WIDTH = 1,
    parameter [10:0] PROBE151_WIDTH = 1,
    parameter [10:0] PROBE152_WIDTH = 1,
    parameter [10:0] PROBE153_WIDTH = 1,
    parameter [10:0] PROBE154_WIDTH = 1,
    parameter [10:0] PROBE155_WIDTH = 1,
    parameter [10:0] PROBE156_WIDTH = 1,
    parameter [10:0] PROBE157_WIDTH = 1,
    parameter [10:0] PROBE158_WIDTH = 1,
    parameter [10:0] PROBE159_WIDTH = 1,
    parameter [10:0] PROBE160_WIDTH = 1,
    parameter [10:0] PROBE161_WIDTH = 1,
    parameter [10:0] PROBE162_WIDTH = 1,
    parameter [10:0] PROBE163_WIDTH = 1,
    parameter [10:0] PROBE164_WIDTH = 1,
    parameter [10:0] PROBE165_WIDTH = 1,
    parameter [10:0] PROBE166_WIDTH = 1,
    parameter [10:0] PROBE167_WIDTH = 1,
    parameter [10:0] PROBE168_WIDTH = 1,
    parameter [10:0] PROBE169_WIDTH = 1,
    parameter [10:0] PROBE170_WIDTH = 1,
    parameter [10:0] PROBE171_WIDTH = 1,
    parameter [10:0] PROBE172_WIDTH = 1,
    parameter [10:0] PROBE173_WIDTH = 1,
    parameter [10:0] PROBE174_WIDTH = 1,
    parameter [10:0] PROBE175_WIDTH = 1,
    parameter [10:0] PROBE176_WIDTH = 1,
    parameter [10:0] PROBE177_WIDTH = 1,
    parameter [10:0] PROBE178_WIDTH = 1,
    parameter [10:0] PROBE179_WIDTH = 1,
    parameter [10:0] PROBE180_WIDTH = 1,
    parameter [10:0] PROBE181_WIDTH = 1,
    parameter [10:0] PROBE182_WIDTH = 1,
    parameter [10:0] PROBE183_WIDTH = 1,
    parameter [10:0] PROBE184_WIDTH = 1,
    parameter [10:0] PROBE185_WIDTH = 1,
    parameter [10:0] PROBE186_WIDTH = 1,
    parameter [10:0] PROBE187_WIDTH = 1,
    parameter [10:0] PROBE188_WIDTH = 1,
    parameter [10:0] PROBE189_WIDTH = 1,
    parameter [10:0] PROBE190_WIDTH = 1,
    parameter [10:0] PROBE191_WIDTH = 1,
    parameter [10:0] PROBE192_WIDTH = 1,
    parameter [10:0] PROBE193_WIDTH = 1,
    parameter [10:0] PROBE194_WIDTH = 1,
    parameter [10:0] PROBE195_WIDTH = 1,
    parameter [10:0] PROBE196_WIDTH = 1,
    parameter [10:0] PROBE197_WIDTH = 1,
    parameter [10:0] PROBE198_WIDTH = 1,
    parameter [10:0] PROBE199_WIDTH = 1,
    parameter [10:0] PROBE200_WIDTH = 1,
    parameter [10:0] PROBE201_WIDTH = 1,
    parameter [10:0] PROBE202_WIDTH = 1,
    parameter [10:0] PROBE203_WIDTH = 1,
    parameter [10:0] PROBE204_WIDTH = 1,
    parameter [10:0] PROBE205_WIDTH = 1,
    parameter [10:0] PROBE206_WIDTH = 1,
    parameter [10:0] PROBE207_WIDTH = 1,
    parameter [10:0] PROBE208_WIDTH = 1,
    parameter [10:0] PROBE209_WIDTH = 1,
    parameter [10:0] PROBE210_WIDTH = 1,
    parameter [10:0] PROBE211_WIDTH = 1,
    parameter [10:0] PROBE212_WIDTH = 1,
    parameter [10:0] PROBE213_WIDTH = 1,
    parameter [10:0] PROBE214_WIDTH = 1,
    parameter [10:0] PROBE215_WIDTH = 1,
    parameter [10:0] PROBE216_WIDTH = 1,
    parameter [10:0] PROBE217_WIDTH = 1,
    parameter [10:0] PROBE218_WIDTH = 1,
    parameter [10:0] PROBE219_WIDTH = 1,
    parameter [10:0] PROBE220_WIDTH = 1,
    parameter [10:0] PROBE221_WIDTH = 1,
    parameter [10:0] PROBE222_WIDTH = 1,
    parameter [10:0] PROBE223_WIDTH = 1,
    parameter [10:0] PROBE224_WIDTH = 1,
    parameter [10:0] PROBE225_WIDTH = 1,
    parameter [10:0] PROBE226_WIDTH = 1,
    parameter [10:0] PROBE227_WIDTH = 1,
    parameter [10:0] PROBE228_WIDTH = 1,
    parameter [10:0] PROBE229_WIDTH = 1,
    parameter [10:0] PROBE230_WIDTH = 1,
    parameter [10:0] PROBE231_WIDTH = 1,
    parameter [10:0] PROBE232_WIDTH = 1,
    parameter [10:0] PROBE233_WIDTH = 1,
    parameter [10:0] PROBE234_WIDTH = 1,
    parameter [10:0] PROBE235_WIDTH = 1,
    parameter [10:0] PROBE236_WIDTH = 1,
    parameter [10:0] PROBE237_WIDTH = 1,
    parameter [10:0] PROBE238_WIDTH = 1,
    parameter [10:0] PROBE239_WIDTH = 1,
    parameter [10:0] PROBE240_WIDTH = 1,
    parameter [10:0] PROBE241_WIDTH = 1,
    parameter [10:0] PROBE242_WIDTH = 1,
    parameter [10:0] PROBE243_WIDTH = 1,
    parameter [10:0] PROBE244_WIDTH = 1,
    parameter [10:0] PROBE245_WIDTH = 1,
    parameter [10:0] PROBE246_WIDTH = 1,
    parameter [10:0] PROBE247_WIDTH = 1,
    parameter [10:0] PROBE248_WIDTH = 1,
    parameter [10:0] PROBE249_WIDTH = 1,
    parameter [10:0] PROBE250_WIDTH = 1,
    parameter [10:0] PROBE251_WIDTH = 1,
    parameter [10:0] PROBE252_WIDTH = 1,
    parameter [10:0] PROBE253_WIDTH = 1,
    parameter [10:0] PROBE254_WIDTH = 1,
    parameter [10:0] PROBE255_WIDTH = 1,


    parameter [1:0] PROBE0_TYPE  = 0,
    parameter [1:0] PROBE1_TYPE  = 0,
    parameter [1:0] PROBE2_TYPE  = 0,
    parameter [1:0] PROBE3_TYPE  = 0,
    parameter [1:0] PROBE4_TYPE  = 0,
    parameter [1:0] PROBE5_TYPE  = 0,
    parameter [1:0] PROBE6_TYPE  = 0,
    parameter [1:0] PROBE7_TYPE  = 0,
    parameter [1:0] PROBE8_TYPE  = 0,
    parameter [1:0] PROBE9_TYPE  = 0,
    parameter [1:0] PROBE10_TYPE = 0,
    parameter [1:0] PROBE11_TYPE = 0,
    parameter [1:0] PROBE12_TYPE = 0,
    parameter [1:0] PROBE13_TYPE = 0,
    parameter [1:0] PROBE14_TYPE = 0,
    parameter [1:0] PROBE15_TYPE = 0,
    parameter [1:0] PROBE16_TYPE = 0,
    parameter [1:0] PROBE17_TYPE = 0,
    parameter [1:0] PROBE18_TYPE = 0,
    parameter [1:0] PROBE19_TYPE = 0,
    parameter [1:0] PROBE20_TYPE = 0,
    parameter [1:0] PROBE21_TYPE = 0,
    parameter [1:0] PROBE22_TYPE = 0,
    parameter [1:0] PROBE23_TYPE = 0,
    parameter [1:0] PROBE24_TYPE = 0,
    parameter [1:0] PROBE25_TYPE = 0,
    parameter [1:0] PROBE26_TYPE = 0,
    parameter [1:0] PROBE27_TYPE = 0,
    parameter [1:0] PROBE28_TYPE = 0,
    parameter [1:0] PROBE29_TYPE = 0,
    parameter [1:0] PROBE30_TYPE = 0,
    parameter [1:0] PROBE31_TYPE = 0,
    parameter [1:0] PROBE32_TYPE = 0,
    parameter [1:0] PROBE33_TYPE = 0,
    parameter [1:0] PROBE34_TYPE = 0,
    parameter [1:0] PROBE35_TYPE = 0,
    parameter [1:0] PROBE36_TYPE = 0,
    parameter [1:0] PROBE37_TYPE = 0,
    parameter [1:0] PROBE38_TYPE = 0,
    parameter [1:0] PROBE39_TYPE = 0,
    parameter [1:0] PROBE40_TYPE = 0,
    parameter [1:0] PROBE41_TYPE = 0,
    parameter [1:0] PROBE42_TYPE = 0,
    parameter [1:0] PROBE43_TYPE = 0,
    parameter [1:0] PROBE44_TYPE = 0,
    parameter [1:0] PROBE45_TYPE = 0,
    parameter [1:0] PROBE46_TYPE = 0,
    parameter [1:0] PROBE47_TYPE = 0,
    parameter [1:0] PROBE48_TYPE = 0,
    parameter [1:0] PROBE49_TYPE = 0,
    parameter [1:0] PROBE50_TYPE = 0,
    parameter [1:0] PROBE51_TYPE = 0,
    parameter [1:0] PROBE52_TYPE = 0,
    parameter [1:0] PROBE53_TYPE = 0,
    parameter [1:0] PROBE54_TYPE = 0,
    parameter [1:0] PROBE55_TYPE = 0,
    parameter [1:0] PROBE56_TYPE = 0,
    parameter [1:0] PROBE57_TYPE = 0,
    parameter [1:0] PROBE58_TYPE = 0,
    parameter [1:0] PROBE59_TYPE = 0,
    parameter [1:0] PROBE60_TYPE = 0,
    parameter [1:0] PROBE61_TYPE = 0,
    parameter [1:0] PROBE62_TYPE = 0,
    parameter [1:0] PROBE63_TYPE = 0,
    parameter [1:0] PROBE64_TYPE = 0,
    parameter [1:0] PROBE65_TYPE = 0,
    parameter [1:0] PROBE66_TYPE = 0,
    parameter [1:0] PROBE67_TYPE = 0,
    parameter [1:0] PROBE68_TYPE = 0,
    parameter [1:0] PROBE69_TYPE = 0,
    parameter [1:0] PROBE70_TYPE = 0,
    parameter [1:0] PROBE71_TYPE = 0,
    parameter [1:0] PROBE72_TYPE = 0,
    parameter [1:0] PROBE73_TYPE = 0,
    parameter [1:0] PROBE74_TYPE = 0,
    parameter [1:0] PROBE75_TYPE = 0,
    parameter [1:0] PROBE76_TYPE = 0,
    parameter [1:0] PROBE77_TYPE = 0,
    parameter [1:0] PROBE78_TYPE = 0,
    parameter [1:0] PROBE79_TYPE = 0,
    parameter [1:0] PROBE80_TYPE = 0,
    parameter [1:0] PROBE81_TYPE = 0,
    parameter [1:0] PROBE82_TYPE = 0,
    parameter [1:0] PROBE83_TYPE = 0,
    parameter [1:0] PROBE84_TYPE = 0,
    parameter [1:0] PROBE85_TYPE = 0,
    parameter [1:0] PROBE86_TYPE = 0,
    parameter [1:0] PROBE87_TYPE = 0,
    parameter [1:0] PROBE88_TYPE = 0,
    parameter [1:0] PROBE89_TYPE = 0,
    parameter [1:0] PROBE90_TYPE = 0,
    parameter [1:0] PROBE91_TYPE = 0,
    parameter [1:0] PROBE92_TYPE = 0,
    parameter [1:0] PROBE93_TYPE = 0,
    parameter [1:0] PROBE94_TYPE = 0,
    parameter [1:0] PROBE95_TYPE = 0,
    parameter [1:0] PROBE96_TYPE = 0,
    parameter [1:0] PROBE97_TYPE = 0,
    parameter [1:0] PROBE98_TYPE = 0,
    parameter [1:0] PROBE99_TYPE = 0,
    parameter [1:0] PROBE100_TYPE = 0,
    parameter [1:0] PROBE101_TYPE = 0,
    parameter [1:0] PROBE102_TYPE = 0,
    parameter [1:0] PROBE103_TYPE = 0,
    parameter [1:0] PROBE104_TYPE = 0,
    parameter [1:0] PROBE105_TYPE = 0,
    parameter [1:0] PROBE106_TYPE = 0,
    parameter [1:0] PROBE107_TYPE = 0,
    parameter [1:0] PROBE108_TYPE = 0,
    parameter [1:0] PROBE109_TYPE = 0,
    parameter [1:0] PROBE110_TYPE = 0,
    parameter [1:0] PROBE111_TYPE = 0,
    parameter [1:0] PROBE112_TYPE = 0,
    parameter [1:0] PROBE113_TYPE = 0,
    parameter [1:0] PROBE114_TYPE = 0,
    parameter [1:0] PROBE115_TYPE = 0,
    parameter [1:0] PROBE116_TYPE = 0,
    parameter [1:0] PROBE117_TYPE = 0,
    parameter [1:0] PROBE118_TYPE = 0,
    parameter [1:0] PROBE119_TYPE = 0,
    parameter [1:0] PROBE120_TYPE = 0,
    parameter [1:0] PROBE121_TYPE = 0,
    parameter [1:0] PROBE122_TYPE = 0,
    parameter [1:0] PROBE123_TYPE = 0,
    parameter [1:0] PROBE124_TYPE = 0,
    parameter [1:0] PROBE125_TYPE = 0,
    parameter [1:0] PROBE126_TYPE = 0,
    parameter [1:0] PROBE127_TYPE = 0,
    parameter [1:0] PROBE128_TYPE = 0,
    parameter [1:0] PROBE129_TYPE = 0,
    parameter [1:0] PROBE130_TYPE = 0,
    parameter [1:0] PROBE131_TYPE = 0,
    parameter [1:0] PROBE132_TYPE = 0,
    parameter [1:0] PROBE133_TYPE = 0,
    parameter [1:0] PROBE134_TYPE = 0,
    parameter [1:0] PROBE135_TYPE = 0,
    parameter [1:0] PROBE136_TYPE = 0,
    parameter [1:0] PROBE137_TYPE = 0,
    parameter [1:0] PROBE138_TYPE = 0,
    parameter [1:0] PROBE139_TYPE = 0,
    parameter [1:0] PROBE140_TYPE = 0,
    parameter [1:0] PROBE141_TYPE = 0,
    parameter [1:0] PROBE142_TYPE = 0,
    parameter [1:0] PROBE143_TYPE = 0,
    parameter [1:0] PROBE144_TYPE = 0,
    parameter [1:0] PROBE145_TYPE = 0,
    parameter [1:0] PROBE146_TYPE = 0,
    parameter [1:0] PROBE147_TYPE = 0,
    parameter [1:0] PROBE148_TYPE = 0,
    parameter [1:0] PROBE149_TYPE = 0,
    parameter [1:0] PROBE150_TYPE = 0,
    parameter [1:0] PROBE151_TYPE = 0,
    parameter [1:0] PROBE152_TYPE = 0,
    parameter [1:0] PROBE153_TYPE = 0,
    parameter [1:0] PROBE154_TYPE = 0,
    parameter [1:0] PROBE155_TYPE = 0,
    parameter [1:0] PROBE156_TYPE = 0,
    parameter [1:0] PROBE157_TYPE = 0,
    parameter [1:0] PROBE158_TYPE = 0,
    parameter [1:0] PROBE159_TYPE = 0,
    parameter [1:0] PROBE160_TYPE = 0,
    parameter [1:0] PROBE161_TYPE = 0,
    parameter [1:0] PROBE162_TYPE = 0,
    parameter [1:0] PROBE163_TYPE = 0,
    parameter [1:0] PROBE164_TYPE = 0,
    parameter [1:0] PROBE165_TYPE = 0,
    parameter [1:0] PROBE166_TYPE = 0,
    parameter [1:0] PROBE167_TYPE = 0,
    parameter [1:0] PROBE168_TYPE = 0,
    parameter [1:0] PROBE169_TYPE = 0,
    parameter [1:0] PROBE170_TYPE = 0,
    parameter [1:0] PROBE171_TYPE = 0,
    parameter [1:0] PROBE172_TYPE = 0,
    parameter [1:0] PROBE173_TYPE = 0,
    parameter [1:0] PROBE174_TYPE = 0,
    parameter [1:0] PROBE175_TYPE = 0,
    parameter [1:0] PROBE176_TYPE = 0,
    parameter [1:0] PROBE177_TYPE = 0,
    parameter [1:0] PROBE178_TYPE = 0,
    parameter [1:0] PROBE179_TYPE = 0,
    parameter [1:0] PROBE180_TYPE = 0,
    parameter [1:0] PROBE181_TYPE = 0,
    parameter [1:0] PROBE182_TYPE = 0,
    parameter [1:0] PROBE183_TYPE = 0,
    parameter [1:0] PROBE184_TYPE = 0,
    parameter [1:0] PROBE185_TYPE = 0,
    parameter [1:0] PROBE186_TYPE = 0,
    parameter [1:0] PROBE187_TYPE = 0,
    parameter [1:0] PROBE188_TYPE = 0,
    parameter [1:0] PROBE189_TYPE = 0,
    parameter [1:0] PROBE190_TYPE = 0,
    parameter [1:0] PROBE191_TYPE = 0,
    parameter [1:0] PROBE192_TYPE = 0,
    parameter [1:0] PROBE193_TYPE = 0,
    parameter [1:0] PROBE194_TYPE = 0,
    parameter [1:0] PROBE195_TYPE = 0,
    parameter [1:0] PROBE196_TYPE = 0,
    parameter [1:0] PROBE197_TYPE = 0,
    parameter [1:0] PROBE198_TYPE = 0,
    parameter [1:0] PROBE199_TYPE = 0,
    parameter [1:0] PROBE200_TYPE = 0,
    parameter [1:0] PROBE201_TYPE = 0,
    parameter [1:0] PROBE202_TYPE = 0,
    parameter [1:0] PROBE203_TYPE = 0,
    parameter [1:0] PROBE204_TYPE = 0,
    parameter [1:0] PROBE205_TYPE = 0,
    parameter [1:0] PROBE206_TYPE = 0,
    parameter [1:0] PROBE207_TYPE = 0,
    parameter [1:0] PROBE208_TYPE = 0,
    parameter [1:0] PROBE209_TYPE = 0,
    parameter [1:0] PROBE210_TYPE = 0,
    parameter [1:0] PROBE211_TYPE = 0,
    parameter [1:0] PROBE212_TYPE = 0,
    parameter [1:0] PROBE213_TYPE = 0,
    parameter [1:0] PROBE214_TYPE = 0,
    parameter [1:0] PROBE215_TYPE = 0,
    parameter [1:0] PROBE216_TYPE = 0,
    parameter [1:0] PROBE217_TYPE = 0,
    parameter [1:0] PROBE218_TYPE = 0,
    parameter [1:0] PROBE219_TYPE = 0,
    parameter [1:0] PROBE220_TYPE = 0,
    parameter [1:0] PROBE221_TYPE = 0,
    parameter [1:0] PROBE222_TYPE = 0,
    parameter [1:0] PROBE223_TYPE = 0,
    parameter [1:0] PROBE224_TYPE = 0,
    parameter [1:0] PROBE225_TYPE = 0,
    parameter [1:0] PROBE226_TYPE = 0,
    parameter [1:0] PROBE227_TYPE = 0,
    parameter [1:0] PROBE228_TYPE = 0,
    parameter [1:0] PROBE229_TYPE = 0,
    parameter [1:0] PROBE230_TYPE = 0,
    parameter [1:0] PROBE231_TYPE = 0,
    parameter [1:0] PROBE232_TYPE = 0,
    parameter [1:0] PROBE233_TYPE = 0,
    parameter [1:0] PROBE234_TYPE = 0,
    parameter [1:0] PROBE235_TYPE = 0,
    parameter [1:0] PROBE236_TYPE = 0,
    parameter [1:0] PROBE237_TYPE = 0,
    parameter [1:0] PROBE238_TYPE = 0,
    parameter [1:0] PROBE239_TYPE = 0,
    parameter [1:0] PROBE240_TYPE = 0,
    parameter [1:0] PROBE241_TYPE = 0,
    parameter [1:0] PROBE242_TYPE = 0,
    parameter [1:0] PROBE243_TYPE = 0,
    parameter [1:0] PROBE244_TYPE = 0,
    parameter [1:0] PROBE245_TYPE = 0,
    parameter [1:0] PROBE246_TYPE = 0,
    parameter [1:0] PROBE247_TYPE = 0,
    parameter [1:0] PROBE248_TYPE = 0,
    parameter [1:0] PROBE249_TYPE = 0,
    parameter [1:0] PROBE250_TYPE = 0,
    parameter [1:0] PROBE251_TYPE = 0,
    parameter [1:0] PROBE252_TYPE = 0,
    parameter [1:0] PROBE253_TYPE = 0,
    parameter [1:0] PROBE254_TYPE = 0,
    parameter [1:0] PROBE255_TYPE = 0
)(
    // Xilinx BSCANE2-compatible interface, without TDO
    input  bscan_CAPTURE,
    input  bscan_DRCK,
    input  bscan_RESET,
    input  bscan_RUNTEST,
    input  bscan_SEL,
    input  bscan_SHIFT,
    input  bscan_TCK,
    input  bscan_TDI,
    input  bscan_TMS,
    input  bscan_UPDATE,

    // adv_dbg_if interface used in PULPino, from OpenCores
    input  edb_module_select,
    output reg edb_module_inhibit,
    output reg edb_module_tdo,
    input  [`DR_WIDTH-1:0] edb_user_dr,

    input  clk,
    input  trig_in,
    output reg trig_in_ack,
    output trig_out,
    input  trig_out_ack,

    input  [PROBE0_WIDTH-1:0] probe0,
    input  [PROBE1_WIDTH-1:0] probe1,
    input  [PROBE2_WIDTH-1:0] probe2,
    input  [PROBE3_WIDTH-1:0] probe3,
    input  [PROBE4_WIDTH-1:0] probe4,
    input  [PROBE5_WIDTH-1:0] probe5,
    input  [PROBE6_WIDTH-1:0] probe6,
    input  [PROBE7_WIDTH-1:0] probe7,
    input  [PROBE8_WIDTH-1:0] probe8,
    input  [PROBE9_WIDTH-1:0] probe9,
    input [PROBE10_WIDTH-1:0] probe10,
    input [PROBE11_WIDTH-1:0] probe11,
    input [PROBE12_WIDTH-1:0] probe12,
    input [PROBE13_WIDTH-1:0] probe13,
    input [PROBE14_WIDTH-1:0] probe14,
    input [PROBE15_WIDTH-1:0] probe15,
    input [PROBE16_WIDTH-1:0] probe16,
    input [PROBE17_WIDTH-1:0] probe17,
    input [PROBE18_WIDTH-1:0] probe18,
    input [PROBE19_WIDTH-1:0] probe19,
    input [PROBE20_WIDTH-1:0] probe20,
    input [PROBE21_WIDTH-1:0] probe21,
    input [PROBE22_WIDTH-1:0] probe22,
    input [PROBE23_WIDTH-1:0] probe23,
    input [PROBE24_WIDTH-1:0] probe24,
    input [PROBE25_WIDTH-1:0] probe25,
    input [PROBE26_WIDTH-1:0] probe26,
    input [PROBE27_WIDTH-1:0] probe27,
    input [PROBE28_WIDTH-1:0] probe28,
    input [PROBE29_WIDTH-1:0] probe29,
    input [PROBE30_WIDTH-1:0] probe30,
    input [PROBE31_WIDTH-1:0] probe31,
    input [PROBE32_WIDTH-1:0] probe32,
    input [PROBE33_WIDTH-1:0] probe33,
    input [PROBE34_WIDTH-1:0] probe34,
    input [PROBE35_WIDTH-1:0] probe35,
    input [PROBE36_WIDTH-1:0] probe36,
    input [PROBE37_WIDTH-1:0] probe37,
    input [PROBE38_WIDTH-1:0] probe38,
    input [PROBE39_WIDTH-1:0] probe39,
    input [PROBE40_WIDTH-1:0] probe40,
    input [PROBE41_WIDTH-1:0] probe41,
    input [PROBE42_WIDTH-1:0] probe42,
    input [PROBE43_WIDTH-1:0] probe43,
    input [PROBE44_WIDTH-1:0] probe44,
    input [PROBE45_WIDTH-1:0] probe45,
    input [PROBE46_WIDTH-1:0] probe46,
    input [PROBE47_WIDTH-1:0] probe47,
    input [PROBE48_WIDTH-1:0] probe48,
    input [PROBE49_WIDTH-1:0] probe49,
    input [PROBE50_WIDTH-1:0] probe50,
    input [PROBE51_WIDTH-1:0] probe51,
    input [PROBE52_WIDTH-1:0] probe52,
    input [PROBE53_WIDTH-1:0] probe53,
    input [PROBE54_WIDTH-1:0] probe54,
    input [PROBE55_WIDTH-1:0] probe55,
    input [PROBE56_WIDTH-1:0] probe56,
    input [PROBE57_WIDTH-1:0] probe57,
    input [PROBE58_WIDTH-1:0] probe58,
    input [PROBE59_WIDTH-1:0] probe59,
    input [PROBE60_WIDTH-1:0] probe60,
    input [PROBE61_WIDTH-1:0] probe61,
    input [PROBE62_WIDTH-1:0] probe62,
    input [PROBE63_WIDTH-1:0] probe63,
    input [PROBE64_WIDTH-1:0] probe64,
    input [PROBE65_WIDTH-1:0] probe65,
    input [PROBE66_WIDTH-1:0] probe66,
    input [PROBE67_WIDTH-1:0] probe67,
    input [PROBE68_WIDTH-1:0] probe68,
    input [PROBE69_WIDTH-1:0] probe69,
    input [PROBE70_WIDTH-1:0] probe70,
    input [PROBE71_WIDTH-1:0] probe71,
    input [PROBE72_WIDTH-1:0] probe72,
    input [PROBE73_WIDTH-1:0] probe73,
    input [PROBE74_WIDTH-1:0] probe74,
    input [PROBE75_WIDTH-1:0] probe75,
    input [PROBE76_WIDTH-1:0] probe76,
    input [PROBE77_WIDTH-1:0] probe77,
    input [PROBE78_WIDTH-1:0] probe78,
    input [PROBE79_WIDTH-1:0] probe79,
    input [PROBE80_WIDTH-1:0] probe80,
    input [PROBE81_WIDTH-1:0] probe81,
    input [PROBE82_WIDTH-1:0] probe82,
    input [PROBE83_WIDTH-1:0] probe83,
    input [PROBE84_WIDTH-1:0] probe84,
    input [PROBE85_WIDTH-1:0] probe85,
    input [PROBE86_WIDTH-1:0] probe86,
    input [PROBE87_WIDTH-1:0] probe87,
    input [PROBE88_WIDTH-1:0] probe88,
    input [PROBE89_WIDTH-1:0] probe89,
    input [PROBE90_WIDTH-1:0] probe90,
    input [PROBE91_WIDTH-1:0] probe91,
    input [PROBE92_WIDTH-1:0] probe92,
    input [PROBE93_WIDTH-1:0] probe93,
    input [PROBE94_WIDTH-1:0] probe94,
    input [PROBE95_WIDTH-1:0] probe95,
    input [PROBE96_WIDTH-1:0] probe96,
    input [PROBE97_WIDTH-1:0] probe97,
    input [PROBE98_WIDTH-1:0] probe98,
    input [PROBE99_WIDTH-1:0] probe99,
    input [PROBE100_WIDTH-1:0] probe100,
    input [PROBE101_WIDTH-1:0] probe101,
    input [PROBE102_WIDTH-1:0] probe102,
    input [PROBE103_WIDTH-1:0] probe103,
    input [PROBE104_WIDTH-1:0] probe104,
    input [PROBE105_WIDTH-1:0] probe105,
    input [PROBE106_WIDTH-1:0] probe106,
    input [PROBE107_WIDTH-1:0] probe107,
    input [PROBE108_WIDTH-1:0] probe108,
    input [PROBE109_WIDTH-1:0] probe109,
    input [PROBE110_WIDTH-1:0] probe110,
    input [PROBE111_WIDTH-1:0] probe111,
    input [PROBE112_WIDTH-1:0] probe112,
    input [PROBE113_WIDTH-1:0] probe113,
    input [PROBE114_WIDTH-1:0] probe114,
    input [PROBE115_WIDTH-1:0] probe115,
    input [PROBE116_WIDTH-1:0] probe116,
    input [PROBE117_WIDTH-1:0] probe117,
    input [PROBE118_WIDTH-1:0] probe118,
    input [PROBE119_WIDTH-1:0] probe119,
    input [PROBE120_WIDTH-1:0] probe120,
    input [PROBE121_WIDTH-1:0] probe121,
    input [PROBE122_WIDTH-1:0] probe122,
    input [PROBE123_WIDTH-1:0] probe123,
    input [PROBE124_WIDTH-1:0] probe124,
    input [PROBE125_WIDTH-1:0] probe125,
    input [PROBE126_WIDTH-1:0] probe126,
    input [PROBE127_WIDTH-1:0] probe127,
    input [PROBE128_WIDTH-1:0] probe128,
    input [PROBE129_WIDTH-1:0] probe129,
    input [PROBE130_WIDTH-1:0] probe130,
    input [PROBE131_WIDTH-1:0] probe131,
    input [PROBE132_WIDTH-1:0] probe132,
    input [PROBE133_WIDTH-1:0] probe133,
    input [PROBE134_WIDTH-1:0] probe134,
    input [PROBE135_WIDTH-1:0] probe135,
    input [PROBE136_WIDTH-1:0] probe136,
    input [PROBE137_WIDTH-1:0] probe137,
    input [PROBE138_WIDTH-1:0] probe138,
    input [PROBE139_WIDTH-1:0] probe139,
    input [PROBE140_WIDTH-1:0] probe140,
    input [PROBE141_WIDTH-1:0] probe141,
    input [PROBE142_WIDTH-1:0] probe142,
    input [PROBE143_WIDTH-1:0] probe143,
    input [PROBE144_WIDTH-1:0] probe144,
    input [PROBE145_WIDTH-1:0] probe145,
    input [PROBE146_WIDTH-1:0] probe146,
    input [PROBE147_WIDTH-1:0] probe147,
    input [PROBE148_WIDTH-1:0] probe148,
    input [PROBE149_WIDTH-1:0] probe149,
    input [PROBE150_WIDTH-1:0] probe150,
    input [PROBE151_WIDTH-1:0] probe151,
    input [PROBE152_WIDTH-1:0] probe152,
    input [PROBE153_WIDTH-1:0] probe153,
    input [PROBE154_WIDTH-1:0] probe154,
    input [PROBE155_WIDTH-1:0] probe155,
    input [PROBE156_WIDTH-1:0] probe156,
    input [PROBE157_WIDTH-1:0] probe157,
    input [PROBE158_WIDTH-1:0] probe158,
    input [PROBE159_WIDTH-1:0] probe159,
    input [PROBE160_WIDTH-1:0] probe160,
    input [PROBE161_WIDTH-1:0] probe161,
    input [PROBE162_WIDTH-1:0] probe162,
    input [PROBE163_WIDTH-1:0] probe163,
    input [PROBE164_WIDTH-1:0] probe164,
    input [PROBE165_WIDTH-1:0] probe165,
    input [PROBE166_WIDTH-1:0] probe166,
    input [PROBE167_WIDTH-1:0] probe167,
    input [PROBE168_WIDTH-1:0] probe168,
    input [PROBE169_WIDTH-1:0] probe169,
    input [PROBE170_WIDTH-1:0] probe170,
    input [PROBE171_WIDTH-1:0] probe171,
    input [PROBE172_WIDTH-1:0] probe172,
    input [PROBE173_WIDTH-1:0] probe173,
    input [PROBE174_WIDTH-1:0] probe174,
    input [PROBE175_WIDTH-1:0] probe175,
    input [PROBE176_WIDTH-1:0] probe176,
    input [PROBE177_WIDTH-1:0] probe177,
    input [PROBE178_WIDTH-1:0] probe178,
    input [PROBE179_WIDTH-1:0] probe179,
    input [PROBE180_WIDTH-1:0] probe180,
    input [PROBE181_WIDTH-1:0] probe181,
    input [PROBE182_WIDTH-1:0] probe182,
    input [PROBE183_WIDTH-1:0] probe183,
    input [PROBE184_WIDTH-1:0] probe184,
    input [PROBE185_WIDTH-1:0] probe185,
    input [PROBE186_WIDTH-1:0] probe186,
    input [PROBE187_WIDTH-1:0] probe187,
    input [PROBE188_WIDTH-1:0] probe188,
    input [PROBE189_WIDTH-1:0] probe189,
    input [PROBE190_WIDTH-1:0] probe190,
    input [PROBE191_WIDTH-1:0] probe191,
    input [PROBE192_WIDTH-1:0] probe192,
    input [PROBE193_WIDTH-1:0] probe193,
    input [PROBE194_WIDTH-1:0] probe194,
    input [PROBE195_WIDTH-1:0] probe195,
    input [PROBE196_WIDTH-1:0] probe196,
    input [PROBE197_WIDTH-1:0] probe197,
    input [PROBE198_WIDTH-1:0] probe198,
    input [PROBE199_WIDTH-1:0] probe199,
    input [PROBE200_WIDTH-1:0] probe200,
    input [PROBE201_WIDTH-1:0] probe201,
    input [PROBE202_WIDTH-1:0] probe202,
    input [PROBE203_WIDTH-1:0] probe203,
    input [PROBE204_WIDTH-1:0] probe204,
    input [PROBE205_WIDTH-1:0] probe205,
    input [PROBE206_WIDTH-1:0] probe206,
    input [PROBE207_WIDTH-1:0] probe207,
    input [PROBE208_WIDTH-1:0] probe208,
    input [PROBE209_WIDTH-1:0] probe209,
    input [PROBE210_WIDTH-1:0] probe210,
    input [PROBE211_WIDTH-1:0] probe211,
    input [PROBE212_WIDTH-1:0] probe212,
    input [PROBE213_WIDTH-1:0] probe213,
    input [PROBE214_WIDTH-1:0] probe214,
    input [PROBE215_WIDTH-1:0] probe215,
    input [PROBE216_WIDTH-1:0] probe216,
    input [PROBE217_WIDTH-1:0] probe217,
    input [PROBE218_WIDTH-1:0] probe218,
    input [PROBE219_WIDTH-1:0] probe219,
    input [PROBE220_WIDTH-1:0] probe220,
    input [PROBE221_WIDTH-1:0] probe221,
    input [PROBE222_WIDTH-1:0] probe222,
    input [PROBE223_WIDTH-1:0] probe223,
    input [PROBE224_WIDTH-1:0] probe224,
    input [PROBE225_WIDTH-1:0] probe225,
    input [PROBE226_WIDTH-1:0] probe226,
    input [PROBE227_WIDTH-1:0] probe227,
    input [PROBE228_WIDTH-1:0] probe228,
    input [PROBE229_WIDTH-1:0] probe229,
    input [PROBE230_WIDTH-1:0] probe230,
    input [PROBE231_WIDTH-1:0] probe231,
    input [PROBE232_WIDTH-1:0] probe232,
    input [PROBE233_WIDTH-1:0] probe233,
    input [PROBE234_WIDTH-1:0] probe234,
    input [PROBE235_WIDTH-1:0] probe235,
    input [PROBE236_WIDTH-1:0] probe236,
    input [PROBE237_WIDTH-1:0] probe237,
    input [PROBE238_WIDTH-1:0] probe238,
    input [PROBE239_WIDTH-1:0] probe239,
    input [PROBE240_WIDTH-1:0] probe240,
    input [PROBE241_WIDTH-1:0] probe241,
    input [PROBE242_WIDTH-1:0] probe242,
    input [PROBE243_WIDTH-1:0] probe243,
    input [PROBE244_WIDTH-1:0] probe244,
    input [PROBE245_WIDTH-1:0] probe245,
    input [PROBE246_WIDTH-1:0] probe246,
    input [PROBE247_WIDTH-1:0] probe247,
    input [PROBE248_WIDTH-1:0] probe248,
    input [PROBE249_WIDTH-1:0] probe249,
    input [PROBE250_WIDTH-1:0] probe250,
    input [PROBE251_WIDTH-1:0] probe251,
    input [PROBE252_WIDTH-1:0] probe252,
    input [PROBE253_WIDTH-1:0] probe253,
    input [PROBE254_WIDTH-1:0] probe254,
    input [PROBE255_WIDTH-1:0] probe255
);
    localparam PROBE_TYPE_NOT_USED = 0;
    localparam PROBE_TYPE_TRIGGER_AND_DATA = 1;
    localparam PROBE_TYPE_DATA_ONLY = 2;
    localparam PROBE_TYPE_TRIGGER_ONLY = 3;

    localparam PROBE0_IS_DATA = PROBE0_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE0_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE1_IS_DATA = PROBE1_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE1_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE2_IS_DATA = PROBE2_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE2_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE3_IS_DATA = PROBE3_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE3_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE4_IS_DATA = PROBE4_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE4_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE5_IS_DATA = PROBE5_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE5_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE6_IS_DATA = PROBE6_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE6_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE7_IS_DATA = PROBE7_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE7_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE8_IS_DATA = PROBE8_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE8_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE9_IS_DATA = PROBE9_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE9_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE10_IS_DATA = PROBE10_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE10_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE11_IS_DATA = PROBE11_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE11_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE12_IS_DATA = PROBE12_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE12_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE13_IS_DATA = PROBE13_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE13_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE14_IS_DATA = PROBE14_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE14_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE15_IS_DATA = PROBE15_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE15_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE16_IS_DATA = PROBE16_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE16_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE17_IS_DATA = PROBE17_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE17_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE18_IS_DATA = PROBE18_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE18_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE19_IS_DATA = PROBE19_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE19_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE20_IS_DATA = PROBE20_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE20_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE21_IS_DATA = PROBE21_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE21_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE22_IS_DATA = PROBE22_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE22_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE23_IS_DATA = PROBE23_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE23_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE24_IS_DATA = PROBE24_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE24_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE25_IS_DATA = PROBE25_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE25_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE26_IS_DATA = PROBE26_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE26_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE27_IS_DATA = PROBE27_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE27_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE28_IS_DATA = PROBE28_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE28_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE29_IS_DATA = PROBE29_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE29_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE30_IS_DATA = PROBE30_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE30_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE31_IS_DATA = PROBE31_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE31_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE32_IS_DATA = PROBE32_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE32_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE33_IS_DATA = PROBE33_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE33_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE34_IS_DATA = PROBE34_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE34_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE35_IS_DATA = PROBE35_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE35_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE36_IS_DATA = PROBE36_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE36_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE37_IS_DATA = PROBE37_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE37_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE38_IS_DATA = PROBE38_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE38_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE39_IS_DATA = PROBE39_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE39_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE40_IS_DATA = PROBE40_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE40_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE41_IS_DATA = PROBE41_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE41_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE42_IS_DATA = PROBE42_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE42_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE43_IS_DATA = PROBE43_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE43_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE44_IS_DATA = PROBE44_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE44_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE45_IS_DATA = PROBE45_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE45_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE46_IS_DATA = PROBE46_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE46_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE47_IS_DATA = PROBE47_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE47_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE48_IS_DATA = PROBE48_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE48_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE49_IS_DATA = PROBE49_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE49_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE50_IS_DATA = PROBE50_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE50_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE51_IS_DATA = PROBE51_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE51_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE52_IS_DATA = PROBE52_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE52_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE53_IS_DATA = PROBE53_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE53_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE54_IS_DATA = PROBE54_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE54_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE55_IS_DATA = PROBE55_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE55_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE56_IS_DATA = PROBE56_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE56_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE57_IS_DATA = PROBE57_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE57_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE58_IS_DATA = PROBE58_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE58_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE59_IS_DATA = PROBE59_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE59_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE60_IS_DATA = PROBE60_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE60_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE61_IS_DATA = PROBE61_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE61_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE62_IS_DATA = PROBE62_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE62_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE63_IS_DATA = PROBE63_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE63_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE64_IS_DATA = PROBE64_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE64_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE65_IS_DATA = PROBE65_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE65_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE66_IS_DATA = PROBE66_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE66_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE67_IS_DATA = PROBE67_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE67_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE68_IS_DATA = PROBE68_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE68_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE69_IS_DATA = PROBE69_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE69_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE70_IS_DATA = PROBE70_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE70_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE71_IS_DATA = PROBE71_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE71_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE72_IS_DATA = PROBE72_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE72_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE73_IS_DATA = PROBE73_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE73_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE74_IS_DATA = PROBE74_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE74_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE75_IS_DATA = PROBE75_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE75_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE76_IS_DATA = PROBE76_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE76_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE77_IS_DATA = PROBE77_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE77_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE78_IS_DATA = PROBE78_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE78_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE79_IS_DATA = PROBE79_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE79_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE80_IS_DATA = PROBE80_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE80_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE81_IS_DATA = PROBE81_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE81_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE82_IS_DATA = PROBE82_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE82_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE83_IS_DATA = PROBE83_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE83_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE84_IS_DATA = PROBE84_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE84_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE85_IS_DATA = PROBE85_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE85_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE86_IS_DATA = PROBE86_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE86_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE87_IS_DATA = PROBE87_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE87_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE88_IS_DATA = PROBE88_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE88_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE89_IS_DATA = PROBE89_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE89_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE90_IS_DATA = PROBE90_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE90_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE91_IS_DATA = PROBE91_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE91_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE92_IS_DATA = PROBE92_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE92_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE93_IS_DATA = PROBE93_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE93_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE94_IS_DATA = PROBE94_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE94_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE95_IS_DATA = PROBE95_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE95_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE96_IS_DATA = PROBE96_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE96_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE97_IS_DATA = PROBE97_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE97_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE98_IS_DATA = PROBE98_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE98_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE99_IS_DATA = PROBE99_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE99_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE100_IS_DATA = PROBE100_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE100_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE101_IS_DATA = PROBE101_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE101_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE102_IS_DATA = PROBE102_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE102_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE103_IS_DATA = PROBE103_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE103_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE104_IS_DATA = PROBE104_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE104_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE105_IS_DATA = PROBE105_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE105_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE106_IS_DATA = PROBE106_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE106_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE107_IS_DATA = PROBE107_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE107_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE108_IS_DATA = PROBE108_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE108_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE109_IS_DATA = PROBE109_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE109_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE110_IS_DATA = PROBE110_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE110_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE111_IS_DATA = PROBE111_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE111_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE112_IS_DATA = PROBE112_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE112_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE113_IS_DATA = PROBE113_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE113_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE114_IS_DATA = PROBE114_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE114_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE115_IS_DATA = PROBE115_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE115_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE116_IS_DATA = PROBE116_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE116_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE117_IS_DATA = PROBE117_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE117_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE118_IS_DATA = PROBE118_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE118_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE119_IS_DATA = PROBE119_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE119_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE120_IS_DATA = PROBE120_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE120_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE121_IS_DATA = PROBE121_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE121_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE122_IS_DATA = PROBE122_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE122_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE123_IS_DATA = PROBE123_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE123_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE124_IS_DATA = PROBE124_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE124_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE125_IS_DATA = PROBE125_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE125_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE126_IS_DATA = PROBE126_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE126_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE127_IS_DATA = PROBE127_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE127_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE128_IS_DATA = PROBE128_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE128_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE129_IS_DATA = PROBE129_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE129_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE130_IS_DATA = PROBE130_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE130_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE131_IS_DATA = PROBE131_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE131_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE132_IS_DATA = PROBE132_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE132_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE133_IS_DATA = PROBE133_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE133_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE134_IS_DATA = PROBE134_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE134_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE135_IS_DATA = PROBE135_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE135_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE136_IS_DATA = PROBE136_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE136_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE137_IS_DATA = PROBE137_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE137_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE138_IS_DATA = PROBE138_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE138_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE139_IS_DATA = PROBE139_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE139_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE140_IS_DATA = PROBE140_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE140_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE141_IS_DATA = PROBE141_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE141_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE142_IS_DATA = PROBE142_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE142_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE143_IS_DATA = PROBE143_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE143_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE144_IS_DATA = PROBE144_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE144_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE145_IS_DATA = PROBE145_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE145_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE146_IS_DATA = PROBE146_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE146_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE147_IS_DATA = PROBE147_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE147_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE148_IS_DATA = PROBE148_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE148_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE149_IS_DATA = PROBE149_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE149_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE150_IS_DATA = PROBE150_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE150_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE151_IS_DATA = PROBE151_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE151_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE152_IS_DATA = PROBE152_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE152_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE153_IS_DATA = PROBE153_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE153_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE154_IS_DATA = PROBE154_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE154_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE155_IS_DATA = PROBE155_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE155_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE156_IS_DATA = PROBE156_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE156_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE157_IS_DATA = PROBE157_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE157_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE158_IS_DATA = PROBE158_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE158_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE159_IS_DATA = PROBE159_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE159_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE160_IS_DATA = PROBE160_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE160_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE161_IS_DATA = PROBE161_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE161_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE162_IS_DATA = PROBE162_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE162_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE163_IS_DATA = PROBE163_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE163_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE164_IS_DATA = PROBE164_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE164_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE165_IS_DATA = PROBE165_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE165_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE166_IS_DATA = PROBE166_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE166_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE167_IS_DATA = PROBE167_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE167_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE168_IS_DATA = PROBE168_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE168_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE169_IS_DATA = PROBE169_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE169_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE170_IS_DATA = PROBE170_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE170_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE171_IS_DATA = PROBE171_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE171_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE172_IS_DATA = PROBE172_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE172_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE173_IS_DATA = PROBE173_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE173_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE174_IS_DATA = PROBE174_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE174_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE175_IS_DATA = PROBE175_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE175_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE176_IS_DATA = PROBE176_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE176_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE177_IS_DATA = PROBE177_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE177_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE178_IS_DATA = PROBE178_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE178_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE179_IS_DATA = PROBE179_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE179_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE180_IS_DATA = PROBE180_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE180_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE181_IS_DATA = PROBE181_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE181_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE182_IS_DATA = PROBE182_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE182_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE183_IS_DATA = PROBE183_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE183_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE184_IS_DATA = PROBE184_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE184_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE185_IS_DATA = PROBE185_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE185_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE186_IS_DATA = PROBE186_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE186_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE187_IS_DATA = PROBE187_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE187_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE188_IS_DATA = PROBE188_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE188_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE189_IS_DATA = PROBE189_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE189_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE190_IS_DATA = PROBE190_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE190_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE191_IS_DATA = PROBE191_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE191_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE192_IS_DATA = PROBE192_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE192_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE193_IS_DATA = PROBE193_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE193_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE194_IS_DATA = PROBE194_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE194_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE195_IS_DATA = PROBE195_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE195_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE196_IS_DATA = PROBE196_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE196_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE197_IS_DATA = PROBE197_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE197_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE198_IS_DATA = PROBE198_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE198_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE199_IS_DATA = PROBE199_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE199_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE200_IS_DATA = PROBE200_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE200_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE201_IS_DATA = PROBE201_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE201_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE202_IS_DATA = PROBE202_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE202_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE203_IS_DATA = PROBE203_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE203_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE204_IS_DATA = PROBE204_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE204_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE205_IS_DATA = PROBE205_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE205_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE206_IS_DATA = PROBE206_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE206_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE207_IS_DATA = PROBE207_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE207_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE208_IS_DATA = PROBE208_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE208_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE209_IS_DATA = PROBE209_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE209_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE210_IS_DATA = PROBE210_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE210_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE211_IS_DATA = PROBE211_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE211_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE212_IS_DATA = PROBE212_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE212_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE213_IS_DATA = PROBE213_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE213_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE214_IS_DATA = PROBE214_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE214_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE215_IS_DATA = PROBE215_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE215_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE216_IS_DATA = PROBE216_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE216_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE217_IS_DATA = PROBE217_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE217_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE218_IS_DATA = PROBE218_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE218_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE219_IS_DATA = PROBE219_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE219_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE220_IS_DATA = PROBE220_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE220_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE221_IS_DATA = PROBE221_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE221_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE222_IS_DATA = PROBE222_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE222_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE223_IS_DATA = PROBE223_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE223_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE224_IS_DATA = PROBE224_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE224_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE225_IS_DATA = PROBE225_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE225_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE226_IS_DATA = PROBE226_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE226_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE227_IS_DATA = PROBE227_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE227_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE228_IS_DATA = PROBE228_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE228_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE229_IS_DATA = PROBE229_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE229_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE230_IS_DATA = PROBE230_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE230_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE231_IS_DATA = PROBE231_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE231_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE232_IS_DATA = PROBE232_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE232_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE233_IS_DATA = PROBE233_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE233_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE234_IS_DATA = PROBE234_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE234_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE235_IS_DATA = PROBE235_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE235_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE236_IS_DATA = PROBE236_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE236_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE237_IS_DATA = PROBE237_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE237_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE238_IS_DATA = PROBE238_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE238_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE239_IS_DATA = PROBE239_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE239_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE240_IS_DATA = PROBE240_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE240_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE241_IS_DATA = PROBE241_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE241_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE242_IS_DATA = PROBE242_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE242_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE243_IS_DATA = PROBE243_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE243_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE244_IS_DATA = PROBE244_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE244_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE245_IS_DATA = PROBE245_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE245_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE246_IS_DATA = PROBE246_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE246_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE247_IS_DATA = PROBE247_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE247_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE248_IS_DATA = PROBE248_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE248_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE249_IS_DATA = PROBE249_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE249_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE250_IS_DATA = PROBE250_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE250_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE251_IS_DATA = PROBE251_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE251_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE252_IS_DATA = PROBE252_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE252_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE253_IS_DATA = PROBE253_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE253_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE254_IS_DATA = PROBE254_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE254_TYPE ==  PROBE_TYPE_DATA_ONLY;
    localparam PROBE255_IS_DATA = PROBE255_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE255_TYPE ==  PROBE_TYPE_DATA_ONLY;

    localparam PROBE0_IS_TRIGGER = PROBE0_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE0_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE1_IS_TRIGGER = PROBE1_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE1_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE2_IS_TRIGGER = PROBE2_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE2_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE3_IS_TRIGGER = PROBE3_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE3_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE4_IS_TRIGGER = PROBE4_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE4_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE5_IS_TRIGGER = PROBE5_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE5_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE6_IS_TRIGGER = PROBE6_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE6_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE7_IS_TRIGGER = PROBE7_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE7_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE8_IS_TRIGGER = PROBE8_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE8_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE9_IS_TRIGGER = PROBE9_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE9_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE10_IS_TRIGGER = PROBE10_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE10_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE11_IS_TRIGGER = PROBE11_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE11_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE12_IS_TRIGGER = PROBE12_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE12_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE13_IS_TRIGGER = PROBE13_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE13_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE14_IS_TRIGGER = PROBE14_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE14_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE15_IS_TRIGGER = PROBE15_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE15_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE16_IS_TRIGGER = PROBE16_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE16_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE17_IS_TRIGGER = PROBE17_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE17_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE18_IS_TRIGGER = PROBE18_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE18_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE19_IS_TRIGGER = PROBE19_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE19_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE20_IS_TRIGGER = PROBE20_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE20_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE21_IS_TRIGGER = PROBE21_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE21_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE22_IS_TRIGGER = PROBE22_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE22_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE23_IS_TRIGGER = PROBE23_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE23_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE24_IS_TRIGGER = PROBE24_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE24_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE25_IS_TRIGGER = PROBE25_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE25_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE26_IS_TRIGGER = PROBE26_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE26_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE27_IS_TRIGGER = PROBE27_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE27_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE28_IS_TRIGGER = PROBE28_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE28_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE29_IS_TRIGGER = PROBE29_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE29_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE30_IS_TRIGGER = PROBE30_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE30_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE31_IS_TRIGGER = PROBE31_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE31_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE32_IS_TRIGGER = PROBE32_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE32_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE33_IS_TRIGGER = PROBE33_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE33_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE34_IS_TRIGGER = PROBE34_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE34_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE35_IS_TRIGGER = PROBE35_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE35_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE36_IS_TRIGGER = PROBE36_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE36_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE37_IS_TRIGGER = PROBE37_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE37_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE38_IS_TRIGGER = PROBE38_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE38_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE39_IS_TRIGGER = PROBE39_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE39_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE40_IS_TRIGGER = PROBE40_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE40_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE41_IS_TRIGGER = PROBE41_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE41_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE42_IS_TRIGGER = PROBE42_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE42_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE43_IS_TRIGGER = PROBE43_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE43_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE44_IS_TRIGGER = PROBE44_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE44_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE45_IS_TRIGGER = PROBE45_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE45_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE46_IS_TRIGGER = PROBE46_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE46_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE47_IS_TRIGGER = PROBE47_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE47_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE48_IS_TRIGGER = PROBE48_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE48_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE49_IS_TRIGGER = PROBE49_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE49_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE50_IS_TRIGGER = PROBE50_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE50_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE51_IS_TRIGGER = PROBE51_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE51_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE52_IS_TRIGGER = PROBE52_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE52_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE53_IS_TRIGGER = PROBE53_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE53_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE54_IS_TRIGGER = PROBE54_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE54_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE55_IS_TRIGGER = PROBE55_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE55_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE56_IS_TRIGGER = PROBE56_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE56_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE57_IS_TRIGGER = PROBE57_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE57_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE58_IS_TRIGGER = PROBE58_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE58_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE59_IS_TRIGGER = PROBE59_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE59_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE60_IS_TRIGGER = PROBE60_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE60_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE61_IS_TRIGGER = PROBE61_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE61_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE62_IS_TRIGGER = PROBE62_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE62_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE63_IS_TRIGGER = PROBE63_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE63_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE64_IS_TRIGGER = PROBE64_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE64_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE65_IS_TRIGGER = PROBE65_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE65_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE66_IS_TRIGGER = PROBE66_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE66_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE67_IS_TRIGGER = PROBE67_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE67_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE68_IS_TRIGGER = PROBE68_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE68_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE69_IS_TRIGGER = PROBE69_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE69_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE70_IS_TRIGGER = PROBE70_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE70_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE71_IS_TRIGGER = PROBE71_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE71_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE72_IS_TRIGGER = PROBE72_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE72_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE73_IS_TRIGGER = PROBE73_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE73_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE74_IS_TRIGGER = PROBE74_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE74_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE75_IS_TRIGGER = PROBE75_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE75_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE76_IS_TRIGGER = PROBE76_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE76_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE77_IS_TRIGGER = PROBE77_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE77_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE78_IS_TRIGGER = PROBE78_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE78_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE79_IS_TRIGGER = PROBE79_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE79_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE80_IS_TRIGGER = PROBE80_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE80_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE81_IS_TRIGGER = PROBE81_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE81_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE82_IS_TRIGGER = PROBE82_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE82_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE83_IS_TRIGGER = PROBE83_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE83_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE84_IS_TRIGGER = PROBE84_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE84_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE85_IS_TRIGGER = PROBE85_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE85_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE86_IS_TRIGGER = PROBE86_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE86_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE87_IS_TRIGGER = PROBE87_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE87_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE88_IS_TRIGGER = PROBE88_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE88_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE89_IS_TRIGGER = PROBE89_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE89_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE90_IS_TRIGGER = PROBE90_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE90_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE91_IS_TRIGGER = PROBE91_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE91_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE92_IS_TRIGGER = PROBE92_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE92_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE93_IS_TRIGGER = PROBE93_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE93_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE94_IS_TRIGGER = PROBE94_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE94_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE95_IS_TRIGGER = PROBE95_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE95_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE96_IS_TRIGGER = PROBE96_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE96_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE97_IS_TRIGGER = PROBE97_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE97_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE98_IS_TRIGGER = PROBE98_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE98_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE99_IS_TRIGGER = PROBE99_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE99_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE100_IS_TRIGGER = PROBE100_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE100_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE101_IS_TRIGGER = PROBE101_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE101_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE102_IS_TRIGGER = PROBE102_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE102_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE103_IS_TRIGGER = PROBE103_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE103_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE104_IS_TRIGGER = PROBE104_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE104_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE105_IS_TRIGGER = PROBE105_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE105_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE106_IS_TRIGGER = PROBE106_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE106_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE107_IS_TRIGGER = PROBE107_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE107_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE108_IS_TRIGGER = PROBE108_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE108_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE109_IS_TRIGGER = PROBE109_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE109_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE110_IS_TRIGGER = PROBE110_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE110_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE111_IS_TRIGGER = PROBE111_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE111_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE112_IS_TRIGGER = PROBE112_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE112_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE113_IS_TRIGGER = PROBE113_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE113_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE114_IS_TRIGGER = PROBE114_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE114_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE115_IS_TRIGGER = PROBE115_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE115_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE116_IS_TRIGGER = PROBE116_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE116_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE117_IS_TRIGGER = PROBE117_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE117_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE118_IS_TRIGGER = PROBE118_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE118_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE119_IS_TRIGGER = PROBE119_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE119_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE120_IS_TRIGGER = PROBE120_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE120_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE121_IS_TRIGGER = PROBE121_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE121_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE122_IS_TRIGGER = PROBE122_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE122_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE123_IS_TRIGGER = PROBE123_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE123_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE124_IS_TRIGGER = PROBE124_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE124_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE125_IS_TRIGGER = PROBE125_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE125_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE126_IS_TRIGGER = PROBE126_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE126_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE127_IS_TRIGGER = PROBE127_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE127_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE128_IS_TRIGGER = PROBE128_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE128_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE129_IS_TRIGGER = PROBE129_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE129_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE130_IS_TRIGGER = PROBE130_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE130_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE131_IS_TRIGGER = PROBE131_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE131_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE132_IS_TRIGGER = PROBE132_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE132_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE133_IS_TRIGGER = PROBE133_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE133_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE134_IS_TRIGGER = PROBE134_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE134_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE135_IS_TRIGGER = PROBE135_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE135_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE136_IS_TRIGGER = PROBE136_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE136_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE137_IS_TRIGGER = PROBE137_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE137_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE138_IS_TRIGGER = PROBE138_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE138_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE139_IS_TRIGGER = PROBE139_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE139_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE140_IS_TRIGGER = PROBE140_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE140_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE141_IS_TRIGGER = PROBE141_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE141_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE142_IS_TRIGGER = PROBE142_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE142_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE143_IS_TRIGGER = PROBE143_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE143_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE144_IS_TRIGGER = PROBE144_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE144_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE145_IS_TRIGGER = PROBE145_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE145_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE146_IS_TRIGGER = PROBE146_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE146_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE147_IS_TRIGGER = PROBE147_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE147_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE148_IS_TRIGGER = PROBE148_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE148_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE149_IS_TRIGGER = PROBE149_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE149_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE150_IS_TRIGGER = PROBE150_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE150_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE151_IS_TRIGGER = PROBE151_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE151_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE152_IS_TRIGGER = PROBE152_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE152_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE153_IS_TRIGGER = PROBE153_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE153_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE154_IS_TRIGGER = PROBE154_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE154_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE155_IS_TRIGGER = PROBE155_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE155_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE156_IS_TRIGGER = PROBE156_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE156_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE157_IS_TRIGGER = PROBE157_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE157_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE158_IS_TRIGGER = PROBE158_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE158_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE159_IS_TRIGGER = PROBE159_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE159_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE160_IS_TRIGGER = PROBE160_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE160_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE161_IS_TRIGGER = PROBE161_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE161_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE162_IS_TRIGGER = PROBE162_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE162_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE163_IS_TRIGGER = PROBE163_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE163_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE164_IS_TRIGGER = PROBE164_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE164_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE165_IS_TRIGGER = PROBE165_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE165_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE166_IS_TRIGGER = PROBE166_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE166_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE167_IS_TRIGGER = PROBE167_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE167_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE168_IS_TRIGGER = PROBE168_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE168_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE169_IS_TRIGGER = PROBE169_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE169_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE170_IS_TRIGGER = PROBE170_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE170_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE171_IS_TRIGGER = PROBE171_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE171_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE172_IS_TRIGGER = PROBE172_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE172_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE173_IS_TRIGGER = PROBE173_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE173_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE174_IS_TRIGGER = PROBE174_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE174_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE175_IS_TRIGGER = PROBE175_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE175_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE176_IS_TRIGGER = PROBE176_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE176_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE177_IS_TRIGGER = PROBE177_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE177_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE178_IS_TRIGGER = PROBE178_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE178_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE179_IS_TRIGGER = PROBE179_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE179_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE180_IS_TRIGGER = PROBE180_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE180_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE181_IS_TRIGGER = PROBE181_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE181_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE182_IS_TRIGGER = PROBE182_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE182_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE183_IS_TRIGGER = PROBE183_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE183_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE184_IS_TRIGGER = PROBE184_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE184_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE185_IS_TRIGGER = PROBE185_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE185_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE186_IS_TRIGGER = PROBE186_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE186_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE187_IS_TRIGGER = PROBE187_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE187_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE188_IS_TRIGGER = PROBE188_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE188_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE189_IS_TRIGGER = PROBE189_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE189_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE190_IS_TRIGGER = PROBE190_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE190_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE191_IS_TRIGGER = PROBE191_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE191_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE192_IS_TRIGGER = PROBE192_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE192_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE193_IS_TRIGGER = PROBE193_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE193_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE194_IS_TRIGGER = PROBE194_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE194_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE195_IS_TRIGGER = PROBE195_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE195_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE196_IS_TRIGGER = PROBE196_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE196_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE197_IS_TRIGGER = PROBE197_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE197_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE198_IS_TRIGGER = PROBE198_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE198_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE199_IS_TRIGGER = PROBE199_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE199_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE200_IS_TRIGGER = PROBE200_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE200_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE201_IS_TRIGGER = PROBE201_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE201_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE202_IS_TRIGGER = PROBE202_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE202_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE203_IS_TRIGGER = PROBE203_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE203_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE204_IS_TRIGGER = PROBE204_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE204_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE205_IS_TRIGGER = PROBE205_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE205_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE206_IS_TRIGGER = PROBE206_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE206_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE207_IS_TRIGGER = PROBE207_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE207_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE208_IS_TRIGGER = PROBE208_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE208_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE209_IS_TRIGGER = PROBE209_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE209_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE210_IS_TRIGGER = PROBE210_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE210_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE211_IS_TRIGGER = PROBE211_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE211_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE212_IS_TRIGGER = PROBE212_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE212_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE213_IS_TRIGGER = PROBE213_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE213_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE214_IS_TRIGGER = PROBE214_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE214_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE215_IS_TRIGGER = PROBE215_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE215_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE216_IS_TRIGGER = PROBE216_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE216_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE217_IS_TRIGGER = PROBE217_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE217_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE218_IS_TRIGGER = PROBE218_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE218_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE219_IS_TRIGGER = PROBE219_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE219_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE220_IS_TRIGGER = PROBE220_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE220_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE221_IS_TRIGGER = PROBE221_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE221_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE222_IS_TRIGGER = PROBE222_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE222_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE223_IS_TRIGGER = PROBE223_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE223_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE224_IS_TRIGGER = PROBE224_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE224_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE225_IS_TRIGGER = PROBE225_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE225_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE226_IS_TRIGGER = PROBE226_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE226_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE227_IS_TRIGGER = PROBE227_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE227_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE228_IS_TRIGGER = PROBE228_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE228_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE229_IS_TRIGGER = PROBE229_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE229_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE230_IS_TRIGGER = PROBE230_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE230_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE231_IS_TRIGGER = PROBE231_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE231_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE232_IS_TRIGGER = PROBE232_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE232_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE233_IS_TRIGGER = PROBE233_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE233_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE234_IS_TRIGGER = PROBE234_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE234_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE235_IS_TRIGGER = PROBE235_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE235_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE236_IS_TRIGGER = PROBE236_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE236_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE237_IS_TRIGGER = PROBE237_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE237_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE238_IS_TRIGGER = PROBE238_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE238_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE239_IS_TRIGGER = PROBE239_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE239_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE240_IS_TRIGGER = PROBE240_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE240_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE241_IS_TRIGGER = PROBE241_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE241_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE242_IS_TRIGGER = PROBE242_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE242_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE243_IS_TRIGGER = PROBE243_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE243_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE244_IS_TRIGGER = PROBE244_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE244_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE245_IS_TRIGGER = PROBE245_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE245_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE246_IS_TRIGGER = PROBE246_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE246_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE247_IS_TRIGGER = PROBE247_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE247_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE248_IS_TRIGGER = PROBE248_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE248_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE249_IS_TRIGGER = PROBE249_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE249_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE250_IS_TRIGGER = PROBE250_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE250_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE251_IS_TRIGGER = PROBE251_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE251_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE252_IS_TRIGGER = PROBE252_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE252_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE253_IS_TRIGGER = PROBE253_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE253_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE254_IS_TRIGGER = PROBE254_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE254_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;
    localparam PROBE255_IS_TRIGGER = PROBE255_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE255_TYPE ==  PROBE_TYPE_TRIGGER_ONLY;

    localparam [31:0] PROBE0_DBUS_LSB = 0;
    localparam [31:0] PROBE1_DBUS_LSB = PROBE0_DBUS_LSB + PROBE0_WIDTH * (PROBE0_IS_DATA);
    localparam [31:0] PROBE2_DBUS_LSB = PROBE1_DBUS_LSB + PROBE1_WIDTH * (PROBE1_IS_DATA);
    localparam [31:0] PROBE3_DBUS_LSB = PROBE2_DBUS_LSB + PROBE2_WIDTH * (PROBE2_IS_DATA);
    localparam [31:0] PROBE4_DBUS_LSB = PROBE3_DBUS_LSB + PROBE3_WIDTH * (PROBE3_IS_DATA);
    localparam [31:0] PROBE5_DBUS_LSB = PROBE4_DBUS_LSB + PROBE4_WIDTH * (PROBE4_IS_DATA);
    localparam [31:0] PROBE6_DBUS_LSB = PROBE5_DBUS_LSB + PROBE5_WIDTH * (PROBE5_IS_DATA);
    localparam [31:0] PROBE7_DBUS_LSB = PROBE6_DBUS_LSB + PROBE6_WIDTH * (PROBE6_IS_DATA);
    localparam [31:0] PROBE8_DBUS_LSB = PROBE7_DBUS_LSB + PROBE7_WIDTH * (PROBE7_IS_DATA);
    localparam [31:0] PROBE9_DBUS_LSB = PROBE8_DBUS_LSB + PROBE8_WIDTH * (PROBE8_IS_DATA);
    localparam [31:0] PROBE10_DBUS_LSB = PROBE9_DBUS_LSB + PROBE9_WIDTH * (PROBE9_IS_DATA);
    localparam [31:0] PROBE11_DBUS_LSB = PROBE10_DBUS_LSB + PROBE10_WIDTH * (PROBE10_IS_DATA);
    localparam [31:0] PROBE12_DBUS_LSB = PROBE11_DBUS_LSB + PROBE11_WIDTH * (PROBE11_IS_DATA);
    localparam [31:0] PROBE13_DBUS_LSB = PROBE12_DBUS_LSB + PROBE12_WIDTH * (PROBE12_IS_DATA);
    localparam [31:0] PROBE14_DBUS_LSB = PROBE13_DBUS_LSB + PROBE13_WIDTH * (PROBE13_IS_DATA);
    localparam [31:0] PROBE15_DBUS_LSB = PROBE14_DBUS_LSB + PROBE14_WIDTH * (PROBE14_IS_DATA);
    localparam [31:0] PROBE16_DBUS_LSB = PROBE15_DBUS_LSB + PROBE15_WIDTH * (PROBE15_IS_DATA);
    localparam [31:0] PROBE17_DBUS_LSB = PROBE16_DBUS_LSB + PROBE16_WIDTH * (PROBE16_IS_DATA);
    localparam [31:0] PROBE18_DBUS_LSB = PROBE17_DBUS_LSB + PROBE17_WIDTH * (PROBE17_IS_DATA);
    localparam [31:0] PROBE19_DBUS_LSB = PROBE18_DBUS_LSB + PROBE18_WIDTH * (PROBE18_IS_DATA);
    localparam [31:0] PROBE20_DBUS_LSB = PROBE19_DBUS_LSB + PROBE19_WIDTH * (PROBE19_IS_DATA);
    localparam [31:0] PROBE21_DBUS_LSB = PROBE20_DBUS_LSB + PROBE20_WIDTH * (PROBE20_IS_DATA);
    localparam [31:0] PROBE22_DBUS_LSB = PROBE21_DBUS_LSB + PROBE21_WIDTH * (PROBE21_IS_DATA);
    localparam [31:0] PROBE23_DBUS_LSB = PROBE22_DBUS_LSB + PROBE22_WIDTH * (PROBE22_IS_DATA);
    localparam [31:0] PROBE24_DBUS_LSB = PROBE23_DBUS_LSB + PROBE23_WIDTH * (PROBE23_IS_DATA);
    localparam [31:0] PROBE25_DBUS_LSB = PROBE24_DBUS_LSB + PROBE24_WIDTH * (PROBE24_IS_DATA);
    localparam [31:0] PROBE26_DBUS_LSB = PROBE25_DBUS_LSB + PROBE25_WIDTH * (PROBE25_IS_DATA);
    localparam [31:0] PROBE27_DBUS_LSB = PROBE26_DBUS_LSB + PROBE26_WIDTH * (PROBE26_IS_DATA);
    localparam [31:0] PROBE28_DBUS_LSB = PROBE27_DBUS_LSB + PROBE27_WIDTH * (PROBE27_IS_DATA);
    localparam [31:0] PROBE29_DBUS_LSB = PROBE28_DBUS_LSB + PROBE28_WIDTH * (PROBE28_IS_DATA);
    localparam [31:0] PROBE30_DBUS_LSB = PROBE29_DBUS_LSB + PROBE29_WIDTH * (PROBE29_IS_DATA);
    localparam [31:0] PROBE31_DBUS_LSB = PROBE30_DBUS_LSB + PROBE30_WIDTH * (PROBE30_IS_DATA);
    localparam [31:0] PROBE32_DBUS_LSB = PROBE31_DBUS_LSB + PROBE31_WIDTH * (PROBE31_IS_DATA);
    localparam [31:0] PROBE33_DBUS_LSB = PROBE32_DBUS_LSB + PROBE32_WIDTH * (PROBE32_IS_DATA);
    localparam [31:0] PROBE34_DBUS_LSB = PROBE33_DBUS_LSB + PROBE33_WIDTH * (PROBE33_IS_DATA);
    localparam [31:0] PROBE35_DBUS_LSB = PROBE34_DBUS_LSB + PROBE34_WIDTH * (PROBE34_IS_DATA);
    localparam [31:0] PROBE36_DBUS_LSB = PROBE35_DBUS_LSB + PROBE35_WIDTH * (PROBE35_IS_DATA);
    localparam [31:0] PROBE37_DBUS_LSB = PROBE36_DBUS_LSB + PROBE36_WIDTH * (PROBE36_IS_DATA);
    localparam [31:0] PROBE38_DBUS_LSB = PROBE37_DBUS_LSB + PROBE37_WIDTH * (PROBE37_IS_DATA);
    localparam [31:0] PROBE39_DBUS_LSB = PROBE38_DBUS_LSB + PROBE38_WIDTH * (PROBE38_IS_DATA);
    localparam [31:0] PROBE40_DBUS_LSB = PROBE39_DBUS_LSB + PROBE39_WIDTH * (PROBE39_IS_DATA);
    localparam [31:0] PROBE41_DBUS_LSB = PROBE40_DBUS_LSB + PROBE40_WIDTH * (PROBE40_IS_DATA);
    localparam [31:0] PROBE42_DBUS_LSB = PROBE41_DBUS_LSB + PROBE41_WIDTH * (PROBE41_IS_DATA);
    localparam [31:0] PROBE43_DBUS_LSB = PROBE42_DBUS_LSB + PROBE42_WIDTH * (PROBE42_IS_DATA);
    localparam [31:0] PROBE44_DBUS_LSB = PROBE43_DBUS_LSB + PROBE43_WIDTH * (PROBE43_IS_DATA);
    localparam [31:0] PROBE45_DBUS_LSB = PROBE44_DBUS_LSB + PROBE44_WIDTH * (PROBE44_IS_DATA);
    localparam [31:0] PROBE46_DBUS_LSB = PROBE45_DBUS_LSB + PROBE45_WIDTH * (PROBE45_IS_DATA);
    localparam [31:0] PROBE47_DBUS_LSB = PROBE46_DBUS_LSB + PROBE46_WIDTH * (PROBE46_IS_DATA);
    localparam [31:0] PROBE48_DBUS_LSB = PROBE47_DBUS_LSB + PROBE47_WIDTH * (PROBE47_IS_DATA);
    localparam [31:0] PROBE49_DBUS_LSB = PROBE48_DBUS_LSB + PROBE48_WIDTH * (PROBE48_IS_DATA);
    localparam [31:0] PROBE50_DBUS_LSB = PROBE49_DBUS_LSB + PROBE49_WIDTH * (PROBE49_IS_DATA);
    localparam [31:0] PROBE51_DBUS_LSB = PROBE50_DBUS_LSB + PROBE50_WIDTH * (PROBE50_IS_DATA);
    localparam [31:0] PROBE52_DBUS_LSB = PROBE51_DBUS_LSB + PROBE51_WIDTH * (PROBE51_IS_DATA);
    localparam [31:0] PROBE53_DBUS_LSB = PROBE52_DBUS_LSB + PROBE52_WIDTH * (PROBE52_IS_DATA);
    localparam [31:0] PROBE54_DBUS_LSB = PROBE53_DBUS_LSB + PROBE53_WIDTH * (PROBE53_IS_DATA);
    localparam [31:0] PROBE55_DBUS_LSB = PROBE54_DBUS_LSB + PROBE54_WIDTH * (PROBE54_IS_DATA);
    localparam [31:0] PROBE56_DBUS_LSB = PROBE55_DBUS_LSB + PROBE55_WIDTH * (PROBE55_IS_DATA);
    localparam [31:0] PROBE57_DBUS_LSB = PROBE56_DBUS_LSB + PROBE56_WIDTH * (PROBE56_IS_DATA);
    localparam [31:0] PROBE58_DBUS_LSB = PROBE57_DBUS_LSB + PROBE57_WIDTH * (PROBE57_IS_DATA);
    localparam [31:0] PROBE59_DBUS_LSB = PROBE58_DBUS_LSB + PROBE58_WIDTH * (PROBE58_IS_DATA);
    localparam [31:0] PROBE60_DBUS_LSB = PROBE59_DBUS_LSB + PROBE59_WIDTH * (PROBE59_IS_DATA);
    localparam [31:0] PROBE61_DBUS_LSB = PROBE60_DBUS_LSB + PROBE60_WIDTH * (PROBE60_IS_DATA);
    localparam [31:0] PROBE62_DBUS_LSB = PROBE61_DBUS_LSB + PROBE61_WIDTH * (PROBE61_IS_DATA);
    localparam [31:0] PROBE63_DBUS_LSB = PROBE62_DBUS_LSB + PROBE62_WIDTH * (PROBE62_IS_DATA);
    localparam [31:0] PROBE64_DBUS_LSB = PROBE63_DBUS_LSB + PROBE63_WIDTH * (PROBE63_IS_DATA);
    localparam [31:0] PROBE65_DBUS_LSB = PROBE64_DBUS_LSB + PROBE64_WIDTH * (PROBE64_IS_DATA);
    localparam [31:0] PROBE66_DBUS_LSB = PROBE65_DBUS_LSB + PROBE65_WIDTH * (PROBE65_IS_DATA);
    localparam [31:0] PROBE67_DBUS_LSB = PROBE66_DBUS_LSB + PROBE66_WIDTH * (PROBE66_IS_DATA);
    localparam [31:0] PROBE68_DBUS_LSB = PROBE67_DBUS_LSB + PROBE67_WIDTH * (PROBE67_IS_DATA);
    localparam [31:0] PROBE69_DBUS_LSB = PROBE68_DBUS_LSB + PROBE68_WIDTH * (PROBE68_IS_DATA);
    localparam [31:0] PROBE70_DBUS_LSB = PROBE69_DBUS_LSB + PROBE69_WIDTH * (PROBE69_IS_DATA);
    localparam [31:0] PROBE71_DBUS_LSB = PROBE70_DBUS_LSB + PROBE70_WIDTH * (PROBE70_IS_DATA);
    localparam [31:0] PROBE72_DBUS_LSB = PROBE71_DBUS_LSB + PROBE71_WIDTH * (PROBE71_IS_DATA);
    localparam [31:0] PROBE73_DBUS_LSB = PROBE72_DBUS_LSB + PROBE72_WIDTH * (PROBE72_IS_DATA);
    localparam [31:0] PROBE74_DBUS_LSB = PROBE73_DBUS_LSB + PROBE73_WIDTH * (PROBE73_IS_DATA);
    localparam [31:0] PROBE75_DBUS_LSB = PROBE74_DBUS_LSB + PROBE74_WIDTH * (PROBE74_IS_DATA);
    localparam [31:0] PROBE76_DBUS_LSB = PROBE75_DBUS_LSB + PROBE75_WIDTH * (PROBE75_IS_DATA);
    localparam [31:0] PROBE77_DBUS_LSB = PROBE76_DBUS_LSB + PROBE76_WIDTH * (PROBE76_IS_DATA);
    localparam [31:0] PROBE78_DBUS_LSB = PROBE77_DBUS_LSB + PROBE77_WIDTH * (PROBE77_IS_DATA);
    localparam [31:0] PROBE79_DBUS_LSB = PROBE78_DBUS_LSB + PROBE78_WIDTH * (PROBE78_IS_DATA);
    localparam [31:0] PROBE80_DBUS_LSB = PROBE79_DBUS_LSB + PROBE79_WIDTH * (PROBE79_IS_DATA);
    localparam [31:0] PROBE81_DBUS_LSB = PROBE80_DBUS_LSB + PROBE80_WIDTH * (PROBE80_IS_DATA);
    localparam [31:0] PROBE82_DBUS_LSB = PROBE81_DBUS_LSB + PROBE81_WIDTH * (PROBE81_IS_DATA);
    localparam [31:0] PROBE83_DBUS_LSB = PROBE82_DBUS_LSB + PROBE82_WIDTH * (PROBE82_IS_DATA);
    localparam [31:0] PROBE84_DBUS_LSB = PROBE83_DBUS_LSB + PROBE83_WIDTH * (PROBE83_IS_DATA);
    localparam [31:0] PROBE85_DBUS_LSB = PROBE84_DBUS_LSB + PROBE84_WIDTH * (PROBE84_IS_DATA);
    localparam [31:0] PROBE86_DBUS_LSB = PROBE85_DBUS_LSB + PROBE85_WIDTH * (PROBE85_IS_DATA);
    localparam [31:0] PROBE87_DBUS_LSB = PROBE86_DBUS_LSB + PROBE86_WIDTH * (PROBE86_IS_DATA);
    localparam [31:0] PROBE88_DBUS_LSB = PROBE87_DBUS_LSB + PROBE87_WIDTH * (PROBE87_IS_DATA);
    localparam [31:0] PROBE89_DBUS_LSB = PROBE88_DBUS_LSB + PROBE88_WIDTH * (PROBE88_IS_DATA);
    localparam [31:0] PROBE90_DBUS_LSB = PROBE89_DBUS_LSB + PROBE89_WIDTH * (PROBE89_IS_DATA);
    localparam [31:0] PROBE91_DBUS_LSB = PROBE90_DBUS_LSB + PROBE90_WIDTH * (PROBE90_IS_DATA);
    localparam [31:0] PROBE92_DBUS_LSB = PROBE91_DBUS_LSB + PROBE91_WIDTH * (PROBE91_IS_DATA);
    localparam [31:0] PROBE93_DBUS_LSB = PROBE92_DBUS_LSB + PROBE92_WIDTH * (PROBE92_IS_DATA);
    localparam [31:0] PROBE94_DBUS_LSB = PROBE93_DBUS_LSB + PROBE93_WIDTH * (PROBE93_IS_DATA);
    localparam [31:0] PROBE95_DBUS_LSB = PROBE94_DBUS_LSB + PROBE94_WIDTH * (PROBE94_IS_DATA);
    localparam [31:0] PROBE96_DBUS_LSB = PROBE95_DBUS_LSB + PROBE95_WIDTH * (PROBE95_IS_DATA);
    localparam [31:0] PROBE97_DBUS_LSB = PROBE96_DBUS_LSB + PROBE96_WIDTH * (PROBE96_IS_DATA);
    localparam [31:0] PROBE98_DBUS_LSB = PROBE97_DBUS_LSB + PROBE97_WIDTH * (PROBE97_IS_DATA);
    localparam [31:0] PROBE99_DBUS_LSB = PROBE98_DBUS_LSB + PROBE98_WIDTH * (PROBE98_IS_DATA);
    localparam [31:0] PROBE100_DBUS_LSB = PROBE99_DBUS_LSB + PROBE99_WIDTH * (PROBE99_IS_DATA);
    localparam [31:0] PROBE101_DBUS_LSB = PROBE100_DBUS_LSB + PROBE100_WIDTH * (PROBE100_IS_DATA);
    localparam [31:0] PROBE102_DBUS_LSB = PROBE101_DBUS_LSB + PROBE101_WIDTH * (PROBE101_IS_DATA);
    localparam [31:0] PROBE103_DBUS_LSB = PROBE102_DBUS_LSB + PROBE102_WIDTH * (PROBE102_IS_DATA);
    localparam [31:0] PROBE104_DBUS_LSB = PROBE103_DBUS_LSB + PROBE103_WIDTH * (PROBE103_IS_DATA);
    localparam [31:0] PROBE105_DBUS_LSB = PROBE104_DBUS_LSB + PROBE104_WIDTH * (PROBE104_IS_DATA);
    localparam [31:0] PROBE106_DBUS_LSB = PROBE105_DBUS_LSB + PROBE105_WIDTH * (PROBE105_IS_DATA);
    localparam [31:0] PROBE107_DBUS_LSB = PROBE106_DBUS_LSB + PROBE106_WIDTH * (PROBE106_IS_DATA);
    localparam [31:0] PROBE108_DBUS_LSB = PROBE107_DBUS_LSB + PROBE107_WIDTH * (PROBE107_IS_DATA);
    localparam [31:0] PROBE109_DBUS_LSB = PROBE108_DBUS_LSB + PROBE108_WIDTH * (PROBE108_IS_DATA);
    localparam [31:0] PROBE110_DBUS_LSB = PROBE109_DBUS_LSB + PROBE109_WIDTH * (PROBE109_IS_DATA);
    localparam [31:0] PROBE111_DBUS_LSB = PROBE110_DBUS_LSB + PROBE110_WIDTH * (PROBE110_IS_DATA);
    localparam [31:0] PROBE112_DBUS_LSB = PROBE111_DBUS_LSB + PROBE111_WIDTH * (PROBE111_IS_DATA);
    localparam [31:0] PROBE113_DBUS_LSB = PROBE112_DBUS_LSB + PROBE112_WIDTH * (PROBE112_IS_DATA);
    localparam [31:0] PROBE114_DBUS_LSB = PROBE113_DBUS_LSB + PROBE113_WIDTH * (PROBE113_IS_DATA);
    localparam [31:0] PROBE115_DBUS_LSB = PROBE114_DBUS_LSB + PROBE114_WIDTH * (PROBE114_IS_DATA);
    localparam [31:0] PROBE116_DBUS_LSB = PROBE115_DBUS_LSB + PROBE115_WIDTH * (PROBE115_IS_DATA);
    localparam [31:0] PROBE117_DBUS_LSB = PROBE116_DBUS_LSB + PROBE116_WIDTH * (PROBE116_IS_DATA);
    localparam [31:0] PROBE118_DBUS_LSB = PROBE117_DBUS_LSB + PROBE117_WIDTH * (PROBE117_IS_DATA);
    localparam [31:0] PROBE119_DBUS_LSB = PROBE118_DBUS_LSB + PROBE118_WIDTH * (PROBE118_IS_DATA);
    localparam [31:0] PROBE120_DBUS_LSB = PROBE119_DBUS_LSB + PROBE119_WIDTH * (PROBE119_IS_DATA);
    localparam [31:0] PROBE121_DBUS_LSB = PROBE120_DBUS_LSB + PROBE120_WIDTH * (PROBE120_IS_DATA);
    localparam [31:0] PROBE122_DBUS_LSB = PROBE121_DBUS_LSB + PROBE121_WIDTH * (PROBE121_IS_DATA);
    localparam [31:0] PROBE123_DBUS_LSB = PROBE122_DBUS_LSB + PROBE122_WIDTH * (PROBE122_IS_DATA);
    localparam [31:0] PROBE124_DBUS_LSB = PROBE123_DBUS_LSB + PROBE123_WIDTH * (PROBE123_IS_DATA);
    localparam [31:0] PROBE125_DBUS_LSB = PROBE124_DBUS_LSB + PROBE124_WIDTH * (PROBE124_IS_DATA);
    localparam [31:0] PROBE126_DBUS_LSB = PROBE125_DBUS_LSB + PROBE125_WIDTH * (PROBE125_IS_DATA);
    localparam [31:0] PROBE127_DBUS_LSB = PROBE126_DBUS_LSB + PROBE126_WIDTH * (PROBE126_IS_DATA);
    localparam [31:0] PROBE128_DBUS_LSB = PROBE127_DBUS_LSB + PROBE127_WIDTH * (PROBE127_IS_DATA);
    localparam [31:0] PROBE129_DBUS_LSB = PROBE128_DBUS_LSB + PROBE128_WIDTH * (PROBE128_IS_DATA);
    localparam [31:0] PROBE130_DBUS_LSB = PROBE129_DBUS_LSB + PROBE129_WIDTH * (PROBE129_IS_DATA);
    localparam [31:0] PROBE131_DBUS_LSB = PROBE130_DBUS_LSB + PROBE130_WIDTH * (PROBE130_IS_DATA);
    localparam [31:0] PROBE132_DBUS_LSB = PROBE131_DBUS_LSB + PROBE131_WIDTH * (PROBE131_IS_DATA);
    localparam [31:0] PROBE133_DBUS_LSB = PROBE132_DBUS_LSB + PROBE132_WIDTH * (PROBE132_IS_DATA);
    localparam [31:0] PROBE134_DBUS_LSB = PROBE133_DBUS_LSB + PROBE133_WIDTH * (PROBE133_IS_DATA);
    localparam [31:0] PROBE135_DBUS_LSB = PROBE134_DBUS_LSB + PROBE134_WIDTH * (PROBE134_IS_DATA);
    localparam [31:0] PROBE136_DBUS_LSB = PROBE135_DBUS_LSB + PROBE135_WIDTH * (PROBE135_IS_DATA);
    localparam [31:0] PROBE137_DBUS_LSB = PROBE136_DBUS_LSB + PROBE136_WIDTH * (PROBE136_IS_DATA);
    localparam [31:0] PROBE138_DBUS_LSB = PROBE137_DBUS_LSB + PROBE137_WIDTH * (PROBE137_IS_DATA);
    localparam [31:0] PROBE139_DBUS_LSB = PROBE138_DBUS_LSB + PROBE138_WIDTH * (PROBE138_IS_DATA);
    localparam [31:0] PROBE140_DBUS_LSB = PROBE139_DBUS_LSB + PROBE139_WIDTH * (PROBE139_IS_DATA);
    localparam [31:0] PROBE141_DBUS_LSB = PROBE140_DBUS_LSB + PROBE140_WIDTH * (PROBE140_IS_DATA);
    localparam [31:0] PROBE142_DBUS_LSB = PROBE141_DBUS_LSB + PROBE141_WIDTH * (PROBE141_IS_DATA);
    localparam [31:0] PROBE143_DBUS_LSB = PROBE142_DBUS_LSB + PROBE142_WIDTH * (PROBE142_IS_DATA);
    localparam [31:0] PROBE144_DBUS_LSB = PROBE143_DBUS_LSB + PROBE143_WIDTH * (PROBE143_IS_DATA);
    localparam [31:0] PROBE145_DBUS_LSB = PROBE144_DBUS_LSB + PROBE144_WIDTH * (PROBE144_IS_DATA);
    localparam [31:0] PROBE146_DBUS_LSB = PROBE145_DBUS_LSB + PROBE145_WIDTH * (PROBE145_IS_DATA);
    localparam [31:0] PROBE147_DBUS_LSB = PROBE146_DBUS_LSB + PROBE146_WIDTH * (PROBE146_IS_DATA);
    localparam [31:0] PROBE148_DBUS_LSB = PROBE147_DBUS_LSB + PROBE147_WIDTH * (PROBE147_IS_DATA);
    localparam [31:0] PROBE149_DBUS_LSB = PROBE148_DBUS_LSB + PROBE148_WIDTH * (PROBE148_IS_DATA);
    localparam [31:0] PROBE150_DBUS_LSB = PROBE149_DBUS_LSB + PROBE149_WIDTH * (PROBE149_IS_DATA);
    localparam [31:0] PROBE151_DBUS_LSB = PROBE150_DBUS_LSB + PROBE150_WIDTH * (PROBE150_IS_DATA);
    localparam [31:0] PROBE152_DBUS_LSB = PROBE151_DBUS_LSB + PROBE151_WIDTH * (PROBE151_IS_DATA);
    localparam [31:0] PROBE153_DBUS_LSB = PROBE152_DBUS_LSB + PROBE152_WIDTH * (PROBE152_IS_DATA);
    localparam [31:0] PROBE154_DBUS_LSB = PROBE153_DBUS_LSB + PROBE153_WIDTH * (PROBE153_IS_DATA);
    localparam [31:0] PROBE155_DBUS_LSB = PROBE154_DBUS_LSB + PROBE154_WIDTH * (PROBE154_IS_DATA);
    localparam [31:0] PROBE156_DBUS_LSB = PROBE155_DBUS_LSB + PROBE155_WIDTH * (PROBE155_IS_DATA);
    localparam [31:0] PROBE157_DBUS_LSB = PROBE156_DBUS_LSB + PROBE156_WIDTH * (PROBE156_IS_DATA);
    localparam [31:0] PROBE158_DBUS_LSB = PROBE157_DBUS_LSB + PROBE157_WIDTH * (PROBE157_IS_DATA);
    localparam [31:0] PROBE159_DBUS_LSB = PROBE158_DBUS_LSB + PROBE158_WIDTH * (PROBE158_IS_DATA);
    localparam [31:0] PROBE160_DBUS_LSB = PROBE159_DBUS_LSB + PROBE159_WIDTH * (PROBE159_IS_DATA);
    localparam [31:0] PROBE161_DBUS_LSB = PROBE160_DBUS_LSB + PROBE160_WIDTH * (PROBE160_IS_DATA);
    localparam [31:0] PROBE162_DBUS_LSB = PROBE161_DBUS_LSB + PROBE161_WIDTH * (PROBE161_IS_DATA);
    localparam [31:0] PROBE163_DBUS_LSB = PROBE162_DBUS_LSB + PROBE162_WIDTH * (PROBE162_IS_DATA);
    localparam [31:0] PROBE164_DBUS_LSB = PROBE163_DBUS_LSB + PROBE163_WIDTH * (PROBE163_IS_DATA);
    localparam [31:0] PROBE165_DBUS_LSB = PROBE164_DBUS_LSB + PROBE164_WIDTH * (PROBE164_IS_DATA);
    localparam [31:0] PROBE166_DBUS_LSB = PROBE165_DBUS_LSB + PROBE165_WIDTH * (PROBE165_IS_DATA);
    localparam [31:0] PROBE167_DBUS_LSB = PROBE166_DBUS_LSB + PROBE166_WIDTH * (PROBE166_IS_DATA);
    localparam [31:0] PROBE168_DBUS_LSB = PROBE167_DBUS_LSB + PROBE167_WIDTH * (PROBE167_IS_DATA);
    localparam [31:0] PROBE169_DBUS_LSB = PROBE168_DBUS_LSB + PROBE168_WIDTH * (PROBE168_IS_DATA);
    localparam [31:0] PROBE170_DBUS_LSB = PROBE169_DBUS_LSB + PROBE169_WIDTH * (PROBE169_IS_DATA);
    localparam [31:0] PROBE171_DBUS_LSB = PROBE170_DBUS_LSB + PROBE170_WIDTH * (PROBE170_IS_DATA);
    localparam [31:0] PROBE172_DBUS_LSB = PROBE171_DBUS_LSB + PROBE171_WIDTH * (PROBE171_IS_DATA);
    localparam [31:0] PROBE173_DBUS_LSB = PROBE172_DBUS_LSB + PROBE172_WIDTH * (PROBE172_IS_DATA);
    localparam [31:0] PROBE174_DBUS_LSB = PROBE173_DBUS_LSB + PROBE173_WIDTH * (PROBE173_IS_DATA);
    localparam [31:0] PROBE175_DBUS_LSB = PROBE174_DBUS_LSB + PROBE174_WIDTH * (PROBE174_IS_DATA);
    localparam [31:0] PROBE176_DBUS_LSB = PROBE175_DBUS_LSB + PROBE175_WIDTH * (PROBE175_IS_DATA);
    localparam [31:0] PROBE177_DBUS_LSB = PROBE176_DBUS_LSB + PROBE176_WIDTH * (PROBE176_IS_DATA);
    localparam [31:0] PROBE178_DBUS_LSB = PROBE177_DBUS_LSB + PROBE177_WIDTH * (PROBE177_IS_DATA);
    localparam [31:0] PROBE179_DBUS_LSB = PROBE178_DBUS_LSB + PROBE178_WIDTH * (PROBE178_IS_DATA);
    localparam [31:0] PROBE180_DBUS_LSB = PROBE179_DBUS_LSB + PROBE179_WIDTH * (PROBE179_IS_DATA);
    localparam [31:0] PROBE181_DBUS_LSB = PROBE180_DBUS_LSB + PROBE180_WIDTH * (PROBE180_IS_DATA);
    localparam [31:0] PROBE182_DBUS_LSB = PROBE181_DBUS_LSB + PROBE181_WIDTH * (PROBE181_IS_DATA);
    localparam [31:0] PROBE183_DBUS_LSB = PROBE182_DBUS_LSB + PROBE182_WIDTH * (PROBE182_IS_DATA);
    localparam [31:0] PROBE184_DBUS_LSB = PROBE183_DBUS_LSB + PROBE183_WIDTH * (PROBE183_IS_DATA);
    localparam [31:0] PROBE185_DBUS_LSB = PROBE184_DBUS_LSB + PROBE184_WIDTH * (PROBE184_IS_DATA);
    localparam [31:0] PROBE186_DBUS_LSB = PROBE185_DBUS_LSB + PROBE185_WIDTH * (PROBE185_IS_DATA);
    localparam [31:0] PROBE187_DBUS_LSB = PROBE186_DBUS_LSB + PROBE186_WIDTH * (PROBE186_IS_DATA);
    localparam [31:0] PROBE188_DBUS_LSB = PROBE187_DBUS_LSB + PROBE187_WIDTH * (PROBE187_IS_DATA);
    localparam [31:0] PROBE189_DBUS_LSB = PROBE188_DBUS_LSB + PROBE188_WIDTH * (PROBE188_IS_DATA);
    localparam [31:0] PROBE190_DBUS_LSB = PROBE189_DBUS_LSB + PROBE189_WIDTH * (PROBE189_IS_DATA);
    localparam [31:0] PROBE191_DBUS_LSB = PROBE190_DBUS_LSB + PROBE190_WIDTH * (PROBE190_IS_DATA);
    localparam [31:0] PROBE192_DBUS_LSB = PROBE191_DBUS_LSB + PROBE191_WIDTH * (PROBE191_IS_DATA);
    localparam [31:0] PROBE193_DBUS_LSB = PROBE192_DBUS_LSB + PROBE192_WIDTH * (PROBE192_IS_DATA);
    localparam [31:0] PROBE194_DBUS_LSB = PROBE193_DBUS_LSB + PROBE193_WIDTH * (PROBE193_IS_DATA);
    localparam [31:0] PROBE195_DBUS_LSB = PROBE194_DBUS_LSB + PROBE194_WIDTH * (PROBE194_IS_DATA);
    localparam [31:0] PROBE196_DBUS_LSB = PROBE195_DBUS_LSB + PROBE195_WIDTH * (PROBE195_IS_DATA);
    localparam [31:0] PROBE197_DBUS_LSB = PROBE196_DBUS_LSB + PROBE196_WIDTH * (PROBE196_IS_DATA);
    localparam [31:0] PROBE198_DBUS_LSB = PROBE197_DBUS_LSB + PROBE197_WIDTH * (PROBE197_IS_DATA);
    localparam [31:0] PROBE199_DBUS_LSB = PROBE198_DBUS_LSB + PROBE198_WIDTH * (PROBE198_IS_DATA);
    localparam [31:0] PROBE200_DBUS_LSB = PROBE199_DBUS_LSB + PROBE199_WIDTH * (PROBE199_IS_DATA);
    localparam [31:0] PROBE201_DBUS_LSB = PROBE200_DBUS_LSB + PROBE200_WIDTH * (PROBE200_IS_DATA);
    localparam [31:0] PROBE202_DBUS_LSB = PROBE201_DBUS_LSB + PROBE201_WIDTH * (PROBE201_IS_DATA);
    localparam [31:0] PROBE203_DBUS_LSB = PROBE202_DBUS_LSB + PROBE202_WIDTH * (PROBE202_IS_DATA);
    localparam [31:0] PROBE204_DBUS_LSB = PROBE203_DBUS_LSB + PROBE203_WIDTH * (PROBE203_IS_DATA);
    localparam [31:0] PROBE205_DBUS_LSB = PROBE204_DBUS_LSB + PROBE204_WIDTH * (PROBE204_IS_DATA);
    localparam [31:0] PROBE206_DBUS_LSB = PROBE205_DBUS_LSB + PROBE205_WIDTH * (PROBE205_IS_DATA);
    localparam [31:0] PROBE207_DBUS_LSB = PROBE206_DBUS_LSB + PROBE206_WIDTH * (PROBE206_IS_DATA);
    localparam [31:0] PROBE208_DBUS_LSB = PROBE207_DBUS_LSB + PROBE207_WIDTH * (PROBE207_IS_DATA);
    localparam [31:0] PROBE209_DBUS_LSB = PROBE208_DBUS_LSB + PROBE208_WIDTH * (PROBE208_IS_DATA);
    localparam [31:0] PROBE210_DBUS_LSB = PROBE209_DBUS_LSB + PROBE209_WIDTH * (PROBE209_IS_DATA);
    localparam [31:0] PROBE211_DBUS_LSB = PROBE210_DBUS_LSB + PROBE210_WIDTH * (PROBE210_IS_DATA);
    localparam [31:0] PROBE212_DBUS_LSB = PROBE211_DBUS_LSB + PROBE211_WIDTH * (PROBE211_IS_DATA);
    localparam [31:0] PROBE213_DBUS_LSB = PROBE212_DBUS_LSB + PROBE212_WIDTH * (PROBE212_IS_DATA);
    localparam [31:0] PROBE214_DBUS_LSB = PROBE213_DBUS_LSB + PROBE213_WIDTH * (PROBE213_IS_DATA);
    localparam [31:0] PROBE215_DBUS_LSB = PROBE214_DBUS_LSB + PROBE214_WIDTH * (PROBE214_IS_DATA);
    localparam [31:0] PROBE216_DBUS_LSB = PROBE215_DBUS_LSB + PROBE215_WIDTH * (PROBE215_IS_DATA);
    localparam [31:0] PROBE217_DBUS_LSB = PROBE216_DBUS_LSB + PROBE216_WIDTH * (PROBE216_IS_DATA);
    localparam [31:0] PROBE218_DBUS_LSB = PROBE217_DBUS_LSB + PROBE217_WIDTH * (PROBE217_IS_DATA);
    localparam [31:0] PROBE219_DBUS_LSB = PROBE218_DBUS_LSB + PROBE218_WIDTH * (PROBE218_IS_DATA);
    localparam [31:0] PROBE220_DBUS_LSB = PROBE219_DBUS_LSB + PROBE219_WIDTH * (PROBE219_IS_DATA);
    localparam [31:0] PROBE221_DBUS_LSB = PROBE220_DBUS_LSB + PROBE220_WIDTH * (PROBE220_IS_DATA);
    localparam [31:0] PROBE222_DBUS_LSB = PROBE221_DBUS_LSB + PROBE221_WIDTH * (PROBE221_IS_DATA);
    localparam [31:0] PROBE223_DBUS_LSB = PROBE222_DBUS_LSB + PROBE222_WIDTH * (PROBE222_IS_DATA);
    localparam [31:0] PROBE224_DBUS_LSB = PROBE223_DBUS_LSB + PROBE223_WIDTH * (PROBE223_IS_DATA);
    localparam [31:0] PROBE225_DBUS_LSB = PROBE224_DBUS_LSB + PROBE224_WIDTH * (PROBE224_IS_DATA);
    localparam [31:0] PROBE226_DBUS_LSB = PROBE225_DBUS_LSB + PROBE225_WIDTH * (PROBE225_IS_DATA);
    localparam [31:0] PROBE227_DBUS_LSB = PROBE226_DBUS_LSB + PROBE226_WIDTH * (PROBE226_IS_DATA);
    localparam [31:0] PROBE228_DBUS_LSB = PROBE227_DBUS_LSB + PROBE227_WIDTH * (PROBE227_IS_DATA);
    localparam [31:0] PROBE229_DBUS_LSB = PROBE228_DBUS_LSB + PROBE228_WIDTH * (PROBE228_IS_DATA);
    localparam [31:0] PROBE230_DBUS_LSB = PROBE229_DBUS_LSB + PROBE229_WIDTH * (PROBE229_IS_DATA);
    localparam [31:0] PROBE231_DBUS_LSB = PROBE230_DBUS_LSB + PROBE230_WIDTH * (PROBE230_IS_DATA);
    localparam [31:0] PROBE232_DBUS_LSB = PROBE231_DBUS_LSB + PROBE231_WIDTH * (PROBE231_IS_DATA);
    localparam [31:0] PROBE233_DBUS_LSB = PROBE232_DBUS_LSB + PROBE232_WIDTH * (PROBE232_IS_DATA);
    localparam [31:0] PROBE234_DBUS_LSB = PROBE233_DBUS_LSB + PROBE233_WIDTH * (PROBE233_IS_DATA);
    localparam [31:0] PROBE235_DBUS_LSB = PROBE234_DBUS_LSB + PROBE234_WIDTH * (PROBE234_IS_DATA);
    localparam [31:0] PROBE236_DBUS_LSB = PROBE235_DBUS_LSB + PROBE235_WIDTH * (PROBE235_IS_DATA);
    localparam [31:0] PROBE237_DBUS_LSB = PROBE236_DBUS_LSB + PROBE236_WIDTH * (PROBE236_IS_DATA);
    localparam [31:0] PROBE238_DBUS_LSB = PROBE237_DBUS_LSB + PROBE237_WIDTH * (PROBE237_IS_DATA);
    localparam [31:0] PROBE239_DBUS_LSB = PROBE238_DBUS_LSB + PROBE238_WIDTH * (PROBE238_IS_DATA);
    localparam [31:0] PROBE240_DBUS_LSB = PROBE239_DBUS_LSB + PROBE239_WIDTH * (PROBE239_IS_DATA);
    localparam [31:0] PROBE241_DBUS_LSB = PROBE240_DBUS_LSB + PROBE240_WIDTH * (PROBE240_IS_DATA);
    localparam [31:0] PROBE242_DBUS_LSB = PROBE241_DBUS_LSB + PROBE241_WIDTH * (PROBE241_IS_DATA);
    localparam [31:0] PROBE243_DBUS_LSB = PROBE242_DBUS_LSB + PROBE242_WIDTH * (PROBE242_IS_DATA);
    localparam [31:0] PROBE244_DBUS_LSB = PROBE243_DBUS_LSB + PROBE243_WIDTH * (PROBE243_IS_DATA);
    localparam [31:0] PROBE245_DBUS_LSB = PROBE244_DBUS_LSB + PROBE244_WIDTH * (PROBE244_IS_DATA);
    localparam [31:0] PROBE246_DBUS_LSB = PROBE245_DBUS_LSB + PROBE245_WIDTH * (PROBE245_IS_DATA);
    localparam [31:0] PROBE247_DBUS_LSB = PROBE246_DBUS_LSB + PROBE246_WIDTH * (PROBE246_IS_DATA);
    localparam [31:0] PROBE248_DBUS_LSB = PROBE247_DBUS_LSB + PROBE247_WIDTH * (PROBE247_IS_DATA);
    localparam [31:0] PROBE249_DBUS_LSB = PROBE248_DBUS_LSB + PROBE248_WIDTH * (PROBE248_IS_DATA);
    localparam [31:0] PROBE250_DBUS_LSB = PROBE249_DBUS_LSB + PROBE249_WIDTH * (PROBE249_IS_DATA);
    localparam [31:0] PROBE251_DBUS_LSB = PROBE250_DBUS_LSB + PROBE250_WIDTH * (PROBE250_IS_DATA);
    localparam [31:0] PROBE252_DBUS_LSB = PROBE251_DBUS_LSB + PROBE251_WIDTH * (PROBE251_IS_DATA);
    localparam [31:0] PROBE253_DBUS_LSB = PROBE252_DBUS_LSB + PROBE252_WIDTH * (PROBE252_IS_DATA);
    localparam [31:0] PROBE254_DBUS_LSB = PROBE253_DBUS_LSB + PROBE253_WIDTH * (PROBE253_IS_DATA);
    localparam [31:0] PROBE255_DBUS_LSB = PROBE254_DBUS_LSB + PROBE254_WIDTH * (PROBE254_IS_DATA);

    localparam [31:0] PROBE0_TBUS_LSB = 0;
    localparam [31:0] PROBE1_TBUS_LSB = PROBE0_TBUS_LSB + 1 * (PROBE0_IS_TRIGGER);
    localparam [31:0] PROBE2_TBUS_LSB = PROBE1_TBUS_LSB + 1 * (PROBE1_IS_TRIGGER);
    localparam [31:0] PROBE3_TBUS_LSB = PROBE2_TBUS_LSB + 1 * (PROBE2_IS_TRIGGER);
    localparam [31:0] PROBE4_TBUS_LSB = PROBE3_TBUS_LSB + 1 * (PROBE3_IS_TRIGGER);
    localparam [31:0] PROBE5_TBUS_LSB = PROBE4_TBUS_LSB + 1 * (PROBE4_IS_TRIGGER);
    localparam [31:0] PROBE6_TBUS_LSB = PROBE5_TBUS_LSB + 1 * (PROBE5_IS_TRIGGER);
    localparam [31:0] PROBE7_TBUS_LSB = PROBE6_TBUS_LSB + 1 * (PROBE6_IS_TRIGGER);
    localparam [31:0] PROBE8_TBUS_LSB = PROBE7_TBUS_LSB + 1 * (PROBE7_IS_TRIGGER);
    localparam [31:0] PROBE9_TBUS_LSB = PROBE8_TBUS_LSB + 1 * (PROBE8_IS_TRIGGER);
    localparam [31:0] PROBE10_TBUS_LSB = PROBE9_TBUS_LSB + 1 * (PROBE9_IS_TRIGGER);
    localparam [31:0] PROBE11_TBUS_LSB = PROBE10_TBUS_LSB + 1 * (PROBE10_IS_TRIGGER);
    localparam [31:0] PROBE12_TBUS_LSB = PROBE11_TBUS_LSB + 1 * (PROBE11_IS_TRIGGER);
    localparam [31:0] PROBE13_TBUS_LSB = PROBE12_TBUS_LSB + 1 * (PROBE12_IS_TRIGGER);
    localparam [31:0] PROBE14_TBUS_LSB = PROBE13_TBUS_LSB + 1 * (PROBE13_IS_TRIGGER);
    localparam [31:0] PROBE15_TBUS_LSB = PROBE14_TBUS_LSB + 1 * (PROBE14_IS_TRIGGER);
    localparam [31:0] PROBE16_TBUS_LSB = PROBE15_TBUS_LSB + 1 * (PROBE15_IS_TRIGGER);
    localparam [31:0] PROBE17_TBUS_LSB = PROBE16_TBUS_LSB + 1 * (PROBE16_IS_TRIGGER);
    localparam [31:0] PROBE18_TBUS_LSB = PROBE17_TBUS_LSB + 1 * (PROBE17_IS_TRIGGER);
    localparam [31:0] PROBE19_TBUS_LSB = PROBE18_TBUS_LSB + 1 * (PROBE18_IS_TRIGGER);
    localparam [31:0] PROBE20_TBUS_LSB = PROBE19_TBUS_LSB + 1 * (PROBE19_IS_TRIGGER);
    localparam [31:0] PROBE21_TBUS_LSB = PROBE20_TBUS_LSB + 1 * (PROBE20_IS_TRIGGER);
    localparam [31:0] PROBE22_TBUS_LSB = PROBE21_TBUS_LSB + 1 * (PROBE21_IS_TRIGGER);
    localparam [31:0] PROBE23_TBUS_LSB = PROBE22_TBUS_LSB + 1 * (PROBE22_IS_TRIGGER);
    localparam [31:0] PROBE24_TBUS_LSB = PROBE23_TBUS_LSB + 1 * (PROBE23_IS_TRIGGER);
    localparam [31:0] PROBE25_TBUS_LSB = PROBE24_TBUS_LSB + 1 * (PROBE24_IS_TRIGGER);
    localparam [31:0] PROBE26_TBUS_LSB = PROBE25_TBUS_LSB + 1 * (PROBE25_IS_TRIGGER);
    localparam [31:0] PROBE27_TBUS_LSB = PROBE26_TBUS_LSB + 1 * (PROBE26_IS_TRIGGER);
    localparam [31:0] PROBE28_TBUS_LSB = PROBE27_TBUS_LSB + 1 * (PROBE27_IS_TRIGGER);
    localparam [31:0] PROBE29_TBUS_LSB = PROBE28_TBUS_LSB + 1 * (PROBE28_IS_TRIGGER);
    localparam [31:0] PROBE30_TBUS_LSB = PROBE29_TBUS_LSB + 1 * (PROBE29_IS_TRIGGER);
    localparam [31:0] PROBE31_TBUS_LSB = PROBE30_TBUS_LSB + 1 * (PROBE30_IS_TRIGGER);
    localparam [31:0] PROBE32_TBUS_LSB = PROBE31_TBUS_LSB + 1 * (PROBE31_IS_TRIGGER);
    localparam [31:0] PROBE33_TBUS_LSB = PROBE32_TBUS_LSB + 1 * (PROBE32_IS_TRIGGER);
    localparam [31:0] PROBE34_TBUS_LSB = PROBE33_TBUS_LSB + 1 * (PROBE33_IS_TRIGGER);
    localparam [31:0] PROBE35_TBUS_LSB = PROBE34_TBUS_LSB + 1 * (PROBE34_IS_TRIGGER);
    localparam [31:0] PROBE36_TBUS_LSB = PROBE35_TBUS_LSB + 1 * (PROBE35_IS_TRIGGER);
    localparam [31:0] PROBE37_TBUS_LSB = PROBE36_TBUS_LSB + 1 * (PROBE36_IS_TRIGGER);
    localparam [31:0] PROBE38_TBUS_LSB = PROBE37_TBUS_LSB + 1 * (PROBE37_IS_TRIGGER);
    localparam [31:0] PROBE39_TBUS_LSB = PROBE38_TBUS_LSB + 1 * (PROBE38_IS_TRIGGER);
    localparam [31:0] PROBE40_TBUS_LSB = PROBE39_TBUS_LSB + 1 * (PROBE39_IS_TRIGGER);
    localparam [31:0] PROBE41_TBUS_LSB = PROBE40_TBUS_LSB + 1 * (PROBE40_IS_TRIGGER);
    localparam [31:0] PROBE42_TBUS_LSB = PROBE41_TBUS_LSB + 1 * (PROBE41_IS_TRIGGER);
    localparam [31:0] PROBE43_TBUS_LSB = PROBE42_TBUS_LSB + 1 * (PROBE42_IS_TRIGGER);
    localparam [31:0] PROBE44_TBUS_LSB = PROBE43_TBUS_LSB + 1 * (PROBE43_IS_TRIGGER);
    localparam [31:0] PROBE45_TBUS_LSB = PROBE44_TBUS_LSB + 1 * (PROBE44_IS_TRIGGER);
    localparam [31:0] PROBE46_TBUS_LSB = PROBE45_TBUS_LSB + 1 * (PROBE45_IS_TRIGGER);
    localparam [31:0] PROBE47_TBUS_LSB = PROBE46_TBUS_LSB + 1 * (PROBE46_IS_TRIGGER);
    localparam [31:0] PROBE48_TBUS_LSB = PROBE47_TBUS_LSB + 1 * (PROBE47_IS_TRIGGER);
    localparam [31:0] PROBE49_TBUS_LSB = PROBE48_TBUS_LSB + 1 * (PROBE48_IS_TRIGGER);
    localparam [31:0] PROBE50_TBUS_LSB = PROBE49_TBUS_LSB + 1 * (PROBE49_IS_TRIGGER);
    localparam [31:0] PROBE51_TBUS_LSB = PROBE50_TBUS_LSB + 1 * (PROBE50_IS_TRIGGER);
    localparam [31:0] PROBE52_TBUS_LSB = PROBE51_TBUS_LSB + 1 * (PROBE51_IS_TRIGGER);
    localparam [31:0] PROBE53_TBUS_LSB = PROBE52_TBUS_LSB + 1 * (PROBE52_IS_TRIGGER);
    localparam [31:0] PROBE54_TBUS_LSB = PROBE53_TBUS_LSB + 1 * (PROBE53_IS_TRIGGER);
    localparam [31:0] PROBE55_TBUS_LSB = PROBE54_TBUS_LSB + 1 * (PROBE54_IS_TRIGGER);
    localparam [31:0] PROBE56_TBUS_LSB = PROBE55_TBUS_LSB + 1 * (PROBE55_IS_TRIGGER);
    localparam [31:0] PROBE57_TBUS_LSB = PROBE56_TBUS_LSB + 1 * (PROBE56_IS_TRIGGER);
    localparam [31:0] PROBE58_TBUS_LSB = PROBE57_TBUS_LSB + 1 * (PROBE57_IS_TRIGGER);
    localparam [31:0] PROBE59_TBUS_LSB = PROBE58_TBUS_LSB + 1 * (PROBE58_IS_TRIGGER);
    localparam [31:0] PROBE60_TBUS_LSB = PROBE59_TBUS_LSB + 1 * (PROBE59_IS_TRIGGER);
    localparam [31:0] PROBE61_TBUS_LSB = PROBE60_TBUS_LSB + 1 * (PROBE60_IS_TRIGGER);
    localparam [31:0] PROBE62_TBUS_LSB = PROBE61_TBUS_LSB + 1 * (PROBE61_IS_TRIGGER);
    localparam [31:0] PROBE63_TBUS_LSB = PROBE62_TBUS_LSB + 1 * (PROBE62_IS_TRIGGER);
    localparam [31:0] PROBE64_TBUS_LSB = PROBE63_TBUS_LSB + 1 * (PROBE63_IS_TRIGGER);
    localparam [31:0] PROBE65_TBUS_LSB = PROBE64_TBUS_LSB + 1 * (PROBE64_IS_TRIGGER);
    localparam [31:0] PROBE66_TBUS_LSB = PROBE65_TBUS_LSB + 1 * (PROBE65_IS_TRIGGER);
    localparam [31:0] PROBE67_TBUS_LSB = PROBE66_TBUS_LSB + 1 * (PROBE66_IS_TRIGGER);
    localparam [31:0] PROBE68_TBUS_LSB = PROBE67_TBUS_LSB + 1 * (PROBE67_IS_TRIGGER);
    localparam [31:0] PROBE69_TBUS_LSB = PROBE68_TBUS_LSB + 1 * (PROBE68_IS_TRIGGER);
    localparam [31:0] PROBE70_TBUS_LSB = PROBE69_TBUS_LSB + 1 * (PROBE69_IS_TRIGGER);
    localparam [31:0] PROBE71_TBUS_LSB = PROBE70_TBUS_LSB + 1 * (PROBE70_IS_TRIGGER);
    localparam [31:0] PROBE72_TBUS_LSB = PROBE71_TBUS_LSB + 1 * (PROBE71_IS_TRIGGER);
    localparam [31:0] PROBE73_TBUS_LSB = PROBE72_TBUS_LSB + 1 * (PROBE72_IS_TRIGGER);
    localparam [31:0] PROBE74_TBUS_LSB = PROBE73_TBUS_LSB + 1 * (PROBE73_IS_TRIGGER);
    localparam [31:0] PROBE75_TBUS_LSB = PROBE74_TBUS_LSB + 1 * (PROBE74_IS_TRIGGER);
    localparam [31:0] PROBE76_TBUS_LSB = PROBE75_TBUS_LSB + 1 * (PROBE75_IS_TRIGGER);
    localparam [31:0] PROBE77_TBUS_LSB = PROBE76_TBUS_LSB + 1 * (PROBE76_IS_TRIGGER);
    localparam [31:0] PROBE78_TBUS_LSB = PROBE77_TBUS_LSB + 1 * (PROBE77_IS_TRIGGER);
    localparam [31:0] PROBE79_TBUS_LSB = PROBE78_TBUS_LSB + 1 * (PROBE78_IS_TRIGGER);
    localparam [31:0] PROBE80_TBUS_LSB = PROBE79_TBUS_LSB + 1 * (PROBE79_IS_TRIGGER);
    localparam [31:0] PROBE81_TBUS_LSB = PROBE80_TBUS_LSB + 1 * (PROBE80_IS_TRIGGER);
    localparam [31:0] PROBE82_TBUS_LSB = PROBE81_TBUS_LSB + 1 * (PROBE81_IS_TRIGGER);
    localparam [31:0] PROBE83_TBUS_LSB = PROBE82_TBUS_LSB + 1 * (PROBE82_IS_TRIGGER);
    localparam [31:0] PROBE84_TBUS_LSB = PROBE83_TBUS_LSB + 1 * (PROBE83_IS_TRIGGER);
    localparam [31:0] PROBE85_TBUS_LSB = PROBE84_TBUS_LSB + 1 * (PROBE84_IS_TRIGGER);
    localparam [31:0] PROBE86_TBUS_LSB = PROBE85_TBUS_LSB + 1 * (PROBE85_IS_TRIGGER);
    localparam [31:0] PROBE87_TBUS_LSB = PROBE86_TBUS_LSB + 1 * (PROBE86_IS_TRIGGER);
    localparam [31:0] PROBE88_TBUS_LSB = PROBE87_TBUS_LSB + 1 * (PROBE87_IS_TRIGGER);
    localparam [31:0] PROBE89_TBUS_LSB = PROBE88_TBUS_LSB + 1 * (PROBE88_IS_TRIGGER);
    localparam [31:0] PROBE90_TBUS_LSB = PROBE89_TBUS_LSB + 1 * (PROBE89_IS_TRIGGER);
    localparam [31:0] PROBE91_TBUS_LSB = PROBE90_TBUS_LSB + 1 * (PROBE90_IS_TRIGGER);
    localparam [31:0] PROBE92_TBUS_LSB = PROBE91_TBUS_LSB + 1 * (PROBE91_IS_TRIGGER);
    localparam [31:0] PROBE93_TBUS_LSB = PROBE92_TBUS_LSB + 1 * (PROBE92_IS_TRIGGER);
    localparam [31:0] PROBE94_TBUS_LSB = PROBE93_TBUS_LSB + 1 * (PROBE93_IS_TRIGGER);
    localparam [31:0] PROBE95_TBUS_LSB = PROBE94_TBUS_LSB + 1 * (PROBE94_IS_TRIGGER);
    localparam [31:0] PROBE96_TBUS_LSB = PROBE95_TBUS_LSB + 1 * (PROBE95_IS_TRIGGER);
    localparam [31:0] PROBE97_TBUS_LSB = PROBE96_TBUS_LSB + 1 * (PROBE96_IS_TRIGGER);
    localparam [31:0] PROBE98_TBUS_LSB = PROBE97_TBUS_LSB + 1 * (PROBE97_IS_TRIGGER);
    localparam [31:0] PROBE99_TBUS_LSB = PROBE98_TBUS_LSB + 1 * (PROBE98_IS_TRIGGER);
    localparam [31:0] PROBE100_TBUS_LSB = PROBE99_TBUS_LSB + 1 * (PROBE99_IS_TRIGGER);
    localparam [31:0] PROBE101_TBUS_LSB = PROBE100_TBUS_LSB + 1 * (PROBE100_IS_TRIGGER);
    localparam [31:0] PROBE102_TBUS_LSB = PROBE101_TBUS_LSB + 1 * (PROBE101_IS_TRIGGER);
    localparam [31:0] PROBE103_TBUS_LSB = PROBE102_TBUS_LSB + 1 * (PROBE102_IS_TRIGGER);
    localparam [31:0] PROBE104_TBUS_LSB = PROBE103_TBUS_LSB + 1 * (PROBE103_IS_TRIGGER);
    localparam [31:0] PROBE105_TBUS_LSB = PROBE104_TBUS_LSB + 1 * (PROBE104_IS_TRIGGER);
    localparam [31:0] PROBE106_TBUS_LSB = PROBE105_TBUS_LSB + 1 * (PROBE105_IS_TRIGGER);
    localparam [31:0] PROBE107_TBUS_LSB = PROBE106_TBUS_LSB + 1 * (PROBE106_IS_TRIGGER);
    localparam [31:0] PROBE108_TBUS_LSB = PROBE107_TBUS_LSB + 1 * (PROBE107_IS_TRIGGER);
    localparam [31:0] PROBE109_TBUS_LSB = PROBE108_TBUS_LSB + 1 * (PROBE108_IS_TRIGGER);
    localparam [31:0] PROBE110_TBUS_LSB = PROBE109_TBUS_LSB + 1 * (PROBE109_IS_TRIGGER);
    localparam [31:0] PROBE111_TBUS_LSB = PROBE110_TBUS_LSB + 1 * (PROBE110_IS_TRIGGER);
    localparam [31:0] PROBE112_TBUS_LSB = PROBE111_TBUS_LSB + 1 * (PROBE111_IS_TRIGGER);
    localparam [31:0] PROBE113_TBUS_LSB = PROBE112_TBUS_LSB + 1 * (PROBE112_IS_TRIGGER);
    localparam [31:0] PROBE114_TBUS_LSB = PROBE113_TBUS_LSB + 1 * (PROBE113_IS_TRIGGER);
    localparam [31:0] PROBE115_TBUS_LSB = PROBE114_TBUS_LSB + 1 * (PROBE114_IS_TRIGGER);
    localparam [31:0] PROBE116_TBUS_LSB = PROBE115_TBUS_LSB + 1 * (PROBE115_IS_TRIGGER);
    localparam [31:0] PROBE117_TBUS_LSB = PROBE116_TBUS_LSB + 1 * (PROBE116_IS_TRIGGER);
    localparam [31:0] PROBE118_TBUS_LSB = PROBE117_TBUS_LSB + 1 * (PROBE117_IS_TRIGGER);
    localparam [31:0] PROBE119_TBUS_LSB = PROBE118_TBUS_LSB + 1 * (PROBE118_IS_TRIGGER);
    localparam [31:0] PROBE120_TBUS_LSB = PROBE119_TBUS_LSB + 1 * (PROBE119_IS_TRIGGER);
    localparam [31:0] PROBE121_TBUS_LSB = PROBE120_TBUS_LSB + 1 * (PROBE120_IS_TRIGGER);
    localparam [31:0] PROBE122_TBUS_LSB = PROBE121_TBUS_LSB + 1 * (PROBE121_IS_TRIGGER);
    localparam [31:0] PROBE123_TBUS_LSB = PROBE122_TBUS_LSB + 1 * (PROBE122_IS_TRIGGER);
    localparam [31:0] PROBE124_TBUS_LSB = PROBE123_TBUS_LSB + 1 * (PROBE123_IS_TRIGGER);
    localparam [31:0] PROBE125_TBUS_LSB = PROBE124_TBUS_LSB + 1 * (PROBE124_IS_TRIGGER);
    localparam [31:0] PROBE126_TBUS_LSB = PROBE125_TBUS_LSB + 1 * (PROBE125_IS_TRIGGER);
    localparam [31:0] PROBE127_TBUS_LSB = PROBE126_TBUS_LSB + 1 * (PROBE126_IS_TRIGGER);
    localparam [31:0] PROBE128_TBUS_LSB = PROBE127_TBUS_LSB + 1 * (PROBE127_IS_TRIGGER);
    localparam [31:0] PROBE129_TBUS_LSB = PROBE128_TBUS_LSB + 1 * (PROBE128_IS_TRIGGER);
    localparam [31:0] PROBE130_TBUS_LSB = PROBE129_TBUS_LSB + 1 * (PROBE129_IS_TRIGGER);
    localparam [31:0] PROBE131_TBUS_LSB = PROBE130_TBUS_LSB + 1 * (PROBE130_IS_TRIGGER);
    localparam [31:0] PROBE132_TBUS_LSB = PROBE131_TBUS_LSB + 1 * (PROBE131_IS_TRIGGER);
    localparam [31:0] PROBE133_TBUS_LSB = PROBE132_TBUS_LSB + 1 * (PROBE132_IS_TRIGGER);
    localparam [31:0] PROBE134_TBUS_LSB = PROBE133_TBUS_LSB + 1 * (PROBE133_IS_TRIGGER);
    localparam [31:0] PROBE135_TBUS_LSB = PROBE134_TBUS_LSB + 1 * (PROBE134_IS_TRIGGER);
    localparam [31:0] PROBE136_TBUS_LSB = PROBE135_TBUS_LSB + 1 * (PROBE135_IS_TRIGGER);
    localparam [31:0] PROBE137_TBUS_LSB = PROBE136_TBUS_LSB + 1 * (PROBE136_IS_TRIGGER);
    localparam [31:0] PROBE138_TBUS_LSB = PROBE137_TBUS_LSB + 1 * (PROBE137_IS_TRIGGER);
    localparam [31:0] PROBE139_TBUS_LSB = PROBE138_TBUS_LSB + 1 * (PROBE138_IS_TRIGGER);
    localparam [31:0] PROBE140_TBUS_LSB = PROBE139_TBUS_LSB + 1 * (PROBE139_IS_TRIGGER);
    localparam [31:0] PROBE141_TBUS_LSB = PROBE140_TBUS_LSB + 1 * (PROBE140_IS_TRIGGER);
    localparam [31:0] PROBE142_TBUS_LSB = PROBE141_TBUS_LSB + 1 * (PROBE141_IS_TRIGGER);
    localparam [31:0] PROBE143_TBUS_LSB = PROBE142_TBUS_LSB + 1 * (PROBE142_IS_TRIGGER);
    localparam [31:0] PROBE144_TBUS_LSB = PROBE143_TBUS_LSB + 1 * (PROBE143_IS_TRIGGER);
    localparam [31:0] PROBE145_TBUS_LSB = PROBE144_TBUS_LSB + 1 * (PROBE144_IS_TRIGGER);
    localparam [31:0] PROBE146_TBUS_LSB = PROBE145_TBUS_LSB + 1 * (PROBE145_IS_TRIGGER);
    localparam [31:0] PROBE147_TBUS_LSB = PROBE146_TBUS_LSB + 1 * (PROBE146_IS_TRIGGER);
    localparam [31:0] PROBE148_TBUS_LSB = PROBE147_TBUS_LSB + 1 * (PROBE147_IS_TRIGGER);
    localparam [31:0] PROBE149_TBUS_LSB = PROBE148_TBUS_LSB + 1 * (PROBE148_IS_TRIGGER);
    localparam [31:0] PROBE150_TBUS_LSB = PROBE149_TBUS_LSB + 1 * (PROBE149_IS_TRIGGER);
    localparam [31:0] PROBE151_TBUS_LSB = PROBE150_TBUS_LSB + 1 * (PROBE150_IS_TRIGGER);
    localparam [31:0] PROBE152_TBUS_LSB = PROBE151_TBUS_LSB + 1 * (PROBE151_IS_TRIGGER);
    localparam [31:0] PROBE153_TBUS_LSB = PROBE152_TBUS_LSB + 1 * (PROBE152_IS_TRIGGER);
    localparam [31:0] PROBE154_TBUS_LSB = PROBE153_TBUS_LSB + 1 * (PROBE153_IS_TRIGGER);
    localparam [31:0] PROBE155_TBUS_LSB = PROBE154_TBUS_LSB + 1 * (PROBE154_IS_TRIGGER);
    localparam [31:0] PROBE156_TBUS_LSB = PROBE155_TBUS_LSB + 1 * (PROBE155_IS_TRIGGER);
    localparam [31:0] PROBE157_TBUS_LSB = PROBE156_TBUS_LSB + 1 * (PROBE156_IS_TRIGGER);
    localparam [31:0] PROBE158_TBUS_LSB = PROBE157_TBUS_LSB + 1 * (PROBE157_IS_TRIGGER);
    localparam [31:0] PROBE159_TBUS_LSB = PROBE158_TBUS_LSB + 1 * (PROBE158_IS_TRIGGER);
    localparam [31:0] PROBE160_TBUS_LSB = PROBE159_TBUS_LSB + 1 * (PROBE159_IS_TRIGGER);
    localparam [31:0] PROBE161_TBUS_LSB = PROBE160_TBUS_LSB + 1 * (PROBE160_IS_TRIGGER);
    localparam [31:0] PROBE162_TBUS_LSB = PROBE161_TBUS_LSB + 1 * (PROBE161_IS_TRIGGER);
    localparam [31:0] PROBE163_TBUS_LSB = PROBE162_TBUS_LSB + 1 * (PROBE162_IS_TRIGGER);
    localparam [31:0] PROBE164_TBUS_LSB = PROBE163_TBUS_LSB + 1 * (PROBE163_IS_TRIGGER);
    localparam [31:0] PROBE165_TBUS_LSB = PROBE164_TBUS_LSB + 1 * (PROBE164_IS_TRIGGER);
    localparam [31:0] PROBE166_TBUS_LSB = PROBE165_TBUS_LSB + 1 * (PROBE165_IS_TRIGGER);
    localparam [31:0] PROBE167_TBUS_LSB = PROBE166_TBUS_LSB + 1 * (PROBE166_IS_TRIGGER);
    localparam [31:0] PROBE168_TBUS_LSB = PROBE167_TBUS_LSB + 1 * (PROBE167_IS_TRIGGER);
    localparam [31:0] PROBE169_TBUS_LSB = PROBE168_TBUS_LSB + 1 * (PROBE168_IS_TRIGGER);
    localparam [31:0] PROBE170_TBUS_LSB = PROBE169_TBUS_LSB + 1 * (PROBE169_IS_TRIGGER);
    localparam [31:0] PROBE171_TBUS_LSB = PROBE170_TBUS_LSB + 1 * (PROBE170_IS_TRIGGER);
    localparam [31:0] PROBE172_TBUS_LSB = PROBE171_TBUS_LSB + 1 * (PROBE171_IS_TRIGGER);
    localparam [31:0] PROBE173_TBUS_LSB = PROBE172_TBUS_LSB + 1 * (PROBE172_IS_TRIGGER);
    localparam [31:0] PROBE174_TBUS_LSB = PROBE173_TBUS_LSB + 1 * (PROBE173_IS_TRIGGER);
    localparam [31:0] PROBE175_TBUS_LSB = PROBE174_TBUS_LSB + 1 * (PROBE174_IS_TRIGGER);
    localparam [31:0] PROBE176_TBUS_LSB = PROBE175_TBUS_LSB + 1 * (PROBE175_IS_TRIGGER);
    localparam [31:0] PROBE177_TBUS_LSB = PROBE176_TBUS_LSB + 1 * (PROBE176_IS_TRIGGER);
    localparam [31:0] PROBE178_TBUS_LSB = PROBE177_TBUS_LSB + 1 * (PROBE177_IS_TRIGGER);
    localparam [31:0] PROBE179_TBUS_LSB = PROBE178_TBUS_LSB + 1 * (PROBE178_IS_TRIGGER);
    localparam [31:0] PROBE180_TBUS_LSB = PROBE179_TBUS_LSB + 1 * (PROBE179_IS_TRIGGER);
    localparam [31:0] PROBE181_TBUS_LSB = PROBE180_TBUS_LSB + 1 * (PROBE180_IS_TRIGGER);
    localparam [31:0] PROBE182_TBUS_LSB = PROBE181_TBUS_LSB + 1 * (PROBE181_IS_TRIGGER);
    localparam [31:0] PROBE183_TBUS_LSB = PROBE182_TBUS_LSB + 1 * (PROBE182_IS_TRIGGER);
    localparam [31:0] PROBE184_TBUS_LSB = PROBE183_TBUS_LSB + 1 * (PROBE183_IS_TRIGGER);
    localparam [31:0] PROBE185_TBUS_LSB = PROBE184_TBUS_LSB + 1 * (PROBE184_IS_TRIGGER);
    localparam [31:0] PROBE186_TBUS_LSB = PROBE185_TBUS_LSB + 1 * (PROBE185_IS_TRIGGER);
    localparam [31:0] PROBE187_TBUS_LSB = PROBE186_TBUS_LSB + 1 * (PROBE186_IS_TRIGGER);
    localparam [31:0] PROBE188_TBUS_LSB = PROBE187_TBUS_LSB + 1 * (PROBE187_IS_TRIGGER);
    localparam [31:0] PROBE189_TBUS_LSB = PROBE188_TBUS_LSB + 1 * (PROBE188_IS_TRIGGER);
    localparam [31:0] PROBE190_TBUS_LSB = PROBE189_TBUS_LSB + 1 * (PROBE189_IS_TRIGGER);
    localparam [31:0] PROBE191_TBUS_LSB = PROBE190_TBUS_LSB + 1 * (PROBE190_IS_TRIGGER);
    localparam [31:0] PROBE192_TBUS_LSB = PROBE191_TBUS_LSB + 1 * (PROBE191_IS_TRIGGER);
    localparam [31:0] PROBE193_TBUS_LSB = PROBE192_TBUS_LSB + 1 * (PROBE192_IS_TRIGGER);
    localparam [31:0] PROBE194_TBUS_LSB = PROBE193_TBUS_LSB + 1 * (PROBE193_IS_TRIGGER);
    localparam [31:0] PROBE195_TBUS_LSB = PROBE194_TBUS_LSB + 1 * (PROBE194_IS_TRIGGER);
    localparam [31:0] PROBE196_TBUS_LSB = PROBE195_TBUS_LSB + 1 * (PROBE195_IS_TRIGGER);
    localparam [31:0] PROBE197_TBUS_LSB = PROBE196_TBUS_LSB + 1 * (PROBE196_IS_TRIGGER);
    localparam [31:0] PROBE198_TBUS_LSB = PROBE197_TBUS_LSB + 1 * (PROBE197_IS_TRIGGER);
    localparam [31:0] PROBE199_TBUS_LSB = PROBE198_TBUS_LSB + 1 * (PROBE198_IS_TRIGGER);
    localparam [31:0] PROBE200_TBUS_LSB = PROBE199_TBUS_LSB + 1 * (PROBE199_IS_TRIGGER);
    localparam [31:0] PROBE201_TBUS_LSB = PROBE200_TBUS_LSB + 1 * (PROBE200_IS_TRIGGER);
    localparam [31:0] PROBE202_TBUS_LSB = PROBE201_TBUS_LSB + 1 * (PROBE201_IS_TRIGGER);
    localparam [31:0] PROBE203_TBUS_LSB = PROBE202_TBUS_LSB + 1 * (PROBE202_IS_TRIGGER);
    localparam [31:0] PROBE204_TBUS_LSB = PROBE203_TBUS_LSB + 1 * (PROBE203_IS_TRIGGER);
    localparam [31:0] PROBE205_TBUS_LSB = PROBE204_TBUS_LSB + 1 * (PROBE204_IS_TRIGGER);
    localparam [31:0] PROBE206_TBUS_LSB = PROBE205_TBUS_LSB + 1 * (PROBE205_IS_TRIGGER);
    localparam [31:0] PROBE207_TBUS_LSB = PROBE206_TBUS_LSB + 1 * (PROBE206_IS_TRIGGER);
    localparam [31:0] PROBE208_TBUS_LSB = PROBE207_TBUS_LSB + 1 * (PROBE207_IS_TRIGGER);
    localparam [31:0] PROBE209_TBUS_LSB = PROBE208_TBUS_LSB + 1 * (PROBE208_IS_TRIGGER);
    localparam [31:0] PROBE210_TBUS_LSB = PROBE209_TBUS_LSB + 1 * (PROBE209_IS_TRIGGER);
    localparam [31:0] PROBE211_TBUS_LSB = PROBE210_TBUS_LSB + 1 * (PROBE210_IS_TRIGGER);
    localparam [31:0] PROBE212_TBUS_LSB = PROBE211_TBUS_LSB + 1 * (PROBE211_IS_TRIGGER);
    localparam [31:0] PROBE213_TBUS_LSB = PROBE212_TBUS_LSB + 1 * (PROBE212_IS_TRIGGER);
    localparam [31:0] PROBE214_TBUS_LSB = PROBE213_TBUS_LSB + 1 * (PROBE213_IS_TRIGGER);
    localparam [31:0] PROBE215_TBUS_LSB = PROBE214_TBUS_LSB + 1 * (PROBE214_IS_TRIGGER);
    localparam [31:0] PROBE216_TBUS_LSB = PROBE215_TBUS_LSB + 1 * (PROBE215_IS_TRIGGER);
    localparam [31:0] PROBE217_TBUS_LSB = PROBE216_TBUS_LSB + 1 * (PROBE216_IS_TRIGGER);
    localparam [31:0] PROBE218_TBUS_LSB = PROBE217_TBUS_LSB + 1 * (PROBE217_IS_TRIGGER);
    localparam [31:0] PROBE219_TBUS_LSB = PROBE218_TBUS_LSB + 1 * (PROBE218_IS_TRIGGER);
    localparam [31:0] PROBE220_TBUS_LSB = PROBE219_TBUS_LSB + 1 * (PROBE219_IS_TRIGGER);
    localparam [31:0] PROBE221_TBUS_LSB = PROBE220_TBUS_LSB + 1 * (PROBE220_IS_TRIGGER);
    localparam [31:0] PROBE222_TBUS_LSB = PROBE221_TBUS_LSB + 1 * (PROBE221_IS_TRIGGER);
    localparam [31:0] PROBE223_TBUS_LSB = PROBE222_TBUS_LSB + 1 * (PROBE222_IS_TRIGGER);
    localparam [31:0] PROBE224_TBUS_LSB = PROBE223_TBUS_LSB + 1 * (PROBE223_IS_TRIGGER);
    localparam [31:0] PROBE225_TBUS_LSB = PROBE224_TBUS_LSB + 1 * (PROBE224_IS_TRIGGER);
    localparam [31:0] PROBE226_TBUS_LSB = PROBE225_TBUS_LSB + 1 * (PROBE225_IS_TRIGGER);
    localparam [31:0] PROBE227_TBUS_LSB = PROBE226_TBUS_LSB + 1 * (PROBE226_IS_TRIGGER);
    localparam [31:0] PROBE228_TBUS_LSB = PROBE227_TBUS_LSB + 1 * (PROBE227_IS_TRIGGER);
    localparam [31:0] PROBE229_TBUS_LSB = PROBE228_TBUS_LSB + 1 * (PROBE228_IS_TRIGGER);
    localparam [31:0] PROBE230_TBUS_LSB = PROBE229_TBUS_LSB + 1 * (PROBE229_IS_TRIGGER);
    localparam [31:0] PROBE231_TBUS_LSB = PROBE230_TBUS_LSB + 1 * (PROBE230_IS_TRIGGER);
    localparam [31:0] PROBE232_TBUS_LSB = PROBE231_TBUS_LSB + 1 * (PROBE231_IS_TRIGGER);
    localparam [31:0] PROBE233_TBUS_LSB = PROBE232_TBUS_LSB + 1 * (PROBE232_IS_TRIGGER);
    localparam [31:0] PROBE234_TBUS_LSB = PROBE233_TBUS_LSB + 1 * (PROBE233_IS_TRIGGER);
    localparam [31:0] PROBE235_TBUS_LSB = PROBE234_TBUS_LSB + 1 * (PROBE234_IS_TRIGGER);
    localparam [31:0] PROBE236_TBUS_LSB = PROBE235_TBUS_LSB + 1 * (PROBE235_IS_TRIGGER);
    localparam [31:0] PROBE237_TBUS_LSB = PROBE236_TBUS_LSB + 1 * (PROBE236_IS_TRIGGER);
    localparam [31:0] PROBE238_TBUS_LSB = PROBE237_TBUS_LSB + 1 * (PROBE237_IS_TRIGGER);
    localparam [31:0] PROBE239_TBUS_LSB = PROBE238_TBUS_LSB + 1 * (PROBE238_IS_TRIGGER);
    localparam [31:0] PROBE240_TBUS_LSB = PROBE239_TBUS_LSB + 1 * (PROBE239_IS_TRIGGER);
    localparam [31:0] PROBE241_TBUS_LSB = PROBE240_TBUS_LSB + 1 * (PROBE240_IS_TRIGGER);
    localparam [31:0] PROBE242_TBUS_LSB = PROBE241_TBUS_LSB + 1 * (PROBE241_IS_TRIGGER);
    localparam [31:0] PROBE243_TBUS_LSB = PROBE242_TBUS_LSB + 1 * (PROBE242_IS_TRIGGER);
    localparam [31:0] PROBE244_TBUS_LSB = PROBE243_TBUS_LSB + 1 * (PROBE243_IS_TRIGGER);
    localparam [31:0] PROBE245_TBUS_LSB = PROBE244_TBUS_LSB + 1 * (PROBE244_IS_TRIGGER);
    localparam [31:0] PROBE246_TBUS_LSB = PROBE245_TBUS_LSB + 1 * (PROBE245_IS_TRIGGER);
    localparam [31:0] PROBE247_TBUS_LSB = PROBE246_TBUS_LSB + 1 * (PROBE246_IS_TRIGGER);
    localparam [31:0] PROBE248_TBUS_LSB = PROBE247_TBUS_LSB + 1 * (PROBE247_IS_TRIGGER);
    localparam [31:0] PROBE249_TBUS_LSB = PROBE248_TBUS_LSB + 1 * (PROBE248_IS_TRIGGER);
    localparam [31:0] PROBE250_TBUS_LSB = PROBE249_TBUS_LSB + 1 * (PROBE249_IS_TRIGGER);
    localparam [31:0] PROBE251_TBUS_LSB = PROBE250_TBUS_LSB + 1 * (PROBE250_IS_TRIGGER);
    localparam [31:0] PROBE252_TBUS_LSB = PROBE251_TBUS_LSB + 1 * (PROBE251_IS_TRIGGER);
    localparam [31:0] PROBE253_TBUS_LSB = PROBE252_TBUS_LSB + 1 * (PROBE252_IS_TRIGGER);
    localparam [31:0] PROBE254_TBUS_LSB = PROBE253_TBUS_LSB + 1 * (PROBE253_IS_TRIGGER);
    localparam [31:0] PROBE255_TBUS_LSB = PROBE254_TBUS_LSB + 1 * (PROBE254_IS_TRIGGER);

    localparam [31:0] PROBE0_CBUS_LSB = 0;
    localparam [31:0] PROBE1_CBUS_LSB = PROBE0_CBUS_LSB + 1 * (PROBE0_IS_DATA);
    localparam [31:0] PROBE2_CBUS_LSB = PROBE1_CBUS_LSB + 1 * (PROBE1_IS_DATA);
    localparam [31:0] PROBE3_CBUS_LSB = PROBE2_CBUS_LSB + 1 * (PROBE2_IS_DATA);
    localparam [31:0] PROBE4_CBUS_LSB = PROBE3_CBUS_LSB + 1 * (PROBE3_IS_DATA);
    localparam [31:0] PROBE5_CBUS_LSB = PROBE4_CBUS_LSB + 1 * (PROBE4_IS_DATA);
    localparam [31:0] PROBE6_CBUS_LSB = PROBE5_CBUS_LSB + 1 * (PROBE5_IS_DATA);
    localparam [31:0] PROBE7_CBUS_LSB = PROBE6_CBUS_LSB + 1 * (PROBE6_IS_DATA);
    localparam [31:0] PROBE8_CBUS_LSB = PROBE7_CBUS_LSB + 1 * (PROBE7_IS_DATA);
    localparam [31:0] PROBE9_CBUS_LSB = PROBE8_CBUS_LSB + 1 * (PROBE8_IS_DATA);
    localparam [31:0] PROBE10_CBUS_LSB = PROBE9_CBUS_LSB + 1 * (PROBE9_IS_DATA);
    localparam [31:0] PROBE11_CBUS_LSB = PROBE10_CBUS_LSB + 1 * (PROBE10_IS_DATA);
    localparam [31:0] PROBE12_CBUS_LSB = PROBE11_CBUS_LSB + 1 * (PROBE11_IS_DATA);
    localparam [31:0] PROBE13_CBUS_LSB = PROBE12_CBUS_LSB + 1 * (PROBE12_IS_DATA);
    localparam [31:0] PROBE14_CBUS_LSB = PROBE13_CBUS_LSB + 1 * (PROBE13_IS_DATA);
    localparam [31:0] PROBE15_CBUS_LSB = PROBE14_CBUS_LSB + 1 * (PROBE14_IS_DATA);
    localparam [31:0] PROBE16_CBUS_LSB = PROBE15_CBUS_LSB + 1 * (PROBE15_IS_DATA);
    localparam [31:0] PROBE17_CBUS_LSB = PROBE16_CBUS_LSB + 1 * (PROBE16_IS_DATA);
    localparam [31:0] PROBE18_CBUS_LSB = PROBE17_CBUS_LSB + 1 * (PROBE17_IS_DATA);
    localparam [31:0] PROBE19_CBUS_LSB = PROBE18_CBUS_LSB + 1 * (PROBE18_IS_DATA);
    localparam [31:0] PROBE20_CBUS_LSB = PROBE19_CBUS_LSB + 1 * (PROBE19_IS_DATA);
    localparam [31:0] PROBE21_CBUS_LSB = PROBE20_CBUS_LSB + 1 * (PROBE20_IS_DATA);
    localparam [31:0] PROBE22_CBUS_LSB = PROBE21_CBUS_LSB + 1 * (PROBE21_IS_DATA);
    localparam [31:0] PROBE23_CBUS_LSB = PROBE22_CBUS_LSB + 1 * (PROBE22_IS_DATA);
    localparam [31:0] PROBE24_CBUS_LSB = PROBE23_CBUS_LSB + 1 * (PROBE23_IS_DATA);
    localparam [31:0] PROBE25_CBUS_LSB = PROBE24_CBUS_LSB + 1 * (PROBE24_IS_DATA);
    localparam [31:0] PROBE26_CBUS_LSB = PROBE25_CBUS_LSB + 1 * (PROBE25_IS_DATA);
    localparam [31:0] PROBE27_CBUS_LSB = PROBE26_CBUS_LSB + 1 * (PROBE26_IS_DATA);
    localparam [31:0] PROBE28_CBUS_LSB = PROBE27_CBUS_LSB + 1 * (PROBE27_IS_DATA);
    localparam [31:0] PROBE29_CBUS_LSB = PROBE28_CBUS_LSB + 1 * (PROBE28_IS_DATA);
    localparam [31:0] PROBE30_CBUS_LSB = PROBE29_CBUS_LSB + 1 * (PROBE29_IS_DATA);
    localparam [31:0] PROBE31_CBUS_LSB = PROBE30_CBUS_LSB + 1 * (PROBE30_IS_DATA);
    localparam [31:0] PROBE32_CBUS_LSB = PROBE31_CBUS_LSB + 1 * (PROBE31_IS_DATA);
    localparam [31:0] PROBE33_CBUS_LSB = PROBE32_CBUS_LSB + 1 * (PROBE32_IS_DATA);
    localparam [31:0] PROBE34_CBUS_LSB = PROBE33_CBUS_LSB + 1 * (PROBE33_IS_DATA);
    localparam [31:0] PROBE35_CBUS_LSB = PROBE34_CBUS_LSB + 1 * (PROBE34_IS_DATA);
    localparam [31:0] PROBE36_CBUS_LSB = PROBE35_CBUS_LSB + 1 * (PROBE35_IS_DATA);
    localparam [31:0] PROBE37_CBUS_LSB = PROBE36_CBUS_LSB + 1 * (PROBE36_IS_DATA);
    localparam [31:0] PROBE38_CBUS_LSB = PROBE37_CBUS_LSB + 1 * (PROBE37_IS_DATA);
    localparam [31:0] PROBE39_CBUS_LSB = PROBE38_CBUS_LSB + 1 * (PROBE38_IS_DATA);
    localparam [31:0] PROBE40_CBUS_LSB = PROBE39_CBUS_LSB + 1 * (PROBE39_IS_DATA);
    localparam [31:0] PROBE41_CBUS_LSB = PROBE40_CBUS_LSB + 1 * (PROBE40_IS_DATA);
    localparam [31:0] PROBE42_CBUS_LSB = PROBE41_CBUS_LSB + 1 * (PROBE41_IS_DATA);
    localparam [31:0] PROBE43_CBUS_LSB = PROBE42_CBUS_LSB + 1 * (PROBE42_IS_DATA);
    localparam [31:0] PROBE44_CBUS_LSB = PROBE43_CBUS_LSB + 1 * (PROBE43_IS_DATA);
    localparam [31:0] PROBE45_CBUS_LSB = PROBE44_CBUS_LSB + 1 * (PROBE44_IS_DATA);
    localparam [31:0] PROBE46_CBUS_LSB = PROBE45_CBUS_LSB + 1 * (PROBE45_IS_DATA);
    localparam [31:0] PROBE47_CBUS_LSB = PROBE46_CBUS_LSB + 1 * (PROBE46_IS_DATA);
    localparam [31:0] PROBE48_CBUS_LSB = PROBE47_CBUS_LSB + 1 * (PROBE47_IS_DATA);
    localparam [31:0] PROBE49_CBUS_LSB = PROBE48_CBUS_LSB + 1 * (PROBE48_IS_DATA);
    localparam [31:0] PROBE50_CBUS_LSB = PROBE49_CBUS_LSB + 1 * (PROBE49_IS_DATA);
    localparam [31:0] PROBE51_CBUS_LSB = PROBE50_CBUS_LSB + 1 * (PROBE50_IS_DATA);
    localparam [31:0] PROBE52_CBUS_LSB = PROBE51_CBUS_LSB + 1 * (PROBE51_IS_DATA);
    localparam [31:0] PROBE53_CBUS_LSB = PROBE52_CBUS_LSB + 1 * (PROBE52_IS_DATA);
    localparam [31:0] PROBE54_CBUS_LSB = PROBE53_CBUS_LSB + 1 * (PROBE53_IS_DATA);
    localparam [31:0] PROBE55_CBUS_LSB = PROBE54_CBUS_LSB + 1 * (PROBE54_IS_DATA);
    localparam [31:0] PROBE56_CBUS_LSB = PROBE55_CBUS_LSB + 1 * (PROBE55_IS_DATA);
    localparam [31:0] PROBE57_CBUS_LSB = PROBE56_CBUS_LSB + 1 * (PROBE56_IS_DATA);
    localparam [31:0] PROBE58_CBUS_LSB = PROBE57_CBUS_LSB + 1 * (PROBE57_IS_DATA);
    localparam [31:0] PROBE59_CBUS_LSB = PROBE58_CBUS_LSB + 1 * (PROBE58_IS_DATA);
    localparam [31:0] PROBE60_CBUS_LSB = PROBE59_CBUS_LSB + 1 * (PROBE59_IS_DATA);
    localparam [31:0] PROBE61_CBUS_LSB = PROBE60_CBUS_LSB + 1 * (PROBE60_IS_DATA);
    localparam [31:0] PROBE62_CBUS_LSB = PROBE61_CBUS_LSB + 1 * (PROBE61_IS_DATA);
    localparam [31:0] PROBE63_CBUS_LSB = PROBE62_CBUS_LSB + 1 * (PROBE62_IS_DATA);
    localparam [31:0] PROBE64_CBUS_LSB = PROBE63_CBUS_LSB + 1 * (PROBE63_IS_DATA);
    localparam [31:0] PROBE65_CBUS_LSB = PROBE64_CBUS_LSB + 1 * (PROBE64_IS_DATA);
    localparam [31:0] PROBE66_CBUS_LSB = PROBE65_CBUS_LSB + 1 * (PROBE65_IS_DATA);
    localparam [31:0] PROBE67_CBUS_LSB = PROBE66_CBUS_LSB + 1 * (PROBE66_IS_DATA);
    localparam [31:0] PROBE68_CBUS_LSB = PROBE67_CBUS_LSB + 1 * (PROBE67_IS_DATA);
    localparam [31:0] PROBE69_CBUS_LSB = PROBE68_CBUS_LSB + 1 * (PROBE68_IS_DATA);
    localparam [31:0] PROBE70_CBUS_LSB = PROBE69_CBUS_LSB + 1 * (PROBE69_IS_DATA);
    localparam [31:0] PROBE71_CBUS_LSB = PROBE70_CBUS_LSB + 1 * (PROBE70_IS_DATA);
    localparam [31:0] PROBE72_CBUS_LSB = PROBE71_CBUS_LSB + 1 * (PROBE71_IS_DATA);
    localparam [31:0] PROBE73_CBUS_LSB = PROBE72_CBUS_LSB + 1 * (PROBE72_IS_DATA);
    localparam [31:0] PROBE74_CBUS_LSB = PROBE73_CBUS_LSB + 1 * (PROBE73_IS_DATA);
    localparam [31:0] PROBE75_CBUS_LSB = PROBE74_CBUS_LSB + 1 * (PROBE74_IS_DATA);
    localparam [31:0] PROBE76_CBUS_LSB = PROBE75_CBUS_LSB + 1 * (PROBE75_IS_DATA);
    localparam [31:0] PROBE77_CBUS_LSB = PROBE76_CBUS_LSB + 1 * (PROBE76_IS_DATA);
    localparam [31:0] PROBE78_CBUS_LSB = PROBE77_CBUS_LSB + 1 * (PROBE77_IS_DATA);
    localparam [31:0] PROBE79_CBUS_LSB = PROBE78_CBUS_LSB + 1 * (PROBE78_IS_DATA);
    localparam [31:0] PROBE80_CBUS_LSB = PROBE79_CBUS_LSB + 1 * (PROBE79_IS_DATA);
    localparam [31:0] PROBE81_CBUS_LSB = PROBE80_CBUS_LSB + 1 * (PROBE80_IS_DATA);
    localparam [31:0] PROBE82_CBUS_LSB = PROBE81_CBUS_LSB + 1 * (PROBE81_IS_DATA);
    localparam [31:0] PROBE83_CBUS_LSB = PROBE82_CBUS_LSB + 1 * (PROBE82_IS_DATA);
    localparam [31:0] PROBE84_CBUS_LSB = PROBE83_CBUS_LSB + 1 * (PROBE83_IS_DATA);
    localparam [31:0] PROBE85_CBUS_LSB = PROBE84_CBUS_LSB + 1 * (PROBE84_IS_DATA);
    localparam [31:0] PROBE86_CBUS_LSB = PROBE85_CBUS_LSB + 1 * (PROBE85_IS_DATA);
    localparam [31:0] PROBE87_CBUS_LSB = PROBE86_CBUS_LSB + 1 * (PROBE86_IS_DATA);
    localparam [31:0] PROBE88_CBUS_LSB = PROBE87_CBUS_LSB + 1 * (PROBE87_IS_DATA);
    localparam [31:0] PROBE89_CBUS_LSB = PROBE88_CBUS_LSB + 1 * (PROBE88_IS_DATA);
    localparam [31:0] PROBE90_CBUS_LSB = PROBE89_CBUS_LSB + 1 * (PROBE89_IS_DATA);
    localparam [31:0] PROBE91_CBUS_LSB = PROBE90_CBUS_LSB + 1 * (PROBE90_IS_DATA);
    localparam [31:0] PROBE92_CBUS_LSB = PROBE91_CBUS_LSB + 1 * (PROBE91_IS_DATA);
    localparam [31:0] PROBE93_CBUS_LSB = PROBE92_CBUS_LSB + 1 * (PROBE92_IS_DATA);
    localparam [31:0] PROBE94_CBUS_LSB = PROBE93_CBUS_LSB + 1 * (PROBE93_IS_DATA);
    localparam [31:0] PROBE95_CBUS_LSB = PROBE94_CBUS_LSB + 1 * (PROBE94_IS_DATA);
    localparam [31:0] PROBE96_CBUS_LSB = PROBE95_CBUS_LSB + 1 * (PROBE95_IS_DATA);
    localparam [31:0] PROBE97_CBUS_LSB = PROBE96_CBUS_LSB + 1 * (PROBE96_IS_DATA);
    localparam [31:0] PROBE98_CBUS_LSB = PROBE97_CBUS_LSB + 1 * (PROBE97_IS_DATA);
    localparam [31:0] PROBE99_CBUS_LSB = PROBE98_CBUS_LSB + 1 * (PROBE98_IS_DATA);
    localparam [31:0] PROBE100_CBUS_LSB = PROBE99_CBUS_LSB + 1 * (PROBE99_IS_DATA);
    localparam [31:0] PROBE101_CBUS_LSB = PROBE100_CBUS_LSB + 1 * (PROBE100_IS_DATA);
    localparam [31:0] PROBE102_CBUS_LSB = PROBE101_CBUS_LSB + 1 * (PROBE101_IS_DATA);
    localparam [31:0] PROBE103_CBUS_LSB = PROBE102_CBUS_LSB + 1 * (PROBE102_IS_DATA);
    localparam [31:0] PROBE104_CBUS_LSB = PROBE103_CBUS_LSB + 1 * (PROBE103_IS_DATA);
    localparam [31:0] PROBE105_CBUS_LSB = PROBE104_CBUS_LSB + 1 * (PROBE104_IS_DATA);
    localparam [31:0] PROBE106_CBUS_LSB = PROBE105_CBUS_LSB + 1 * (PROBE105_IS_DATA);
    localparam [31:0] PROBE107_CBUS_LSB = PROBE106_CBUS_LSB + 1 * (PROBE106_IS_DATA);
    localparam [31:0] PROBE108_CBUS_LSB = PROBE107_CBUS_LSB + 1 * (PROBE107_IS_DATA);
    localparam [31:0] PROBE109_CBUS_LSB = PROBE108_CBUS_LSB + 1 * (PROBE108_IS_DATA);
    localparam [31:0] PROBE110_CBUS_LSB = PROBE109_CBUS_LSB + 1 * (PROBE109_IS_DATA);
    localparam [31:0] PROBE111_CBUS_LSB = PROBE110_CBUS_LSB + 1 * (PROBE110_IS_DATA);
    localparam [31:0] PROBE112_CBUS_LSB = PROBE111_CBUS_LSB + 1 * (PROBE111_IS_DATA);
    localparam [31:0] PROBE113_CBUS_LSB = PROBE112_CBUS_LSB + 1 * (PROBE112_IS_DATA);
    localparam [31:0] PROBE114_CBUS_LSB = PROBE113_CBUS_LSB + 1 * (PROBE113_IS_DATA);
    localparam [31:0] PROBE115_CBUS_LSB = PROBE114_CBUS_LSB + 1 * (PROBE114_IS_DATA);
    localparam [31:0] PROBE116_CBUS_LSB = PROBE115_CBUS_LSB + 1 * (PROBE115_IS_DATA);
    localparam [31:0] PROBE117_CBUS_LSB = PROBE116_CBUS_LSB + 1 * (PROBE116_IS_DATA);
    localparam [31:0] PROBE118_CBUS_LSB = PROBE117_CBUS_LSB + 1 * (PROBE117_IS_DATA);
    localparam [31:0] PROBE119_CBUS_LSB = PROBE118_CBUS_LSB + 1 * (PROBE118_IS_DATA);
    localparam [31:0] PROBE120_CBUS_LSB = PROBE119_CBUS_LSB + 1 * (PROBE119_IS_DATA);
    localparam [31:0] PROBE121_CBUS_LSB = PROBE120_CBUS_LSB + 1 * (PROBE120_IS_DATA);
    localparam [31:0] PROBE122_CBUS_LSB = PROBE121_CBUS_LSB + 1 * (PROBE121_IS_DATA);
    localparam [31:0] PROBE123_CBUS_LSB = PROBE122_CBUS_LSB + 1 * (PROBE122_IS_DATA);
    localparam [31:0] PROBE124_CBUS_LSB = PROBE123_CBUS_LSB + 1 * (PROBE123_IS_DATA);
    localparam [31:0] PROBE125_CBUS_LSB = PROBE124_CBUS_LSB + 1 * (PROBE124_IS_DATA);
    localparam [31:0] PROBE126_CBUS_LSB = PROBE125_CBUS_LSB + 1 * (PROBE125_IS_DATA);
    localparam [31:0] PROBE127_CBUS_LSB = PROBE126_CBUS_LSB + 1 * (PROBE126_IS_DATA);
    localparam [31:0] PROBE128_CBUS_LSB = PROBE127_CBUS_LSB + 1 * (PROBE127_IS_DATA);
    localparam [31:0] PROBE129_CBUS_LSB = PROBE128_CBUS_LSB + 1 * (PROBE128_IS_DATA);
    localparam [31:0] PROBE130_CBUS_LSB = PROBE129_CBUS_LSB + 1 * (PROBE129_IS_DATA);
    localparam [31:0] PROBE131_CBUS_LSB = PROBE130_CBUS_LSB + 1 * (PROBE130_IS_DATA);
    localparam [31:0] PROBE132_CBUS_LSB = PROBE131_CBUS_LSB + 1 * (PROBE131_IS_DATA);
    localparam [31:0] PROBE133_CBUS_LSB = PROBE132_CBUS_LSB + 1 * (PROBE132_IS_DATA);
    localparam [31:0] PROBE134_CBUS_LSB = PROBE133_CBUS_LSB + 1 * (PROBE133_IS_DATA);
    localparam [31:0] PROBE135_CBUS_LSB = PROBE134_CBUS_LSB + 1 * (PROBE134_IS_DATA);
    localparam [31:0] PROBE136_CBUS_LSB = PROBE135_CBUS_LSB + 1 * (PROBE135_IS_DATA);
    localparam [31:0] PROBE137_CBUS_LSB = PROBE136_CBUS_LSB + 1 * (PROBE136_IS_DATA);
    localparam [31:0] PROBE138_CBUS_LSB = PROBE137_CBUS_LSB + 1 * (PROBE137_IS_DATA);
    localparam [31:0] PROBE139_CBUS_LSB = PROBE138_CBUS_LSB + 1 * (PROBE138_IS_DATA);
    localparam [31:0] PROBE140_CBUS_LSB = PROBE139_CBUS_LSB + 1 * (PROBE139_IS_DATA);
    localparam [31:0] PROBE141_CBUS_LSB = PROBE140_CBUS_LSB + 1 * (PROBE140_IS_DATA);
    localparam [31:0] PROBE142_CBUS_LSB = PROBE141_CBUS_LSB + 1 * (PROBE141_IS_DATA);
    localparam [31:0] PROBE143_CBUS_LSB = PROBE142_CBUS_LSB + 1 * (PROBE142_IS_DATA);
    localparam [31:0] PROBE144_CBUS_LSB = PROBE143_CBUS_LSB + 1 * (PROBE143_IS_DATA);
    localparam [31:0] PROBE145_CBUS_LSB = PROBE144_CBUS_LSB + 1 * (PROBE144_IS_DATA);
    localparam [31:0] PROBE146_CBUS_LSB = PROBE145_CBUS_LSB + 1 * (PROBE145_IS_DATA);
    localparam [31:0] PROBE147_CBUS_LSB = PROBE146_CBUS_LSB + 1 * (PROBE146_IS_DATA);
    localparam [31:0] PROBE148_CBUS_LSB = PROBE147_CBUS_LSB + 1 * (PROBE147_IS_DATA);
    localparam [31:0] PROBE149_CBUS_LSB = PROBE148_CBUS_LSB + 1 * (PROBE148_IS_DATA);
    localparam [31:0] PROBE150_CBUS_LSB = PROBE149_CBUS_LSB + 1 * (PROBE149_IS_DATA);
    localparam [31:0] PROBE151_CBUS_LSB = PROBE150_CBUS_LSB + 1 * (PROBE150_IS_DATA);
    localparam [31:0] PROBE152_CBUS_LSB = PROBE151_CBUS_LSB + 1 * (PROBE151_IS_DATA);
    localparam [31:0] PROBE153_CBUS_LSB = PROBE152_CBUS_LSB + 1 * (PROBE152_IS_DATA);
    localparam [31:0] PROBE154_CBUS_LSB = PROBE153_CBUS_LSB + 1 * (PROBE153_IS_DATA);
    localparam [31:0] PROBE155_CBUS_LSB = PROBE154_CBUS_LSB + 1 * (PROBE154_IS_DATA);
    localparam [31:0] PROBE156_CBUS_LSB = PROBE155_CBUS_LSB + 1 * (PROBE155_IS_DATA);
    localparam [31:0] PROBE157_CBUS_LSB = PROBE156_CBUS_LSB + 1 * (PROBE156_IS_DATA);
    localparam [31:0] PROBE158_CBUS_LSB = PROBE157_CBUS_LSB + 1 * (PROBE157_IS_DATA);
    localparam [31:0] PROBE159_CBUS_LSB = PROBE158_CBUS_LSB + 1 * (PROBE158_IS_DATA);
    localparam [31:0] PROBE160_CBUS_LSB = PROBE159_CBUS_LSB + 1 * (PROBE159_IS_DATA);
    localparam [31:0] PROBE161_CBUS_LSB = PROBE160_CBUS_LSB + 1 * (PROBE160_IS_DATA);
    localparam [31:0] PROBE162_CBUS_LSB = PROBE161_CBUS_LSB + 1 * (PROBE161_IS_DATA);
    localparam [31:0] PROBE163_CBUS_LSB = PROBE162_CBUS_LSB + 1 * (PROBE162_IS_DATA);
    localparam [31:0] PROBE164_CBUS_LSB = PROBE163_CBUS_LSB + 1 * (PROBE163_IS_DATA);
    localparam [31:0] PROBE165_CBUS_LSB = PROBE164_CBUS_LSB + 1 * (PROBE164_IS_DATA);
    localparam [31:0] PROBE166_CBUS_LSB = PROBE165_CBUS_LSB + 1 * (PROBE165_IS_DATA);
    localparam [31:0] PROBE167_CBUS_LSB = PROBE166_CBUS_LSB + 1 * (PROBE166_IS_DATA);
    localparam [31:0] PROBE168_CBUS_LSB = PROBE167_CBUS_LSB + 1 * (PROBE167_IS_DATA);
    localparam [31:0] PROBE169_CBUS_LSB = PROBE168_CBUS_LSB + 1 * (PROBE168_IS_DATA);
    localparam [31:0] PROBE170_CBUS_LSB = PROBE169_CBUS_LSB + 1 * (PROBE169_IS_DATA);
    localparam [31:0] PROBE171_CBUS_LSB = PROBE170_CBUS_LSB + 1 * (PROBE170_IS_DATA);
    localparam [31:0] PROBE172_CBUS_LSB = PROBE171_CBUS_LSB + 1 * (PROBE171_IS_DATA);
    localparam [31:0] PROBE173_CBUS_LSB = PROBE172_CBUS_LSB + 1 * (PROBE172_IS_DATA);
    localparam [31:0] PROBE174_CBUS_LSB = PROBE173_CBUS_LSB + 1 * (PROBE173_IS_DATA);
    localparam [31:0] PROBE175_CBUS_LSB = PROBE174_CBUS_LSB + 1 * (PROBE174_IS_DATA);
    localparam [31:0] PROBE176_CBUS_LSB = PROBE175_CBUS_LSB + 1 * (PROBE175_IS_DATA);
    localparam [31:0] PROBE177_CBUS_LSB = PROBE176_CBUS_LSB + 1 * (PROBE176_IS_DATA);
    localparam [31:0] PROBE178_CBUS_LSB = PROBE177_CBUS_LSB + 1 * (PROBE177_IS_DATA);
    localparam [31:0] PROBE179_CBUS_LSB = PROBE178_CBUS_LSB + 1 * (PROBE178_IS_DATA);
    localparam [31:0] PROBE180_CBUS_LSB = PROBE179_CBUS_LSB + 1 * (PROBE179_IS_DATA);
    localparam [31:0] PROBE181_CBUS_LSB = PROBE180_CBUS_LSB + 1 * (PROBE180_IS_DATA);
    localparam [31:0] PROBE182_CBUS_LSB = PROBE181_CBUS_LSB + 1 * (PROBE181_IS_DATA);
    localparam [31:0] PROBE183_CBUS_LSB = PROBE182_CBUS_LSB + 1 * (PROBE182_IS_DATA);
    localparam [31:0] PROBE184_CBUS_LSB = PROBE183_CBUS_LSB + 1 * (PROBE183_IS_DATA);
    localparam [31:0] PROBE185_CBUS_LSB = PROBE184_CBUS_LSB + 1 * (PROBE184_IS_DATA);
    localparam [31:0] PROBE186_CBUS_LSB = PROBE185_CBUS_LSB + 1 * (PROBE185_IS_DATA);
    localparam [31:0] PROBE187_CBUS_LSB = PROBE186_CBUS_LSB + 1 * (PROBE186_IS_DATA);
    localparam [31:0] PROBE188_CBUS_LSB = PROBE187_CBUS_LSB + 1 * (PROBE187_IS_DATA);
    localparam [31:0] PROBE189_CBUS_LSB = PROBE188_CBUS_LSB + 1 * (PROBE188_IS_DATA);
    localparam [31:0] PROBE190_CBUS_LSB = PROBE189_CBUS_LSB + 1 * (PROBE189_IS_DATA);
    localparam [31:0] PROBE191_CBUS_LSB = PROBE190_CBUS_LSB + 1 * (PROBE190_IS_DATA);
    localparam [31:0] PROBE192_CBUS_LSB = PROBE191_CBUS_LSB + 1 * (PROBE191_IS_DATA);
    localparam [31:0] PROBE193_CBUS_LSB = PROBE192_CBUS_LSB + 1 * (PROBE192_IS_DATA);
    localparam [31:0] PROBE194_CBUS_LSB = PROBE193_CBUS_LSB + 1 * (PROBE193_IS_DATA);
    localparam [31:0] PROBE195_CBUS_LSB = PROBE194_CBUS_LSB + 1 * (PROBE194_IS_DATA);
    localparam [31:0] PROBE196_CBUS_LSB = PROBE195_CBUS_LSB + 1 * (PROBE195_IS_DATA);
    localparam [31:0] PROBE197_CBUS_LSB = PROBE196_CBUS_LSB + 1 * (PROBE196_IS_DATA);
    localparam [31:0] PROBE198_CBUS_LSB = PROBE197_CBUS_LSB + 1 * (PROBE197_IS_DATA);
    localparam [31:0] PROBE199_CBUS_LSB = PROBE198_CBUS_LSB + 1 * (PROBE198_IS_DATA);
    localparam [31:0] PROBE200_CBUS_LSB = PROBE199_CBUS_LSB + 1 * (PROBE199_IS_DATA);
    localparam [31:0] PROBE201_CBUS_LSB = PROBE200_CBUS_LSB + 1 * (PROBE200_IS_DATA);
    localparam [31:0] PROBE202_CBUS_LSB = PROBE201_CBUS_LSB + 1 * (PROBE201_IS_DATA);
    localparam [31:0] PROBE203_CBUS_LSB = PROBE202_CBUS_LSB + 1 * (PROBE202_IS_DATA);
    localparam [31:0] PROBE204_CBUS_LSB = PROBE203_CBUS_LSB + 1 * (PROBE203_IS_DATA);
    localparam [31:0] PROBE205_CBUS_LSB = PROBE204_CBUS_LSB + 1 * (PROBE204_IS_DATA);
    localparam [31:0] PROBE206_CBUS_LSB = PROBE205_CBUS_LSB + 1 * (PROBE205_IS_DATA);
    localparam [31:0] PROBE207_CBUS_LSB = PROBE206_CBUS_LSB + 1 * (PROBE206_IS_DATA);
    localparam [31:0] PROBE208_CBUS_LSB = PROBE207_CBUS_LSB + 1 * (PROBE207_IS_DATA);
    localparam [31:0] PROBE209_CBUS_LSB = PROBE208_CBUS_LSB + 1 * (PROBE208_IS_DATA);
    localparam [31:0] PROBE210_CBUS_LSB = PROBE209_CBUS_LSB + 1 * (PROBE209_IS_DATA);
    localparam [31:0] PROBE211_CBUS_LSB = PROBE210_CBUS_LSB + 1 * (PROBE210_IS_DATA);
    localparam [31:0] PROBE212_CBUS_LSB = PROBE211_CBUS_LSB + 1 * (PROBE211_IS_DATA);
    localparam [31:0] PROBE213_CBUS_LSB = PROBE212_CBUS_LSB + 1 * (PROBE212_IS_DATA);
    localparam [31:0] PROBE214_CBUS_LSB = PROBE213_CBUS_LSB + 1 * (PROBE213_IS_DATA);
    localparam [31:0] PROBE215_CBUS_LSB = PROBE214_CBUS_LSB + 1 * (PROBE214_IS_DATA);
    localparam [31:0] PROBE216_CBUS_LSB = PROBE215_CBUS_LSB + 1 * (PROBE215_IS_DATA);
    localparam [31:0] PROBE217_CBUS_LSB = PROBE216_CBUS_LSB + 1 * (PROBE216_IS_DATA);
    localparam [31:0] PROBE218_CBUS_LSB = PROBE217_CBUS_LSB + 1 * (PROBE217_IS_DATA);
    localparam [31:0] PROBE219_CBUS_LSB = PROBE218_CBUS_LSB + 1 * (PROBE218_IS_DATA);
    localparam [31:0] PROBE220_CBUS_LSB = PROBE219_CBUS_LSB + 1 * (PROBE219_IS_DATA);
    localparam [31:0] PROBE221_CBUS_LSB = PROBE220_CBUS_LSB + 1 * (PROBE220_IS_DATA);
    localparam [31:0] PROBE222_CBUS_LSB = PROBE221_CBUS_LSB + 1 * (PROBE221_IS_DATA);
    localparam [31:0] PROBE223_CBUS_LSB = PROBE222_CBUS_LSB + 1 * (PROBE222_IS_DATA);
    localparam [31:0] PROBE224_CBUS_LSB = PROBE223_CBUS_LSB + 1 * (PROBE223_IS_DATA);
    localparam [31:0] PROBE225_CBUS_LSB = PROBE224_CBUS_LSB + 1 * (PROBE224_IS_DATA);
    localparam [31:0] PROBE226_CBUS_LSB = PROBE225_CBUS_LSB + 1 * (PROBE225_IS_DATA);
    localparam [31:0] PROBE227_CBUS_LSB = PROBE226_CBUS_LSB + 1 * (PROBE226_IS_DATA);
    localparam [31:0] PROBE228_CBUS_LSB = PROBE227_CBUS_LSB + 1 * (PROBE227_IS_DATA);
    localparam [31:0] PROBE229_CBUS_LSB = PROBE228_CBUS_LSB + 1 * (PROBE228_IS_DATA);
    localparam [31:0] PROBE230_CBUS_LSB = PROBE229_CBUS_LSB + 1 * (PROBE229_IS_DATA);
    localparam [31:0] PROBE231_CBUS_LSB = PROBE230_CBUS_LSB + 1 * (PROBE230_IS_DATA);
    localparam [31:0] PROBE232_CBUS_LSB = PROBE231_CBUS_LSB + 1 * (PROBE231_IS_DATA);
    localparam [31:0] PROBE233_CBUS_LSB = PROBE232_CBUS_LSB + 1 * (PROBE232_IS_DATA);
    localparam [31:0] PROBE234_CBUS_LSB = PROBE233_CBUS_LSB + 1 * (PROBE233_IS_DATA);
    localparam [31:0] PROBE235_CBUS_LSB = PROBE234_CBUS_LSB + 1 * (PROBE234_IS_DATA);
    localparam [31:0] PROBE236_CBUS_LSB = PROBE235_CBUS_LSB + 1 * (PROBE235_IS_DATA);
    localparam [31:0] PROBE237_CBUS_LSB = PROBE236_CBUS_LSB + 1 * (PROBE236_IS_DATA);
    localparam [31:0] PROBE238_CBUS_LSB = PROBE237_CBUS_LSB + 1 * (PROBE237_IS_DATA);
    localparam [31:0] PROBE239_CBUS_LSB = PROBE238_CBUS_LSB + 1 * (PROBE238_IS_DATA);
    localparam [31:0] PROBE240_CBUS_LSB = PROBE239_CBUS_LSB + 1 * (PROBE239_IS_DATA);
    localparam [31:0] PROBE241_CBUS_LSB = PROBE240_CBUS_LSB + 1 * (PROBE240_IS_DATA);
    localparam [31:0] PROBE242_CBUS_LSB = PROBE241_CBUS_LSB + 1 * (PROBE241_IS_DATA);
    localparam [31:0] PROBE243_CBUS_LSB = PROBE242_CBUS_LSB + 1 * (PROBE242_IS_DATA);
    localparam [31:0] PROBE244_CBUS_LSB = PROBE243_CBUS_LSB + 1 * (PROBE243_IS_DATA);
    localparam [31:0] PROBE245_CBUS_LSB = PROBE244_CBUS_LSB + 1 * (PROBE244_IS_DATA);
    localparam [31:0] PROBE246_CBUS_LSB = PROBE245_CBUS_LSB + 1 * (PROBE245_IS_DATA);
    localparam [31:0] PROBE247_CBUS_LSB = PROBE246_CBUS_LSB + 1 * (PROBE246_IS_DATA);
    localparam [31:0] PROBE248_CBUS_LSB = PROBE247_CBUS_LSB + 1 * (PROBE247_IS_DATA);
    localparam [31:0] PROBE249_CBUS_LSB = PROBE248_CBUS_LSB + 1 * (PROBE248_IS_DATA);
    localparam [31:0] PROBE250_CBUS_LSB = PROBE249_CBUS_LSB + 1 * (PROBE249_IS_DATA);
    localparam [31:0] PROBE251_CBUS_LSB = PROBE250_CBUS_LSB + 1 * (PROBE250_IS_DATA);
    localparam [31:0] PROBE252_CBUS_LSB = PROBE251_CBUS_LSB + 1 * (PROBE251_IS_DATA);
    localparam [31:0] PROBE253_CBUS_LSB = PROBE252_CBUS_LSB + 1 * (PROBE252_IS_DATA);
    localparam [31:0] PROBE254_CBUS_LSB = PROBE253_CBUS_LSB + 1 * (PROBE253_IS_DATA);
    localparam [31:0] PROBE255_CBUS_LSB = PROBE254_CBUS_LSB + 1 * (PROBE254_IS_DATA);

    localparam [31:0] PROBE0_PBUS_LSB = 0;
    localparam [31:0] PROBE1_PBUS_LSB = PROBE0_PBUS_LSB + PROBE0_WIDTH * (PROBE0_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE2_PBUS_LSB = PROBE1_PBUS_LSB + PROBE1_WIDTH * (PROBE1_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE3_PBUS_LSB = PROBE2_PBUS_LSB + PROBE2_WIDTH * (PROBE2_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE4_PBUS_LSB = PROBE3_PBUS_LSB + PROBE3_WIDTH * (PROBE3_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE5_PBUS_LSB = PROBE4_PBUS_LSB + PROBE4_WIDTH * (PROBE4_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE6_PBUS_LSB = PROBE5_PBUS_LSB + PROBE5_WIDTH * (PROBE5_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE7_PBUS_LSB = PROBE6_PBUS_LSB + PROBE6_WIDTH * (PROBE6_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE8_PBUS_LSB = PROBE7_PBUS_LSB + PROBE7_WIDTH * (PROBE7_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE9_PBUS_LSB = PROBE8_PBUS_LSB + PROBE8_WIDTH * (PROBE8_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE10_PBUS_LSB = PROBE9_PBUS_LSB + PROBE9_WIDTH * (PROBE9_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE11_PBUS_LSB = PROBE10_PBUS_LSB + PROBE10_WIDTH * (PROBE10_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE12_PBUS_LSB = PROBE11_PBUS_LSB + PROBE11_WIDTH * (PROBE11_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE13_PBUS_LSB = PROBE12_PBUS_LSB + PROBE12_WIDTH * (PROBE12_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE14_PBUS_LSB = PROBE13_PBUS_LSB + PROBE13_WIDTH * (PROBE13_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE15_PBUS_LSB = PROBE14_PBUS_LSB + PROBE14_WIDTH * (PROBE14_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE16_PBUS_LSB = PROBE15_PBUS_LSB + PROBE15_WIDTH * (PROBE15_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE17_PBUS_LSB = PROBE16_PBUS_LSB + PROBE16_WIDTH * (PROBE16_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE18_PBUS_LSB = PROBE17_PBUS_LSB + PROBE17_WIDTH * (PROBE17_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE19_PBUS_LSB = PROBE18_PBUS_LSB + PROBE18_WIDTH * (PROBE18_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE20_PBUS_LSB = PROBE19_PBUS_LSB + PROBE19_WIDTH * (PROBE19_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE21_PBUS_LSB = PROBE20_PBUS_LSB + PROBE20_WIDTH * (PROBE20_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE22_PBUS_LSB = PROBE21_PBUS_LSB + PROBE21_WIDTH * (PROBE21_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE23_PBUS_LSB = PROBE22_PBUS_LSB + PROBE22_WIDTH * (PROBE22_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE24_PBUS_LSB = PROBE23_PBUS_LSB + PROBE23_WIDTH * (PROBE23_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE25_PBUS_LSB = PROBE24_PBUS_LSB + PROBE24_WIDTH * (PROBE24_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE26_PBUS_LSB = PROBE25_PBUS_LSB + PROBE25_WIDTH * (PROBE25_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE27_PBUS_LSB = PROBE26_PBUS_LSB + PROBE26_WIDTH * (PROBE26_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE28_PBUS_LSB = PROBE27_PBUS_LSB + PROBE27_WIDTH * (PROBE27_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE29_PBUS_LSB = PROBE28_PBUS_LSB + PROBE28_WIDTH * (PROBE28_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE30_PBUS_LSB = PROBE29_PBUS_LSB + PROBE29_WIDTH * (PROBE29_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE31_PBUS_LSB = PROBE30_PBUS_LSB + PROBE30_WIDTH * (PROBE30_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE32_PBUS_LSB = PROBE31_PBUS_LSB + PROBE31_WIDTH * (PROBE31_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE33_PBUS_LSB = PROBE32_PBUS_LSB + PROBE32_WIDTH * (PROBE32_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE34_PBUS_LSB = PROBE33_PBUS_LSB + PROBE33_WIDTH * (PROBE33_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE35_PBUS_LSB = PROBE34_PBUS_LSB + PROBE34_WIDTH * (PROBE34_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE36_PBUS_LSB = PROBE35_PBUS_LSB + PROBE35_WIDTH * (PROBE35_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE37_PBUS_LSB = PROBE36_PBUS_LSB + PROBE36_WIDTH * (PROBE36_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE38_PBUS_LSB = PROBE37_PBUS_LSB + PROBE37_WIDTH * (PROBE37_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE39_PBUS_LSB = PROBE38_PBUS_LSB + PROBE38_WIDTH * (PROBE38_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE40_PBUS_LSB = PROBE39_PBUS_LSB + PROBE39_WIDTH * (PROBE39_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE41_PBUS_LSB = PROBE40_PBUS_LSB + PROBE40_WIDTH * (PROBE40_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE42_PBUS_LSB = PROBE41_PBUS_LSB + PROBE41_WIDTH * (PROBE41_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE43_PBUS_LSB = PROBE42_PBUS_LSB + PROBE42_WIDTH * (PROBE42_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE44_PBUS_LSB = PROBE43_PBUS_LSB + PROBE43_WIDTH * (PROBE43_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE45_PBUS_LSB = PROBE44_PBUS_LSB + PROBE44_WIDTH * (PROBE44_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE46_PBUS_LSB = PROBE45_PBUS_LSB + PROBE45_WIDTH * (PROBE45_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE47_PBUS_LSB = PROBE46_PBUS_LSB + PROBE46_WIDTH * (PROBE46_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE48_PBUS_LSB = PROBE47_PBUS_LSB + PROBE47_WIDTH * (PROBE47_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE49_PBUS_LSB = PROBE48_PBUS_LSB + PROBE48_WIDTH * (PROBE48_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE50_PBUS_LSB = PROBE49_PBUS_LSB + PROBE49_WIDTH * (PROBE49_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE51_PBUS_LSB = PROBE50_PBUS_LSB + PROBE50_WIDTH * (PROBE50_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE52_PBUS_LSB = PROBE51_PBUS_LSB + PROBE51_WIDTH * (PROBE51_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE53_PBUS_LSB = PROBE52_PBUS_LSB + PROBE52_WIDTH * (PROBE52_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE54_PBUS_LSB = PROBE53_PBUS_LSB + PROBE53_WIDTH * (PROBE53_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE55_PBUS_LSB = PROBE54_PBUS_LSB + PROBE54_WIDTH * (PROBE54_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE56_PBUS_LSB = PROBE55_PBUS_LSB + PROBE55_WIDTH * (PROBE55_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE57_PBUS_LSB = PROBE56_PBUS_LSB + PROBE56_WIDTH * (PROBE56_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE58_PBUS_LSB = PROBE57_PBUS_LSB + PROBE57_WIDTH * (PROBE57_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE59_PBUS_LSB = PROBE58_PBUS_LSB + PROBE58_WIDTH * (PROBE58_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE60_PBUS_LSB = PROBE59_PBUS_LSB + PROBE59_WIDTH * (PROBE59_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE61_PBUS_LSB = PROBE60_PBUS_LSB + PROBE60_WIDTH * (PROBE60_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE62_PBUS_LSB = PROBE61_PBUS_LSB + PROBE61_WIDTH * (PROBE61_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE63_PBUS_LSB = PROBE62_PBUS_LSB + PROBE62_WIDTH * (PROBE62_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE64_PBUS_LSB = PROBE63_PBUS_LSB + PROBE63_WIDTH * (PROBE63_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE65_PBUS_LSB = PROBE64_PBUS_LSB + PROBE64_WIDTH * (PROBE64_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE66_PBUS_LSB = PROBE65_PBUS_LSB + PROBE65_WIDTH * (PROBE65_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE67_PBUS_LSB = PROBE66_PBUS_LSB + PROBE66_WIDTH * (PROBE66_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE68_PBUS_LSB = PROBE67_PBUS_LSB + PROBE67_WIDTH * (PROBE67_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE69_PBUS_LSB = PROBE68_PBUS_LSB + PROBE68_WIDTH * (PROBE68_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE70_PBUS_LSB = PROBE69_PBUS_LSB + PROBE69_WIDTH * (PROBE69_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE71_PBUS_LSB = PROBE70_PBUS_LSB + PROBE70_WIDTH * (PROBE70_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE72_PBUS_LSB = PROBE71_PBUS_LSB + PROBE71_WIDTH * (PROBE71_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE73_PBUS_LSB = PROBE72_PBUS_LSB + PROBE72_WIDTH * (PROBE72_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE74_PBUS_LSB = PROBE73_PBUS_LSB + PROBE73_WIDTH * (PROBE73_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE75_PBUS_LSB = PROBE74_PBUS_LSB + PROBE74_WIDTH * (PROBE74_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE76_PBUS_LSB = PROBE75_PBUS_LSB + PROBE75_WIDTH * (PROBE75_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE77_PBUS_LSB = PROBE76_PBUS_LSB + PROBE76_WIDTH * (PROBE76_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE78_PBUS_LSB = PROBE77_PBUS_LSB + PROBE77_WIDTH * (PROBE77_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE79_PBUS_LSB = PROBE78_PBUS_LSB + PROBE78_WIDTH * (PROBE78_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE80_PBUS_LSB = PROBE79_PBUS_LSB + PROBE79_WIDTH * (PROBE79_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE81_PBUS_LSB = PROBE80_PBUS_LSB + PROBE80_WIDTH * (PROBE80_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE82_PBUS_LSB = PROBE81_PBUS_LSB + PROBE81_WIDTH * (PROBE81_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE83_PBUS_LSB = PROBE82_PBUS_LSB + PROBE82_WIDTH * (PROBE82_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE84_PBUS_LSB = PROBE83_PBUS_LSB + PROBE83_WIDTH * (PROBE83_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE85_PBUS_LSB = PROBE84_PBUS_LSB + PROBE84_WIDTH * (PROBE84_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE86_PBUS_LSB = PROBE85_PBUS_LSB + PROBE85_WIDTH * (PROBE85_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE87_PBUS_LSB = PROBE86_PBUS_LSB + PROBE86_WIDTH * (PROBE86_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE88_PBUS_LSB = PROBE87_PBUS_LSB + PROBE87_WIDTH * (PROBE87_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE89_PBUS_LSB = PROBE88_PBUS_LSB + PROBE88_WIDTH * (PROBE88_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE90_PBUS_LSB = PROBE89_PBUS_LSB + PROBE89_WIDTH * (PROBE89_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE91_PBUS_LSB = PROBE90_PBUS_LSB + PROBE90_WIDTH * (PROBE90_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE92_PBUS_LSB = PROBE91_PBUS_LSB + PROBE91_WIDTH * (PROBE91_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE93_PBUS_LSB = PROBE92_PBUS_LSB + PROBE92_WIDTH * (PROBE92_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE94_PBUS_LSB = PROBE93_PBUS_LSB + PROBE93_WIDTH * (PROBE93_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE95_PBUS_LSB = PROBE94_PBUS_LSB + PROBE94_WIDTH * (PROBE94_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE96_PBUS_LSB = PROBE95_PBUS_LSB + PROBE95_WIDTH * (PROBE95_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE97_PBUS_LSB = PROBE96_PBUS_LSB + PROBE96_WIDTH * (PROBE96_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE98_PBUS_LSB = PROBE97_PBUS_LSB + PROBE97_WIDTH * (PROBE97_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE99_PBUS_LSB = PROBE98_PBUS_LSB + PROBE98_WIDTH * (PROBE98_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE100_PBUS_LSB = PROBE99_PBUS_LSB + PROBE99_WIDTH * (PROBE99_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE101_PBUS_LSB = PROBE100_PBUS_LSB + PROBE100_WIDTH * (PROBE100_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE102_PBUS_LSB = PROBE101_PBUS_LSB + PROBE101_WIDTH * (PROBE101_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE103_PBUS_LSB = PROBE102_PBUS_LSB + PROBE102_WIDTH * (PROBE102_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE104_PBUS_LSB = PROBE103_PBUS_LSB + PROBE103_WIDTH * (PROBE103_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE105_PBUS_LSB = PROBE104_PBUS_LSB + PROBE104_WIDTH * (PROBE104_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE106_PBUS_LSB = PROBE105_PBUS_LSB + PROBE105_WIDTH * (PROBE105_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE107_PBUS_LSB = PROBE106_PBUS_LSB + PROBE106_WIDTH * (PROBE106_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE108_PBUS_LSB = PROBE107_PBUS_LSB + PROBE107_WIDTH * (PROBE107_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE109_PBUS_LSB = PROBE108_PBUS_LSB + PROBE108_WIDTH * (PROBE108_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE110_PBUS_LSB = PROBE109_PBUS_LSB + PROBE109_WIDTH * (PROBE109_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE111_PBUS_LSB = PROBE110_PBUS_LSB + PROBE110_WIDTH * (PROBE110_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE112_PBUS_LSB = PROBE111_PBUS_LSB + PROBE111_WIDTH * (PROBE111_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE113_PBUS_LSB = PROBE112_PBUS_LSB + PROBE112_WIDTH * (PROBE112_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE114_PBUS_LSB = PROBE113_PBUS_LSB + PROBE113_WIDTH * (PROBE113_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE115_PBUS_LSB = PROBE114_PBUS_LSB + PROBE114_WIDTH * (PROBE114_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE116_PBUS_LSB = PROBE115_PBUS_LSB + PROBE115_WIDTH * (PROBE115_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE117_PBUS_LSB = PROBE116_PBUS_LSB + PROBE116_WIDTH * (PROBE116_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE118_PBUS_LSB = PROBE117_PBUS_LSB + PROBE117_WIDTH * (PROBE117_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE119_PBUS_LSB = PROBE118_PBUS_LSB + PROBE118_WIDTH * (PROBE118_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE120_PBUS_LSB = PROBE119_PBUS_LSB + PROBE119_WIDTH * (PROBE119_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE121_PBUS_LSB = PROBE120_PBUS_LSB + PROBE120_WIDTH * (PROBE120_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE122_PBUS_LSB = PROBE121_PBUS_LSB + PROBE121_WIDTH * (PROBE121_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE123_PBUS_LSB = PROBE122_PBUS_LSB + PROBE122_WIDTH * (PROBE122_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE124_PBUS_LSB = PROBE123_PBUS_LSB + PROBE123_WIDTH * (PROBE123_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE125_PBUS_LSB = PROBE124_PBUS_LSB + PROBE124_WIDTH * (PROBE124_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE126_PBUS_LSB = PROBE125_PBUS_LSB + PROBE125_WIDTH * (PROBE125_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE127_PBUS_LSB = PROBE126_PBUS_LSB + PROBE126_WIDTH * (PROBE126_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE128_PBUS_LSB = PROBE127_PBUS_LSB + PROBE127_WIDTH * (PROBE127_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE129_PBUS_LSB = PROBE128_PBUS_LSB + PROBE128_WIDTH * (PROBE128_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE130_PBUS_LSB = PROBE129_PBUS_LSB + PROBE129_WIDTH * (PROBE129_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE131_PBUS_LSB = PROBE130_PBUS_LSB + PROBE130_WIDTH * (PROBE130_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE132_PBUS_LSB = PROBE131_PBUS_LSB + PROBE131_WIDTH * (PROBE131_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE133_PBUS_LSB = PROBE132_PBUS_LSB + PROBE132_WIDTH * (PROBE132_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE134_PBUS_LSB = PROBE133_PBUS_LSB + PROBE133_WIDTH * (PROBE133_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE135_PBUS_LSB = PROBE134_PBUS_LSB + PROBE134_WIDTH * (PROBE134_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE136_PBUS_LSB = PROBE135_PBUS_LSB + PROBE135_WIDTH * (PROBE135_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE137_PBUS_LSB = PROBE136_PBUS_LSB + PROBE136_WIDTH * (PROBE136_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE138_PBUS_LSB = PROBE137_PBUS_LSB + PROBE137_WIDTH * (PROBE137_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE139_PBUS_LSB = PROBE138_PBUS_LSB + PROBE138_WIDTH * (PROBE138_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE140_PBUS_LSB = PROBE139_PBUS_LSB + PROBE139_WIDTH * (PROBE139_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE141_PBUS_LSB = PROBE140_PBUS_LSB + PROBE140_WIDTH * (PROBE140_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE142_PBUS_LSB = PROBE141_PBUS_LSB + PROBE141_WIDTH * (PROBE141_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE143_PBUS_LSB = PROBE142_PBUS_LSB + PROBE142_WIDTH * (PROBE142_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE144_PBUS_LSB = PROBE143_PBUS_LSB + PROBE143_WIDTH * (PROBE143_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE145_PBUS_LSB = PROBE144_PBUS_LSB + PROBE144_WIDTH * (PROBE144_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE146_PBUS_LSB = PROBE145_PBUS_LSB + PROBE145_WIDTH * (PROBE145_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE147_PBUS_LSB = PROBE146_PBUS_LSB + PROBE146_WIDTH * (PROBE146_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE148_PBUS_LSB = PROBE147_PBUS_LSB + PROBE147_WIDTH * (PROBE147_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE149_PBUS_LSB = PROBE148_PBUS_LSB + PROBE148_WIDTH * (PROBE148_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE150_PBUS_LSB = PROBE149_PBUS_LSB + PROBE149_WIDTH * (PROBE149_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE151_PBUS_LSB = PROBE150_PBUS_LSB + PROBE150_WIDTH * (PROBE150_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE152_PBUS_LSB = PROBE151_PBUS_LSB + PROBE151_WIDTH * (PROBE151_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE153_PBUS_LSB = PROBE152_PBUS_LSB + PROBE152_WIDTH * (PROBE152_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE154_PBUS_LSB = PROBE153_PBUS_LSB + PROBE153_WIDTH * (PROBE153_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE155_PBUS_LSB = PROBE154_PBUS_LSB + PROBE154_WIDTH * (PROBE154_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE156_PBUS_LSB = PROBE155_PBUS_LSB + PROBE155_WIDTH * (PROBE155_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE157_PBUS_LSB = PROBE156_PBUS_LSB + PROBE156_WIDTH * (PROBE156_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE158_PBUS_LSB = PROBE157_PBUS_LSB + PROBE157_WIDTH * (PROBE157_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE159_PBUS_LSB = PROBE158_PBUS_LSB + PROBE158_WIDTH * (PROBE158_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE160_PBUS_LSB = PROBE159_PBUS_LSB + PROBE159_WIDTH * (PROBE159_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE161_PBUS_LSB = PROBE160_PBUS_LSB + PROBE160_WIDTH * (PROBE160_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE162_PBUS_LSB = PROBE161_PBUS_LSB + PROBE161_WIDTH * (PROBE161_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE163_PBUS_LSB = PROBE162_PBUS_LSB + PROBE162_WIDTH * (PROBE162_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE164_PBUS_LSB = PROBE163_PBUS_LSB + PROBE163_WIDTH * (PROBE163_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE165_PBUS_LSB = PROBE164_PBUS_LSB + PROBE164_WIDTH * (PROBE164_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE166_PBUS_LSB = PROBE165_PBUS_LSB + PROBE165_WIDTH * (PROBE165_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE167_PBUS_LSB = PROBE166_PBUS_LSB + PROBE166_WIDTH * (PROBE166_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE168_PBUS_LSB = PROBE167_PBUS_LSB + PROBE167_WIDTH * (PROBE167_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE169_PBUS_LSB = PROBE168_PBUS_LSB + PROBE168_WIDTH * (PROBE168_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE170_PBUS_LSB = PROBE169_PBUS_LSB + PROBE169_WIDTH * (PROBE169_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE171_PBUS_LSB = PROBE170_PBUS_LSB + PROBE170_WIDTH * (PROBE170_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE172_PBUS_LSB = PROBE171_PBUS_LSB + PROBE171_WIDTH * (PROBE171_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE173_PBUS_LSB = PROBE172_PBUS_LSB + PROBE172_WIDTH * (PROBE172_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE174_PBUS_LSB = PROBE173_PBUS_LSB + PROBE173_WIDTH * (PROBE173_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE175_PBUS_LSB = PROBE174_PBUS_LSB + PROBE174_WIDTH * (PROBE174_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE176_PBUS_LSB = PROBE175_PBUS_LSB + PROBE175_WIDTH * (PROBE175_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE177_PBUS_LSB = PROBE176_PBUS_LSB + PROBE176_WIDTH * (PROBE176_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE178_PBUS_LSB = PROBE177_PBUS_LSB + PROBE177_WIDTH * (PROBE177_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE179_PBUS_LSB = PROBE178_PBUS_LSB + PROBE178_WIDTH * (PROBE178_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE180_PBUS_LSB = PROBE179_PBUS_LSB + PROBE179_WIDTH * (PROBE179_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE181_PBUS_LSB = PROBE180_PBUS_LSB + PROBE180_WIDTH * (PROBE180_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE182_PBUS_LSB = PROBE181_PBUS_LSB + PROBE181_WIDTH * (PROBE181_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE183_PBUS_LSB = PROBE182_PBUS_LSB + PROBE182_WIDTH * (PROBE182_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE184_PBUS_LSB = PROBE183_PBUS_LSB + PROBE183_WIDTH * (PROBE183_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE185_PBUS_LSB = PROBE184_PBUS_LSB + PROBE184_WIDTH * (PROBE184_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE186_PBUS_LSB = PROBE185_PBUS_LSB + PROBE185_WIDTH * (PROBE185_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE187_PBUS_LSB = PROBE186_PBUS_LSB + PROBE186_WIDTH * (PROBE186_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE188_PBUS_LSB = PROBE187_PBUS_LSB + PROBE187_WIDTH * (PROBE187_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE189_PBUS_LSB = PROBE188_PBUS_LSB + PROBE188_WIDTH * (PROBE188_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE190_PBUS_LSB = PROBE189_PBUS_LSB + PROBE189_WIDTH * (PROBE189_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE191_PBUS_LSB = PROBE190_PBUS_LSB + PROBE190_WIDTH * (PROBE190_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE192_PBUS_LSB = PROBE191_PBUS_LSB + PROBE191_WIDTH * (PROBE191_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE193_PBUS_LSB = PROBE192_PBUS_LSB + PROBE192_WIDTH * (PROBE192_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE194_PBUS_LSB = PROBE193_PBUS_LSB + PROBE193_WIDTH * (PROBE193_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE195_PBUS_LSB = PROBE194_PBUS_LSB + PROBE194_WIDTH * (PROBE194_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE196_PBUS_LSB = PROBE195_PBUS_LSB + PROBE195_WIDTH * (PROBE195_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE197_PBUS_LSB = PROBE196_PBUS_LSB + PROBE196_WIDTH * (PROBE196_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE198_PBUS_LSB = PROBE197_PBUS_LSB + PROBE197_WIDTH * (PROBE197_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE199_PBUS_LSB = PROBE198_PBUS_LSB + PROBE198_WIDTH * (PROBE198_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE200_PBUS_LSB = PROBE199_PBUS_LSB + PROBE199_WIDTH * (PROBE199_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE201_PBUS_LSB = PROBE200_PBUS_LSB + PROBE200_WIDTH * (PROBE200_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE202_PBUS_LSB = PROBE201_PBUS_LSB + PROBE201_WIDTH * (PROBE201_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE203_PBUS_LSB = PROBE202_PBUS_LSB + PROBE202_WIDTH * (PROBE202_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE204_PBUS_LSB = PROBE203_PBUS_LSB + PROBE203_WIDTH * (PROBE203_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE205_PBUS_LSB = PROBE204_PBUS_LSB + PROBE204_WIDTH * (PROBE204_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE206_PBUS_LSB = PROBE205_PBUS_LSB + PROBE205_WIDTH * (PROBE205_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE207_PBUS_LSB = PROBE206_PBUS_LSB + PROBE206_WIDTH * (PROBE206_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE208_PBUS_LSB = PROBE207_PBUS_LSB + PROBE207_WIDTH * (PROBE207_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE209_PBUS_LSB = PROBE208_PBUS_LSB + PROBE208_WIDTH * (PROBE208_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE210_PBUS_LSB = PROBE209_PBUS_LSB + PROBE209_WIDTH * (PROBE209_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE211_PBUS_LSB = PROBE210_PBUS_LSB + PROBE210_WIDTH * (PROBE210_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE212_PBUS_LSB = PROBE211_PBUS_LSB + PROBE211_WIDTH * (PROBE211_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE213_PBUS_LSB = PROBE212_PBUS_LSB + PROBE212_WIDTH * (PROBE212_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE214_PBUS_LSB = PROBE213_PBUS_LSB + PROBE213_WIDTH * (PROBE213_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE215_PBUS_LSB = PROBE214_PBUS_LSB + PROBE214_WIDTH * (PROBE214_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE216_PBUS_LSB = PROBE215_PBUS_LSB + PROBE215_WIDTH * (PROBE215_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE217_PBUS_LSB = PROBE216_PBUS_LSB + PROBE216_WIDTH * (PROBE216_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE218_PBUS_LSB = PROBE217_PBUS_LSB + PROBE217_WIDTH * (PROBE217_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE219_PBUS_LSB = PROBE218_PBUS_LSB + PROBE218_WIDTH * (PROBE218_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE220_PBUS_LSB = PROBE219_PBUS_LSB + PROBE219_WIDTH * (PROBE219_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE221_PBUS_LSB = PROBE220_PBUS_LSB + PROBE220_WIDTH * (PROBE220_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE222_PBUS_LSB = PROBE221_PBUS_LSB + PROBE221_WIDTH * (PROBE221_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE223_PBUS_LSB = PROBE222_PBUS_LSB + PROBE222_WIDTH * (PROBE222_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE224_PBUS_LSB = PROBE223_PBUS_LSB + PROBE223_WIDTH * (PROBE223_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE225_PBUS_LSB = PROBE224_PBUS_LSB + PROBE224_WIDTH * (PROBE224_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE226_PBUS_LSB = PROBE225_PBUS_LSB + PROBE225_WIDTH * (PROBE225_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE227_PBUS_LSB = PROBE226_PBUS_LSB + PROBE226_WIDTH * (PROBE226_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE228_PBUS_LSB = PROBE227_PBUS_LSB + PROBE227_WIDTH * (PROBE227_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE229_PBUS_LSB = PROBE228_PBUS_LSB + PROBE228_WIDTH * (PROBE228_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE230_PBUS_LSB = PROBE229_PBUS_LSB + PROBE229_WIDTH * (PROBE229_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE231_PBUS_LSB = PROBE230_PBUS_LSB + PROBE230_WIDTH * (PROBE230_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE232_PBUS_LSB = PROBE231_PBUS_LSB + PROBE231_WIDTH * (PROBE231_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE233_PBUS_LSB = PROBE232_PBUS_LSB + PROBE232_WIDTH * (PROBE232_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE234_PBUS_LSB = PROBE233_PBUS_LSB + PROBE233_WIDTH * (PROBE233_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE235_PBUS_LSB = PROBE234_PBUS_LSB + PROBE234_WIDTH * (PROBE234_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE236_PBUS_LSB = PROBE235_PBUS_LSB + PROBE235_WIDTH * (PROBE235_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE237_PBUS_LSB = PROBE236_PBUS_LSB + PROBE236_WIDTH * (PROBE236_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE238_PBUS_LSB = PROBE237_PBUS_LSB + PROBE237_WIDTH * (PROBE237_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE239_PBUS_LSB = PROBE238_PBUS_LSB + PROBE238_WIDTH * (PROBE238_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE240_PBUS_LSB = PROBE239_PBUS_LSB + PROBE239_WIDTH * (PROBE239_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE241_PBUS_LSB = PROBE240_PBUS_LSB + PROBE240_WIDTH * (PROBE240_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE242_PBUS_LSB = PROBE241_PBUS_LSB + PROBE241_WIDTH * (PROBE241_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE243_PBUS_LSB = PROBE242_PBUS_LSB + PROBE242_WIDTH * (PROBE242_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE244_PBUS_LSB = PROBE243_PBUS_LSB + PROBE243_WIDTH * (PROBE243_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE245_PBUS_LSB = PROBE244_PBUS_LSB + PROBE244_WIDTH * (PROBE244_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE246_PBUS_LSB = PROBE245_PBUS_LSB + PROBE245_WIDTH * (PROBE245_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE247_PBUS_LSB = PROBE246_PBUS_LSB + PROBE246_WIDTH * (PROBE246_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE248_PBUS_LSB = PROBE247_PBUS_LSB + PROBE247_WIDTH * (PROBE247_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE249_PBUS_LSB = PROBE248_PBUS_LSB + PROBE248_WIDTH * (PROBE248_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE250_PBUS_LSB = PROBE249_PBUS_LSB + PROBE249_WIDTH * (PROBE249_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE251_PBUS_LSB = PROBE250_PBUS_LSB + PROBE250_WIDTH * (PROBE250_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE252_PBUS_LSB = PROBE251_PBUS_LSB + PROBE251_WIDTH * (PROBE251_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE253_PBUS_LSB = PROBE252_PBUS_LSB + PROBE252_WIDTH * (PROBE252_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE254_PBUS_LSB = PROBE253_PBUS_LSB + PROBE253_WIDTH * (PROBE253_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);
    localparam [31:0] PROBE255_PBUS_LSB = PROBE254_PBUS_LSB + PROBE254_WIDTH * (PROBE254_TYPE == PROBE_TYPE_NOT_USED ? 0 : 1);

    localparam [256*32-1:0] PROBE_DBUS_LSB_ARRAY = {
        PROBE255_DBUS_LSB, PROBE254_DBUS_LSB, PROBE253_DBUS_LSB, PROBE252_DBUS_LSB,
        PROBE251_DBUS_LSB, PROBE250_DBUS_LSB, PROBE249_DBUS_LSB, PROBE248_DBUS_LSB,
        PROBE247_DBUS_LSB, PROBE246_DBUS_LSB, PROBE245_DBUS_LSB, PROBE244_DBUS_LSB,
        PROBE243_DBUS_LSB, PROBE242_DBUS_LSB, PROBE241_DBUS_LSB, PROBE240_DBUS_LSB,
        PROBE239_DBUS_LSB, PROBE238_DBUS_LSB, PROBE237_DBUS_LSB, PROBE236_DBUS_LSB,
        PROBE235_DBUS_LSB, PROBE234_DBUS_LSB, PROBE233_DBUS_LSB, PROBE232_DBUS_LSB,
        PROBE231_DBUS_LSB, PROBE230_DBUS_LSB, PROBE229_DBUS_LSB, PROBE228_DBUS_LSB,
        PROBE227_DBUS_LSB, PROBE226_DBUS_LSB, PROBE225_DBUS_LSB, PROBE224_DBUS_LSB,
        PROBE223_DBUS_LSB, PROBE222_DBUS_LSB, PROBE221_DBUS_LSB, PROBE220_DBUS_LSB,
        PROBE219_DBUS_LSB, PROBE218_DBUS_LSB, PROBE217_DBUS_LSB, PROBE216_DBUS_LSB,
        PROBE215_DBUS_LSB, PROBE214_DBUS_LSB, PROBE213_DBUS_LSB, PROBE212_DBUS_LSB,
        PROBE211_DBUS_LSB, PROBE210_DBUS_LSB, PROBE209_DBUS_LSB, PROBE208_DBUS_LSB,
        PROBE207_DBUS_LSB, PROBE206_DBUS_LSB, PROBE205_DBUS_LSB, PROBE204_DBUS_LSB,
        PROBE203_DBUS_LSB, PROBE202_DBUS_LSB, PROBE201_DBUS_LSB, PROBE200_DBUS_LSB,
        PROBE199_DBUS_LSB, PROBE198_DBUS_LSB, PROBE197_DBUS_LSB, PROBE196_DBUS_LSB,
        PROBE195_DBUS_LSB, PROBE194_DBUS_LSB, PROBE193_DBUS_LSB, PROBE192_DBUS_LSB,
        PROBE191_DBUS_LSB, PROBE190_DBUS_LSB, PROBE189_DBUS_LSB, PROBE188_DBUS_LSB,
        PROBE187_DBUS_LSB, PROBE186_DBUS_LSB, PROBE185_DBUS_LSB, PROBE184_DBUS_LSB,
        PROBE183_DBUS_LSB, PROBE182_DBUS_LSB, PROBE181_DBUS_LSB, PROBE180_DBUS_LSB,
        PROBE179_DBUS_LSB, PROBE178_DBUS_LSB, PROBE177_DBUS_LSB, PROBE176_DBUS_LSB,
        PROBE175_DBUS_LSB, PROBE174_DBUS_LSB, PROBE173_DBUS_LSB, PROBE172_DBUS_LSB,
        PROBE171_DBUS_LSB, PROBE170_DBUS_LSB, PROBE169_DBUS_LSB, PROBE168_DBUS_LSB,
        PROBE167_DBUS_LSB, PROBE166_DBUS_LSB, PROBE165_DBUS_LSB, PROBE164_DBUS_LSB,
        PROBE163_DBUS_LSB, PROBE162_DBUS_LSB, PROBE161_DBUS_LSB, PROBE160_DBUS_LSB,
        PROBE159_DBUS_LSB, PROBE158_DBUS_LSB, PROBE157_DBUS_LSB, PROBE156_DBUS_LSB,
        PROBE155_DBUS_LSB, PROBE154_DBUS_LSB, PROBE153_DBUS_LSB, PROBE152_DBUS_LSB,
        PROBE151_DBUS_LSB, PROBE150_DBUS_LSB, PROBE149_DBUS_LSB, PROBE148_DBUS_LSB,
        PROBE147_DBUS_LSB, PROBE146_DBUS_LSB, PROBE145_DBUS_LSB, PROBE144_DBUS_LSB,
        PROBE143_DBUS_LSB, PROBE142_DBUS_LSB, PROBE141_DBUS_LSB, PROBE140_DBUS_LSB,
        PROBE139_DBUS_LSB, PROBE138_DBUS_LSB, PROBE137_DBUS_LSB, PROBE136_DBUS_LSB,
        PROBE135_DBUS_LSB, PROBE134_DBUS_LSB, PROBE133_DBUS_LSB, PROBE132_DBUS_LSB,
        PROBE131_DBUS_LSB, PROBE130_DBUS_LSB, PROBE129_DBUS_LSB, PROBE128_DBUS_LSB,
        PROBE127_DBUS_LSB, PROBE126_DBUS_LSB, PROBE125_DBUS_LSB, PROBE124_DBUS_LSB,
        PROBE123_DBUS_LSB, PROBE122_DBUS_LSB, PROBE121_DBUS_LSB, PROBE120_DBUS_LSB,
        PROBE119_DBUS_LSB, PROBE118_DBUS_LSB, PROBE117_DBUS_LSB, PROBE116_DBUS_LSB,
        PROBE115_DBUS_LSB, PROBE114_DBUS_LSB, PROBE113_DBUS_LSB, PROBE112_DBUS_LSB,
        PROBE111_DBUS_LSB, PROBE110_DBUS_LSB, PROBE109_DBUS_LSB, PROBE108_DBUS_LSB,
        PROBE107_DBUS_LSB, PROBE106_DBUS_LSB, PROBE105_DBUS_LSB, PROBE104_DBUS_LSB,
        PROBE103_DBUS_LSB, PROBE102_DBUS_LSB, PROBE101_DBUS_LSB, PROBE100_DBUS_LSB,
        PROBE99_DBUS_LSB, PROBE98_DBUS_LSB, PROBE97_DBUS_LSB, PROBE96_DBUS_LSB,
        PROBE95_DBUS_LSB, PROBE94_DBUS_LSB, PROBE93_DBUS_LSB, PROBE92_DBUS_LSB,
        PROBE91_DBUS_LSB, PROBE90_DBUS_LSB, PROBE89_DBUS_LSB, PROBE88_DBUS_LSB,
        PROBE87_DBUS_LSB, PROBE86_DBUS_LSB, PROBE85_DBUS_LSB, PROBE84_DBUS_LSB,
        PROBE83_DBUS_LSB, PROBE82_DBUS_LSB, PROBE81_DBUS_LSB, PROBE80_DBUS_LSB,
        PROBE79_DBUS_LSB, PROBE78_DBUS_LSB, PROBE77_DBUS_LSB, PROBE76_DBUS_LSB,
        PROBE75_DBUS_LSB, PROBE74_DBUS_LSB, PROBE73_DBUS_LSB, PROBE72_DBUS_LSB,
        PROBE71_DBUS_LSB, PROBE70_DBUS_LSB, PROBE69_DBUS_LSB, PROBE68_DBUS_LSB,
        PROBE67_DBUS_LSB, PROBE66_DBUS_LSB, PROBE65_DBUS_LSB, PROBE64_DBUS_LSB,
        PROBE63_DBUS_LSB, PROBE62_DBUS_LSB, PROBE61_DBUS_LSB, PROBE60_DBUS_LSB,
        PROBE59_DBUS_LSB, PROBE58_DBUS_LSB, PROBE57_DBUS_LSB, PROBE56_DBUS_LSB,
        PROBE55_DBUS_LSB, PROBE54_DBUS_LSB, PROBE53_DBUS_LSB, PROBE52_DBUS_LSB,
        PROBE51_DBUS_LSB, PROBE50_DBUS_LSB, PROBE49_DBUS_LSB, PROBE48_DBUS_LSB,
        PROBE47_DBUS_LSB, PROBE46_DBUS_LSB, PROBE45_DBUS_LSB, PROBE44_DBUS_LSB,
        PROBE43_DBUS_LSB, PROBE42_DBUS_LSB, PROBE41_DBUS_LSB, PROBE40_DBUS_LSB,
        PROBE39_DBUS_LSB, PROBE38_DBUS_LSB, PROBE37_DBUS_LSB, PROBE36_DBUS_LSB,
        PROBE35_DBUS_LSB, PROBE34_DBUS_LSB, PROBE33_DBUS_LSB, PROBE32_DBUS_LSB,
        PROBE31_DBUS_LSB, PROBE30_DBUS_LSB, PROBE29_DBUS_LSB, PROBE28_DBUS_LSB,
        PROBE27_DBUS_LSB, PROBE26_DBUS_LSB, PROBE25_DBUS_LSB, PROBE24_DBUS_LSB,
        PROBE23_DBUS_LSB, PROBE22_DBUS_LSB, PROBE21_DBUS_LSB, PROBE20_DBUS_LSB,
        PROBE19_DBUS_LSB, PROBE18_DBUS_LSB, PROBE17_DBUS_LSB, PROBE16_DBUS_LSB,
        PROBE15_DBUS_LSB, PROBE14_DBUS_LSB, PROBE13_DBUS_LSB, PROBE12_DBUS_LSB,
        PROBE11_DBUS_LSB, PROBE10_DBUS_LSB, PROBE9_DBUS_LSB, PROBE8_DBUS_LSB,
        PROBE7_DBUS_LSB, PROBE6_DBUS_LSB, PROBE5_DBUS_LSB, PROBE4_DBUS_LSB,
        PROBE3_DBUS_LSB, PROBE2_DBUS_LSB, PROBE1_DBUS_LSB, PROBE0_DBUS_LSB};

    localparam [256*32-1:0] PROBE_CBUS_LSB_ARRAY = {
        PROBE255_CBUS_LSB, PROBE254_CBUS_LSB, PROBE253_CBUS_LSB, PROBE252_CBUS_LSB,
        PROBE251_CBUS_LSB, PROBE250_CBUS_LSB, PROBE249_CBUS_LSB, PROBE248_CBUS_LSB,
        PROBE247_CBUS_LSB, PROBE246_CBUS_LSB, PROBE245_CBUS_LSB, PROBE244_CBUS_LSB,
        PROBE243_CBUS_LSB, PROBE242_CBUS_LSB, PROBE241_CBUS_LSB, PROBE240_CBUS_LSB,
        PROBE239_CBUS_LSB, PROBE238_CBUS_LSB, PROBE237_CBUS_LSB, PROBE236_CBUS_LSB,
        PROBE235_CBUS_LSB, PROBE234_CBUS_LSB, PROBE233_CBUS_LSB, PROBE232_CBUS_LSB,
        PROBE231_CBUS_LSB, PROBE230_CBUS_LSB, PROBE229_CBUS_LSB, PROBE228_CBUS_LSB,
        PROBE227_CBUS_LSB, PROBE226_CBUS_LSB, PROBE225_CBUS_LSB, PROBE224_CBUS_LSB,
        PROBE223_CBUS_LSB, PROBE222_CBUS_LSB, PROBE221_CBUS_LSB, PROBE220_CBUS_LSB,
        PROBE219_CBUS_LSB, PROBE218_CBUS_LSB, PROBE217_CBUS_LSB, PROBE216_CBUS_LSB,
        PROBE215_CBUS_LSB, PROBE214_CBUS_LSB, PROBE213_CBUS_LSB, PROBE212_CBUS_LSB,
        PROBE211_CBUS_LSB, PROBE210_CBUS_LSB, PROBE209_CBUS_LSB, PROBE208_CBUS_LSB,
        PROBE207_CBUS_LSB, PROBE206_CBUS_LSB, PROBE205_CBUS_LSB, PROBE204_CBUS_LSB,
        PROBE203_CBUS_LSB, PROBE202_CBUS_LSB, PROBE201_CBUS_LSB, PROBE200_CBUS_LSB,
        PROBE199_CBUS_LSB, PROBE198_CBUS_LSB, PROBE197_CBUS_LSB, PROBE196_CBUS_LSB,
        PROBE195_CBUS_LSB, PROBE194_CBUS_LSB, PROBE193_CBUS_LSB, PROBE192_CBUS_LSB,
        PROBE191_CBUS_LSB, PROBE190_CBUS_LSB, PROBE189_CBUS_LSB, PROBE188_CBUS_LSB,
        PROBE187_CBUS_LSB, PROBE186_CBUS_LSB, PROBE185_CBUS_LSB, PROBE184_CBUS_LSB,
        PROBE183_CBUS_LSB, PROBE182_CBUS_LSB, PROBE181_CBUS_LSB, PROBE180_CBUS_LSB,
        PROBE179_CBUS_LSB, PROBE178_CBUS_LSB, PROBE177_CBUS_LSB, PROBE176_CBUS_LSB,
        PROBE175_CBUS_LSB, PROBE174_CBUS_LSB, PROBE173_CBUS_LSB, PROBE172_CBUS_LSB,
        PROBE171_CBUS_LSB, PROBE170_CBUS_LSB, PROBE169_CBUS_LSB, PROBE168_CBUS_LSB,
        PROBE167_CBUS_LSB, PROBE166_CBUS_LSB, PROBE165_CBUS_LSB, PROBE164_CBUS_LSB,
        PROBE163_CBUS_LSB, PROBE162_CBUS_LSB, PROBE161_CBUS_LSB, PROBE160_CBUS_LSB,
        PROBE159_CBUS_LSB, PROBE158_CBUS_LSB, PROBE157_CBUS_LSB, PROBE156_CBUS_LSB,
        PROBE155_CBUS_LSB, PROBE154_CBUS_LSB, PROBE153_CBUS_LSB, PROBE152_CBUS_LSB,
        PROBE151_CBUS_LSB, PROBE150_CBUS_LSB, PROBE149_CBUS_LSB, PROBE148_CBUS_LSB,
        PROBE147_CBUS_LSB, PROBE146_CBUS_LSB, PROBE145_CBUS_LSB, PROBE144_CBUS_LSB,
        PROBE143_CBUS_LSB, PROBE142_CBUS_LSB, PROBE141_CBUS_LSB, PROBE140_CBUS_LSB,
        PROBE139_CBUS_LSB, PROBE138_CBUS_LSB, PROBE137_CBUS_LSB, PROBE136_CBUS_LSB,
        PROBE135_CBUS_LSB, PROBE134_CBUS_LSB, PROBE133_CBUS_LSB, PROBE132_CBUS_LSB,
        PROBE131_CBUS_LSB, PROBE130_CBUS_LSB, PROBE129_CBUS_LSB, PROBE128_CBUS_LSB,
        PROBE127_CBUS_LSB, PROBE126_CBUS_LSB, PROBE125_CBUS_LSB, PROBE124_CBUS_LSB,
        PROBE123_CBUS_LSB, PROBE122_CBUS_LSB, PROBE121_CBUS_LSB, PROBE120_CBUS_LSB,
        PROBE119_CBUS_LSB, PROBE118_CBUS_LSB, PROBE117_CBUS_LSB, PROBE116_CBUS_LSB,
        PROBE115_CBUS_LSB, PROBE114_CBUS_LSB, PROBE113_CBUS_LSB, PROBE112_CBUS_LSB,
        PROBE111_CBUS_LSB, PROBE110_CBUS_LSB, PROBE109_CBUS_LSB, PROBE108_CBUS_LSB,
        PROBE107_CBUS_LSB, PROBE106_CBUS_LSB, PROBE105_CBUS_LSB, PROBE104_CBUS_LSB,
        PROBE103_CBUS_LSB, PROBE102_CBUS_LSB, PROBE101_CBUS_LSB, PROBE100_CBUS_LSB,
        PROBE99_CBUS_LSB, PROBE98_CBUS_LSB, PROBE97_CBUS_LSB, PROBE96_CBUS_LSB,
        PROBE95_CBUS_LSB, PROBE94_CBUS_LSB, PROBE93_CBUS_LSB, PROBE92_CBUS_LSB,
        PROBE91_CBUS_LSB, PROBE90_CBUS_LSB, PROBE89_CBUS_LSB, PROBE88_CBUS_LSB,
        PROBE87_CBUS_LSB, PROBE86_CBUS_LSB, PROBE85_CBUS_LSB, PROBE84_CBUS_LSB,
        PROBE83_CBUS_LSB, PROBE82_CBUS_LSB, PROBE81_CBUS_LSB, PROBE80_CBUS_LSB,
        PROBE79_CBUS_LSB, PROBE78_CBUS_LSB, PROBE77_CBUS_LSB, PROBE76_CBUS_LSB,
        PROBE75_CBUS_LSB, PROBE74_CBUS_LSB, PROBE73_CBUS_LSB, PROBE72_CBUS_LSB,
        PROBE71_CBUS_LSB, PROBE70_CBUS_LSB, PROBE69_CBUS_LSB, PROBE68_CBUS_LSB,
        PROBE67_CBUS_LSB, PROBE66_CBUS_LSB, PROBE65_CBUS_LSB, PROBE64_CBUS_LSB,
        PROBE63_CBUS_LSB, PROBE62_CBUS_LSB, PROBE61_CBUS_LSB, PROBE60_CBUS_LSB,
        PROBE59_CBUS_LSB, PROBE58_CBUS_LSB, PROBE57_CBUS_LSB, PROBE56_CBUS_LSB,
        PROBE55_CBUS_LSB, PROBE54_CBUS_LSB, PROBE53_CBUS_LSB, PROBE52_CBUS_LSB,
        PROBE51_CBUS_LSB, PROBE50_CBUS_LSB, PROBE49_CBUS_LSB, PROBE48_CBUS_LSB,
        PROBE47_CBUS_LSB, PROBE46_CBUS_LSB, PROBE45_CBUS_LSB, PROBE44_CBUS_LSB,
        PROBE43_CBUS_LSB, PROBE42_CBUS_LSB, PROBE41_CBUS_LSB, PROBE40_CBUS_LSB,
        PROBE39_CBUS_LSB, PROBE38_CBUS_LSB, PROBE37_CBUS_LSB, PROBE36_CBUS_LSB,
        PROBE35_CBUS_LSB, PROBE34_CBUS_LSB, PROBE33_CBUS_LSB, PROBE32_CBUS_LSB,
        PROBE31_CBUS_LSB, PROBE30_CBUS_LSB, PROBE29_CBUS_LSB, PROBE28_CBUS_LSB,
        PROBE27_CBUS_LSB, PROBE26_CBUS_LSB, PROBE25_CBUS_LSB, PROBE24_CBUS_LSB,
        PROBE23_CBUS_LSB, PROBE22_CBUS_LSB, PROBE21_CBUS_LSB, PROBE20_CBUS_LSB,
        PROBE19_CBUS_LSB, PROBE18_CBUS_LSB, PROBE17_CBUS_LSB, PROBE16_CBUS_LSB,
        PROBE15_CBUS_LSB, PROBE14_CBUS_LSB, PROBE13_CBUS_LSB, PROBE12_CBUS_LSB,
        PROBE11_CBUS_LSB, PROBE10_CBUS_LSB, PROBE9_CBUS_LSB, PROBE8_CBUS_LSB,
        PROBE7_CBUS_LSB, PROBE6_CBUS_LSB, PROBE5_CBUS_LSB, PROBE4_CBUS_LSB,
        PROBE3_CBUS_LSB, PROBE2_CBUS_LSB, PROBE1_CBUS_LSB, PROBE0_CBUS_LSB};

    localparam [256*32-1:0] PROBE_TBUS_LSB_ARRAY = {
        PROBE255_TBUS_LSB, PROBE254_TBUS_LSB, PROBE253_TBUS_LSB, PROBE252_TBUS_LSB,
        PROBE251_TBUS_LSB, PROBE250_TBUS_LSB, PROBE249_TBUS_LSB, PROBE248_TBUS_LSB,
        PROBE247_TBUS_LSB, PROBE246_TBUS_LSB, PROBE245_TBUS_LSB, PROBE244_TBUS_LSB,
        PROBE243_TBUS_LSB, PROBE242_TBUS_LSB, PROBE241_TBUS_LSB, PROBE240_TBUS_LSB,
        PROBE239_TBUS_LSB, PROBE238_TBUS_LSB, PROBE237_TBUS_LSB, PROBE236_TBUS_LSB,
        PROBE235_TBUS_LSB, PROBE234_TBUS_LSB, PROBE233_TBUS_LSB, PROBE232_TBUS_LSB,
        PROBE231_TBUS_LSB, PROBE230_TBUS_LSB, PROBE229_TBUS_LSB, PROBE228_TBUS_LSB,
        PROBE227_TBUS_LSB, PROBE226_TBUS_LSB, PROBE225_TBUS_LSB, PROBE224_TBUS_LSB,
        PROBE223_TBUS_LSB, PROBE222_TBUS_LSB, PROBE221_TBUS_LSB, PROBE220_TBUS_LSB,
        PROBE219_TBUS_LSB, PROBE218_TBUS_LSB, PROBE217_TBUS_LSB, PROBE216_TBUS_LSB,
        PROBE215_TBUS_LSB, PROBE214_TBUS_LSB, PROBE213_TBUS_LSB, PROBE212_TBUS_LSB,
        PROBE211_TBUS_LSB, PROBE210_TBUS_LSB, PROBE209_TBUS_LSB, PROBE208_TBUS_LSB,
        PROBE207_TBUS_LSB, PROBE206_TBUS_LSB, PROBE205_TBUS_LSB, PROBE204_TBUS_LSB,
        PROBE203_TBUS_LSB, PROBE202_TBUS_LSB, PROBE201_TBUS_LSB, PROBE200_TBUS_LSB,
        PROBE199_TBUS_LSB, PROBE198_TBUS_LSB, PROBE197_TBUS_LSB, PROBE196_TBUS_LSB,
        PROBE195_TBUS_LSB, PROBE194_TBUS_LSB, PROBE193_TBUS_LSB, PROBE192_TBUS_LSB,
        PROBE191_TBUS_LSB, PROBE190_TBUS_LSB, PROBE189_TBUS_LSB, PROBE188_TBUS_LSB,
        PROBE187_TBUS_LSB, PROBE186_TBUS_LSB, PROBE185_TBUS_LSB, PROBE184_TBUS_LSB,
        PROBE183_TBUS_LSB, PROBE182_TBUS_LSB, PROBE181_TBUS_LSB, PROBE180_TBUS_LSB,
        PROBE179_TBUS_LSB, PROBE178_TBUS_LSB, PROBE177_TBUS_LSB, PROBE176_TBUS_LSB,
        PROBE175_TBUS_LSB, PROBE174_TBUS_LSB, PROBE173_TBUS_LSB, PROBE172_TBUS_LSB,
        PROBE171_TBUS_LSB, PROBE170_TBUS_LSB, PROBE169_TBUS_LSB, PROBE168_TBUS_LSB,
        PROBE167_TBUS_LSB, PROBE166_TBUS_LSB, PROBE165_TBUS_LSB, PROBE164_TBUS_LSB,
        PROBE163_TBUS_LSB, PROBE162_TBUS_LSB, PROBE161_TBUS_LSB, PROBE160_TBUS_LSB,
        PROBE159_TBUS_LSB, PROBE158_TBUS_LSB, PROBE157_TBUS_LSB, PROBE156_TBUS_LSB,
        PROBE155_TBUS_LSB, PROBE154_TBUS_LSB, PROBE153_TBUS_LSB, PROBE152_TBUS_LSB,
        PROBE151_TBUS_LSB, PROBE150_TBUS_LSB, PROBE149_TBUS_LSB, PROBE148_TBUS_LSB,
        PROBE147_TBUS_LSB, PROBE146_TBUS_LSB, PROBE145_TBUS_LSB, PROBE144_TBUS_LSB,
        PROBE143_TBUS_LSB, PROBE142_TBUS_LSB, PROBE141_TBUS_LSB, PROBE140_TBUS_LSB,
        PROBE139_TBUS_LSB, PROBE138_TBUS_LSB, PROBE137_TBUS_LSB, PROBE136_TBUS_LSB,
        PROBE135_TBUS_LSB, PROBE134_TBUS_LSB, PROBE133_TBUS_LSB, PROBE132_TBUS_LSB,
        PROBE131_TBUS_LSB, PROBE130_TBUS_LSB, PROBE129_TBUS_LSB, PROBE128_TBUS_LSB,
        PROBE127_TBUS_LSB, PROBE126_TBUS_LSB, PROBE125_TBUS_LSB, PROBE124_TBUS_LSB,
        PROBE123_TBUS_LSB, PROBE122_TBUS_LSB, PROBE121_TBUS_LSB, PROBE120_TBUS_LSB,
        PROBE119_TBUS_LSB, PROBE118_TBUS_LSB, PROBE117_TBUS_LSB, PROBE116_TBUS_LSB,
        PROBE115_TBUS_LSB, PROBE114_TBUS_LSB, PROBE113_TBUS_LSB, PROBE112_TBUS_LSB,
        PROBE111_TBUS_LSB, PROBE110_TBUS_LSB, PROBE109_TBUS_LSB, PROBE108_TBUS_LSB,
        PROBE107_TBUS_LSB, PROBE106_TBUS_LSB, PROBE105_TBUS_LSB, PROBE104_TBUS_LSB,
        PROBE103_TBUS_LSB, PROBE102_TBUS_LSB, PROBE101_TBUS_LSB, PROBE100_TBUS_LSB,
        PROBE99_TBUS_LSB, PROBE98_TBUS_LSB, PROBE97_TBUS_LSB, PROBE96_TBUS_LSB,
        PROBE95_TBUS_LSB, PROBE94_TBUS_LSB, PROBE93_TBUS_LSB, PROBE92_TBUS_LSB,
        PROBE91_TBUS_LSB, PROBE90_TBUS_LSB, PROBE89_TBUS_LSB, PROBE88_TBUS_LSB,
        PROBE87_TBUS_LSB, PROBE86_TBUS_LSB, PROBE85_TBUS_LSB, PROBE84_TBUS_LSB,
        PROBE83_TBUS_LSB, PROBE82_TBUS_LSB, PROBE81_TBUS_LSB, PROBE80_TBUS_LSB,
        PROBE79_TBUS_LSB, PROBE78_TBUS_LSB, PROBE77_TBUS_LSB, PROBE76_TBUS_LSB,
        PROBE75_TBUS_LSB, PROBE74_TBUS_LSB, PROBE73_TBUS_LSB, PROBE72_TBUS_LSB,
        PROBE71_TBUS_LSB, PROBE70_TBUS_LSB, PROBE69_TBUS_LSB, PROBE68_TBUS_LSB,
        PROBE67_TBUS_LSB, PROBE66_TBUS_LSB, PROBE65_TBUS_LSB, PROBE64_TBUS_LSB,
        PROBE63_TBUS_LSB, PROBE62_TBUS_LSB, PROBE61_TBUS_LSB, PROBE60_TBUS_LSB,
        PROBE59_TBUS_LSB, PROBE58_TBUS_LSB, PROBE57_TBUS_LSB, PROBE56_TBUS_LSB,
        PROBE55_TBUS_LSB, PROBE54_TBUS_LSB, PROBE53_TBUS_LSB, PROBE52_TBUS_LSB,
        PROBE51_TBUS_LSB, PROBE50_TBUS_LSB, PROBE49_TBUS_LSB, PROBE48_TBUS_LSB,
        PROBE47_TBUS_LSB, PROBE46_TBUS_LSB, PROBE45_TBUS_LSB, PROBE44_TBUS_LSB,
        PROBE43_TBUS_LSB, PROBE42_TBUS_LSB, PROBE41_TBUS_LSB, PROBE40_TBUS_LSB,
        PROBE39_TBUS_LSB, PROBE38_TBUS_LSB, PROBE37_TBUS_LSB, PROBE36_TBUS_LSB,
        PROBE35_TBUS_LSB, PROBE34_TBUS_LSB, PROBE33_TBUS_LSB, PROBE32_TBUS_LSB,
        PROBE31_TBUS_LSB, PROBE30_TBUS_LSB, PROBE29_TBUS_LSB, PROBE28_TBUS_LSB,
        PROBE27_TBUS_LSB, PROBE26_TBUS_LSB, PROBE25_TBUS_LSB, PROBE24_TBUS_LSB,
        PROBE23_TBUS_LSB, PROBE22_TBUS_LSB, PROBE21_TBUS_LSB, PROBE20_TBUS_LSB,
        PROBE19_TBUS_LSB, PROBE18_TBUS_LSB, PROBE17_TBUS_LSB, PROBE16_TBUS_LSB,
        PROBE15_TBUS_LSB, PROBE14_TBUS_LSB, PROBE13_TBUS_LSB, PROBE12_TBUS_LSB,
        PROBE11_TBUS_LSB, PROBE10_TBUS_LSB, PROBE9_TBUS_LSB, PROBE8_TBUS_LSB,
        PROBE7_TBUS_LSB, PROBE6_TBUS_LSB, PROBE5_TBUS_LSB, PROBE4_TBUS_LSB,
        PROBE3_TBUS_LSB, PROBE2_TBUS_LSB, PROBE1_TBUS_LSB, PROBE0_TBUS_LSB};

    localparam [256*32-1:0] PROBE_PBUS_LSB_ARRAY = {
        PROBE255_PBUS_LSB, PROBE254_PBUS_LSB, PROBE253_PBUS_LSB, PROBE252_PBUS_LSB,
        PROBE251_PBUS_LSB, PROBE250_PBUS_LSB, PROBE249_PBUS_LSB, PROBE248_PBUS_LSB,
        PROBE247_PBUS_LSB, PROBE246_PBUS_LSB, PROBE245_PBUS_LSB, PROBE244_PBUS_LSB,
        PROBE243_PBUS_LSB, PROBE242_PBUS_LSB, PROBE241_PBUS_LSB, PROBE240_PBUS_LSB,
        PROBE239_PBUS_LSB, PROBE238_PBUS_LSB, PROBE237_PBUS_LSB, PROBE236_PBUS_LSB,
        PROBE235_PBUS_LSB, PROBE234_PBUS_LSB, PROBE233_PBUS_LSB, PROBE232_PBUS_LSB,
        PROBE231_PBUS_LSB, PROBE230_PBUS_LSB, PROBE229_PBUS_LSB, PROBE228_PBUS_LSB,
        PROBE227_PBUS_LSB, PROBE226_PBUS_LSB, PROBE225_PBUS_LSB, PROBE224_PBUS_LSB,
        PROBE223_PBUS_LSB, PROBE222_PBUS_LSB, PROBE221_PBUS_LSB, PROBE220_PBUS_LSB,
        PROBE219_PBUS_LSB, PROBE218_PBUS_LSB, PROBE217_PBUS_LSB, PROBE216_PBUS_LSB,
        PROBE215_PBUS_LSB, PROBE214_PBUS_LSB, PROBE213_PBUS_LSB, PROBE212_PBUS_LSB,
        PROBE211_PBUS_LSB, PROBE210_PBUS_LSB, PROBE209_PBUS_LSB, PROBE208_PBUS_LSB,
        PROBE207_PBUS_LSB, PROBE206_PBUS_LSB, PROBE205_PBUS_LSB, PROBE204_PBUS_LSB,
        PROBE203_PBUS_LSB, PROBE202_PBUS_LSB, PROBE201_PBUS_LSB, PROBE200_PBUS_LSB,
        PROBE199_PBUS_LSB, PROBE198_PBUS_LSB, PROBE197_PBUS_LSB, PROBE196_PBUS_LSB,
        PROBE195_PBUS_LSB, PROBE194_PBUS_LSB, PROBE193_PBUS_LSB, PROBE192_PBUS_LSB,
        PROBE191_PBUS_LSB, PROBE190_PBUS_LSB, PROBE189_PBUS_LSB, PROBE188_PBUS_LSB,
        PROBE187_PBUS_LSB, PROBE186_PBUS_LSB, PROBE185_PBUS_LSB, PROBE184_PBUS_LSB,
        PROBE183_PBUS_LSB, PROBE182_PBUS_LSB, PROBE181_PBUS_LSB, PROBE180_PBUS_LSB,
        PROBE179_PBUS_LSB, PROBE178_PBUS_LSB, PROBE177_PBUS_LSB, PROBE176_PBUS_LSB,
        PROBE175_PBUS_LSB, PROBE174_PBUS_LSB, PROBE173_PBUS_LSB, PROBE172_PBUS_LSB,
        PROBE171_PBUS_LSB, PROBE170_PBUS_LSB, PROBE169_PBUS_LSB, PROBE168_PBUS_LSB,
        PROBE167_PBUS_LSB, PROBE166_PBUS_LSB, PROBE165_PBUS_LSB, PROBE164_PBUS_LSB,
        PROBE163_PBUS_LSB, PROBE162_PBUS_LSB, PROBE161_PBUS_LSB, PROBE160_PBUS_LSB,
        PROBE159_PBUS_LSB, PROBE158_PBUS_LSB, PROBE157_PBUS_LSB, PROBE156_PBUS_LSB,
        PROBE155_PBUS_LSB, PROBE154_PBUS_LSB, PROBE153_PBUS_LSB, PROBE152_PBUS_LSB,
        PROBE151_PBUS_LSB, PROBE150_PBUS_LSB, PROBE149_PBUS_LSB, PROBE148_PBUS_LSB,
        PROBE147_PBUS_LSB, PROBE146_PBUS_LSB, PROBE145_PBUS_LSB, PROBE144_PBUS_LSB,
        PROBE143_PBUS_LSB, PROBE142_PBUS_LSB, PROBE141_PBUS_LSB, PROBE140_PBUS_LSB,
        PROBE139_PBUS_LSB, PROBE138_PBUS_LSB, PROBE137_PBUS_LSB, PROBE136_PBUS_LSB,
        PROBE135_PBUS_LSB, PROBE134_PBUS_LSB, PROBE133_PBUS_LSB, PROBE132_PBUS_LSB,
        PROBE131_PBUS_LSB, PROBE130_PBUS_LSB, PROBE129_PBUS_LSB, PROBE128_PBUS_LSB,
        PROBE127_PBUS_LSB, PROBE126_PBUS_LSB, PROBE125_PBUS_LSB, PROBE124_PBUS_LSB,
        PROBE123_PBUS_LSB, PROBE122_PBUS_LSB, PROBE121_PBUS_LSB, PROBE120_PBUS_LSB,
        PROBE119_PBUS_LSB, PROBE118_PBUS_LSB, PROBE117_PBUS_LSB, PROBE116_PBUS_LSB,
        PROBE115_PBUS_LSB, PROBE114_PBUS_LSB, PROBE113_PBUS_LSB, PROBE112_PBUS_LSB,
        PROBE111_PBUS_LSB, PROBE110_PBUS_LSB, PROBE109_PBUS_LSB, PROBE108_PBUS_LSB,
        PROBE107_PBUS_LSB, PROBE106_PBUS_LSB, PROBE105_PBUS_LSB, PROBE104_PBUS_LSB,
        PROBE103_PBUS_LSB, PROBE102_PBUS_LSB, PROBE101_PBUS_LSB, PROBE100_PBUS_LSB,
        PROBE99_PBUS_LSB, PROBE98_PBUS_LSB, PROBE97_PBUS_LSB, PROBE96_PBUS_LSB,
        PROBE95_PBUS_LSB, PROBE94_PBUS_LSB, PROBE93_PBUS_LSB, PROBE92_PBUS_LSB,
        PROBE91_PBUS_LSB, PROBE90_PBUS_LSB, PROBE89_PBUS_LSB, PROBE88_PBUS_LSB,
        PROBE87_PBUS_LSB, PROBE86_PBUS_LSB, PROBE85_PBUS_LSB, PROBE84_PBUS_LSB,
        PROBE83_PBUS_LSB, PROBE82_PBUS_LSB, PROBE81_PBUS_LSB, PROBE80_PBUS_LSB,
        PROBE79_PBUS_LSB, PROBE78_PBUS_LSB, PROBE77_PBUS_LSB, PROBE76_PBUS_LSB,
        PROBE75_PBUS_LSB, PROBE74_PBUS_LSB, PROBE73_PBUS_LSB, PROBE72_PBUS_LSB,
        PROBE71_PBUS_LSB, PROBE70_PBUS_LSB, PROBE69_PBUS_LSB, PROBE68_PBUS_LSB,
        PROBE67_PBUS_LSB, PROBE66_PBUS_LSB, PROBE65_PBUS_LSB, PROBE64_PBUS_LSB,
        PROBE63_PBUS_LSB, PROBE62_PBUS_LSB, PROBE61_PBUS_LSB, PROBE60_PBUS_LSB,
        PROBE59_PBUS_LSB, PROBE58_PBUS_LSB, PROBE57_PBUS_LSB, PROBE56_PBUS_LSB,
        PROBE55_PBUS_LSB, PROBE54_PBUS_LSB, PROBE53_PBUS_LSB, PROBE52_PBUS_LSB,
        PROBE51_PBUS_LSB, PROBE50_PBUS_LSB, PROBE49_PBUS_LSB, PROBE48_PBUS_LSB,
        PROBE47_PBUS_LSB, PROBE46_PBUS_LSB, PROBE45_PBUS_LSB, PROBE44_PBUS_LSB,
        PROBE43_PBUS_LSB, PROBE42_PBUS_LSB, PROBE41_PBUS_LSB, PROBE40_PBUS_LSB,
        PROBE39_PBUS_LSB, PROBE38_PBUS_LSB, PROBE37_PBUS_LSB, PROBE36_PBUS_LSB,
        PROBE35_PBUS_LSB, PROBE34_PBUS_LSB, PROBE33_PBUS_LSB, PROBE32_PBUS_LSB,
        PROBE31_PBUS_LSB, PROBE30_PBUS_LSB, PROBE29_PBUS_LSB, PROBE28_PBUS_LSB,
        PROBE27_PBUS_LSB, PROBE26_PBUS_LSB, PROBE25_PBUS_LSB, PROBE24_PBUS_LSB,
        PROBE23_PBUS_LSB, PROBE22_PBUS_LSB, PROBE21_PBUS_LSB, PROBE20_PBUS_LSB,
        PROBE19_PBUS_LSB, PROBE18_PBUS_LSB, PROBE17_PBUS_LSB, PROBE16_PBUS_LSB,
        PROBE15_PBUS_LSB, PROBE14_PBUS_LSB, PROBE13_PBUS_LSB, PROBE12_PBUS_LSB,
        PROBE11_PBUS_LSB, PROBE10_PBUS_LSB, PROBE9_PBUS_LSB, PROBE8_PBUS_LSB,
        PROBE7_PBUS_LSB, PROBE6_PBUS_LSB, PROBE5_PBUS_LSB, PROBE4_PBUS_LSB,
        PROBE3_PBUS_LSB, PROBE2_PBUS_LSB, PROBE1_PBUS_LSB, PROBE0_PBUS_LSB};

    localparam [256*11-1:0] PROBE_WIDTH_ARRAY = {
        PROBE255_WIDTH, PROBE254_WIDTH, PROBE253_WIDTH, PROBE252_WIDTH,
        PROBE251_WIDTH, PROBE250_WIDTH, PROBE249_WIDTH, PROBE248_WIDTH,
        PROBE247_WIDTH, PROBE246_WIDTH, PROBE245_WIDTH, PROBE244_WIDTH,
        PROBE243_WIDTH, PROBE242_WIDTH, PROBE241_WIDTH, PROBE240_WIDTH,
        PROBE239_WIDTH, PROBE238_WIDTH, PROBE237_WIDTH, PROBE236_WIDTH,
        PROBE235_WIDTH, PROBE234_WIDTH, PROBE233_WIDTH, PROBE232_WIDTH,
        PROBE231_WIDTH, PROBE230_WIDTH, PROBE229_WIDTH, PROBE228_WIDTH,
        PROBE227_WIDTH, PROBE226_WIDTH, PROBE225_WIDTH, PROBE224_WIDTH,
        PROBE223_WIDTH, PROBE222_WIDTH, PROBE221_WIDTH, PROBE220_WIDTH,
        PROBE219_WIDTH, PROBE218_WIDTH, PROBE217_WIDTH, PROBE216_WIDTH,
        PROBE215_WIDTH, PROBE214_WIDTH, PROBE213_WIDTH, PROBE212_WIDTH,
        PROBE211_WIDTH, PROBE210_WIDTH, PROBE209_WIDTH, PROBE208_WIDTH,
        PROBE207_WIDTH, PROBE206_WIDTH, PROBE205_WIDTH, PROBE204_WIDTH,
        PROBE203_WIDTH, PROBE202_WIDTH, PROBE201_WIDTH, PROBE200_WIDTH,
        PROBE199_WIDTH, PROBE198_WIDTH, PROBE197_WIDTH, PROBE196_WIDTH,
        PROBE195_WIDTH, PROBE194_WIDTH, PROBE193_WIDTH, PROBE192_WIDTH,
        PROBE191_WIDTH, PROBE190_WIDTH, PROBE189_WIDTH, PROBE188_WIDTH,
        PROBE187_WIDTH, PROBE186_WIDTH, PROBE185_WIDTH, PROBE184_WIDTH,
        PROBE183_WIDTH, PROBE182_WIDTH, PROBE181_WIDTH, PROBE180_WIDTH,
        PROBE179_WIDTH, PROBE178_WIDTH, PROBE177_WIDTH, PROBE176_WIDTH,
        PROBE175_WIDTH, PROBE174_WIDTH, PROBE173_WIDTH, PROBE172_WIDTH,
        PROBE171_WIDTH, PROBE170_WIDTH, PROBE169_WIDTH, PROBE168_WIDTH,
        PROBE167_WIDTH, PROBE166_WIDTH, PROBE165_WIDTH, PROBE164_WIDTH,
        PROBE163_WIDTH, PROBE162_WIDTH, PROBE161_WIDTH, PROBE160_WIDTH,
        PROBE159_WIDTH, PROBE158_WIDTH, PROBE157_WIDTH, PROBE156_WIDTH,
        PROBE155_WIDTH, PROBE154_WIDTH, PROBE153_WIDTH, PROBE152_WIDTH,
        PROBE151_WIDTH, PROBE150_WIDTH, PROBE149_WIDTH, PROBE148_WIDTH,
        PROBE147_WIDTH, PROBE146_WIDTH, PROBE145_WIDTH, PROBE144_WIDTH,
        PROBE143_WIDTH, PROBE142_WIDTH, PROBE141_WIDTH, PROBE140_WIDTH,
        PROBE139_WIDTH, PROBE138_WIDTH, PROBE137_WIDTH, PROBE136_WIDTH,
        PROBE135_WIDTH, PROBE134_WIDTH, PROBE133_WIDTH, PROBE132_WIDTH,
        PROBE131_WIDTH, PROBE130_WIDTH, PROBE129_WIDTH, PROBE128_WIDTH,
        PROBE127_WIDTH, PROBE126_WIDTH, PROBE125_WIDTH, PROBE124_WIDTH,
        PROBE123_WIDTH, PROBE122_WIDTH, PROBE121_WIDTH, PROBE120_WIDTH,
        PROBE119_WIDTH, PROBE118_WIDTH, PROBE117_WIDTH, PROBE116_WIDTH,
        PROBE115_WIDTH, PROBE114_WIDTH, PROBE113_WIDTH, PROBE112_WIDTH,
        PROBE111_WIDTH, PROBE110_WIDTH, PROBE109_WIDTH, PROBE108_WIDTH,
        PROBE107_WIDTH, PROBE106_WIDTH, PROBE105_WIDTH, PROBE104_WIDTH,
        PROBE103_WIDTH, PROBE102_WIDTH, PROBE101_WIDTH, PROBE100_WIDTH,
        PROBE99_WIDTH, PROBE98_WIDTH, PROBE97_WIDTH, PROBE96_WIDTH,
        PROBE95_WIDTH, PROBE94_WIDTH, PROBE93_WIDTH, PROBE92_WIDTH,
        PROBE91_WIDTH, PROBE90_WIDTH, PROBE89_WIDTH, PROBE88_WIDTH,
        PROBE87_WIDTH, PROBE86_WIDTH, PROBE85_WIDTH, PROBE84_WIDTH,
        PROBE83_WIDTH, PROBE82_WIDTH, PROBE81_WIDTH, PROBE80_WIDTH,
        PROBE79_WIDTH, PROBE78_WIDTH, PROBE77_WIDTH, PROBE76_WIDTH,
        PROBE75_WIDTH, PROBE74_WIDTH, PROBE73_WIDTH, PROBE72_WIDTH,
        PROBE71_WIDTH, PROBE70_WIDTH, PROBE69_WIDTH, PROBE68_WIDTH,
        PROBE67_WIDTH, PROBE66_WIDTH, PROBE65_WIDTH, PROBE64_WIDTH,
        PROBE63_WIDTH, PROBE62_WIDTH, PROBE61_WIDTH, PROBE60_WIDTH,
        PROBE59_WIDTH, PROBE58_WIDTH, PROBE57_WIDTH, PROBE56_WIDTH,
        PROBE55_WIDTH, PROBE54_WIDTH, PROBE53_WIDTH, PROBE52_WIDTH,
        PROBE51_WIDTH, PROBE50_WIDTH, PROBE49_WIDTH, PROBE48_WIDTH,
        PROBE47_WIDTH, PROBE46_WIDTH, PROBE45_WIDTH, PROBE44_WIDTH,
        PROBE43_WIDTH, PROBE42_WIDTH, PROBE41_WIDTH, PROBE40_WIDTH,
        PROBE39_WIDTH, PROBE38_WIDTH, PROBE37_WIDTH, PROBE36_WIDTH,
        PROBE35_WIDTH, PROBE34_WIDTH, PROBE33_WIDTH, PROBE32_WIDTH,
        PROBE31_WIDTH, PROBE30_WIDTH, PROBE29_WIDTH, PROBE28_WIDTH,
        PROBE27_WIDTH, PROBE26_WIDTH, PROBE25_WIDTH, PROBE24_WIDTH,
        PROBE23_WIDTH, PROBE22_WIDTH, PROBE21_WIDTH, PROBE20_WIDTH,
        PROBE19_WIDTH, PROBE18_WIDTH, PROBE17_WIDTH, PROBE16_WIDTH,
        PROBE15_WIDTH, PROBE14_WIDTH, PROBE13_WIDTH, PROBE12_WIDTH,
        PROBE11_WIDTH, PROBE10_WIDTH, PROBE9_WIDTH, PROBE8_WIDTH,
        PROBE7_WIDTH, PROBE6_WIDTH, PROBE5_WIDTH, PROBE4_WIDTH,
        PROBE3_WIDTH, PROBE2_WIDTH, PROBE1_WIDTH, PROBE0_WIDTH};

    localparam [256*2-1:0] PROBE_TYPE_ARRAY = {
        PROBE255_TYPE, PROBE254_TYPE, PROBE253_TYPE, PROBE252_TYPE,
        PROBE251_TYPE, PROBE250_TYPE, PROBE249_TYPE, PROBE248_TYPE,
        PROBE247_TYPE, PROBE246_TYPE, PROBE245_TYPE, PROBE244_TYPE,
        PROBE243_TYPE, PROBE242_TYPE, PROBE241_TYPE, PROBE240_TYPE,
        PROBE239_TYPE, PROBE238_TYPE, PROBE237_TYPE, PROBE236_TYPE,
        PROBE235_TYPE, PROBE234_TYPE, PROBE233_TYPE, PROBE232_TYPE,
        PROBE231_TYPE, PROBE230_TYPE, PROBE229_TYPE, PROBE228_TYPE,
        PROBE227_TYPE, PROBE226_TYPE, PROBE225_TYPE, PROBE224_TYPE,
        PROBE223_TYPE, PROBE222_TYPE, PROBE221_TYPE, PROBE220_TYPE,
        PROBE219_TYPE, PROBE218_TYPE, PROBE217_TYPE, PROBE216_TYPE,
        PROBE215_TYPE, PROBE214_TYPE, PROBE213_TYPE, PROBE212_TYPE,
        PROBE211_TYPE, PROBE210_TYPE, PROBE209_TYPE, PROBE208_TYPE,
        PROBE207_TYPE, PROBE206_TYPE, PROBE205_TYPE, PROBE204_TYPE,
        PROBE203_TYPE, PROBE202_TYPE, PROBE201_TYPE, PROBE200_TYPE,
        PROBE199_TYPE, PROBE198_TYPE, PROBE197_TYPE, PROBE196_TYPE,
        PROBE195_TYPE, PROBE194_TYPE, PROBE193_TYPE, PROBE192_TYPE,
        PROBE191_TYPE, PROBE190_TYPE, PROBE189_TYPE, PROBE188_TYPE,
        PROBE187_TYPE, PROBE186_TYPE, PROBE185_TYPE, PROBE184_TYPE,
        PROBE183_TYPE, PROBE182_TYPE, PROBE181_TYPE, PROBE180_TYPE,
        PROBE179_TYPE, PROBE178_TYPE, PROBE177_TYPE, PROBE176_TYPE,
        PROBE175_TYPE, PROBE174_TYPE, PROBE173_TYPE, PROBE172_TYPE,
        PROBE171_TYPE, PROBE170_TYPE, PROBE169_TYPE, PROBE168_TYPE,
        PROBE167_TYPE, PROBE166_TYPE, PROBE165_TYPE, PROBE164_TYPE,
        PROBE163_TYPE, PROBE162_TYPE, PROBE161_TYPE, PROBE160_TYPE,
        PROBE159_TYPE, PROBE158_TYPE, PROBE157_TYPE, PROBE156_TYPE,
        PROBE155_TYPE, PROBE154_TYPE, PROBE153_TYPE, PROBE152_TYPE,
        PROBE151_TYPE, PROBE150_TYPE, PROBE149_TYPE, PROBE148_TYPE,
        PROBE147_TYPE, PROBE146_TYPE, PROBE145_TYPE, PROBE144_TYPE,
        PROBE143_TYPE, PROBE142_TYPE, PROBE141_TYPE, PROBE140_TYPE,
        PROBE139_TYPE, PROBE138_TYPE, PROBE137_TYPE, PROBE136_TYPE,
        PROBE135_TYPE, PROBE134_TYPE, PROBE133_TYPE, PROBE132_TYPE,
        PROBE131_TYPE, PROBE130_TYPE, PROBE129_TYPE, PROBE128_TYPE,
        PROBE127_TYPE, PROBE126_TYPE, PROBE125_TYPE, PROBE124_TYPE,
        PROBE123_TYPE, PROBE122_TYPE, PROBE121_TYPE, PROBE120_TYPE,
        PROBE119_TYPE, PROBE118_TYPE, PROBE117_TYPE, PROBE116_TYPE,
        PROBE115_TYPE, PROBE114_TYPE, PROBE113_TYPE, PROBE112_TYPE,
        PROBE111_TYPE, PROBE110_TYPE, PROBE109_TYPE, PROBE108_TYPE,
        PROBE107_TYPE, PROBE106_TYPE, PROBE105_TYPE, PROBE104_TYPE,
        PROBE103_TYPE, PROBE102_TYPE, PROBE101_TYPE, PROBE100_TYPE,
        PROBE99_TYPE, PROBE98_TYPE, PROBE97_TYPE, PROBE96_TYPE,
        PROBE95_TYPE, PROBE94_TYPE, PROBE93_TYPE, PROBE92_TYPE,
        PROBE91_TYPE, PROBE90_TYPE, PROBE89_TYPE, PROBE88_TYPE,
        PROBE87_TYPE, PROBE86_TYPE, PROBE85_TYPE, PROBE84_TYPE,
        PROBE83_TYPE, PROBE82_TYPE, PROBE81_TYPE, PROBE80_TYPE,
        PROBE79_TYPE, PROBE78_TYPE, PROBE77_TYPE, PROBE76_TYPE,
        PROBE75_TYPE, PROBE74_TYPE, PROBE73_TYPE, PROBE72_TYPE,
        PROBE71_TYPE, PROBE70_TYPE, PROBE69_TYPE, PROBE68_TYPE,
        PROBE67_TYPE, PROBE66_TYPE, PROBE65_TYPE, PROBE64_TYPE,
        PROBE63_TYPE, PROBE62_TYPE, PROBE61_TYPE, PROBE60_TYPE,
        PROBE59_TYPE, PROBE58_TYPE, PROBE57_TYPE, PROBE56_TYPE,
        PROBE55_TYPE, PROBE54_TYPE, PROBE53_TYPE, PROBE52_TYPE,
        PROBE51_TYPE, PROBE50_TYPE, PROBE49_TYPE, PROBE48_TYPE,
        PROBE47_TYPE, PROBE46_TYPE, PROBE45_TYPE, PROBE44_TYPE,
        PROBE43_TYPE, PROBE42_TYPE, PROBE41_TYPE, PROBE40_TYPE,
        PROBE39_TYPE, PROBE38_TYPE, PROBE37_TYPE, PROBE36_TYPE,
        PROBE35_TYPE, PROBE34_TYPE, PROBE33_TYPE, PROBE32_TYPE,
        PROBE31_TYPE, PROBE30_TYPE, PROBE29_TYPE, PROBE28_TYPE,
        PROBE27_TYPE, PROBE26_TYPE, PROBE25_TYPE, PROBE24_TYPE,
        PROBE23_TYPE, PROBE22_TYPE, PROBE21_TYPE, PROBE20_TYPE,
        PROBE19_TYPE, PROBE18_TYPE, PROBE17_TYPE, PROBE16_TYPE,
        PROBE15_TYPE, PROBE14_TYPE, PROBE13_TYPE, PROBE12_TYPE,
        PROBE11_TYPE, PROBE10_TYPE, PROBE9_TYPE, PROBE8_TYPE,
        PROBE7_TYPE, PROBE6_TYPE, PROBE5_TYPE, PROBE4_TYPE,
        PROBE3_TYPE, PROBE2_TYPE, PROBE1_TYPE, PROBE0_TYPE};

    // Sum of the width for all data probes
    // localparam integer CAPTURE_WIDTH = sum_dw_capture(NUM_PROBES, PROBE_WIDTH_ARRAY, PROBE_TYPE_ARRAY);
    localparam CAPTURE_WIDTH = PROBE255_DBUS_LSB + PROBE255_WIDTH * (PROBE255_IS_DATA);

    // Number of probes with type = trigger / data trigger
    localparam TRIGGER_WIDTH = PROBE255_TBUS_LSB + 1 * (PROBE255_IS_TRIGGER);

    // Number of probes with type = data / data trigger
    // localparam NUM_DATA_PRB = sum_prb_data(NUM_PROBES, PROBE_TYPE_ARRAY);
    localparam NUM_DATA_PRB = PROBE255_CBUS_LSB;

    // localparam ALL_WIDTH = sum_dw_all(NUM_PROBES, PROBE_WIDTH_ARRAY);
    localparam ALL_WIDTH = PROBE255_PBUS_LSB;

    // Plus 1 bit status bit
    // localparam BYTES_PER_WORD = (CAPTURE_WIDTH)/8 + 1;
    localparam _64BIT_PER_WORD = (CAPTURE_WIDTH) / 64 + 1;
    // Remarks:
    //  We increment the row address to read next row from the fifo after finish reading all bytes for the current word
    // For example:
    //  Word = 130bit = 3 64bit word
    //  column addr:    0, 8, 16, 0, 8, 16
    //  row addr:       0, 0, 0,  1, 1, 1
    localparam _64BIT_PER_WORD_M1_IN_BYTES = (_64BIT_PER_WORD - 1) << 3;

    // !!! Make sure ( DR_WIDTH >= 1 + OP_WIDTH + ADDR_WIDTH + COUNT_WIDTH )
    localparam OP_WIDTH    = 4;
    localparam ADDR_WIDTH  = 32;
    localparam COUNT_WIDTH = 16;

    localparam REGSEL_WIDTH = 13;
    localparam REG_WIDTH    = 64; // max width for a single register

    localparam REG_MSB      = `DR_WIDTH - (1 + OP_WIDTH + REGSEL_WIDTH) - 1;

    // Index coding for registers
    localparam INTREG_R0 = 0; 
    localparam INTREG_TRIG_MASK0 = 1; 
    localparam INTREG_TRIG_MASK1 = 11; 
    localparam INTREG_TRIG_MASK2 = 12; 
    localparam INTREG_TRIG_MASK3 = 13; 
    localparam INTREG_CAP_MASK0 = 2;
    localparam INTREG_CAP_MASK1 = 14;
    localparam INTREG_CAP_MASK2 = 15;
    localparam INTREG_CAP_MASK3 = 16;
    localparam INTREG_WINDOW_PROP = 3;
    localparam INEREG_SOFT_RESET = 4;
    localparam INTREG_UUID_LOWER = 8;
    localparam INTREG_UUID_UPPER = 9;

    localparam BUF_MAX_ADDR_W = 17; // max=131,072 =2^17

    // | capture_pattern | tu_pattern | trig_pos | stop_trig | run_trig_imdt | run_trig | sample_cnt | cstate
    // | 2-bit      | 2-bit        17-bit   | 1-bit       1-bit           1-bit    | 17-bit       3-bit
    localparam R0_WIDTH = 3 + 3 + BUF_MAX_ADDR_W * 2 + 2 + 2;

    // Layout for R3 (Window Properties)
    // | num_trigger | window_depth |
    // | 17 bit      | 17 bit|
    localparam R3_WIDTH = BUF_MAX_ADDR_W + 5;

    // Cmd coding for instructions
    //localparam LA_CMD_BWRITE8  = 4'h1;
    //localparam LA_CMD_BWRITE16 = 4'h2;
    //localparam LA_CMD_BWRITE32 = 4'h3;
    //localparam LA_CMD_BWRITE64 = 4'h4;
    localparam LA_CMD_BREAD8   = 4'h5;
    localparam LA_CMD_BREAD16  = 4'h6;
    localparam LA_CMD_BREAD32  = 4'h7;
    localparam LA_CMD_BREAD64  = 4'h8;
    localparam LA_CMD_IREG_WR  = 4'h9;
    localparam LA_CMD_IREG_SEL = 4'hd;

    // FSM state coding
    localparam STATE_idle    = 4'h0;
    localparam STATE_Rbegin  = 4'h1;
    localparam STATE_Rready  = 4'h2;
    localparam STATE_Rstatus = 4'h3;
    localparam STATE_Rburst  = 4'h4;
    localparam STATE_Wready  = 4'h5;
    localparam STATE_Wwait   = 4'h6;
    localparam STATE_Wburst  = 4'h7;
    localparam STATE_Wstatus = 4'h8;
    localparam STATE_Rcrc    = 4'h9;
    localparam STATE_Wcrc    = 4'ha;
    localparam STATE_Wmatch  = 4'hb;

    localparam MAX_PROBES = 256;

    localparam PIPE_CU = 1;
    localparam PIPE_TU = 1;


    ////////////////////////////////////////

    localparam REG_USAGE_TRIG_PATTERN   = 8'h01;
    localparam REG_USAGE_TRIG_VALUE     = 8'h02;
    localparam REG_USAGE_TRIG_MASK      = 8'h03;
    localparam REG_USAGE_CAP_PATTERN   = 8'h04;
    localparam REG_USAGE_CAP_VALUE     = 8'h05;
    localparam REG_USAGE_CAP_MASK      = 8'h06;
    // No operation
    localparam REG_USAGE_DEFAULT       = 8'hff;

    localparam REG_TRIG_PATTERN_WIDTH  = 8'd3;
    localparam REG_TRIG_VALUE_WIDTH    = 8'd64;
    localparam REG_TRIG_MASK_WIDTH     = 8'd64;
    localparam REG_CAP_PATTERN_WIDTH   = 8'd3;
    localparam REG_CAP_VALUE_WIDTH     = 8'd64;
    localparam REG_CAP_MASK_WIDTH      = 8'd64;

    localparam WINDOWS_ADDRESS_WIDTH = $clog2(BUF_MAX_ADDR_W);

    //wire [1023:0] probes [0:MAX_PROBES-1];
    localparam PROBES_WIDTH = MAX_PROBES + ALL_WIDTH - NUM_PROBES;
    wire [PROBES_WIDTH-1:0] probes;

    // Registers to hold state etc.
    wire     [R0_WIDTH-1:0] internal_reg_r0;          // module internal register.
    // wire [R3_WIDTH-1:0] internal_reg_r3;
    reg     [REG_WIDTH-1:0] data_out_shift_reg;       // widht-bits to accomodate the internal_reg_*
    reg  [REGSEL_WIDTH-1:0] internal_register_select; // Holds index of currently selected register
    reg      [OP_WIDTH-1:0] opcode;                   // holds the current command (rd/wr, word size)
    reg              [31:0] address_counter;          // Holds address for next Wishbone access
    reg               [5:0] bit_count;                // How many bits have been shifted in/out
    reg              [15:0] word_count;               // bytes remaining in current burst command

    // Control signals for the various counters / registers / state machines
    reg        out_reg_ld_en;    // Enable parallel load of data_out_shift_reg
    reg        out_reg_shift_en; // Enable shift of data_out_shift_reg
    reg        out_reg_data_sel; // 0 = BIU data, 1 = internal register data
    reg        regsel_ld_en;     // Reg. select register load enable
    reg        intreg_ld_en;     // load enable for internal registers
    reg  [1:0] tdo_output_sel;   // Selects signal to send to TDO.  0 = ready bit, 1 = output register, 2 = CRC match, 3 = CRC shift reg.
    reg        addr_sel;         // Selects data for address_counter. 0 = data_register_i, 1 = incremented address count
    reg        addr_ct_en;       // Enable signal for address counter register
    reg        op_reg_en;        // Enable signal for 'operation' register
    reg        bit_ct_rst;       // reset (zero) bit count register
    reg        bit_ct_en;        // enable bit counter
    reg        word_ct_sel;      // Selects data for byte counter.  0 = data_register_i, 1 = decremented byte count
    reg        word_ct_en;       // Enable byte counter register
    reg        crc_in_sel;       // selects incoming write data (=0) or outgoing read data (=1)as input to CRC module
    reg        crc_en;           // does 1-bit iteration in CRC module
    reg        crc_shift_en;     // CRC reg is also it's own output shift register; this enables a shift
    reg        crc_clr;          // resets CRC module
    reg        biu_strobe;       // Indicates that the bus unit should latch data and start a transaction

    // Status signals
    wire intreg_instruction; // True when the input_data_i reg has a valid internal register instruction
    wire intreg_write;       // True when the input_data_i reg has an internal register write op
    wire burst_write;        // True when the input_data_i reg has a valid burst write instruction for this module
    wire burst_read;         // True when the input_data_i reg has a valid burst read  instruction for this module 
    // reg  rd_op;              // True when operation in the opcode reg is a read, false when a write
    wire bit_count_max;      // true when bit counter is equal to current word size
    wire bit_count_32;       // true when bit count register == 32, for CRC after burst writes
    wire word_count_zero;    // true when byte counter is zero
    wire crc_match;          // indicates whether data_register_i matches computed CRC
    wire biu_ready;          // indicates that the BIU has finished the last command

    // Intermediate signals
    wire                    module_cmd;             // inverse of MSB of data_register_i. 1 means current cmd not for top level (but is for us)
    wire     [OP_WIDTH-1:0] opcode_in;              // from data_register_i
    wire   [ADDR_WIDTH-1:0] address_in;             // from data_register_i
    wire  [COUNT_WIDTH-1:0] count_in;               // from data_register_i
    wire [REGSEL_WIDTH-1:0] reg_select;             // from data_register_i, input to internal register select register

    wire    [REG_WIDTH-1:0] out_reg_data;           // parallel input to the output shift register
    wire    [REG_WIDTH-1:0] data_from_internal_reg; // data from internal reg. MUX to output shift register
    reg               [5:0] word_size_bits;         // 8,16,32 or 64.  Decoded from 'operation'
    reg               [3:0] word_size_bytes;        // 1,2,4 or 8
    wire             [31:0] data_to_addr_counter;   // output of the mux in front of the address counter inputs
    wire             [32:0] incremented_address;    // value of address counter plus 'word_size'
    wire             [15:0] decremented_word_count;
    wire             [15:0] data_to_word_counter;   // output of the mux in front of the byte counter input
    wire                    crc_serial_out;
    wire                    crc_data_in;            // input to CRC module, either data_register_i[52] or data_out_shift_reg[0]
    wire             [31:0] crc_data_out;           // output of CRC module, to output shift register
    wire    [REG_WIDTH-1:0] data_to_biu;            // from data_register_i
    wire    [REG_WIDTH-1:0] data_from_biu;          // to data_out_shift_register

    reg               [3:0] module_state, module_next_state;

    reg                       la_resetn_p1; 
    reg                       la_resetn; 
    wire [2:0]                la_cstate;
    reg                       la_run_trig;
    reg                       la_run_trig_imdt;
    reg                       la_stop_trig;
    wire  [BUF_MAX_ADDR_W-1:0] la_sample_cnt;
    reg  [BUF_MAX_ADDR_W-1:0] la_trig_pos;
    wire                      tu_trigger;
    wire  [CAPTURE_WIDTH-1:0] cap_fifo_din;
    reg   [CAPTURE_WIDTH-1:0] cap_fifo_din_cu, cap_fifo_din_tu;
    wire  [TRIGGER_WIDTH-1:0] tu_data;
    reg                 [1:0] la_trig_pattern;
    reg      [MAX_PROBES-1:0] la_trig_mask; // TODO fixed for MAX_PROBES = 64 
    // reg                       cap_buf_read_done;

    wire                      capture_enable;
    // Global Capture Condition Mask / Pattern
    reg   [1:0]               la_capture_pattern;
    wire                      la_capture_enable;
    // wire [REG_WIDTH-1:0] register_conn [0:(1<<REGSEL_WIDTH)-1];
    reg [BUF_MAX_ADDR_W-1:0] la_num_trigger;
    reg [WINDOWS_ADDRESS_WIDTH-1:0] la_window_depth;
    wire                       la_soft_reset;
    wire [127:0]              core_uuid = UUID;

    wire   [NUM_DATA_PRB-1:0] mux_capture_cmp;

    ////////////////////////////////////////
    // 
    
    assign probes = {
        probe255, probe254, probe253, probe252, probe251, probe250, probe249, probe248,
        probe247, probe246, probe245, probe244, probe243, probe242, probe241, probe240,
        probe239, probe238, probe237, probe236, probe235, probe234, probe233, probe232,
        probe231, probe230, probe229, probe228, probe227, probe226, probe225, probe224,
        probe223, probe222, probe221, probe220, probe219, probe218, probe217, probe216,
        probe215, probe214, probe213, probe212, probe211, probe210, probe209, probe208,
        probe207, probe206, probe205, probe204, probe203, probe202, probe201, probe200,
        probe199, probe198, probe197, probe196, probe195, probe194, probe193, probe192,
        probe191, probe190, probe189, probe188, probe187, probe186, probe185, probe184,
        probe183, probe182, probe181, probe180, probe179, probe178, probe177, probe176,
        probe175, probe174, probe173, probe172, probe171, probe170, probe169, probe168,
        probe167, probe166, probe165, probe164, probe163, probe162, probe161, probe160,
        probe159, probe158, probe157, probe156, probe155, probe154, probe153, probe152,
        probe151, probe150, probe149, probe148, probe147, probe146, probe145, probe144,
        probe143, probe142, probe141, probe140, probe139, probe138, probe137, probe136,
        probe135, probe134, probe133, probe132, probe131, probe130, probe129, probe128,
        probe127, probe126, probe125, probe124, probe123, probe122, probe121, probe120,
        probe119, probe118, probe117, probe116, probe115, probe114, probe113, probe112,
        probe111, probe110, probe109, probe108, probe107, probe106, probe105, probe104,
        probe103, probe102, probe101, probe100, probe99, probe98, probe97, probe96,
        probe95, probe94, probe93, probe92, probe91, probe90, probe89, probe88,
        probe87, probe86, probe85, probe84, probe83, probe82, probe81, probe80,
        probe79, probe78, probe77, probe76, probe75, probe74, probe73, probe72,
        probe71, probe70, probe69, probe68, probe67, probe66, probe65, probe64,
        probe63, probe62, probe61, probe60, probe59, probe58, probe57, probe56,
        probe55, probe54, probe53, probe52, probe51, probe50, probe49, probe48, 
        probe47, probe46, probe45, probe44, probe43, probe42, probe41, probe40, 
        probe39, probe38, probe37, probe36, probe35, probe34, probe33, probe32, 
        probe31, probe30, probe29, probe28, probe27, probe26, probe25, probe24,
        probe23, probe22, probe21, probe20, probe19, probe18, probe17, probe16,
        probe15, probe14, probe13, probe12, probe11, probe10, probe9, probe8, 
        probe7, probe6, probe5, probe4, probe3, probe2, probe1, probe0
    };

    assign module_cmd  = ~edb_user_dr[`DR_WIDTH-1];
    assign opcode_in   =  edb_user_dr[`DR_WIDTH-2 -: OP_WIDTH];
    assign address_in  =  edb_user_dr[`DR_WIDTH-2-OP_WIDTH -: ADDR_WIDTH];
    assign count_in    =  edb_user_dr[`DR_WIDTH-2-OP_WIDTH-ADDR_WIDTH -: COUNT_WIDTH];

    assign reg_select  =  edb_user_dr[`DR_WIDTH-2-OP_WIDTH -: REGSEL_WIDTH];

    assign data_to_biu = {bscan_TDI, edb_user_dr[`DR_WIDTH-1 -: REG_WIDTH-1]};

    assign internal_reg_r0[2:0]                     = la_cstate;
    assign internal_reg_r0[2 + BUF_MAX_ADDR_W : 3]  = la_sample_cnt;
    assign internal_reg_r0[2 + BUF_MAX_ADDR_W + 1]  = la_run_trig;
    assign internal_reg_r0[2 + BUF_MAX_ADDR_W + 2]  = la_run_trig_imdt;
    assign internal_reg_r0[2 + BUF_MAX_ADDR_W + 3]  = la_stop_trig;

    // 2 + 34 + 3  = 39:23
    assign internal_reg_r0[2 * BUF_MAX_ADDR_W + 5 : 2 + BUF_MAX_ADDR_W + 4]   = la_trig_pos;
    // 41:40
    assign internal_reg_r0[2 * BUF_MAX_ADDR_W + 7 : 2 * BUF_MAX_ADDR_W + 6]   = la_trig_pattern;
    // 43:42
    assign internal_reg_r0[2 * BUF_MAX_ADDR_W + 9 : 2 * BUF_MAX_ADDR_W + 8]   = la_capture_pattern;

    ////////////////////////////////////////
    // 

    assign intreg_instruction = ((opcode_in == LA_CMD_IREG_WR) | (opcode_in == LA_CMD_IREG_SEL));

    assign intreg_write = (opcode_in == LA_CMD_IREG_WR);

    assign burst_read = (opcode_in == LA_CMD_BREAD8)  | 
                        (opcode_in == LA_CMD_BREAD16) | 
                        (opcode_in == LA_CMD_BREAD32) | 
                        (opcode_in == LA_CMD_BREAD64);

    assign burst_write = 1'b0;

    always @(*) begin
        case (opcode)
            LA_CMD_BREAD8: begin
                word_size_bits  = 6'd7;  // Bits is actually bits-1, to make the FSM easier
                word_size_bytes = 4'd1;
                // rd_op           = 1'b1;
            end
            LA_CMD_BREAD16: begin
               word_size_bits  = 6'd15;  // Bits is actually bits-1, to make the FSM easier
               word_size_bytes = 4'd2;
            //    rd_op           = 1'b1;
            end
            LA_CMD_BREAD32: begin
               word_size_bits  = 6'd31;  // Bits is actually bits-1, to make the FSM easier
               word_size_bytes = 4'd4;
            //    rd_op           = 1'b1;
            end
            LA_CMD_BREAD64: begin
               word_size_bits  = 6'd63;  // Bits is actually bits-1, to make the FSM easier
               word_size_bytes = 4'd8;
            //    rd_op           = 1'b1;
            end
            default: begin
                word_size_bits  = 6'b00_0000;
                word_size_bytes = 4'b0000;
                // rd_op           = 1'b0;
            end
        endcase
    end

    ////////////////////////////////////////
    // internal register

    always @(posedge bscan_TCK or posedge bscan_RESET) begin
        if (bscan_RESET) begin
            internal_register_select <= 'h0;
        end 
        else if (regsel_ld_en) begin
            internal_register_select <= reg_select;
        end
    end

    //always @(*) begin
    //    case (internal_register_select)
    //        INTREG_R0: data_from_internal_reg = internal_reg_r0;
    //        default:   data_from_internal_reg = internal_reg_r0;
    //    endcase
    //end

    // All register reads decoded with this line
    // assign data_from_internal_reg = register_conn[internal_register_select];

    // assign register_conn[INTREG_UUID_LOWER] = core_uuid[0 +: 64];
    // assign register_conn[INTREG_UUID_UPPER] = core_uuid[64 +: 64];

    // Actual register lines connection
    // assign register_conn[INTREG_R0] = {{(REG_WIDTH-R0_WIDTH){1'b0}}, internal_reg_r0};
    // assign register_conn[INTREG_R1] = la_trig_mask;

    assign data_from_internal_reg = (internal_register_select == INTREG_R0)  ? {{(REG_WIDTH-R0_WIDTH){1'b0}}, internal_reg_r0} :
                                    (internal_register_select == INTREG_TRIG_MASK0) ? {la_trig_mask[63:0]} :
                                    (internal_register_select == INTREG_TRIG_MASK1) ? {la_trig_mask[127:64]} :
                                    (internal_register_select == INTREG_TRIG_MASK2) ? {la_trig_mask[191:128]} :
                                    (internal_register_select == INTREG_TRIG_MASK3) ? {la_trig_mask[255:192]} :
                                    (internal_register_select == INTREG_UUID_LOWER) ? core_uuid[0 +: 64] :
                                    (internal_register_select == INTREG_UUID_UPPER) ? core_uuid[64 +: 64] :
                                    64'b0;

    // Register writes for R0
    always @(posedge bscan_TCK or posedge bscan_RESET) begin
        if (bscan_RESET) begin
            la_run_trig      <= 1'b0;
            la_run_trig_imdt <= 1'b0;
            la_stop_trig     <= 1'b0;
            // la_sample_cnt    <= 0;
            la_trig_pos      <= DATA_DEPTH/2;
            la_trig_pattern  <= 2'b00;
            la_capture_pattern    <= 2'b00;
        end 
        else if (la_soft_reset) begin
            la_run_trig      <= 1'b0;
            la_run_trig_imdt <= 1'b0;
            la_stop_trig     <= 1'b0;
        end 
        else if (intreg_ld_en && (reg_select == INTREG_R0)) begin
            la_run_trig      <= edb_user_dr[REG_MSB -4 - BUF_MAX_ADDR_W -2];
            la_run_trig_imdt <= edb_user_dr[REG_MSB -4 - BUF_MAX_ADDR_W -1];
            la_stop_trig     <= edb_user_dr[REG_MSB -4 - BUF_MAX_ADDR_W];
            la_trig_pos      <= edb_user_dr[REG_MSB -4 -: BUF_MAX_ADDR_W];
            la_trig_pattern  <= edb_user_dr[REG_MSB -2 -: 2];
            la_capture_pattern  <= edb_user_dr[REG_MSB -: 2];
        end
    end

    // Register writes for R1
    always @(posedge bscan_TCK or posedge bscan_RESET) begin
        if (bscan_RESET) begin
            la_trig_mask <= 'b0;
        end 
        else if (intreg_ld_en) begin
            if (reg_select == INTREG_TRIG_MASK0) begin
                la_trig_mask[0 +: 64] <= edb_user_dr[REG_MSB -: 64];
            end
            if (reg_select == INTREG_TRIG_MASK1) begin
                la_trig_mask[64 +: 64] <= edb_user_dr[REG_MSB -: 64];
            end
            if (reg_select == INTREG_TRIG_MASK2) begin
                la_trig_mask[128 +: 64] <= edb_user_dr[REG_MSB -: 64];
            end
            if (reg_select == INTREG_TRIG_MASK3) begin
                la_trig_mask[192 +: 64] <= edb_user_dr[REG_MSB -: 64];
            end
        end
    end

    // Register writes for R3
    always @(posedge bscan_TCK or posedge bscan_RESET) begin
        if (bscan_RESET) begin
            la_num_trigger <= 1;
            la_window_depth <= $clog2(DATA_DEPTH);
        end
        else if (intreg_ld_en && (reg_select == INTREG_WINDOW_PROP)) begin
            la_window_depth <= edb_user_dr[REG_MSB -: WINDOWS_ADDRESS_WIDTH];
            la_num_trigger <= edb_user_dr[REG_MSB - WINDOWS_ADDRESS_WIDTH -: BUF_MAX_ADDR_W];
        end
    end

    reg la_soft_reset_in;

    // Register writes for R4
    always @(posedge bscan_TCK or posedge bscan_RESET) begin
        if (bscan_RESET) begin
            la_soft_reset_in <= 1'b1;
        end
        else if (intreg_ld_en && (reg_select == INEREG_SOFT_RESET)) begin
            la_soft_reset_in <= edb_user_dr[REG_MSB];
        end
        else begin
            la_soft_reset_in <= 1'b0;
        end
    end

    assign la_soft_reset = la_soft_reset_in;
    ///////////////////////////////////////////////
    // Address counter

    assign data_to_addr_counter = (addr_sel) ? incremented_address[31:0] : address_in;
    //assign incremented_address  = address_counter + word_size_bytes;
    assign incremented_address  = (address_counter[0 +: 15] == _64BIT_PER_WORD_M1_IN_BYTES ) ? 
                                  {address_counter[31 -: 17] + 17'h1, 15'h0} : 
                                  address_counter + word_size_bytes;

    // Technically, since this data (sometimes) comes from the input shift reg, we should latch on
    // negedge, per the JTAG spec. But that makes things difficult when incrementing.
    always @(posedge bscan_TCK or posedge bscan_RESET) begin // JTAG spec specifies latch on negative edge in UPDATE_DR state
        if (bscan_RESET)
            address_counter <= 32'h0;
        else if (addr_ct_en)
            address_counter <= data_to_addr_counter;
    end

    ////////////////////////////////////////
    // Opcode latch

    always @(posedge bscan_TCK or posedge bscan_RESET) begin // JTAG spec specifies latch on negative edge in UPDATE_DR state
        if (bscan_RESET)
            opcode <= 4'h0;
        else if (op_reg_en)
            opcode <= opcode_in;
    end

    //////////////////////////////////////
    // Bit counter

    always @(posedge bscan_TCK or posedge bscan_RESET) begin
        if (bscan_RESET)     bit_count <= 6'h0;
        else if (bit_ct_rst) bit_count <= 6'h0;
        else if (bit_ct_en)  bit_count <= bit_count + 6'h1;
    end

    assign bit_count_max = (bit_count == word_size_bits) ? 1'b1 : 1'b0;
    assign bit_count_32 = (bit_count == 6'h20) ? 1'b1 : 1'b0;

    ////////////////////////////////////////
    // Word counter

    assign data_to_word_counter = (word_ct_sel) ? decremented_word_count : count_in;
    assign decremented_word_count = word_count - 16'h1;

    // Technically, since this data (sometimes) comes from the input shift reg, we should latch on
    // negedge, per the JTAG spec. But that makes things difficult when incrementing.
    always @(posedge bscan_TCK or posedge bscan_RESET) begin // JTAG spec specifies latch on negative edge in UPDATE_DR state
        if (bscan_RESET)
            word_count <= 16'h0;
        else if (word_ct_en)
            word_count <= data_to_word_counter;
    end

    assign word_count_zero = (word_count == 16'h0);

    ////////////////////////////////////////
    // tdo mux

    assign out_reg_data = (out_reg_data_sel) ? data_from_internal_reg : data_from_biu;

    always @(posedge bscan_TCK or posedge bscan_RESET) begin
        if (bscan_RESET)           data_out_shift_reg <= 'h0;
        else if (out_reg_ld_en)    data_out_shift_reg <= out_reg_data;
        else if (out_reg_shift_en) data_out_shift_reg <= {1'b0, data_out_shift_reg[REG_WIDTH-1:1]};
    end

    always @(*) begin
        case (tdo_output_sel) 
            2'h1:    edb_module_tdo = data_out_shift_reg[0];
            2'h2:    edb_module_tdo = crc_match;
            2'h3:    edb_module_tdo = crc_serial_out;
            default: edb_module_tdo = biu_ready;
        endcase
    end

    /////////////////////////////////////
    // CRC module

    assign crc_data_in = (crc_in_sel) ? bscan_TDI : data_out_shift_reg[0];  // MUX, write or read data

    edb_adbg_crc32 axi_crc_i (
        .clk        ( bscan_TCK ), 
        .data       ( crc_data_in ),
        .enable     ( crc_en ),
        .shift      ( crc_shift_en ),
        .clr        ( crc_clr ),
        .rstn       ( ~bscan_RESET ),
        .crc_out    ( crc_data_out ),
        .serial_out ( crc_serial_out )
    );

    assign crc_match = (edb_user_dr[`DR_WIDTH-1 -: 32] == crc_data_out) ? 1'b1 : 1'b0;

    ////////////////////////////////////////
    // Control FSM

    // Definition of machine state values.
    // Don't worry too much about the state encoding, the synthesis tool
    // will probably re-encode it anyway.

    // sequential part of the FSM
    always @(posedge bscan_TCK or posedge bscan_RESET) begin
        if (bscan_RESET)
            module_state <= STATE_idle;
        else
            module_state <= module_next_state;
    end

    // Determination of next state; purely combinatorial
    always @(*) begin
        case (module_state)
            STATE_idle: begin
                if (module_cmd && edb_module_select && bscan_UPDATE && burst_read) 
                    module_next_state = STATE_Rbegin;
                else if (module_cmd && edb_module_select && bscan_UPDATE && burst_write) 
                    module_next_state = STATE_Wready;
                else
                    module_next_state = STATE_idle;
            end

            STATE_Rbegin: begin
                if (word_count_zero)
                    module_next_state = STATE_idle;  // set up a burst of size 0, illegal.
                else
                    module_next_state = STATE_Rready;
            end

            STATE_Rready: begin
                if (edb_module_select && bscan_CAPTURE)
                    module_next_state = STATE_Rstatus;
                else
                    module_next_state = STATE_Rready;
            end

            STATE_Rstatus: begin
                if (bscan_UPDATE)
                    module_next_state = STATE_idle;
                else if (biu_ready)
                    module_next_state = STATE_Rburst;
                else
                    module_next_state = STATE_Rstatus;
            end

            STATE_Rburst: begin
                if (bscan_UPDATE)
                    module_next_state = STATE_idle;
                else if (bit_count_max && word_count_zero)
                    module_next_state = STATE_Rcrc;
                else
                    module_next_state = STATE_Rburst;
            end

            STATE_Rcrc: begin
                if (bscan_UPDATE)
                    module_next_state = STATE_idle;
                // This doubles as the 'recovery' state, so stay here until update_dr_i.
                else 
                    module_next_state = STATE_Rcrc;
            end

            STATE_Wready: begin
                if (word_count_zero)
                    module_next_state = STATE_idle;
                else if (edb_module_select && bscan_CAPTURE) 
                    module_next_state = STATE_Wwait;
                else
                    module_next_state = STATE_Wready;
            end

            STATE_Wwait: begin
                if (bscan_UPDATE)
                    module_next_state = STATE_idle;  // client terminated early
                else if (edb_module_select && edb_user_dr[`DR_WIDTH-1])
                    module_next_state = STATE_Wburst; // Got a start bit
                else
                    module_next_state = STATE_Wwait;
            end

            STATE_Wburst: begin
                if (bscan_UPDATE)
                    module_next_state = STATE_idle;  // client terminated early
                else if (bit_count_max) begin
                    if(word_count_zero)
                        module_next_state = STATE_Wcrc;
                    else
                        module_next_state = STATE_Wburst;
                end
                else 
                    module_next_state = STATE_Wburst;
            end

            STATE_Wstatus: begin
                if (bscan_UPDATE)
                    module_next_state = STATE_idle;  // client terminated early    
                else if (word_count_zero)
                    module_next_state = STATE_Wcrc;
                // can't wait until bus ready if multiple devices in chain...
                // Would have to read postfix_bits, then send another start bit and push it through
                // prefix_bits...potentially very inefficient.
                else 
                    module_next_state = STATE_Wburst;
            end

            STATE_Wcrc: begin
                if (bscan_UPDATE)  module_next_state = STATE_idle;  // client terminated early
                else if (bit_count_32) module_next_state = STATE_Wmatch;
                else module_next_state = STATE_Wcrc;
            end

            STATE_Wmatch: begin
                if (bscan_UPDATE)  module_next_state = STATE_idle;
               // This doubles as our recovery state, stay here until update_dr_i
                else module_next_state = STATE_Wmatch;
            end

            default: module_next_state = STATE_idle;  // shouldn't actually happen...
        endcase
    end

    // Outputs of state machine, pure combinatorial
    always @(*) begin
        // Default everything to 0, keeps the case statement simple
        addr_sel          = 1'b1;  // Selects data for address_counter. 0 = data_register_i, 1 = incremented address count
        addr_ct_en        = 1'b0;  // Enable signal for address counter register
        op_reg_en         = 1'b0;  // Enable signal for 'operation' register
        bit_ct_en         = 1'b0;  // enable bit counter
        bit_ct_rst        = 1'b0;  // reset (zero) bit count register
        word_ct_sel       = 1'b1;  // Selects data for byte counter.  0 = data_register_i, 1 = decremented byte count
        word_ct_en        = 1'b0;   // Enable byte counter register
        out_reg_ld_en     = 1'b0;  // Enable parallel load of data_out_shift_reg
        out_reg_shift_en  = 1'b0;  // Enable shift of data_out_shift_reg
        tdo_output_sel    = 2'b1;   // 1 = data reg, 0 = biu_ready, 2 = crc_match, 3 = CRC data
        biu_strobe        = 1'b0;
        crc_clr           = 1'b0;
        crc_en            = 1'b0;      // add the input bit to the CRC calculation
        crc_in_sel        = 1'b0;  // 0 = tdo, 1 = tdi
        crc_shift_en      = 1'b0;
        out_reg_data_sel  = 1'b1;  // 0 = BIU data, 1 = internal register data
        regsel_ld_en      = 1'b0;
        intreg_ld_en      = 1'b0;
        //error_reg_en      = 1'b0;
        //biu_clr_err       = 1'b0;  // Set this to reset the BIU, clearing the biu_err bit
        edb_module_inhibit = 1'b0;  // Don't disable the top-level module in the default case
        // cap_buf_read_done  = 1'b0;

        case (module_state)
            STATE_idle: begin
                addr_sel    = 1'b0;
                word_ct_sel = 1'b0;

                // Operations for internal registers - stay in idle state
                if (edb_module_select & bscan_SHIFT)
                    out_reg_shift_en = 1'b1; // For module regs
                if (edb_module_select & bscan_CAPTURE) begin
                    out_reg_data_sel = 1'b1;  // select internal register data
                    out_reg_ld_en = 1'b1;   // For module regs
                end
                if (edb_module_select & module_cmd & bscan_UPDATE) begin
                    if (intreg_instruction) 
                        regsel_ld_en = 1'b1;  // For module regs
                    if (intreg_write)       
                        intreg_ld_en = 1'b1;  // For module regs
                end

                // Burst operations
                if (module_next_state != STATE_idle) begin  // Do the same to receive read or write opcode
                    addr_ct_en = 1'b1;
                    op_reg_en  = 1'b1;
                    bit_ct_rst = 1'b1;
                    word_ct_en = 1'b1;
                    crc_clr    = 1'b1;
                end
            end

            STATE_Rbegin: begin
                if (!word_count_zero) begin  // Start a biu read transaction
                    biu_strobe = 1'b1;
                    addr_sel   = 1'b1;
                    addr_ct_en = 1'b1;
                end
            end

            STATE_Rready:
                ; // Just a wait state // FIXME ??????? 
      
            STATE_Rstatus: begin
                tdo_output_sel  = 2'h0;
                edb_module_inhibit = 1'b1;    // in case of early termination

                if (module_next_state == STATE_Rburst) begin
                    //error_reg_en     = 1'b1;       // Check the wb_error bit
                    out_reg_data_sel = 1'b0;  // select BIU data
                    out_reg_ld_en    = 1'b1;
                    bit_ct_rst       = 1'b1;
                    word_ct_sel      = 1'b1;
                    word_ct_en       = 1'b1;
                    if (!(decremented_word_count == 0) && !word_count_zero) begin  // Start a biu read transaction
                        biu_strobe    = 1'b1;
                        addr_sel      = 1'b1;
                        addr_ct_en    = 1'b1;
                    end
                end
            end

            STATE_Rburst: begin
                tdo_output_sel     = 2'h1;
                out_reg_shift_en   = 1'b1;
                bit_ct_en          = 1'b1;
                crc_en             = 1'b1;
                crc_in_sel         = 1'b0;  // read data in output shift register LSB (tdo)
                edb_module_inhibit = 1'b1;  // in case of early termination

                if (bit_count_max) begin
                    //error_reg_en     = 1'b1;       // Check the wb_error bit
                    out_reg_data_sel = 1'b0;  // select BIU data
                    out_reg_ld_en    = 1'b1;
                    bit_ct_rst       = 1'b1;
                    word_ct_sel      = 1'b1;
                    word_ct_en       = 1'b1;
                    if (!(decremented_word_count == 0) && !word_count_zero) begin // Start a biu read transaction
                        biu_strobe     = 1'b1;
                        addr_sel       = 1'b1;
                        addr_ct_en     = 1'b1;
                    end
                end
            end

            STATE_Rcrc: begin
                // Just shift out the data, don't bother counting, we don't move on until update_dr_i
                tdo_output_sel = 2'h3;
                crc_shift_en   = 1'b1;
                edb_module_inhibit = 1'b1;
            end

            STATE_Wready:
                ; // Just a wait state

            STATE_Wwait: begin
                tdo_output_sel = 2'h1;
                edb_module_inhibit = 1'b1;    // in case of early termination
                if (module_next_state == STATE_Wburst) begin
                    //biu_clr_err    = 1'b1;  // If error occurred on last transaction of last burst, biu_err is still set.  Clear it.
                    bit_ct_en      = 1'b1;
                    word_ct_sel    = 1'b1;  // Pre-decrement the byte count
                    word_ct_en     = 1'b1;
                    crc_en         = 1'b1;  // CRC gets tdi_i, which is 1 cycle ahead of data_register_i, so we need the bit there now in the CRC
                    crc_in_sel     = 1'b1;  // read data from tdi_i
                end
            end

            STATE_Wburst: begin
                bit_ct_en       = 1'b1;
                tdo_output_sel  = 2'h1;
                crc_en          = 1'b1;
                crc_in_sel      = 1'b1;  // read data from tdi_i
                edb_module_inhibit = 1'b1;    // in case of early termination

                // It would be better to do this in STATE_Wstatus, but we don't use that state 
                // if ADBG_USE_HISPEED is defined.  
                if(bit_count_max) begin
                    //error_reg_en = 1'b1;       // Check the wb_error bit
                    bit_ct_rst   = 1'b1;  // Zero the bit count
                    // start transaction. Can't do this here if not hispeed, biu_ready
                    // is the status bit, and it's 0 if we start a transaction here.
                    biu_strobe   = 1'b1;  // Start a BIU transaction
                    addr_ct_en   = 1'b1;  // Increment thte address counter
                    // Also can't dec the byte count yet unless hispeed,
                    // that would skip the last word.
                    word_ct_sel  = 1'b1;  // Decrement the byte count
                    word_ct_en   = 1'b1;
                end
            end

            STATE_Wstatus: begin
                tdo_output_sel = 2'h0;  // Send the status bit to TDO
                //error_reg_en = 1'b1;       // Check the wb_error bit
                // start transaction
                biu_strobe = 1'b1;  // Start a BIU transaction
                word_ct_sel = 1'b1;  // Decrement the byte count
                word_ct_en = 1'b1;
                bit_ct_rst = 1'b1;  // Zero the bit count
                addr_ct_en = 1'b1;  // Increment thte address counter
                edb_module_inhibit = 1'b1;    // in case of early termination
            end

            STATE_Wcrc: begin
                bit_ct_en = 1'b1;
                edb_module_inhibit = 1'b1;    // in case of early termination
                if (module_next_state == STATE_Wmatch)
                    tdo_output_sel = 2'h2;  // This is when the 'match' bit is actually read
            end

            STATE_Wmatch: begin
                tdo_output_sel = 2'h2;
                edb_module_inhibit = 1'b1;
                // Bit of a hack here...an error on the final write won't be detected in STATE_Wstatus like the rest, 
                // so we assume the bus transaction is done and check it / latch it into the error register here.
                //if (module_next_state == STATE_idle)
                //    error_reg_en = 1'b1;
            end

            default: ;
        endcase
    end

    ////////////////////////////////////////

    always @(posedge clk or posedge bscan_RESET or posedge la_soft_reset) begin
        if (bscan_RESET || la_soft_reset) begin
            la_resetn_p1   <= 1'b0;
            la_resetn      <= 1'b0;
        end 
        else begin
            la_resetn_p1   <= 1'b1;
            la_resetn      <= la_resetn_p1;
        end
    end

    genvar i, j;
    generate
        for (i = 0; i < NUM_PROBES; i = i + 1) begin : GEN_PROBE
            localparam PROBE_WIDTH = PROBE_WIDTH_ARRAY[(i*11) +: 11];
            localparam PROBE_TYPE = PROBE_TYPE_ARRAY[(i*2) +: 2];
            localparam REG_PER_PW = (PROBE_WIDTH-1)/REG_WIDTH + 1;
            // multiple of 2 > REG_PER_PW*2+1 = 1024/64*2+1 = 33
            localparam REG_DEPTH = 128;
            localparam integer ALL_LSB = PROBE_PBUS_LSB_ARRAY[(i*32) +: 32];
            localparam integer CAP_LSB = PROBE_DBUS_LSB_ARRAY[(i*32) +: 32];
            localparam integer TBUS_LSB = PROBE_TBUS_LSB_ARRAY[(i*32) +: 32];
            localparam integer CBUS_LSB = PROBE_CBUS_LSB_ARRAY[(i*32) +: 32];

            wire [PROBE_WIDTH-1:0] this_probe;
            reg  [PROBE_WIDTH-1:0] this_probe_p1, this_probe_p2;

            reg  [PROBE_WIDTH-1:0] this_probe_p3, this_probe_p4;
            reg  [PROBE_WIDTH-1:0] this_probe_p5, this_probe_p6;

            assign this_probe = probes[ALL_LSB +: PROBE_WIDTH];

            if (INPUT_PIPE_STAGES >= 1) begin
                always @(posedge clk) begin
                    this_probe_p1 <= this_probe;
                end
            end 
            else begin
                always @(*) begin
                    this_probe_p1 = this_probe;
                end
            end

            if (INPUT_PIPE_STAGES >= 2) begin
                always @(posedge clk) begin
                    this_probe_p2 <= this_probe_p1;
                end
            end
            else begin
                always @(*) begin
                    this_probe_p2 = this_probe_p1;
                end
            end

            if (INPUT_PIPE_STAGES >= 3) begin
                always @(posedge clk) begin
                    this_probe_p3 <= this_probe_p2;
                end
            end
            else begin
                always @(*) begin
                    this_probe_p3 = this_probe_p2;
                end
            end

            if (INPUT_PIPE_STAGES >= 4) begin
                always @(posedge clk) begin
                    this_probe_p4 <= this_probe_p3;
                end
            end
            else begin
                always @(*) begin
                    this_probe_p4 = this_probe_p3;
                end
            end

            if (INPUT_PIPE_STAGES >= 5) begin
                always @(posedge clk) begin
                    this_probe_p5 <= this_probe_p4;
                end
            end
            else begin
                always @(*) begin
                    this_probe_p5 = this_probe_p4;
                end
            end

            if (INPUT_PIPE_STAGES >= 6) begin
                always @(posedge clk) begin
                    this_probe_p6 <= this_probe_p5;
                end
            end
            else begin
                always @(*) begin
                    this_probe_p6 = this_probe_p5;
                end
            end


            if (PROBE_TYPE != PROBE_TYPE_NOT_USED) begin
                wire [(REG_PER_PW*REG_WIDTH)-1:0] probe_compared, probe_mask;
                wire [2:0] probe_pattern;

                wire [(REG_PER_PW*REG_WIDTH)-1:0] cap_probe_compared, cap_probe_mask;
                wire [2:0] cap_probe_pattern;

                // Setup logic for loading register when address selected
                for (j = 0 ; j < REG_DEPTH; j = j + 1) begin : GEN_REGS
                    localparam REG_ADDR = (1 + i)*REG_DEPTH + j; // addr mapping
                    // localparam REG_USAGE = get_reg_usage_code(j, PROBE_WIDTH, REG_WIDTH);
                    // localparam REG_DATA_WIDTH = get_reg_data_width(REG_USAGE);
                    // localparam IS_REG_USING = is_reg_using(REG_USAGE, PROBE_TYPE);

                    localparam num_reg_used = (PROBE_WIDTH - 1) / REG_WIDTH + 1;
                    localparam addr_offset = j;

                    if (addr_offset == 0)
                        begin
                            reg [REG_TRIG_PATTERN_WIDTH -1 : 0] internal_reg_pr;

                            // Load corresponding data width from dr when the reg addr is selected
                            always @(posedge bscan_TCK or posedge bscan_RESET) begin
                                if (bscan_RESET) begin
                                    internal_reg_pr <= 'h0;
                                end
                                else if (intreg_ld_en && (reg_select == REG_ADDR)) begin
                                    internal_reg_pr <= edb_user_dr[0 +: REG_TRIG_PATTERN_WIDTH];
                                end
                            end
                            // Trigger Pattern
                            assign probe_pattern = internal_reg_pr;
                        end
                    else if (addr_offset < num_reg_used + 1)
                        begin
                            reg [REG_TRIG_VALUE_WIDTH -1 : 0] internal_reg_pr;

                            // Load corresponding data width from dr when the reg addr is selected
                            always @(posedge bscan_TCK or posedge bscan_RESET) begin
                                if (bscan_RESET) begin
                                    internal_reg_pr <= 'h0;
                                end
                                else if (intreg_ld_en && (reg_select == REG_ADDR)) begin
                                    internal_reg_pr <= edb_user_dr[0 +: REG_TRIG_VALUE_WIDTH];
                                end
                            end
                            // Trigger Value
                            assign probe_compared[(j-1)*REG_WIDTH +: REG_WIDTH] = internal_reg_pr;
                        end
                    else if (addr_offset < 2 * num_reg_used + 1)
                        begin
                            reg [REG_TRIG_MASK_WIDTH -1 : 0] internal_reg_pr;

                            // Load corresponding data width from dr when the reg addr is selected
                            always @(posedge bscan_TCK or posedge bscan_RESET) begin
                                if (bscan_RESET) begin
                                    internal_reg_pr <= 'h0;
                                end
                                else if (intreg_ld_en && (reg_select == REG_ADDR)) begin
                                    internal_reg_pr <= edb_user_dr[0 +: REG_TRIG_MASK_WIDTH];
                                end
                            end
                            // Trigger Mask
                            assign probe_mask[(j-REG_PER_PW-1)*REG_WIDTH +: REG_WIDTH] = internal_reg_pr;
                        end
                    else if (addr_offset == 2 * num_reg_used + 1)
                        begin
                            reg [REG_CAP_PATTERN_WIDTH -1 : 0] internal_reg_pr;

                            // Load corresponding data width from dr when the reg addr is selected
                            always @(posedge bscan_TCK or posedge bscan_RESET) begin
                                if (bscan_RESET) begin
                                    internal_reg_pr <= 'h0;
                                end
                                else if (intreg_ld_en && (reg_select == REG_ADDR)) begin
                                    internal_reg_pr <= edb_user_dr[0 +: REG_CAP_PATTERN_WIDTH];
                                end
                            end
                            // Capture Pattern
                            assign cap_probe_pattern = internal_reg_pr;
                        end
                    else if (addr_offset < 3 * num_reg_used + 2)
                        begin
                            reg [REG_CAP_VALUE_WIDTH -1 : 0] internal_reg_pr;

                            // Load corresponding data width from dr when the reg addr is selected
                            always @(posedge bscan_TCK or posedge bscan_RESET) begin
                                if (bscan_RESET) begin
                                    internal_reg_pr <= 'h0;
                                end
                                else if (intreg_ld_en && (reg_select == REG_ADDR)) begin
                                    internal_reg_pr <= edb_user_dr[0 +: REG_CAP_VALUE_WIDTH];
                                end
                            end
                            // Capture Value
                            assign cap_probe_compared[(j - 2* REG_PER_PW - 2)*REG_WIDTH +: REG_WIDTH] = internal_reg_pr;
                        end
                    else if (addr_offset < 4 * num_reg_used + 2)
                        begin
                            reg [REG_CAP_MASK_WIDTH -1 : 0] internal_reg_pr;

                            // Load corresponding data width from dr when the reg addr is selected
                            always @(posedge bscan_TCK or posedge bscan_RESET) begin
                                if (bscan_RESET) begin
                                    internal_reg_pr <= 'h0;
                                end
                                else if (intreg_ld_en && (reg_select == REG_ADDR)) begin
                                    internal_reg_pr <= edb_user_dr[0 +: REG_CAP_MASK_WIDTH];
                                end
                            end

                            // Capture Mask
                            assign cap_probe_mask[(j - 3* REG_PER_PW - 2)*REG_WIDTH +: REG_WIDTH] = internal_reg_pr;
                        end

                end

                if (PROBE_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE_TYPE == PROBE_TYPE_DATA_ONLY) begin
                    if (CAPTURE_CONTROL == 1) begin
                        wire cap_probe_cout;

                        compare_unit #(
                            .WIDTH (PROBE_WIDTH),
                            .PIPE   ( PIPE_CU )
                        ) capture_cu (
                            .clk         ( clk ),
                            .data_in     ( this_probe_p6 ),
                            .compared_in ( cap_probe_compared[0 +: PROBE_WIDTH] ),
                            .mask_in     ( cap_probe_mask[0 +: PROBE_WIDTH] ),
                            .pattern_in  ( cap_probe_pattern ),
                            .compare_out ( cap_probe_cout )
                        );
                        // Combine the output of compare unit into mux_capture_cmp
                        assign mux_capture_cmp[CBUS_LSB] = cap_probe_cout;
                    end

                    assign cap_fifo_din[CAP_LSB +: PROBE_WIDTH] = this_probe_p6;

                end

                if (PROBE_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE_TYPE == PROBE_TYPE_TRIGGER_ONLY) begin
                    wire       probe_cout;

                    compare_unit #(
                        .WIDTH  ( PROBE_WIDTH ),
                        .PIPE   ( PIPE_CU )
                    ) trigger_cu (
                        .clk         ( clk ),
                        .data_in     ( this_probe_p6 ),
                        .compared_in ( probe_compared[0 +: PROBE_WIDTH] ),
                        .mask_in     ( probe_mask[0 +: PROBE_WIDTH] ),
                        .pattern_in  ( probe_pattern ),
                        .compare_out ( probe_cout )
                    );

                    assign tu_data[TBUS_LSB] = probe_cout;
                end
            end
        end
    endgenerate

    // Handle global trigger condition
    trigger_unit #(
        .WIDTH      ( TRIGGER_WIDTH ),
        .TRIGIN_EN  ( TRIGIN_EN ),
        .PIPE       ( PIPE_TU ),
        .TRIGGER_IF_MASK_ZERO ( 0 ) // Output low when mask is all zero
    ) trigger_tu (
        .clk            ( clk ),
        .data_in        ( tu_data ),
        .mask_in        ( la_trig_mask[0 +: TRIGGER_WIDTH] ),
        .pattern_in     ( la_trig_pattern ),
        .trigger_in     ( trig_in ),
        .trigger_out    ( tu_trigger )
    );

    generate
        if (CAPTURE_CONTROL == 1) begin
            reg  [MAX_PROBES - 1: 0] la_capture_mask;
            // Register writes for R2 (Capture Mask: Which Probes has enabled capture conditions)
            always @(posedge bscan_TCK or posedge bscan_RESET) begin
                if (bscan_RESET) begin
                    la_capture_mask <= 256'b0;
                end
                else if (intreg_ld_en) begin
                    if (reg_select == INTREG_CAP_MASK0) begin
                        la_capture_mask[0 +: 64] <= edb_user_dr[REG_MSB -: 64];
                    end
                    if (reg_select == INTREG_CAP_MASK1) begin
                        la_capture_mask[64 +: 64] <= edb_user_dr[REG_MSB -: 64];
                    end
                    if (reg_select == INTREG_CAP_MASK2) begin
                        la_capture_mask[128 +: 64] <= edb_user_dr[REG_MSB -: 64];
                    end
                    if (reg_select == INTREG_CAP_MASK3) begin
                        la_capture_mask[192 +: 64] <= edb_user_dr[REG_MSB -: 64];
                    end
                end
            end
            // assign register_conn[INTREG_CAP_MASK] = la_capture_mask;

            // Handle global capture condition
            trigger_unit #(
                .WIDTH      ( NUM_DATA_PRB ),
                .TRIGIN_EN  ( 0 ),
                .PIPE       ( PIPE_TU ),
                .TRIGGER_IF_MASK_ZERO ( 1 ) // Output high when mask is all zero
            ) global_capture_inst (
                .clk            ( clk ),
                .data_in        ( mux_capture_cmp ),
                .mask_in        ( la_capture_mask[0 +: NUM_DATA_PRB] ),
                .pattern_in     ( la_capture_pattern ),
                .trigger_in     ( 0 ),
                .trigger_out    ( capture_enable )
            );

            assign la_capture_enable = capture_enable;
        end else begin
            assign capture_enable = 1'b1;
            assign la_capture_enable = capture_enable;
            assign la_capture_mask = 256'b0;
        end
    endgenerate

    generate
        if (TRIGIN_EN) begin
            always @(posedge clk) begin
                if (!la_resetn) begin
                    trig_in_ack <= 1'b0;
                end 
                else begin
                    trig_in_ack <= trig_in;
                end
            end
        end
    endgenerate

    generate
        if (PIPE_CU == 1) begin
            reg [CAPTURE_WIDTH-1:0] cap_fifo_din_p1;

            always @(posedge clk) begin
                cap_fifo_din_p1 <= cap_fifo_din;
                cap_fifo_din_cu <= cap_fifo_din_p1;
            end
        end 
        else begin
            always @(*) begin
                cap_fifo_din_cu = cap_fifo_din;
            end
        end

        // Added due to trigger unit now 1-cycle delayed
        if (PIPE_TU == 1) begin
            always @(posedge clk) begin
                cap_fifo_din_tu <= cap_fifo_din_cu;
            end
        end 
        else begin
            always @(*) begin
                cap_fifo_din_tu = cap_fifo_din_cu;
            end
        end
    endgenerate

    la_biu #(
        .REG_WIDTH      ( REG_WIDTH ),
        .BUF_MAX_ADDR_W ( BUF_MAX_ADDR_W ),
        .CAPTURE_WIDTH  ( CAPTURE_WIDTH ),
        .DATA_DEPTH     ( DATA_DEPTH ),
        .WINDOWS_ADDRESS_WIDTH (WINDOWS_ADDRESS_WIDTH),
        .TRIGOUT_EN     ( TRIGOUT_EN ),
        .CAPTURE_CONTROL (CAPTURE_CONTROL)
    ) la_biu_inst (
        .la_run_trig        ( la_run_trig ),
        .la_run_trig_imdt   ( la_run_trig_imdt ),
        .la_stop_trig       ( la_stop_trig ),
        .la_trig_pos        ( la_trig_pos ),
        .la_window_depth    ( la_window_depth),
        .la_num_trigger     ( la_num_trigger),
        .la_cstate          ( la_cstate ),
        .la_sample_cnt      (la_sample_cnt),
        .tck_i              ( bscan_TCK ),
        .reset_i            ( bscan_RESET ),
        .strobe_i           ( biu_strobe ),
        .rdy_o              ( biu_ready ),
        .addr_i             ( address_counter ),
        .data_o             ( data_from_biu ),
        .clk                ( clk ),
        .la_resetn          ( la_resetn ),
        .cap_fifo_din       ( cap_fifo_din_tu ),
        .capture_enable     ( la_capture_enable ),
        .tu_trigger         ( tu_trigger ),
        .trig_out           ( trig_out ),
        .trig_out_ack       ( trig_out_ack )
    );

endmodule
// edb_la_top

//////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2013-2019 Efinix Inc. All rights reserved.
//
// This   document  contains  proprietary information  which   is
// protected by  copyright. All rights  are reserved.  This notice
// refers to original work by Efinix, Inc. which may be derivitive
// of other work distributed under license of the authors.  In the
// case of derivative work, nothing in this notice overrides the
// original author's license agreement.  Where applicable, the 
// original license agreement is included in it's original 
// unmodified form immediately below this header.
//
// WARRANTY DISCLAIMER.  
//     THE  DESIGN, CODE, OR INFORMATION ARE PROVIDED “AS IS” AND 
//     EFINIX MAKES NO WARRANTIES, EXPRESS OR IMPLIED WITH 
//     RESPECT THERETO, AND EXPRESSLY DISCLAIMS ANY IMPLIED WARRANTIES, 
//     INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF 
//     MERCHANTABILITY, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR 
//     PURPOSE.  SOME STATES DO NOT ALLOW EXCLUSIONS OF AN IMPLIED 
//     WARRANTY, SO THIS DISCLAIMER MAY NOT APPLY TO LICENSEE.
//
// LIMITATION OF LIABILITY.  
//     NOTWITHSTANDING ANYTHING TO THE CONTRARY, EXCEPT FOR BODILY 
//     INJURY, EFINIX SHALL NOT BE LIABLE WITH RESPECT TO ANY SUBJECT 
//     MATTER OF THIS AGREEMENT UNDER TORT, CONTRACT, STRICT LIABILITY 
//     OR ANY OTHER LEGAL OR EQUITABLE THEORY (I) FOR ANY INDIRECT, 
//     SPECIAL, INCIDENTAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES OF ANY 
//     CHARACTER INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF 
//     GOODWILL, DATA OR PROFIT, WORK STOPPAGE, OR COMPUTER FAILURE OR 
//     MALFUNCTION, OR IN ANY EVENT (II) FOR ANY AMOUNT IN EXCESS, IN 
//     THE AGGREGATE, OF THE FEE PAID BY LICENSEE TO EFINIX HEREUNDER 
//     (OR, IF THE FEE HAS BEEN WAIVED, $100), EVEN IF EFINIX SHALL HAVE 
//     BEEN INFORMED OF THE POSSIBILITY OF SUCH DAMAGES.  SOME STATES DO 
//     NOT ALLOW THE EXCLUSION OR LIMITATION OF INCIDENTAL OR 
//     CONSEQUENTIAL DAMAGES, SO THIS LIMITATION AND EXCLUSION MAY NOT 
//     APPLY TO LICENSEE.
//
/////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//
// A custom sync FIFO implementation with extra read port for reading a full
// buffer, with address 0 starting at the first word read pointer points to.
//
// May 2019, samh
//

module fifo_address_trancode_unit #(
    parameter TOTAL_ADDR_WIDTH = 10,
    parameter CELL_ADDR_WIDTH = 11, // Additional 1 bit to indicate overflow
    parameter BUFFER_DEPTH = 5,
    parameter PIPE = 1
)(
    input clk,

    input [TOTAL_ADDR_WIDTH - 1:0] window_addr,
    input [CELL_ADDR_WIDTH - 1:0] cell_addr,
    input [BUFFER_DEPTH - 1:0] window_depth, // 2's power

    output reg [TOTAL_ADDR_WIDTH -1:0] phy_addr,
    output reg cell_addr_msb
);
    wire [TOTAL_ADDR_WIDTH - 1:0] out_phy_addr;
    wire out_cell_addr_msb;
    wire [BUFFER_DEPTH - 1:0] window_depth_plus_1;
    wire [CELL_ADDR_WIDTH - 1:0] cell_addr_mask;

    wire [TOTAL_ADDR_WIDTH - 1:0] real_cell_addr;
    assign real_cell_addr = cell_addr[TOTAL_ADDR_WIDTH-1:0];

    // MSB                                                                          LSB
    // window_addr(window_addr width - window_depth bit) |  cell_addr (window_depth bit)
    // Example:
    // window_depth = 4, addr_width = 10
    // MSP 6 bit = window_addr, 4 bit = cell_addr
    assign out_phy_addr = (window_addr << window_depth) | (real_cell_addr & {{(TOTAL_ADDR_WIDTH){1'b1}} >> (TOTAL_ADDR_WIDTH - window_depth)});

    // Get the most MSB bit of the cell addr, needed because the length of the cell addr depends on window_depth
    assign window_depth_plus_1 = window_depth + 1'b1;
    assign cell_addr_mask = 1'b1 << (window_depth);
    assign out_cell_addr_msb = |{cell_addr & cell_addr_mask};

    generate
        if (PIPE == 1) begin
            always @(posedge clk) begin
                phy_addr <= out_phy_addr;
                cell_addr_msb <= out_cell_addr_msb;
            end
        end else begin
            always @(*) begin
                phy_addr = out_phy_addr;
                cell_addr_msb = out_cell_addr_msb;
            end
        end
    endgenerate
endmodule

module fifo_with_read #(
    parameter DATA_WIDTH = 1,
    parameter ADDR_WIDTH = 10,
    parameter WINDOW_ADDR_WIDTH = 5,
    parameter PIPE = 1
)(
    input  clk, rstn,
    input  push, pop,

    input  [WINDOW_ADDR_WIDTH - 1: 0] window_depth,
    output reg full,
    output [ADDR_WIDTH - 1: 0] curr_window_addr,

    input [DATA_WIDTH - 1:0] din,
    output [DATA_WIDTH - 1: 0] dout,
    input  rd_mode,
    input  [ADDR_WIDTH-1:0] raddr,

    output prefull,
    output preprefull,
    output [ADDR_WIDTH -1: 0] curr_cnt,
    output [ADDR_WIDTH: 0] total_cnt
);

    reg [ADDR_WIDTH - 1: 0] window_addr;

    localparam RAM_DEPTH = (1 << ADDR_WIDTH);

    wire [ADDR_WIDTH-1:0] wr_pointer;
    wire [ADDR_WIDTH-1:0] rd_pointer;

    wire we, re;
    wire [ADDR_WIDTH-1:0] phy_addr;

    wire segment_pointer_eq;
    wire segment_msb_xor;

    reg [ADDR_WIDTH:0] segment_wr_pointer;
    reg [ADDR_WIDTH:0] segment_rd_pointer;

    wire segment_wr_msb;
    wire segment_rd_msb;

    reg [ADDR_WIDTH:0] counter;
    reg [ADDR_WIDTH:0] total_counter;

    reg [ADDR_WIDTH:0] next_segment_wr_pointer;
    wire next_segment_wr_msb;
    wire [ADDR_WIDTH - 1: 0] next_phy_wr_addr;
    wire [ADDR_WIDTH:0] max_counter;

    assign total_cnt = total_counter;

    // Stage 1: Increment Cell Address
    always @(posedge clk) begin
        if (!rstn) begin
            counter <= 0;
            window_addr <= 0;
            segment_rd_pointer <= 0;
            segment_wr_pointer <= 0;
            next_segment_wr_pointer <= 1;
        end else if (prefull && push && !pop) begin
            window_addr <= window_addr + 1'b1;
            segment_rd_pointer <= 0;
            segment_wr_pointer <= 0;
            next_segment_wr_pointer <= 1;
            counter <= 0;
        end else begin
            if (pop) begin
                segment_rd_pointer <= segment_rd_pointer + 1'b1;
            end

            if (push) begin
                segment_wr_pointer <= segment_wr_pointer + 1'b1;
                next_segment_wr_pointer <= next_segment_wr_pointer + 1'b1;
            end

            if (pop && !push) begin
                counter <= counter - 1'b1;
            end else if (push && !pop) begin
                counter <= counter + 1'b1;
            end else begin
                counter <= counter;
            end
        end
    end

    always @(posedge clk) begin
        if (!rstn) begin
            total_counter <= 0;
        end else begin
            if (pop && !push) begin
                total_counter <= total_counter - 1'b1;
            end else if (push && !pop) begin
                total_counter <= total_counter + 1'b1;
            end else begin
                total_counter <= total_counter;
            end
        end
    end

    assign curr_cnt = counter[ADDR_WIDTH-1:0];

    // Stage 2: Translate the address to phyiscal address
    fifo_address_trancode_unit #(
        .TOTAL_ADDR_WIDTH(ADDR_WIDTH),
        .CELL_ADDR_WIDTH(ADDR_WIDTH + 1),
        .BUFFER_DEPTH(WINDOW_ADDR_WIDTH),
        .PIPE(PIPE)
        // .PIPE(0)
    ) transcode_next_write_addr (
        .clk(clk),
        .window_addr(window_addr),
        .cell_addr(next_segment_wr_pointer),
        .window_depth(window_depth),

        .phy_addr(next_phy_wr_addr),
        .cell_addr_msb(next_segment_wr_msb)
    );

    fifo_address_trancode_unit #(
        .TOTAL_ADDR_WIDTH(ADDR_WIDTH),
        .CELL_ADDR_WIDTH(ADDR_WIDTH + 1),
        .BUFFER_DEPTH(WINDOW_ADDR_WIDTH),
        .PIPE(PIPE)
        // .PIPE(0)
    ) transcode_write_addr (
        .clk(clk),
        .window_addr(window_addr),
        .cell_addr(segment_wr_pointer),
        .window_depth(window_depth),

        .phy_addr(wr_pointer),
        .cell_addr_msb(segment_wr_msb)
    );

    fifo_address_trancode_unit #(
        .TOTAL_ADDR_WIDTH(ADDR_WIDTH),
        .CELL_ADDR_WIDTH(ADDR_WIDTH + 1),
        .BUFFER_DEPTH(WINDOW_ADDR_WIDTH),
        .PIPE(PIPE)
        // .PIPE(0)
    ) transcode_read_addr (
        .clk(clk),
        .window_addr(window_addr),
        .cell_addr(segment_rd_pointer),
        .window_depth(window_depth),

        .phy_addr(rd_pointer),
        .cell_addr_msb(segment_rd_msb)
    );

    reg [DATA_WIDTH - 1: 0] din_p2;
    reg push_p2;
    reg pop_p2;

    // We need to mark the MSP of the data of the last data block (for sw to reorder the data)
    wire [DATA_WIDTH - 1:0] data_in_with_status_bit;
    wire is_last_data = prefull && push && !pop;
    assign data_in_with_status_bit = {is_last_data, din[DATA_WIDTH -2:0]};

    generate
        if (PIPE == 1) begin
            always @(posedge clk) begin
                din_p2 <= data_in_with_status_bit;
                push_p2 <= push;
                pop_p2 <= pop;
                full <= prefull;
            end
        end else begin
            always @(*) begin
                din_p2 = data_in_with_status_bit;
                push_p2 = push;
                pop_p2 = pop;
            end
        end
    endgenerate

    assign segment_pointer_eq = (rd_pointer == wr_pointer);
    assign segment_msb_xor = segment_rd_msb ^ segment_wr_msb;

    assign next_segment_pointer_eq = (rd_pointer == next_phy_wr_addr);
    assign next_segment_msb_xor = segment_rd_msb ^ next_segment_wr_msb;

    assign max_counter = (2 ** window_depth) & {ADDR_WIDTH+1{1'b1}};
    assign prefull = (counter == max_counter - 1'b1);
    assign preprefull =  (counter == max_counter - 2'b10);

    assign we = push_p2;
    assign re = pop_p2;
    assign curr_window_addr = window_addr;

    assign phy_addr = rd_mode ? raddr : rd_pointer[ADDR_WIDTH-1:0];
    edb_simple_dual_port_ram #(
        .DATA_WIDTH    ( DATA_WIDTH ),
        .ADDR_WIDTH    ( ADDR_WIDTH ),
        .RAM_INIT_FILE ( "" )
    ) simple_dual_port_ram_inst (
        .rclk  ( clk ),
        .re    ( re | rd_mode ),
        //.raddr ( rd_pointer[ADDR_WIDTH-1:0] ),
        .raddr ( phy_addr ),
        .rdata ( dout ),
        .wclk  ( clk ),
        .we    ( we ),
        .waddr ( wr_pointer[ADDR_WIDTH-1:0] ),
        .wdata ( din_p2 )
    );
endmodule
// fifo_with_read

//////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2013-2019 Efinix Inc. All rights reserved.
//
// This   document  contains  proprietary information  which   is
// protected by  copyright. All rights  are reserved.  This notice
// refers to original work by Efinix, Inc. which may be derivitive
// of other work distributed under license of the authors.  In the
// case of derivative work, nothing in this notice overrides the
// original author's license agreement.  Where applicable, the
// original license agreement is included in it's original
// unmodified form immediately below this header.
//
// WARRANTY DISCLAIMER.
//     THE  DESIGN, CODE, OR INFORMATION ARE PROVIDED “AS IS” AND
//     EFINIX MAKES NO WARRANTIES, EXPRESS OR IMPLIED WITH
//     RESPECT THERETO, AND EXPRESSLY DISCLAIMS ANY IMPLIED WARRANTIES,
//     INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
//     MERCHANTABILITY, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR
//     PURPOSE.  SOME STATES DO NOT ALLOW EXCLUSIONS OF AN IMPLIED
//     WARRANTY, SO THIS DISCLAIMER MAY NOT APPLY TO LICENSEE.
//
// LIMITATION OF LIABILITY.
//     NOTWITHSTANDING ANYTHING TO THE CONTRARY, EXCEPT FOR BODILY
//     INJURY, EFINIX SHALL NOT BE LIABLE WITH RESPECT TO ANY SUBJECT
//     MATTER OF THIS AGREEMENT UNDER TORT, CONTRACT, STRICT LIABILITY
//     OR ANY OTHER LEGAL OR EQUITABLE THEORY (I) FOR ANY INDIRECT,
//     SPECIAL, INCIDENTAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES OF ANY
//     CHARACTER INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF
//     GOODWILL, DATA OR PROFIT, WORK STOPPAGE, OR COMPUTER FAILURE OR
//     MALFUNCTION, OR IN ANY EVENT (II) FOR ANY AMOUNT IN EXCESS, IN
//     THE AGGREGATE, OF THE FEE PAID BY LICENSEE TO EFINIX HEREUNDER
//     (OR, IF THE FEE HAS BEEN WAIVED, $100), EVEN IF EFINIX SHALL HAVE
//     BEEN INFORMED OF THE POSSIBILITY OF SUCH DAMAGES.  SOME STATES DO
//     NOT ALLOW THE EXCLUSION OR LIMITATION OF INCIDENTAL OR
//     CONSEQUENTIAL DAMAGES, SO THIS LIMITATION AND EXCLUSION MAY NOT
//     APPLY TO LICENSEE.
//
/////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//
// Modified from adbg AXI bus-interface-unit for LogicN logic analyzer
//
// May 2019, samh
//


module la_biu #(
    parameter REG_WIDTH = 64,
    parameter BUF_MAX_ADDR_W = 17, // max=131,072 =2^17
    parameter CAPTURE_WIDTH = 1,
    parameter DATA_DEPTH = 1024,
    parameter WINDOWS_ADDRESS_WIDTH = 5, // log2(max buffer width) ~= 4
    parameter TRIGOUT_EN = 0,
    parameter CAPTURE_CONTROL = 0
)(
    input  la_run_trig,
    input  la_run_trig_imdt,
    input  la_stop_trig,
    input  [BUF_MAX_ADDR_W-1:0] la_trig_pos,
    input  [WINDOWS_ADDRESS_WIDTH - 1:0] la_window_depth,
    input  [BUF_MAX_ADDR_W-1:0] la_num_trigger,

    output [2:0] la_cstate,
    output [BUF_MAX_ADDR_W-1: 0] la_sample_cnt,

    input  tck_i,
    input  reset_i,
    input  strobe_i,
    output reg rdy_o,
    input  [31:0] addr_i,
    output [REG_WIDTH-1:0] data_o,
    //input  [3:0] word_size_i,  // 1,2, or 4

    input  clk,
    input  la_resetn,
    input  [CAPTURE_WIDTH-1:0] cap_fifo_din,
    input  capture_enable, // Set to high to capture the sampled data
    input  tu_trigger,
    // input  cap_buf_read_done,

    output reg trig_out,
    input  trig_out_ack
);

    // function integer least_pwr2;
    //     input integer target;
    //     integer i;
    //     begin
    //         least_pwr2 = 1;
    //         for (i = 31; i >= 0; i = i - 1) begin
    //             if ((1 << i) >= target)
    //                 least_pwr2 = 1 << i;
    //         end
    //     end
    // endfunction

    // State machine
    localparam LA_IDLE      = 4'h0;
    localparam LA_PRE_TRIG  = 4'h1;
    localparam LA_WAIT_TRIG = 4'h2;
    localparam LA_POST_TRIG = 4'h3;
    localparam LA_FULL      = 4'h4;
    localparam LA_POST_TILL_FULL = 4'h5;
    localparam LA_RE_TRIG = 4'h6;
    localparam LA_POST_RE_TRIG_PHEAD = 4'h7;
    localparam LA_POST_RE_TRIG = 4'h8;
    localparam LA_POST_RE_TRIG_PHEAD_TRIGGED = 4'h9;
    localparam LA_POST_REACH_FULL = 4'hA;

    // localparam BYTES_PER_WORD = (CAPTURE_WIDTH)/8 + 1; // Plus 1 bit status bit
    // localparam BPW_LEAST_PWR2 = least_pwr2(BYTES_PER_WORD);

    localparam _64BIT_PER_WORD = (CAPTURE_WIDTH) / 64 + 1;
    // localparam WPD_LEAST_PWR2 = least_pwr2(_64BIT_PER_WORD);
    localparam WPD_LEAST_PWR2 = _64BIT_PER_WORD;

    // AXI4 FSM states
    localparam S_IDLE = 2'h0, S_AXIADDR = 2'h1, S_AXIDATA = 2'h2, S_AXIRESP = 2'h3;

    reg  [1:0] axi_fsm_state, next_fsm_state;

    reg [3:0] curr_state, next_state;
    reg  run_trig_p1, run_trig_p2;
    reg  run_trig_imdt_p1, run_trig_imdt_p2;
    wire  [BUF_MAX_ADDR_W-1:0] pos_counter;
    wire trig_pos_reached;
    wire fifo_full;
    reg  fifo_push, fifo_pop;
    reg  read_mode;
    wire [CAPTURE_WIDTH:0] fifo_dout;
    wire fifo_rstn;
    // wire [(BPW_LEAST_PWR2*8)-1:0] dout_ceil;
    // reg  [7:0] conn8 [0:BPW_LEAST_PWR2-1];
    wire [(WPD_LEAST_PWR2) * 64 -1:0] dout_ceil; // Cell to store a data chunk
    reg [63:0] conn64 [0:WPD_LEAST_PWR2-1];

    reg  triggering;

    // 1 free block in fifo for current window
    wire fifo_free_one;
    // 2 free block in fifo for current window
    wire fifo_free_two;

    // 17-bits MSB from addr_i,
    // actual used depends on BUF DATA_DEPTH
    localparam ADDR_WIDTH = $clog2(DATA_DEPTH);
    wire [ADDR_WIDTH-1:0] row_addr;
    wire [14:0] col_addr;

    localparam MOD_ADDRESS = $clog2(ADDR_WIDTH);
    // Number of bit for
    // reg [WINDOWS_ADDRESS_WIDTH - 1:0] fifo_window_depth;
    wire [BUF_MAX_ADDR_W - 1:0] fifo_window_cnt;
    wire  [ADDR_WIDTH-1:0] fifo_counter;
    assign pos_counter = {{(BUF_MAX_ADDR_W - ADDR_WIDTH){1'b0}}, fifo_counter};

    wire [ADDR_WIDTH:0] fifo_total_count;
    assign la_sample_cnt = {{(BUF_MAX_ADDR_W - ADDR_WIDTH - 1){1'b0}}, fifo_total_count};

    // Registers
    reg  [31:0] addr_reg;  // Don't really need the two LSB, this info is in the SEL bits
    reg  [REG_WIDTH-1:0] data_out_reg;  // AXI->dbg
    reg  str_sync;  // This is 'active-toggle' rather than -high or -low.
    reg  rdy_sync;  // ditto, active-toggle

    // Sync registers.  TFF indicates TCK domain, WBFF indicates wb_clk domain
    reg  rdy_sync_tff1;
    reg  rdy_sync_tff2;
    reg  rdy_sync_tff2q;  // used to detect toggles
    reg  str_sync_wbff1;
    reg  str_sync_wbff2;
    reg  str_sync_wbff2q;  // used to detect toggles

    // Control Signals
    reg  data_o_en;    // latch wb_data_i
    reg  rdy_sync_en;  // toggle the rdy_sync signal, indicate ready to TCK domain

    // Internal signals
    wire start_toggle;  // AXI domain, indicates a toggle on the start strobe
    wire [REG_WIDTH-1:0] swapped_data_out;

    // reg  cap_buf_read_done_p1, cap_buf_read_done_p2, cap_buf_read_done_p3;
    // wire cap_buf_read_done_negedge;

    // assign la_cstate = curr_state;

    localparam USER_LA_STATE_IDLE = 3'h0;
    localparam USER_LA_STATE_PRE = 3'h1;
    localparam USER_LA_STATE_WAIT = 3'h2;
    localparam USER_LA_STATE_POST = 3'h3;
    localparam USER_LA_STATE_FULL = 3'h4;

    reg[2:0] reg_la_cstate;
    assign la_cstate = reg_la_cstate;
    always @(*) begin
        case (curr_state)
            LA_IDLE: begin
                reg_la_cstate = USER_LA_STATE_IDLE;
            end
            LA_PRE_TRIG: begin
                reg_la_cstate = USER_LA_STATE_PRE;
            end
            LA_WAIT_TRIG: begin
                reg_la_cstate = USER_LA_STATE_WAIT;
            end

            LA_POST_TRIG: begin
                reg_la_cstate = USER_LA_STATE_POST;
            end

            LA_FULL: begin
                reg_la_cstate = USER_LA_STATE_FULL;
            end

            LA_POST_TILL_FULL: begin
                reg_la_cstate = USER_LA_STATE_POST;
            end

            LA_RE_TRIG: begin
                reg_la_cstate = USER_LA_STATE_PRE;
            end

            LA_POST_RE_TRIG_PHEAD: begin
                reg_la_cstate = USER_LA_STATE_PRE;
            end

            LA_POST_RE_TRIG: begin
                reg_la_cstate = USER_LA_STATE_PRE;
            end
            LA_POST_RE_TRIG_PHEAD_TRIGGED: begin
                reg_la_cstate = USER_LA_STATE_PRE;
            end
            LA_POST_REACH_FULL: begin
                reg_la_cstate = USER_LA_STATE_POST;
            end
            default :
                reg_la_cstate = USER_LA_STATE_IDLE;
        endcase
    end

    // Add one MSP bit to the captured data
    wire [CAPTURE_WIDTH:0] fifo_data_with_dummy_bit;
    assign fifo_data_with_dummy_bit = {1'b1, cap_fifo_din};

    always @(posedge clk) begin
        if (!la_resetn) begin
            run_trig_p1      <= 1'b0;
            run_trig_p2      <= 1'b0;
            run_trig_imdt_p1 <= 1'b0;
            run_trig_imdt_p2 <= 1'b0;
        end
        else begin
            run_trig_p1      <= la_run_trig;
            run_trig_p2      <= run_trig_p1;
            run_trig_imdt_p1 <= la_run_trig_imdt;
            run_trig_imdt_p2 <= run_trig_imdt_p1;
        end
    end

    assign trig_pos_reached = (pos_counter == la_trig_pos - 1);

    wire is_phead;
    assign is_phead = la_trig_pos == 0;

    wire is_plast;
    assign is_plast = la_trig_pos == 2 ** la_window_depth - 1;

    wire is_plast2;
    assign is_plast2 = la_trig_pos == 2 ** la_window_depth - 2;

    wire is_last_window;
    assign is_last_window = fifo_window_cnt == la_num_trigger - 1;

    always @(*) begin
        case(curr_state)
            LA_IDLE: begin
                if (run_trig_p2 || run_trig_imdt_p2) begin
                    if (la_trig_pos == 0) begin
                        next_state = LA_WAIT_TRIG;
                    end else begin
                        next_state = LA_PRE_TRIG;
                    end
                end else begin
                    next_state = LA_IDLE;
                end
            end

            LA_PRE_TRIG: begin
                if (trig_pos_reached) begin
                    next_state = LA_WAIT_TRIG;
                end else begin
                    next_state = LA_PRE_TRIG;
                end
            end

            LA_WAIT_TRIG: begin
                if (tu_trigger || run_trig_imdt_p2) begin
                    if (is_plast) begin
                        next_state = LA_POST_RE_TRIG;
                        if (is_last_window) begin
                            next_state = LA_POST_REACH_FULL;
                        end
                    end else begin
                        next_state = LA_POST_TRIG;
                        if (is_last_window) begin
                            next_state = LA_POST_TILL_FULL;
                        end
                    end
                end else if (la_stop_trig) begin
                    // Just buffer and stop
                    next_state = LA_POST_TILL_FULL;
                end else begin
                    next_state = LA_WAIT_TRIG;
                end
            end

            LA_FULL: begin
                next_state = LA_FULL;
            end

            // Push until fifo is real-full (all windows are full)
            LA_POST_TILL_FULL: begin
                if (fifo_free_one) begin
                    next_state = LA_POST_REACH_FULL;
                end else begin
                    next_state = LA_POST_TILL_FULL;
                end
            end

            LA_POST_REACH_FULL: begin
                next_state = LA_FULL;
            end

            LA_POST_RE_TRIG_PHEAD: begin
                if (tu_trigger || run_trig_imdt_p2) begin
                    next_state = LA_POST_RE_TRIG_PHEAD_TRIGGED;
                    if (is_last_window) begin
                        next_state = LA_POST_TILL_FULL;
                    end
                end else begin
                    next_state = LA_WAIT_TRIG;
                end
            end

            LA_POST_RE_TRIG_PHEAD_TRIGGED: begin
                next_state = LA_POST_TRIG;
            end

            LA_POST_RE_TRIG: begin
                if (trig_pos_reached) begin
                    next_state = LA_WAIT_TRIG;
                end else begin
                    next_state = LA_PRE_TRIG;
                end
            end

            LA_POST_TRIG: begin
                if (fifo_free_two || (fifo_free_one &&  is_plast2)) begin
                    if (is_last_window) begin
                        next_state = LA_POST_TILL_FULL;
                    end else begin
                        if (is_phead) begin
                            next_state = LA_POST_RE_TRIG_PHEAD;
                        end else begin
                            next_state = LA_POST_RE_TRIG;
                        end
                    end
                end else begin
                    next_state = LA_POST_TRIG;
                end
            end

            default: next_state = LA_IDLE;
        endcase
    end

    // Control whether go to next state or not
    reg state_load;
    always @(*) begin
        fifo_push  = 1'b0;
        fifo_pop   = 1'b0;
        read_mode  = 1'b0;
        triggering = 1'b0;
        state_load = 1'b1;
        case(curr_state)
            LA_PRE_TRIG: begin
                state_load = capture_enable;
                fifo_push  = 1'b1 & capture_enable;
            end

            LA_WAIT_TRIG: begin
                state_load = capture_enable;
                if (tu_trigger || run_trig_imdt_p2) begin
                    triggering = 1'b1;
                    fifo_push  = 1'b1 & capture_enable;
                    fifo_pop = 1'b0;
                end
                else begin
                    fifo_pop  = 1'b1 & capture_enable;
                    fifo_push  = 1'b1 & capture_enable;
                end
            end

            LA_POST_TRIG: begin
                state_load = capture_enable;
                fifo_push = 1'b1 & capture_enable;
            end

            LA_FULL: begin
                read_mode = 1'b1;
            end

            LA_POST_TILL_FULL: begin
                state_load = capture_enable;
                fifo_push = 1'b1 & capture_enable;
            end

            LA_RE_TRIG: begin
                state_load = capture_enable;
                fifo_push = 1'b1 & capture_enable;
            end

            LA_POST_REACH_FULL: begin
                // The fifo is fulled already, not pushing / poping
            end

            LA_POST_RE_TRIG_PHEAD: begin
                state_load = capture_enable;
                fifo_push = 1'b1 & capture_enable;
            end

            LA_POST_RE_TRIG_PHEAD_TRIGGED: begin
                state_load = capture_enable;
                fifo_push = 1'b1 & capture_enable;
            end

            LA_POST_RE_TRIG: begin
                state_load = capture_enable;
                fifo_push = 1'b1 & capture_enable;
            end

            default: begin
                fifo_push = 1'b0;
                fifo_pop = 1'b0;
            end
        endcase
    end

    always @(posedge clk) begin
        if (!la_resetn) begin
            curr_state <= LA_IDLE;
        end
        else if (la_stop_trig) begin
            curr_state <= next_state;
        end else if (state_load) begin
            curr_state <= next_state;
        end
    end

    generate
        if (TRIGOUT_EN) begin
            always @(posedge clk) begin
                if (!la_resetn || trig_out_ack || (curr_state == LA_IDLE)) begin
                    trig_out <= 1'b0;
                end
                else if (triggering) begin
                    trig_out <= 1'b1;
                end
            end
        end
    endgenerate

    // Create toggle-active strobe signal for clock sync.  This will start a transaction
    // on the AXI once the toggle propagates to the FSM in the AXI domain.
    always @(posedge tck_i or posedge reset_i) begin
        if (reset_i)
            str_sync <= 1'b0;
        else if (strobe_i && rdy_o)
            str_sync <= ~str_sync;
    end

    // synchronize the start strobe
    always @(posedge clk) begin
        if (!la_resetn) begin
            str_sync_wbff1  <= 1'b0;
            str_sync_wbff2  <= 1'b0;
            str_sync_wbff2q <= 1'b0;
        end
        else begin
            str_sync_wbff1  <= str_sync;
            str_sync_wbff2  <= str_sync_wbff1;
            str_sync_wbff2q <= str_sync_wbff2;  // used to detect toggles
        end
    end

    assign start_toggle = (str_sync_wbff2 != str_sync_wbff2q);

    // Create a toggle-active ready signal to send to the TCK domain
    always @(posedge clk) begin
        if (!la_resetn)
            rdy_sync <= 1'b0;
        else if (rdy_sync_en)
            rdy_sync <= ~rdy_sync;
    end

    // Create rdy_o output.  Set on reset, clear on strobe (if set), set on input toggle
    always @(posedge tck_i or posedge reset_i) begin
        if (reset_i) begin
            rdy_sync_tff1  <= 1'b0;
            rdy_sync_tff2  <= 1'b0;
            rdy_sync_tff2q <= 1'b0;
        end
        else begin
            rdy_sync_tff1  <= rdy_sync;       // Synchronize the ready signal across clock domains
            rdy_sync_tff2  <= rdy_sync_tff1;
            rdy_sync_tff2q <= rdy_sync_tff2;  // used to detect toggles
        end
    end

    always @(posedge tck_i or posedge reset_i) begin
        if (reset_i) begin
            rdy_o <= 1'b1;
        end
        else begin
            if (strobe_i && rdy_o)
                rdy_o <= 1'b0;
            else if (rdy_sync_tff2 != rdy_sync_tff2q)
                rdy_o <= 1'b1;
        end
    end

    // Latch input data on 'start' strobe, if ready.
    always @(posedge tck_i or posedge reset_i) begin
        if (reset_i) begin
            addr_reg <= 0;
        end
        else if (strobe_i && rdy_o) begin
            addr_reg <= addr_i;
        end
    end

    // WB->dbg data register
    always @(posedge clk) begin
        if (!la_resetn)
            data_out_reg <= 0;
        else if (data_o_en)
            data_out_reg <= swapped_data_out;
    end

    assign data_o = data_out_reg;

    // assign fifo_rstn = la_resetn && !(curr_state == LA_IDLE || curr_state == LA_RE_TRIG);
    assign fifo_rstn = la_resetn && !(curr_state == LA_IDLE);

    assign row_addr = addr_reg[15 +: ADDR_WIDTH];
    // Because col_addr is incremented by 8, we need to divided it by 8 here to locate the correct 64bit part of the whole words
    assign col_addr = addr_reg[14:0] >> 3;

    wire [ADDR_WIDTH -1:0] la_window_fill_cnt;

    assign fifo_window_cnt = {{(BUF_MAX_ADDR_W - ADDR_WIDTH){1'b0}},la_window_fill_cnt};

    fifo_with_read #(
        .DATA_WIDTH ( CAPTURE_WIDTH  + 1),
        .WINDOW_ADDR_WIDTH (WINDOWS_ADDRESS_WIDTH),
        .ADDR_WIDTH ( ADDR_WIDTH ),
        .PIPE (1)
    ) fifo_with_read_inst (
        .clk     ( clk ),
        .rstn    ( fifo_rstn ),
        .push    ( fifo_push ),
        .pop     ( fifo_pop ),
        .window_depth (la_window_depth),
        .full    ( fifo_full ),
        .curr_window_addr (la_window_fill_cnt),
        .rd_mode ( read_mode ),
        .raddr   ( row_addr ),
        .din     ( fifo_data_with_dummy_bit ),
        .dout    ( fifo_dout ),
        .prefull(fifo_free_one),
        .preprefull(fifo_free_two),
        .curr_cnt(fifo_counter),
        .total_cnt(fifo_total_count)
    );

    // assign dout_ceil = fifo_dout;
    // always @(*) begin
    //     for (i = 0; i < BYTES_PER_WORD; i = i + 1) begin
    //         conn8[i] = dout_ceil[i*8 +: 8];
    //     end
    // end
    // //assign swapped_data_out = conn8[col_addr[0 +: $clog2(BPW_LEAST_PWR2)]];
    // assign swapped_data_out = conn8[col_addr];

    assign dout_ceil = fifo_dout;
    genvar i;
    generate
        for (i = 0; i < _64BIT_PER_WORD; i = i + 1) begin
            always @(*) begin
                conn64[i] = dout_ceil[i * 64 +: 64];
            end
        end
    endgenerate
    assign swapped_data_out = conn64[col_addr];

    // Determination of next state (combinatorial)
    always @(*) begin
        //axi_master_ar_valid = 1'b0;
        //axi_master_r_ready  = 1'b0;
        next_fsm_state      = axi_fsm_state;
        rdy_sync_en         = 1'b0;
        data_o_en           = 1'b0;

        case (axi_fsm_state)
            S_IDLE: begin
                if (start_toggle)
                    next_fsm_state = S_AXIADDR;  // Don't go to next state for 1-cycle transfer
                else
                    next_fsm_state = S_IDLE;
            end
            S_AXIADDR: begin
                //axi_master_ar_valid = 1'b1;
                //if (!wr_reg && axi_master_ar_ready)
                next_fsm_state = S_AXIRESP;
            end
            S_AXIRESP: begin
                //axi_master_r_ready = 1'b1;
                //if (!wr_reg && axi_master_r_valid) begin
                data_o_en      = 1'b1;
                next_fsm_state = S_IDLE;
                rdy_sync_en    = 1'b1;
                //end
            end
        endcase
    end

    // Sequential bit
    always @(posedge clk) begin
        if (!la_resetn) axi_fsm_state <= S_IDLE;
        else            axi_fsm_state <= next_fsm_state;
    end

endmodule
// la_biu

//////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2013-2019 Efinix Inc. All rights reserved.
//
// This   document  contains  proprietary information  which   is
// protected by  copyright. All rights  are reserved.  This notice
// refers to original work by Efinix, Inc. which may be derivitive
// of other work distributed under license of the authors.  In the
// case of derivative work, nothing in this notice overrides the
// original author's license agreement.  Where applicable, the
// original license agreement is included in it's original
// unmodified form immediately below this header.
//
// WARRANTY DISCLAIMER.
//     THE  DESIGN, CODE, OR INFORMATION ARE PROVIDED “AS IS” AND
//     EFINIX MAKES NO WARRANTIES, EXPRESS OR IMPLIED WITH
//     RESPECT THERETO, AND EXPRESSLY DISCLAIMS ANY IMPLIED WARRANTIES,
//     INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
//     MERCHANTABILITY, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR
//     PURPOSE.  SOME STATES DO NOT ALLOW EXCLUSIONS OF AN IMPLIED
//     WARRANTY, SO THIS DISCLAIMER MAY NOT APPLY TO LICENSEE.
//
// LIMITATION OF LIABILITY.
//     NOTWITHSTANDING ANYTHING TO THE CONTRARY, EXCEPT FOR BODILY
//     INJURY, EFINIX SHALL NOT BE LIABLE WITH RESPECT TO ANY SUBJECT
//     MATTER OF THIS AGREEMENT UNDER TORT, CONTRACT, STRICT LIABILITY
//     OR ANY OTHER LEGAL OR EQUITABLE THEORY (I) FOR ANY INDIRECT,
//     SPECIAL, INCIDENTAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES OF ANY
//     CHARACTER INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF
//     GOODWILL, DATA OR PROFIT, WORK STOPPAGE, OR COMPUTER FAILURE OR
//     MALFUNCTION, OR IN ANY EVENT (II) FOR ANY AMOUNT IN EXCESS, IN
//     THE AGGREGATE, OF THE FEE PAID BY LICENSEE TO EFINIX HEREUNDER
//     (OR, IF THE FEE HAS BEEN WAIVED, $100), EVEN IF EFINIX SHALL HAVE
//     BEEN INFORMED OF THE POSSIBILITY OF SUCH DAMAGES.  SOME STATES DO
//     NOT ALLOW THE EXCLUSION OR LIMITATION OF INCIDENTAL OR
//     CONSEQUENTIAL DAMAGES, SO THIS LIMITATION AND EXCLUSION MAY NOT
//     APPLY TO LICENSEE.
//
/////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//
// Compare unit for each probe of the Efinix LogicN logic analyzer
//
// May 2019, samh
//


module compare_unit #(
    parameter WIDTH = 1,
    parameter PIPE = 0
)(
    input clk,
    input [WIDTH-1:0] data_in,
    input [WIDTH-1:0] compared_in,
    input [WIDTH-1:0] mask_in,
    input [2:0] pattern_in,
    output reg compare_out
);

    localparam NOP        = 3'h0;
    localparam LOGIC_ZERO = 3'h1;
    localparam LOGIC_ONE  = 3'h2;
    localparam DONT_CARE  = 3'h3;
    localparam RISE_EDGE  = 3'h4;
    localparam FALL_EDGE  = 3'h5;
    localparam BOTH_EDGE  = 3'h6;
    localparam NO_TRAN    = 3'h7;

    localparam EQ         = 3'h1;
    localparam NOT_EQ     = 3'h2;
    localparam LESS_THAN  = 3'h3;
    localparam LESS_EQ    = 3'h4;
    localparam GRTR_THAN  = 3'h5;
    localparam GRTR_EQ    = 3'h6;

    generate
        if (WIDTH == 1) begin
            reg data_in_p1;
            reg enable;
            wire rise, fall;

            always @(posedge clk) begin
                data_in_p1 <= data_in;
                enable <= 1'b1;
            end

            assign rise = (data_in == 1'b1 && data_in_p1 == 1'b0);
            assign fall = (data_in == 1'b0 && data_in_p1 == 1'b1);

            if (PIPE == 0) begin
                always @(*) begin
                    case (pattern_in)
                        LOGIC_ZERO:
                            compare_out = (data_in == 1'b0);
                        LOGIC_ONE:
                            compare_out = (data_in == 1'b1);
                        DONT_CARE:
                            compare_out = (data_in == 1'bx);
                        RISE_EDGE:
                            compare_out = enable && rise;
                        FALL_EDGE:
                            compare_out = enable && fall;
                        BOTH_EDGE:
                            compare_out = enable && (rise || fall);
                        NO_TRAN:
                            compare_out = enable && (data_in == data_in_p1);
                        default: // NOP
                            compare_out = 1'b0;
                    endcase
                end
            end 
            else begin // PIPE != 0
                reg exp1, exp2, exp3, exp4, exp5, exp6;

                always @(posedge clk) begin
                    exp1 <= (data_in == 1'b0);
                    exp2 <= (data_in == 1'b1);
                    exp3 <= enable && rise;
                    exp4 <= enable && fall;
                    exp5 <= enable && (rise || fall);
                    exp6 <= enable && (data_in == data_in_p1);
                    case (pattern_in)
                        LOGIC_ZERO:
                            //compare_out <= (data_in == 1'b0);
                            compare_out <= exp1;
                        LOGIC_ONE:
                            //compare_out <= (data_in == 1'b1);
                            compare_out <= exp2;
                        DONT_CARE:
                            compare_out <= 1'b1;
                        RISE_EDGE:
                            //compare_out <= enable && rise;
                            compare_out <= exp3;
                        FALL_EDGE:
                            //compare_out <= enable && fall;
                            compare_out <= exp4;
                        BOTH_EDGE:
                            //compare_out <= enable && (rise || fall);
                            compare_out <= exp5;
                        NO_TRAN:
                            //compare_out <= enable && (data_in == data_in_p1);
                            compare_out <= exp6;
                        default: // NOP
                            compare_out <= 1'b0;
                    endcase
                end
            end
        end 
        else begin // WIDTH != 1
            if (PIPE == 0) begin
                always @(*) begin
                    case (pattern_in)
                        EQ:
                            compare_out = (data_in | ~mask_in) == (compared_in | ~mask_in);
                        NOT_EQ:
                            compare_out = (data_in | ~mask_in) != (compared_in | ~mask_in);
                        LESS_THAN:
                            compare_out = (data_in < compared_in);
                        LESS_EQ:
                            compare_out = (data_in <= compared_in);
                        GRTR_THAN:
                            compare_out = (data_in > compared_in);
                        GRTR_EQ:
                            compare_out = (data_in >= compared_in);
                        default: // NOP
                            compare_out = 1'b0;
                    endcase
                end
            end 
            else begin // PIPE != 0
                reg [WIDTH-1:0] exp1, exp2;
                reg exp_gt;
                reg exp_eq;

                always @(posedge clk) begin
                    exp1 <= (data_in | ~mask_in);
                    exp2 <= (compared_in | ~mask_in);
                    exp_gt <= (data_in > compared_in);
                    exp_eq <= (data_in == compared_in);

                    case (pattern_in)
                        EQ:
                            compare_out <= exp1 == exp2;
                        NOT_EQ:
                            compare_out <= exp1 != exp2;
                        LESS_THAN:
                            compare_out <= !exp_gt && !exp_eq;
                        LESS_EQ:
                            compare_out <= !exp_gt;
                        GRTR_THAN:
                            compare_out <= exp_gt;
                        GRTR_EQ:
                            compare_out <= exp_gt || exp_eq;
                        default: // NOP
                            compare_out <= 1'b0;
                    endcase
                end
            end
        end
    endgenerate

endmodule
// compare_unit

//////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2013-2019 Efinix Inc. All rights reserved.
//
// This   document  contains  proprietary information  which   is
// protected by  copyright. All rights  are reserved.  This notice
// refers to original work by Efinix, Inc. which may be derivitive
// of other work distributed under license of the authors.  In the
// case of derivative work, nothing in this notice overrides the
// original author's license agreement.  Where applicable, the 
// original license agreement is included in it's original 
// unmodified form immediately below this header.
//
// WARRANTY DISCLAIMER.  
//     THE  DESIGN, CODE, OR INFORMATION ARE PROVIDED “AS IS” AND 
//     EFINIX MAKES NO WARRANTIES, EXPRESS OR IMPLIED WITH 
//     RESPECT THERETO, AND EXPRESSLY DISCLAIMS ANY IMPLIED WARRANTIES, 
//     INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF 
//     MERCHANTABILITY, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR 
//     PURPOSE.  SOME STATES DO NOT ALLOW EXCLUSIONS OF AN IMPLIED 
//     WARRANTY, SO THIS DISCLAIMER MAY NOT APPLY TO LICENSEE.
//
// LIMITATION OF LIABILITY.  
//     NOTWITHSTANDING ANYTHING TO THE CONTRARY, EXCEPT FOR BODILY 
//     INJURY, EFINIX SHALL NOT BE LIABLE WITH RESPECT TO ANY SUBJECT 
//     MATTER OF THIS AGREEMENT UNDER TORT, CONTRACT, STRICT LIABILITY 
//     OR ANY OTHER LEGAL OR EQUITABLE THEORY (I) FOR ANY INDIRECT, 
//     SPECIAL, INCIDENTAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES OF ANY 
//     CHARACTER INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF 
//     GOODWILL, DATA OR PROFIT, WORK STOPPAGE, OR COMPUTER FAILURE OR 
//     MALFUNCTION, OR IN ANY EVENT (II) FOR ANY AMOUNT IN EXCESS, IN 
//     THE AGGREGATE, OF THE FEE PAID BY LICENSEE TO EFINIX HEREUNDER 
//     (OR, IF THE FEE HAS BEEN WAIVED, $100), EVEN IF EFINIX SHALL HAVE 
//     BEEN INFORMED OF THE POSSIBILITY OF SUCH DAMAGES.  SOME STATES DO 
//     NOT ALLOW THE EXCLUSION OR LIMITATION OF INCIDENTAL OR 
//     CONSEQUENTIAL DAMAGES, SO THIS LIMITATION AND EXCLUSION MAY NOT 
//     APPLY TO LICENSEE.
//
/////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//
// Trigger unit for the trigger condition (reduction logic) on all compare unit
// outputs in Efinix LogicN logic analyzer
//
// May 2019, samh
//


module trigger_unit #(
    parameter WIDTH = 1,
    parameter TRIGIN_EN = 0,
    parameter PIPE = 0,
    parameter TRIGGER_IF_MASK_ZERO = 0 /* Output High / Low when mask_in is all zero,
                                only apply when TRIGIN_EN is disabled
                              */
)(
    input clk,
    input [WIDTH-1:0] data_in,
    input [WIDTH-1:0] mask_in, // Enable mask, set bit hi to enable trigger
    input [1:0] pattern_in,
    input trigger_in,
    output reg trigger_out
);

    localparam AND  = 'h0;
    localparam OR   = 'h1;
    localparam NAND = 'h2;
    localparam NOR  = 'h3;

    generate
        if (TRIGIN_EN == 1) begin
            reg mux_out;
            always @(*) begin
                case (pattern_in)
                    OR:
                        mux_out = |{(data_in & mask_in), trigger_in};
                    NAND:
                        mux_out = ~&{(data_in | ~mask_in), trigger_in};
                    NOR:
                        mux_out = ~|{(data_in & mask_in), trigger_in};
                    default: // AND
                        mux_out = &{(data_in | ~mask_in), trigger_in};
                endcase
            end
            // When TRIGIN_EN is set, it is considered that the mask for comparasion would never be empty
            if (PIPE == 0) begin
                always @(*) begin
                    trigger_out = mux_out;
                end
            end else begin
                always @(posedge clk) begin
                    trigger_out <= mux_out;
                end
            end
        end else begin
            reg mux_out;
            always @(*) begin
                case (pattern_in)
                    OR:
                        mux_out = |(data_in & mask_in);
                    NAND:
                        mux_out = ~&(data_in | ~mask_in);
                    NOR:
                        mux_out = ~|(data_in & mask_in);
                    default: // AND
                        mux_out = &(data_in | ~mask_in);
                endcase
            end
            if (PIPE == 0) begin
                if (TRIGGER_IF_MASK_ZERO == 0) begin
                    always @(*) begin
                        trigger_out = mux_out && (|mask_in);
                    end
                end else begin
                    always @(*) begin
                        trigger_out = mux_out || (~|mask_in);
                    end
                end
            end else begin
                if (TRIGGER_IF_MASK_ZERO == 0) begin
                    always @(posedge clk) begin
                        trigger_out <= mux_out && (|mask_in);
                    end
                end else begin
                    always @(posedge clk) begin
                        trigger_out <= mux_out || (~|mask_in);
                    end
                end
            end
        end
    endgenerate
endmodule
// trigger_unit

//////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2013-2019 Efinix Inc. All rights reserved.
//
// This   document  contains  proprietary information  which   is
// protected by  copyright. All rights  are reserved.  This notice
// refers to original work by Efinix, Inc. which may be derivitive
// of other work distributed under license of the authors.  In the
// case of derivative work, nothing in this notice overrides the
// original author's license agreement.  Where applicable, the 
// original license agreement is included in it's original 
// unmodified form immediately below this header.
//
// WARRANTY DISCLAIMER.  
//     THE  DESIGN, CODE, OR INFORMATION ARE PROVIDED “AS IS” AND 
//     EFINIX MAKES NO WARRANTIES, EXPRESS OR IMPLIED WITH 
//     RESPECT THERETO, AND EXPRESSLY DISCLAIMS ANY IMPLIED WARRANTIES, 
//     INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF 
//     MERCHANTABILITY, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR 
//     PURPOSE.  SOME STATES DO NOT ALLOW EXCLUSIONS OF AN IMPLIED 
//     WARRANTY, SO THIS DISCLAIMER MAY NOT APPLY TO LICENSEE.
//
// LIMITATION OF LIABILITY.  
//     NOTWITHSTANDING ANYTHING TO THE CONTRARY, EXCEPT FOR BODILY 
//     INJURY, EFINIX SHALL NOT BE LIABLE WITH RESPECT TO ANY SUBJECT 
//     MATTER OF THIS AGREEMENT UNDER TORT, CONTRACT, STRICT LIABILITY 
//     OR ANY OTHER LEGAL OR EQUITABLE THEORY (I) FOR ANY INDIRECT, 
//     SPECIAL, INCIDENTAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES OF ANY 
//     CHARACTER INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF 
//     GOODWILL, DATA OR PROFIT, WORK STOPPAGE, OR COMPUTER FAILURE OR 
//     MALFUNCTION, OR IN ANY EVENT (II) FOR ANY AMOUNT IN EXCESS, IN 
//     THE AGGREGATE, OF THE FEE PAID BY LICENSEE TO EFINIX HEREUNDER 
//     (OR, IF THE FEE HAS BEEN WAIVED, $100), EVEN IF EFINIX SHALL HAVE 
//     BEEN INFORMED OF THE POSSIBILITY OF SUCH DAMAGES.  SOME STATES DO 
//     NOT ALLOW THE EXCLUSION OR LIMITATION OF INCIDENTAL OR 
//     CONSEQUENTIAL DAMAGES, SO THIS LIMITATION AND EXCLUSION MAY NOT 
//     APPLY TO LICENSEE.
//
/////////////////////////////////////////////////////////////////////////////


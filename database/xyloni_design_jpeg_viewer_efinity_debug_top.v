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
    input  vio0_clk,
    input  [3:0] vio0_state,
    output vio0_on,
    output vio0_off,
    output vio0_trigger,
    output vio0_mode,
    output vio0_en,
    output vio0_we,
    output vio0_re,
    output [23:0] vio0_rgb,
    output [8:0] vio0_pix,
    output vio0_next,
    output vio0_back,
    output vio0_interrupt,
    input  la0_clk,
    input  la0_csx,
    input  la0_dcx,
    input  la0_wrx,
    input  la0_rdx,
    input  [23:0] la0_o_d,
    input  [23:0] la0_oe,
    input  [23:0] la0_i_d,
    input  [3:0] la0_state,
    input  [8:0] la0_x,
    input  [9:0] la0_y,
    input  [4:0] la0_fsm_status,
    input  [2:0] la0_spi_status,
    input  [1:0] la0_sos_status,
    input  [2:0] la0_scan_state,
    input  la0_Y_lb_we,
    input  la0_U_lb_we,
    input  la0_V_lb_we,
    input  la0_lb_full,
    input  la0_lb_nempty,
    input  la0_trigger
);

    localparam HUB_CS_WIDTH = 15;

    wire [HUB_CS_WIDTH-1:0] edb_module_selects;
    wire [HUB_CS_WIDTH-1:0] edb_module_inhibit;
    wire [HUB_CS_WIDTH-1:0] edb_module_tdo;
    wire    [`DR_WIDTH-1:0] edb_user_dr;

    // debug core connections
    wire vio0_module_select;
    wire vio0_module_inhibit;
    wire vio0_module_tdo;

    wire la0_module_select;
    wire la0_module_inhibit;
    wire la0_module_tdo;

    assign vio0_module_select       = edb_module_selects[0];
    assign edb_module_inhibit[0]    = vio0_module_inhibit;
    assign edb_module_tdo[0]        = vio0_module_tdo;
    assign la0_module_select        = edb_module_selects[1];
    assign edb_module_inhibit[1]    = la0_module_inhibit;
    assign edb_module_tdo[1]        = la0_module_tdo;
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
    edb_vio_top #(
        .NUM_PROBE_IN           ( 1 ),
        .NUM_PROBE_OUT          ( 12 ),
        .UUID           ( 128'h7fca82a0082340f29106597966e59361 ),
        .PROBE_IN0_WIDTH        ( 4 ),
        .PROBE_OUT0_WIDTH       ( 1 ),
        .PROBE_OUT1_WIDTH       ( 1 ),
        .PROBE_OUT2_WIDTH       ( 1 ),
        .PROBE_OUT3_WIDTH       ( 1 ),
        .PROBE_OUT4_WIDTH       ( 1 ),
        .PROBE_OUT5_WIDTH       ( 1 ),
        .PROBE_OUT6_WIDTH       ( 1 ),
        .PROBE_OUT7_WIDTH       ( 24 ),
        .PROBE_OUT8_WIDTH       ( 9 ),
        .PROBE_OUT9_WIDTH       ( 1 ),
        .PROBE_OUT10_WIDTH      ( 1 ),
        .PROBE_OUT11_WIDTH      ( 1 ),
        .PROBE_OUT0_INIT_VAL    ( 'h0 ),
        .PROBE_OUT1_INIT_VAL    ( 'h0 ),
        .PROBE_OUT2_INIT_VAL    ( 'h0 ),
        .PROBE_OUT3_INIT_VAL    ( 'h0 ),
        .PROBE_OUT4_INIT_VAL    ( 'h0 ),
        .PROBE_OUT5_INIT_VAL    ( 'h0 ),
        .PROBE_OUT6_INIT_VAL    ( 'h0 ),
        .PROBE_OUT7_INIT_VAL    ( 'h0 ),
        .PROBE_OUT8_INIT_VAL    ( 'h1df ),
        .PROBE_OUT9_INIT_VAL    ( 'h0 ),
        .PROBE_OUT10_INIT_VAL   ( 'h0 ),
        .PROBE_OUT11_INIT_VAL   ( 'h0 )
    ) vio0 (
        .bscan_CAPTURE      ( bscan_CAPTURE ),
        .bscan_DRCK         ( bscan_DRCK    ),
        .bscan_RESET        ( bscan_RESET   ),
        .bscan_RUNTEST      ( bscan_RUNTEST ),
        .bscan_SEL          ( bscan_SEL     ),
        .bscan_SHIFT        ( bscan_SHIFT   ),
        .bscan_TCK          ( bscan_TCK     ),
        .bscan_TDI          ( bscan_TDI     ),
        .bscan_TMS          ( bscan_TMS     ),
        .bscan_UPDATE       ( bscan_UPDATE  ),
        .edb_user_dr        ( edb_user_dr ),
        .edb_module_select  ( vio0_module_select  ),
        .edb_module_inhibit ( vio0_module_inhibit ),
        .edb_module_tdo     ( vio0_module_tdo ),
        .clk                ( vio0_clk ),
        .probe_in0          ( vio0_state ),
        .probe_in1          ( 1'b0 ),
        .probe_in2          ( 1'b0 ),
        .probe_in3          ( 1'b0 ),
        .probe_in4          ( 1'b0 ),
        .probe_in5          ( 1'b0 ),
        .probe_in6          ( 1'b0 ),
        .probe_in7          ( 1'b0 ),
        .probe_in8          ( 1'b0 ),
        .probe_in9          ( 1'b0 ),
        .probe_in10         ( 1'b0 ),
        .probe_in11         ( 1'b0 ),
        .probe_in12         ( 1'b0 ),
        .probe_in13         ( 1'b0 ),
        .probe_in14         ( 1'b0 ),
        .probe_in15         ( 1'b0 ),
        .probe_in16         ( 1'b0 ),
        .probe_in17         ( 1'b0 ),
        .probe_in18         ( 1'b0 ),
        .probe_in19         ( 1'b0 ),
        .probe_in20         ( 1'b0 ),
        .probe_in21         ( 1'b0 ),
        .probe_in22         ( 1'b0 ),
        .probe_in23         ( 1'b0 ),
        .probe_in24         ( 1'b0 ),
        .probe_in25         ( 1'b0 ),
        .probe_in26         ( 1'b0 ),
        .probe_in27         ( 1'b0 ),
        .probe_in28         ( 1'b0 ),
        .probe_in29         ( 1'b0 ),
        .probe_in30         ( 1'b0 ),
        .probe_in31         ( 1'b0 ),
        .probe_in32         ( 1'b0 ),
        .probe_in33         ( 1'b0 ),
        .probe_in34         ( 1'b0 ),
        .probe_in35         ( 1'b0 ),
        .probe_in36         ( 1'b0 ),
        .probe_in37         ( 1'b0 ),
        .probe_in38         ( 1'b0 ),
        .probe_in39         ( 1'b0 ),
        .probe_in40         ( 1'b0 ),
        .probe_in41         ( 1'b0 ),
        .probe_in42         ( 1'b0 ),
        .probe_in43         ( 1'b0 ),
        .probe_in44         ( 1'b0 ),
        .probe_in45         ( 1'b0 ),
        .probe_in46         ( 1'b0 ),
        .probe_in47         ( 1'b0 ),
        .probe_in48         ( 1'b0 ),
        .probe_in49         ( 1'b0 ),
        .probe_in50         ( 1'b0 ),
        .probe_in51         ( 1'b0 ),
        .probe_in52         ( 1'b0 ),
        .probe_in53         ( 1'b0 ),
        .probe_in54         ( 1'b0 ),
        .probe_in55         ( 1'b0 ),
        .probe_in56         ( 1'b0 ),
        .probe_in57         ( 1'b0 ),
        .probe_in58         ( 1'b0 ),
        .probe_in59         ( 1'b0 ),
        .probe_in60         ( 1'b0 ),
        .probe_in61         ( 1'b0 ),
        .probe_in62         ( 1'b0 ),
        .probe_in63         ( 1'b0 ),
        .probe_out0         ( vio0_on ),
        .probe_out1         ( vio0_off ),
        .probe_out2         ( vio0_trigger ),
        .probe_out3         ( vio0_mode ),
        .probe_out4         ( vio0_en ),
        .probe_out5         ( vio0_we ),
        .probe_out6         ( vio0_re ),
        .probe_out7         ( vio0_rgb ),
        .probe_out8         ( vio0_pix ),
        .probe_out9         ( vio0_next ),
        .probe_out10            ( vio0_back ),
        .probe_out11            ( vio0_interrupt ),
        .probe_out12            (  ),
        .probe_out13            (  ),
        .probe_out14            (  ),
        .probe_out15            (  ),
        .probe_out16            (  ),
        .probe_out17            (  ),
        .probe_out18            (  ),
        .probe_out19            (  ),
        .probe_out20            (  ),
        .probe_out21            (  ),
        .probe_out22            (  ),
        .probe_out23            (  ),
        .probe_out24            (  ),
        .probe_out25            (  ),
        .probe_out26            (  ),
        .probe_out27            (  ),
        .probe_out28            (  ),
        .probe_out29            (  ),
        .probe_out30            (  ),
        .probe_out31            (  ),
        .probe_out32            (  ),
        .probe_out33            (  ),
        .probe_out34            (  ),
        .probe_out35            (  ),
        .probe_out36            (  ),
        .probe_out37            (  ),
        .probe_out38            (  ),
        .probe_out39            (  ),
        .probe_out40            (  ),
        .probe_out41            (  ),
        .probe_out42            (  ),
        .probe_out43            (  ),
        .probe_out44            (  ),
        .probe_out45            (  ),
        .probe_out46            (  ),
        .probe_out47            (  ),
        .probe_out48            (  ),
        .probe_out49            (  ),
        .probe_out50            (  ),
        .probe_out51            (  ),
        .probe_out52            (  ),
        .probe_out53            (  ),
        .probe_out54            (  ),
        .probe_out55            (  ),
        .probe_out56            (  ),
        .probe_out57            (  ),
        .probe_out58            (  ),
        .probe_out59            (  ),
        .probe_out60            (  ),
        .probe_out61            (  ),
        .probe_out62            (  ),
        .probe_out63            (  )
    );

    edb_la_top #(
        .NUM_PROBES         ( 20 ),
        .DATA_DEPTH         ( 2048 ),
        .TRIGIN_EN          ( 0 ),
        .TRIGOUT_EN         ( 0 ),
        .CAPTURE_CONTROL    ( 0 ),
        .UUID   ( 128'hdcd83912d7504077b193205f4503b343 ),
        .CNDTNL_STRG_EN     ( 0 ),
        .PROBE0_WIDTH       ( 1 ),
        .PROBE0_TYPE        ( 1 ),
        .PROBE1_WIDTH       ( 1 ),
        .PROBE1_TYPE        ( 1 ),
        .PROBE2_WIDTH       ( 1 ),
        .PROBE2_TYPE        ( 1 ),
        .PROBE3_WIDTH       ( 1 ),
        .PROBE3_TYPE        ( 1 ),
        .PROBE4_WIDTH       ( 24 ),
        .PROBE4_TYPE        ( 1 ),
        .PROBE5_WIDTH       ( 24 ),
        .PROBE5_TYPE        ( 1 ),
        .PROBE6_WIDTH       ( 24 ),
        .PROBE6_TYPE        ( 1 ),
        .PROBE7_WIDTH       ( 4 ),
        .PROBE7_TYPE        ( 1 ),
        .PROBE8_WIDTH       ( 9 ),
        .PROBE8_TYPE        ( 1 ),
        .PROBE9_WIDTH       ( 10 ),
        .PROBE9_TYPE        ( 1 ),
        .PROBE10_WIDTH      ( 5 ),
        .PROBE10_TYPE       ( 1 ),
        .PROBE11_WIDTH      ( 3 ),
        .PROBE11_TYPE       ( 1 ),
        .PROBE12_WIDTH      ( 2 ),
        .PROBE12_TYPE       ( 1 ),
        .PROBE13_WIDTH      ( 3 ),
        .PROBE13_TYPE       ( 1 ),
        .PROBE14_WIDTH      ( 1 ),
        .PROBE14_TYPE       ( 1 ),
        .PROBE15_WIDTH      ( 1 ),
        .PROBE15_TYPE       ( 1 ),
        .PROBE16_WIDTH      ( 1 ),
        .PROBE16_TYPE       ( 1 ),
        .PROBE17_WIDTH      ( 1 ),
        .PROBE17_TYPE       ( 1 ),
        .PROBE18_WIDTH      ( 1 ),
        .PROBE18_TYPE       ( 1 ),
        .PROBE19_WIDTH      ( 1 ),
        .PROBE19_TYPE       ( 1 )
    ) la0 (
        .bscan_CAPTURE          ( bscan_CAPTURE ),
        .bscan_DRCK             ( bscan_DRCK    ),
        .bscan_RESET            ( bscan_RESET   ),
        .bscan_RUNTEST          ( bscan_RUNTEST ),
        .bscan_SEL              ( bscan_SEL     ),
        .bscan_SHIFT            ( bscan_SHIFT   ),
        .bscan_TCK              ( bscan_TCK     ),
        .bscan_TDI              ( bscan_TDI     ),
        .bscan_TMS              ( bscan_TMS     ),
        .bscan_UPDATE           ( bscan_UPDATE  ),
        .edb_user_dr            ( edb_user_dr ),
        .edb_module_select      ( la0_module_select  ),
        .edb_module_inhibit     ( la0_module_inhibit ),
        .edb_module_tdo         ( la0_module_tdo ),
        .clk                    ( la0_clk ),
        .trig_in                ( 1'b0 ),
        .trig_in_ack            (  ),
        .trig_out               (  ),
        .trig_out_ack           ( 1'b0 ),
        .probe0                 ( la0_csx ),
        .probe1                 ( la0_dcx ),
        .probe2                 ( la0_wrx ),
        .probe3                 ( la0_rdx ),
        .probe4                 ( la0_o_d ),
        .probe5                 ( la0_oe ),
        .probe6                 ( la0_i_d ),
        .probe7                 ( la0_state ),
        .probe8                 ( la0_x ),
        .probe9                 ( la0_y ),
        .probe10                    ( la0_fsm_status ),
        .probe11                    ( la0_spi_status ),
        .probe12                    ( la0_sos_status ),
        .probe13                    ( la0_scan_state ),
        .probe14                    ( la0_Y_lb_we ),
        .probe15                    ( la0_U_lb_we ),
        .probe16                    ( la0_V_lb_we ),
        .probe17                    ( la0_lb_full ),
        .probe18                    ( la0_lb_nempty ),
        .probe19                    ( la0_trigger )
    );

    debug_hub debug_hub_inst (
        .bscan_CAPTURE      ( bscan_CAPTURE ),
        .bscan_DRCK         ( bscan_DRCK    ),
        .bscan_RESET        ( bscan_RESET   ),
        .bscan_RUNTEST      ( bscan_RUNTEST ),
        .bscan_SEL          ( bscan_SEL     ),
        .bscan_SHIFT        ( bscan_SHIFT   ),
        .bscan_TCK          ( bscan_TCK     ),
        .bscan_TDI          ( bscan_TDI     ),
        .bscan_TMS          ( bscan_TMS     ),
        .bscan_UPDATE       ( bscan_UPDATE  ),
        .bscan_TDO          ( bscan_TDO     ),
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

    integer i;

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
    always @(*) begin
        for (i = 0; i < CS_WIDTH; i = i + 1) begin
            if (module_id_reg == i + 1) // check 4-bit id against 1~15
                module_selects[i] <= 1'b1;
            else
                module_selects[i] <= 1'b0;
        end
    end

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

////////////////////////////////////////////////////////////////////////////////
//
// Efinix JTAG Virtual Input Output (VIO) debug core
//
// v0.1: samh, Jan 2019
//

//`include "dbg_defines.v"


//
// VIO core wrapper for seperating individual probe ports
//
module edb_vio_top #(
    parameter NUM_PROBE_IN  = 1,
    parameter NUM_PROBE_OUT = 1,
    parameter UUID          = 128'h0000_0000_0000_0000_0000_0000_0000_0000,

    parameter [8:0] PROBE_IN0_WIDTH   = 1,
    parameter [8:0] PROBE_IN1_WIDTH   = 1,
    parameter [8:0] PROBE_IN2_WIDTH   = 1,
    parameter [8:0] PROBE_IN3_WIDTH   = 1,
    parameter [8:0] PROBE_IN4_WIDTH   = 1,
    parameter [8:0] PROBE_IN5_WIDTH   = 1,
    parameter [8:0] PROBE_IN6_WIDTH   = 1,
    parameter [8:0] PROBE_IN7_WIDTH   = 1,
    parameter [8:0] PROBE_IN8_WIDTH   = 1,
    parameter [8:0] PROBE_IN9_WIDTH   = 1,
    parameter [8:0] PROBE_IN10_WIDTH  = 1,
    parameter [8:0] PROBE_IN11_WIDTH  = 1,
    parameter [8:0] PROBE_IN12_WIDTH  = 1,
    parameter [8:0] PROBE_IN13_WIDTH  = 1,
    parameter [8:0] PROBE_IN14_WIDTH  = 1,
    parameter [8:0] PROBE_IN15_WIDTH  = 1,
    parameter [8:0] PROBE_IN16_WIDTH  = 1,
    parameter [8:0] PROBE_IN17_WIDTH  = 1,
    parameter [8:0] PROBE_IN18_WIDTH  = 1,
    parameter [8:0] PROBE_IN19_WIDTH  = 1,
    parameter [8:0] PROBE_IN20_WIDTH  = 1,
    parameter [8:0] PROBE_IN21_WIDTH  = 1,
    parameter [8:0] PROBE_IN22_WIDTH  = 1,
    parameter [8:0] PROBE_IN23_WIDTH  = 1,
    parameter [8:0] PROBE_IN24_WIDTH  = 1,
    parameter [8:0] PROBE_IN25_WIDTH  = 1,
    parameter [8:0] PROBE_IN26_WIDTH  = 1,
    parameter [8:0] PROBE_IN27_WIDTH  = 1,
    parameter [8:0] PROBE_IN28_WIDTH  = 1,
    parameter [8:0] PROBE_IN29_WIDTH  = 1,
    parameter [8:0] PROBE_IN30_WIDTH  = 1,
    parameter [8:0] PROBE_IN31_WIDTH  = 1,
    parameter [8:0] PROBE_IN32_WIDTH  = 1,
    parameter [8:0] PROBE_IN33_WIDTH  = 1,
    parameter [8:0] PROBE_IN34_WIDTH  = 1,
    parameter [8:0] PROBE_IN35_WIDTH  = 1,
    parameter [8:0] PROBE_IN36_WIDTH  = 1,
    parameter [8:0] PROBE_IN37_WIDTH  = 1,
    parameter [8:0] PROBE_IN38_WIDTH  = 1,
    parameter [8:0] PROBE_IN39_WIDTH  = 1,
    parameter [8:0] PROBE_IN40_WIDTH  = 1,
    parameter [8:0] PROBE_IN41_WIDTH  = 1,
    parameter [8:0] PROBE_IN42_WIDTH  = 1,
    parameter [8:0] PROBE_IN43_WIDTH  = 1,
    parameter [8:0] PROBE_IN44_WIDTH  = 1,
    parameter [8:0] PROBE_IN45_WIDTH  = 1,
    parameter [8:0] PROBE_IN46_WIDTH  = 1,
    parameter [8:0] PROBE_IN47_WIDTH  = 1,
    parameter [8:0] PROBE_IN48_WIDTH  = 1,
    parameter [8:0] PROBE_IN49_WIDTH  = 1,
    parameter [8:0] PROBE_IN50_WIDTH  = 1,
    parameter [8:0] PROBE_IN51_WIDTH  = 1,
    parameter [8:0] PROBE_IN52_WIDTH  = 1,
    parameter [8:0] PROBE_IN53_WIDTH  = 1,
    parameter [8:0] PROBE_IN54_WIDTH  = 1,
    parameter [8:0] PROBE_IN55_WIDTH  = 1,
    parameter [8:0] PROBE_IN56_WIDTH  = 1,
    parameter [8:0] PROBE_IN57_WIDTH  = 1,
    parameter [8:0] PROBE_IN58_WIDTH  = 1,
    parameter [8:0] PROBE_IN59_WIDTH  = 1,
    parameter [8:0] PROBE_IN60_WIDTH  = 1,
    parameter [8:0] PROBE_IN61_WIDTH  = 1,
    parameter [8:0] PROBE_IN62_WIDTH  = 1,
    parameter [8:0] PROBE_IN63_WIDTH  = 1,

    parameter [8:0] PROBE_OUT0_WIDTH  = 1,
    parameter [8:0] PROBE_OUT1_WIDTH  = 1,
    parameter [8:0] PROBE_OUT2_WIDTH  = 1,
    parameter [8:0] PROBE_OUT3_WIDTH  = 1,
    parameter [8:0] PROBE_OUT4_WIDTH  = 1,
    parameter [8:0] PROBE_OUT5_WIDTH  = 1,
    parameter [8:0] PROBE_OUT6_WIDTH  = 1,
    parameter [8:0] PROBE_OUT7_WIDTH  = 1,
    parameter [8:0] PROBE_OUT8_WIDTH  = 1,
    parameter [8:0] PROBE_OUT9_WIDTH  = 1,
    parameter [8:0] PROBE_OUT10_WIDTH = 1,
    parameter [8:0] PROBE_OUT11_WIDTH = 1,
    parameter [8:0] PROBE_OUT12_WIDTH = 1,
    parameter [8:0] PROBE_OUT13_WIDTH = 1,
    parameter [8:0] PROBE_OUT14_WIDTH = 1,
    parameter [8:0] PROBE_OUT15_WIDTH = 1,
    parameter [8:0] PROBE_OUT16_WIDTH = 1,
    parameter [8:0] PROBE_OUT17_WIDTH = 1,
    parameter [8:0] PROBE_OUT18_WIDTH = 1,
    parameter [8:0] PROBE_OUT19_WIDTH = 1,
    parameter [8:0] PROBE_OUT20_WIDTH = 1,
    parameter [8:0] PROBE_OUT21_WIDTH = 1,
    parameter [8:0] PROBE_OUT22_WIDTH = 1,
    parameter [8:0] PROBE_OUT23_WIDTH = 1,
    parameter [8:0] PROBE_OUT24_WIDTH = 1,
    parameter [8:0] PROBE_OUT25_WIDTH = 1,
    parameter [8:0] PROBE_OUT26_WIDTH = 1,
    parameter [8:0] PROBE_OUT27_WIDTH = 1,
    parameter [8:0] PROBE_OUT28_WIDTH = 1,
    parameter [8:0] PROBE_OUT29_WIDTH = 1,
    parameter [8:0] PROBE_OUT30_WIDTH = 1,
    parameter [8:0] PROBE_OUT31_WIDTH = 1,
    parameter [8:0] PROBE_OUT32_WIDTH = 1,
    parameter [8:0] PROBE_OUT33_WIDTH = 1,
    parameter [8:0] PROBE_OUT34_WIDTH = 1,
    parameter [8:0] PROBE_OUT35_WIDTH = 1,
    parameter [8:0] PROBE_OUT36_WIDTH = 1,
    parameter [8:0] PROBE_OUT37_WIDTH = 1,
    parameter [8:0] PROBE_OUT38_WIDTH = 1,
    parameter [8:0] PROBE_OUT39_WIDTH = 1,
    parameter [8:0] PROBE_OUT40_WIDTH = 1,
    parameter [8:0] PROBE_OUT41_WIDTH = 1,
    parameter [8:0] PROBE_OUT42_WIDTH = 1,
    parameter [8:0] PROBE_OUT43_WIDTH = 1,
    parameter [8:0] PROBE_OUT44_WIDTH = 1,
    parameter [8:0] PROBE_OUT45_WIDTH = 1,
    parameter [8:0] PROBE_OUT46_WIDTH = 1,
    parameter [8:0] PROBE_OUT47_WIDTH = 1,
    parameter [8:0] PROBE_OUT48_WIDTH = 1,
    parameter [8:0] PROBE_OUT49_WIDTH = 1,
    parameter [8:0] PROBE_OUT50_WIDTH = 1,
    parameter [8:0] PROBE_OUT51_WIDTH = 1,
    parameter [8:0] PROBE_OUT52_WIDTH = 1,
    parameter [8:0] PROBE_OUT53_WIDTH = 1,
    parameter [8:0] PROBE_OUT54_WIDTH = 1,
    parameter [8:0] PROBE_OUT55_WIDTH = 1,
    parameter [8:0] PROBE_OUT56_WIDTH = 1,
    parameter [8:0] PROBE_OUT57_WIDTH = 1,
    parameter [8:0] PROBE_OUT58_WIDTH = 1,
    parameter [8:0] PROBE_OUT59_WIDTH = 1,
    parameter [8:0] PROBE_OUT60_WIDTH = 1,
    parameter [8:0] PROBE_OUT61_WIDTH = 1,
    parameter [8:0] PROBE_OUT62_WIDTH = 1,
    parameter [8:0] PROBE_OUT63_WIDTH = 1,

    parameter [255:0] PROBE_OUT0_INIT_VAL  = 'h0,
    parameter [255:0] PROBE_OUT1_INIT_VAL  = 'h0,
    parameter [255:0] PROBE_OUT2_INIT_VAL  = 'h0,
    parameter [255:0] PROBE_OUT3_INIT_VAL  = 'h0,
    parameter [255:0] PROBE_OUT4_INIT_VAL  = 'h0,
    parameter [255:0] PROBE_OUT5_INIT_VAL  = 'h0,
    parameter [255:0] PROBE_OUT6_INIT_VAL  = 'h0,
    parameter [255:0] PROBE_OUT7_INIT_VAL  = 'h0,
    parameter [255:0] PROBE_OUT8_INIT_VAL  = 'h0,
    parameter [255:0] PROBE_OUT9_INIT_VAL  = 'h0,
    parameter [255:0] PROBE_OUT10_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT11_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT12_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT13_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT14_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT15_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT16_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT17_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT18_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT19_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT20_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT21_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT22_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT23_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT24_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT25_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT26_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT27_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT28_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT29_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT30_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT31_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT32_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT33_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT34_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT35_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT36_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT37_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT38_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT39_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT40_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT41_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT42_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT43_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT44_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT45_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT46_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT47_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT48_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT49_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT50_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT51_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT52_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT53_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT54_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT55_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT56_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT57_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT58_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT59_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT60_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT61_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT62_INIT_VAL = 'h0,
    parameter [255:0] PROBE_OUT63_INIT_VAL = 'h0
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
    output edb_module_inhibit,
    output edb_module_tdo,
    input  [`DR_WIDTH-1:0] edb_user_dr,

    // VIO interface
    input  clk,

    input  [PROBE_IN0_WIDTH -1:0] probe_in0,
    input  [PROBE_IN1_WIDTH -1:0] probe_in1,
    input  [PROBE_IN2_WIDTH -1:0] probe_in2,
    input  [PROBE_IN3_WIDTH -1:0] probe_in3,
    input  [PROBE_IN4_WIDTH -1:0] probe_in4,
    input  [PROBE_IN5_WIDTH -1:0] probe_in5,
    input  [PROBE_IN6_WIDTH -1:0] probe_in6,
    input  [PROBE_IN7_WIDTH -1:0] probe_in7,
    input  [PROBE_IN8_WIDTH -1:0] probe_in8,
    input  [PROBE_IN9_WIDTH -1:0] probe_in9,
    input  [PROBE_IN10_WIDTH-1:0] probe_in10,
    input  [PROBE_IN11_WIDTH-1:0] probe_in11,
    input  [PROBE_IN12_WIDTH-1:0] probe_in12,
    input  [PROBE_IN13_WIDTH-1:0] probe_in13,
    input  [PROBE_IN14_WIDTH-1:0] probe_in14,
    input  [PROBE_IN15_WIDTH-1:0] probe_in15,
    input  [PROBE_IN16_WIDTH-1:0] probe_in16,
    input  [PROBE_IN17_WIDTH-1:0] probe_in17,
    input  [PROBE_IN18_WIDTH-1:0] probe_in18,
    input  [PROBE_IN19_WIDTH-1:0] probe_in19,
    input  [PROBE_IN20_WIDTH-1:0] probe_in20,
    input  [PROBE_IN21_WIDTH-1:0] probe_in21,
    input  [PROBE_IN22_WIDTH-1:0] probe_in22,
    input  [PROBE_IN23_WIDTH-1:0] probe_in23,
    input  [PROBE_IN24_WIDTH-1:0] probe_in24,
    input  [PROBE_IN25_WIDTH-1:0] probe_in25,
    input  [PROBE_IN26_WIDTH-1:0] probe_in26,
    input  [PROBE_IN27_WIDTH-1:0] probe_in27,
    input  [PROBE_IN28_WIDTH-1:0] probe_in28,
    input  [PROBE_IN29_WIDTH-1:0] probe_in29,
    input  [PROBE_IN30_WIDTH-1:0] probe_in30,
    input  [PROBE_IN31_WIDTH-1:0] probe_in31,
    input  [PROBE_IN32_WIDTH-1:0] probe_in32,
    input  [PROBE_IN33_WIDTH-1:0] probe_in33,
    input  [PROBE_IN34_WIDTH-1:0] probe_in34,
    input  [PROBE_IN35_WIDTH-1:0] probe_in35,
    input  [PROBE_IN36_WIDTH-1:0] probe_in36,
    input  [PROBE_IN37_WIDTH-1:0] probe_in37,
    input  [PROBE_IN38_WIDTH-1:0] probe_in38,
    input  [PROBE_IN39_WIDTH-1:0] probe_in39,
    input  [PROBE_IN40_WIDTH-1:0] probe_in40,
    input  [PROBE_IN41_WIDTH-1:0] probe_in41,
    input  [PROBE_IN42_WIDTH-1:0] probe_in42,
    input  [PROBE_IN43_WIDTH-1:0] probe_in43,
    input  [PROBE_IN44_WIDTH-1:0] probe_in44,
    input  [PROBE_IN45_WIDTH-1:0] probe_in45,
    input  [PROBE_IN46_WIDTH-1:0] probe_in46,
    input  [PROBE_IN47_WIDTH-1:0] probe_in47,
    input  [PROBE_IN48_WIDTH-1:0] probe_in48,
    input  [PROBE_IN49_WIDTH-1:0] probe_in49,
    input  [PROBE_IN50_WIDTH-1:0] probe_in50,
    input  [PROBE_IN51_WIDTH-1:0] probe_in51,
    input  [PROBE_IN52_WIDTH-1:0] probe_in52,
    input  [PROBE_IN53_WIDTH-1:0] probe_in53,
    input  [PROBE_IN54_WIDTH-1:0] probe_in54,
    input  [PROBE_IN55_WIDTH-1:0] probe_in55,
    input  [PROBE_IN56_WIDTH-1:0] probe_in56,
    input  [PROBE_IN57_WIDTH-1:0] probe_in57,
    input  [PROBE_IN58_WIDTH-1:0] probe_in58,
    input  [PROBE_IN59_WIDTH-1:0] probe_in59,
    input  [PROBE_IN60_WIDTH-1:0] probe_in60,
    input  [PROBE_IN61_WIDTH-1:0] probe_in61,
    input  [PROBE_IN62_WIDTH-1:0] probe_in62,
    input  [PROBE_IN63_WIDTH-1:0] probe_in63,

    output [PROBE_OUT0_WIDTH -1:0] probe_out0,
    output [PROBE_OUT1_WIDTH -1:0] probe_out1,
    output [PROBE_OUT2_WIDTH -1:0] probe_out2,
    output [PROBE_OUT3_WIDTH -1:0] probe_out3,
    output [PROBE_OUT4_WIDTH -1:0] probe_out4,
    output [PROBE_OUT5_WIDTH -1:0] probe_out5,
    output [PROBE_OUT6_WIDTH -1:0] probe_out6,
    output [PROBE_OUT7_WIDTH -1:0] probe_out7,
    output [PROBE_OUT8_WIDTH -1:0] probe_out8,
    output [PROBE_OUT9_WIDTH -1:0] probe_out9,
    output [PROBE_OUT10_WIDTH-1:0] probe_out10,
    output [PROBE_OUT11_WIDTH-1:0] probe_out11,
    output [PROBE_OUT12_WIDTH-1:0] probe_out12,
    output [PROBE_OUT13_WIDTH-1:0] probe_out13,
    output [PROBE_OUT14_WIDTH-1:0] probe_out14,
    output [PROBE_OUT15_WIDTH-1:0] probe_out15,
    output [PROBE_OUT16_WIDTH-1:0] probe_out16,
    output [PROBE_OUT17_WIDTH-1:0] probe_out17,
    output [PROBE_OUT18_WIDTH-1:0] probe_out18,
    output [PROBE_OUT19_WIDTH-1:0] probe_out19,
    output [PROBE_OUT20_WIDTH-1:0] probe_out20,
    output [PROBE_OUT21_WIDTH-1:0] probe_out21,
    output [PROBE_OUT22_WIDTH-1:0] probe_out22,
    output [PROBE_OUT23_WIDTH-1:0] probe_out23,
    output [PROBE_OUT24_WIDTH-1:0] probe_out24,
    output [PROBE_OUT25_WIDTH-1:0] probe_out25,
    output [PROBE_OUT26_WIDTH-1:0] probe_out26,
    output [PROBE_OUT27_WIDTH-1:0] probe_out27,
    output [PROBE_OUT28_WIDTH-1:0] probe_out28,
    output [PROBE_OUT29_WIDTH-1:0] probe_out29,
    output [PROBE_OUT30_WIDTH-1:0] probe_out30,
    output [PROBE_OUT31_WIDTH-1:0] probe_out31,
    output [PROBE_OUT32_WIDTH-1:0] probe_out32,
    output [PROBE_OUT33_WIDTH-1:0] probe_out33,
    output [PROBE_OUT34_WIDTH-1:0] probe_out34,
    output [PROBE_OUT35_WIDTH-1:0] probe_out35,
    output [PROBE_OUT36_WIDTH-1:0] probe_out36,
    output [PROBE_OUT37_WIDTH-1:0] probe_out37,
    output [PROBE_OUT38_WIDTH-1:0] probe_out38,
    output [PROBE_OUT39_WIDTH-1:0] probe_out39,
    output [PROBE_OUT40_WIDTH-1:0] probe_out40,
    output [PROBE_OUT41_WIDTH-1:0] probe_out41,
    output [PROBE_OUT42_WIDTH-1:0] probe_out42,
    output [PROBE_OUT43_WIDTH-1:0] probe_out43,
    output [PROBE_OUT44_WIDTH-1:0] probe_out44,
    output [PROBE_OUT45_WIDTH-1:0] probe_out45,
    output [PROBE_OUT46_WIDTH-1:0] probe_out46,
    output [PROBE_OUT47_WIDTH-1:0] probe_out47,
    output [PROBE_OUT48_WIDTH-1:0] probe_out48,
    output [PROBE_OUT49_WIDTH-1:0] probe_out49,
    output [PROBE_OUT50_WIDTH-1:0] probe_out50,
    output [PROBE_OUT51_WIDTH-1:0] probe_out51,
    output [PROBE_OUT52_WIDTH-1:0] probe_out52,
    output [PROBE_OUT53_WIDTH-1:0] probe_out53,
    output [PROBE_OUT54_WIDTH-1:0] probe_out54,
    output [PROBE_OUT55_WIDTH-1:0] probe_out55,
    output [PROBE_OUT56_WIDTH-1:0] probe_out56,
    output [PROBE_OUT57_WIDTH-1:0] probe_out57,
    output [PROBE_OUT58_WIDTH-1:0] probe_out58,
    output [PROBE_OUT59_WIDTH-1:0] probe_out59,
    output [PROBE_OUT60_WIDTH-1:0] probe_out60,
    output [PROBE_OUT61_WIDTH-1:0] probe_out61,
    output [PROBE_OUT62_WIDTH-1:0] probe_out62,
    output [PROBE_OUT63_WIDTH-1:0] probe_out63
);

    function automatic integer cond_sum64;
        input integer count;
        input [64*9-1:0] in;
        integer i;
        reg [64*9-1:0] in_reg;
        begin
            cond_sum64 = 0;
            in_reg = in;
            for (i = 0; i < count; i=i+1) begin
                cond_sum64 = cond_sum64 + in_reg[8:0];
                in_reg = in_reg >> 9;
            end
        end
    endfunction

    localparam MAXP = 64;

    localparam [MAXP*9-1:0] PROBE_IN_W_ARRAY = {
        PROBE_IN63_WIDTH, PROBE_IN62_WIDTH, PROBE_IN61_WIDTH, PROBE_IN60_WIDTH,
        PROBE_IN59_WIDTH, PROBE_IN58_WIDTH, PROBE_IN57_WIDTH, PROBE_IN56_WIDTH,
        PROBE_IN55_WIDTH, PROBE_IN54_WIDTH, PROBE_IN53_WIDTH, PROBE_IN52_WIDTH,
        PROBE_IN51_WIDTH, PROBE_IN50_WIDTH, PROBE_IN49_WIDTH, PROBE_IN48_WIDTH,
        PROBE_IN47_WIDTH, PROBE_IN46_WIDTH, PROBE_IN45_WIDTH, PROBE_IN44_WIDTH,
        PROBE_IN43_WIDTH, PROBE_IN42_WIDTH, PROBE_IN41_WIDTH, PROBE_IN40_WIDTH,
        PROBE_IN39_WIDTH, PROBE_IN38_WIDTH, PROBE_IN37_WIDTH, PROBE_IN36_WIDTH,
        PROBE_IN35_WIDTH, PROBE_IN34_WIDTH, PROBE_IN33_WIDTH, PROBE_IN32_WIDTH,
        PROBE_IN31_WIDTH, PROBE_IN30_WIDTH, PROBE_IN29_WIDTH, PROBE_IN28_WIDTH,
        PROBE_IN27_WIDTH, PROBE_IN26_WIDTH, PROBE_IN25_WIDTH, PROBE_IN24_WIDTH,
        PROBE_IN23_WIDTH, PROBE_IN22_WIDTH, PROBE_IN21_WIDTH, PROBE_IN20_WIDTH,
        PROBE_IN19_WIDTH, PROBE_IN18_WIDTH, PROBE_IN17_WIDTH, PROBE_IN16_WIDTH,
        PROBE_IN15_WIDTH, PROBE_IN14_WIDTH, PROBE_IN13_WIDTH, PROBE_IN12_WIDTH,
        PROBE_IN11_WIDTH, PROBE_IN10_WIDTH, PROBE_IN9_WIDTH, PROBE_IN8_WIDTH,
        PROBE_IN7_WIDTH, PROBE_IN6_WIDTH, PROBE_IN5_WIDTH, PROBE_IN4_WIDTH,
        PROBE_IN3_WIDTH, PROBE_IN2_WIDTH, PROBE_IN1_WIDTH, PROBE_IN0_WIDTH
    };

    localparam PROBE_IN_W = cond_sum64(NUM_PROBE_IN, PROBE_IN_W_ARRAY);

    localparam [MAXP*9-1:0] PROBE_OUT_W_ARRAY = {
        PROBE_OUT63_WIDTH, PROBE_OUT62_WIDTH, PROBE_OUT61_WIDTH, PROBE_OUT60_WIDTH,
        PROBE_OUT59_WIDTH, PROBE_OUT58_WIDTH, PROBE_OUT57_WIDTH, PROBE_OUT56_WIDTH,
        PROBE_OUT55_WIDTH, PROBE_OUT54_WIDTH, PROBE_OUT53_WIDTH, PROBE_OUT52_WIDTH,
        PROBE_OUT51_WIDTH, PROBE_OUT50_WIDTH, PROBE_OUT49_WIDTH, PROBE_OUT48_WIDTH,
        PROBE_OUT47_WIDTH, PROBE_OUT46_WIDTH, PROBE_OUT45_WIDTH, PROBE_OUT44_WIDTH,
        PROBE_OUT43_WIDTH, PROBE_OUT42_WIDTH, PROBE_OUT41_WIDTH, PROBE_OUT40_WIDTH,
        PROBE_OUT39_WIDTH, PROBE_OUT38_WIDTH, PROBE_OUT37_WIDTH, PROBE_OUT36_WIDTH,
        PROBE_OUT35_WIDTH, PROBE_OUT34_WIDTH, PROBE_OUT33_WIDTH, PROBE_OUT32_WIDTH,
        PROBE_OUT31_WIDTH, PROBE_OUT30_WIDTH, PROBE_OUT29_WIDTH, PROBE_OUT28_WIDTH,
        PROBE_OUT27_WIDTH, PROBE_OUT26_WIDTH, PROBE_OUT25_WIDTH, PROBE_OUT24_WIDTH,
        PROBE_OUT23_WIDTH, PROBE_OUT22_WIDTH, PROBE_OUT21_WIDTH, PROBE_OUT20_WIDTH,
        PROBE_OUT19_WIDTH, PROBE_OUT18_WIDTH, PROBE_OUT17_WIDTH, PROBE_OUT16_WIDTH,
        PROBE_OUT15_WIDTH, PROBE_OUT14_WIDTH, PROBE_OUT13_WIDTH, PROBE_OUT12_WIDTH,
        PROBE_OUT11_WIDTH, PROBE_OUT10_WIDTH, PROBE_OUT9_WIDTH, PROBE_OUT8_WIDTH,
        PROBE_OUT7_WIDTH, PROBE_OUT6_WIDTH, PROBE_OUT5_WIDTH, PROBE_OUT4_WIDTH,
        PROBE_OUT3_WIDTH, PROBE_OUT2_WIDTH, PROBE_OUT1_WIDTH, PROBE_OUT0_WIDTH
    };

    localparam PROBE_OUT_W = cond_sum64(NUM_PROBE_OUT, PROBE_OUT_W_ARRAY);

    localparam init_concat = {
        PROBE_OUT63_INIT_VAL[PROBE_OUT63_WIDTH-1:0],
        PROBE_OUT62_INIT_VAL[PROBE_OUT62_WIDTH-1:0],
        PROBE_OUT61_INIT_VAL[PROBE_OUT61_WIDTH-1:0],
        PROBE_OUT60_INIT_VAL[PROBE_OUT60_WIDTH-1:0],
        PROBE_OUT59_INIT_VAL[PROBE_OUT59_WIDTH-1:0],
        PROBE_OUT58_INIT_VAL[PROBE_OUT58_WIDTH-1:0],
        PROBE_OUT57_INIT_VAL[PROBE_OUT57_WIDTH-1:0],
        PROBE_OUT56_INIT_VAL[PROBE_OUT56_WIDTH-1:0],
        PROBE_OUT55_INIT_VAL[PROBE_OUT55_WIDTH-1:0],
        PROBE_OUT54_INIT_VAL[PROBE_OUT54_WIDTH-1:0],
        PROBE_OUT53_INIT_VAL[PROBE_OUT53_WIDTH-1:0],
        PROBE_OUT52_INIT_VAL[PROBE_OUT52_WIDTH-1:0],
        PROBE_OUT51_INIT_VAL[PROBE_OUT51_WIDTH-1:0],
        PROBE_OUT50_INIT_VAL[PROBE_OUT50_WIDTH-1:0],
        PROBE_OUT49_INIT_VAL[PROBE_OUT49_WIDTH-1:0],
        PROBE_OUT48_INIT_VAL[PROBE_OUT48_WIDTH-1:0],
        PROBE_OUT47_INIT_VAL[PROBE_OUT47_WIDTH-1:0],
        PROBE_OUT46_INIT_VAL[PROBE_OUT46_WIDTH-1:0],
        PROBE_OUT45_INIT_VAL[PROBE_OUT45_WIDTH-1:0],
        PROBE_OUT44_INIT_VAL[PROBE_OUT44_WIDTH-1:0],
        PROBE_OUT43_INIT_VAL[PROBE_OUT43_WIDTH-1:0],
        PROBE_OUT42_INIT_VAL[PROBE_OUT42_WIDTH-1:0],
        PROBE_OUT41_INIT_VAL[PROBE_OUT41_WIDTH-1:0],
        PROBE_OUT40_INIT_VAL[PROBE_OUT40_WIDTH-1:0],
        PROBE_OUT39_INIT_VAL[PROBE_OUT39_WIDTH-1:0],
        PROBE_OUT38_INIT_VAL[PROBE_OUT38_WIDTH-1:0],
        PROBE_OUT37_INIT_VAL[PROBE_OUT37_WIDTH-1:0],
        PROBE_OUT36_INIT_VAL[PROBE_OUT36_WIDTH-1:0],
        PROBE_OUT35_INIT_VAL[PROBE_OUT35_WIDTH-1:0],
        PROBE_OUT34_INIT_VAL[PROBE_OUT34_WIDTH-1:0],
        PROBE_OUT33_INIT_VAL[PROBE_OUT33_WIDTH-1:0],
        PROBE_OUT32_INIT_VAL[PROBE_OUT32_WIDTH-1:0],
        PROBE_OUT31_INIT_VAL[PROBE_OUT31_WIDTH-1:0],
        PROBE_OUT30_INIT_VAL[PROBE_OUT30_WIDTH-1:0],
        PROBE_OUT29_INIT_VAL[PROBE_OUT29_WIDTH-1:0],
        PROBE_OUT28_INIT_VAL[PROBE_OUT28_WIDTH-1:0],
        PROBE_OUT27_INIT_VAL[PROBE_OUT27_WIDTH-1:0],
        PROBE_OUT26_INIT_VAL[PROBE_OUT26_WIDTH-1:0],
        PROBE_OUT25_INIT_VAL[PROBE_OUT25_WIDTH-1:0],
        PROBE_OUT24_INIT_VAL[PROBE_OUT24_WIDTH-1:0],
        PROBE_OUT23_INIT_VAL[PROBE_OUT23_WIDTH-1:0],
        PROBE_OUT22_INIT_VAL[PROBE_OUT22_WIDTH-1:0],
        PROBE_OUT21_INIT_VAL[PROBE_OUT21_WIDTH-1:0],
        PROBE_OUT20_INIT_VAL[PROBE_OUT20_WIDTH-1:0],
        PROBE_OUT19_INIT_VAL[PROBE_OUT19_WIDTH-1:0],
        PROBE_OUT18_INIT_VAL[PROBE_OUT18_WIDTH-1:0],
        PROBE_OUT17_INIT_VAL[PROBE_OUT17_WIDTH-1:0],
        PROBE_OUT16_INIT_VAL[PROBE_OUT16_WIDTH-1:0],
        PROBE_OUT15_INIT_VAL[PROBE_OUT15_WIDTH-1:0],
        PROBE_OUT14_INIT_VAL[PROBE_OUT14_WIDTH-1:0],
        PROBE_OUT13_INIT_VAL[PROBE_OUT13_WIDTH-1:0],
        PROBE_OUT12_INIT_VAL[PROBE_OUT12_WIDTH-1:0],
        PROBE_OUT11_INIT_VAL[PROBE_OUT11_WIDTH-1:0],
        PROBE_OUT10_INIT_VAL[PROBE_OUT10_WIDTH-1:0],
        PROBE_OUT9_INIT_VAL[PROBE_OUT9_WIDTH-1:0],
        PROBE_OUT8_INIT_VAL[PROBE_OUT8_WIDTH-1:0],
        PROBE_OUT7_INIT_VAL[PROBE_OUT7_WIDTH-1:0],
        PROBE_OUT6_INIT_VAL[PROBE_OUT6_WIDTH-1:0],
        PROBE_OUT5_INIT_VAL[PROBE_OUT5_WIDTH-1:0],
        PROBE_OUT4_INIT_VAL[PROBE_OUT4_WIDTH-1:0],
        PROBE_OUT3_INIT_VAL[PROBE_OUT3_WIDTH-1:0],
        PROBE_OUT2_INIT_VAL[PROBE_OUT2_WIDTH-1:0],
        PROBE_OUT1_INIT_VAL[PROBE_OUT1_WIDTH-1:0],
        PROBE_OUT0_INIT_VAL[PROBE_OUT0_WIDTH-1:0]
    };

    localparam PROBE_OUT_INIT_VAL = init_concat[(PROBE_OUT_W ? PROBE_OUT_W-1 : 0):0];

    wire [(PROBE_IN_W ? PROBE_IN_W-1 : 0):0]    probe_in_vec;
    wire [(PROBE_OUT_W ? PROBE_OUT_W-1 : 0):0]  probe_out_vec;
    wire [PROBE_IN_W+(64-NUM_PROBE_IN)-1:0]     probe_in_concat;
    wire [PROBE_OUT_W+(64-NUM_PROBE_OUT)-1:0]   probe_out_concat;

    assign probe_in_concat = {
        probe_in63, probe_in62, probe_in61, probe_in60,
        probe_in59, probe_in58, probe_in57, probe_in56,
        probe_in55, probe_in54, probe_in53, probe_in52,
        probe_in51, probe_in50, probe_in49, probe_in48,
        probe_in47, probe_in46, probe_in45, probe_in44,
        probe_in43, probe_in42, probe_in41, probe_in40,
        probe_in39, probe_in38, probe_in37, probe_in36,
        probe_in35, probe_in34, probe_in33, probe_in32,
        probe_in31, probe_in30, probe_in29, probe_in28,
        probe_in27, probe_in26, probe_in25, probe_in24,
        probe_in23, probe_in22, probe_in21, probe_in20,
        probe_in19, probe_in18, probe_in17, probe_in16,
        probe_in15, probe_in14, probe_in13, probe_in12,
        probe_in11, probe_in10, probe_in9, probe_in8,
        probe_in7, probe_in6, probe_in5, probe_in4,
        probe_in3, probe_in2, probe_in1, probe_in0
    };

    assign {
        probe_out63, probe_out62, probe_out61, probe_out60,
        probe_out59, probe_out58, probe_out57, probe_out56,
        probe_out55, probe_out54, probe_out53, probe_out52,
        probe_out51, probe_out50, probe_out49, probe_out48,
        probe_out47, probe_out46, probe_out45, probe_out44,
        probe_out43, probe_out42, probe_out41, probe_out40,
        probe_out39, probe_out38, probe_out37, probe_out36,
        probe_out35, probe_out34, probe_out33, probe_out32,
        probe_out31, probe_out30, probe_out29, probe_out28,
        probe_out27, probe_out26, probe_out25, probe_out24,
        probe_out23, probe_out22, probe_out21, probe_out20,
        probe_out19, probe_out18, probe_out17, probe_out16,
        probe_out15, probe_out14, probe_out13, probe_out12,
        probe_out11, probe_out10, probe_out9, probe_out8,
        probe_out7, probe_out6, probe_out5, probe_out4,
        probe_out3, probe_out2, probe_out1, probe_out0
    } = probe_out_concat;

    assign probe_in_vec = probe_in_concat[(PROBE_IN_W ? PROBE_IN_W-1 : 0):0];
    assign probe_out_concat = {{(64-NUM_PROBE_OUT){1'b0}}, probe_out_vec};

    vio_core #(
        .INT_WIDTH ( PROBE_IN_W ), 
        .OUT_WIDTH ( PROBE_OUT_W ),
        .PROBE_OUT_INIT_VAL ( PROBE_OUT_INIT_VAL ),
        .UUID (UUID)
    ) vio_core_inst (
        .bscan_CAPTURE          ( bscan_CAPTURE ),
        .bscan_DRCK             ( bscan_DRCK    ),
        .bscan_RESET            ( bscan_RESET   ),
        .bscan_RUNTEST          ( bscan_RUNTEST ),
        .bscan_SEL              ( bscan_SEL     ),
        .bscan_SHIFT            ( bscan_SHIFT   ),
        .bscan_TCK              ( bscan_TCK     ),
        .bscan_TDI              ( bscan_TDI     ),
        .bscan_TMS              ( bscan_TMS     ),
        .bscan_UPDATE           ( bscan_UPDATE  ),
        .edb_module_select      ( edb_module_select ),
        .edb_module_inhibit     ( edb_module_inhibit ),
        .edb_module_tdo         ( edb_module_tdo ),
        .edb_user_dr            ( edb_user_dr ),
        .clk                    ( clk           ),
        .probe_in_vec           ( probe_in_vec ),
        .probe_out_vec          ( probe_out_vec )
    );

endmodule
// edb_vio_top


//
// A golden template for the vio_core, no modification needed during rtl_gen
//
module vio_core #(
    parameter INT_WIDTH = 1,
    parameter OUT_WIDTH = 1,
    parameter PROBE_OUT_INIT_VAL = 0,
    parameter UUID = 128'h0000_0000_0000_0000_0000_0000_0000_0000
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
    input                  edb_module_select,
    output reg             edb_module_inhibit,
    output reg             edb_module_tdo,
    input  [`DR_WIDTH-1:0] edb_user_dr,

    // VIO interface, with single wide in/out-put vectors
    input                      clk,
    input      [(INT_WIDTH ? INT_WIDTH-1 : 0):0] probe_in_vec,
    output reg [(OUT_WIDTH ? OUT_WIDTH-1 : 0):0] probe_out_vec
);

    function integer clog2;
        input integer value;
        integer d;
        begin
            if (value <= 0)
                clog2 = 0;
            else begin
                d = 2;
                for (clog2 = 1; d < value; clog2 = clog2 + 1)
                    d = d << 1;
            end
        end
    endfunction

    // !!! Make sure ( DR_WIDTH >= 1 + OP_WIDTH + ADDR_WIDTH + COUNT_WIDTH )
    localparam OP_WIDTH    = 4;
    localparam ADDR_WIDTH  = 16;
    localparam COUNT_WIDTH = 16;

    localparam REGSEL_WIDTH   = 4;
    localparam REG_WIDTH      = 16; // max width for a single register
    //localparam REG_WIDTH_LOG2 = $clog2(REG_WIDTH);
    localparam REG_MSB        = `DR_WIDTH - 2 - OP_WIDTH - REGSEL_WIDTH;

    localparam INT_DEPTH      = ((INT_WIDTH-1)/REG_WIDTH) + 1;
    localparam OUT_DEPTH      = ((OUT_WIDTH-1)/REG_WIDTH) + 1;
    localparam INT_DEPTH_LOG2 = clog2(INT_DEPTH);
    localparam OUT_DEPTH_LOG2 = clog2(OUT_DEPTH);

    // Index coding for registers
    localparam INTREG_R0 = 0; 
    localparam INTREG_UUID_W0 = 8;
    localparam INTREG_UUID_W1 = 9;
    localparam INTREG_UUID_W2 = 10;
    localparam INTREG_UUID_W3 = 11;
    localparam INTREG_UUID_W4 = 12;
    localparam INTREG_UUID_W5 = 13;
    localparam INTREG_UUID_W6 = 14;
    localparam INTREG_UUID_W7 = 15;

    // Cmd coding for instructions
    //localparam VIO_CMD_BWRITE8  = 4'h1;
    localparam VIO_CMD_BWRITE16 = 4'h2;
    //localparam VIO_CMD_BWRITE32 = 4'h3;
    //localparam VIO_CMD_BWRITE64 = 4'h4;
    //localparam VIO_CMD_BREAD8   = 4'h5;
    localparam VIO_CMD_BREAD16  = 4'h6;
    //localparam VIO_CMD_BREAD32  = 4'h7;
    //localparam VIO_CMD_BREAD64  = 4'h8;
    localparam VIO_CMD_IREG_WR  = 4'h9;
    localparam VIO_CMD_IREG_SEL = 4'hd;

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
    ////////////////////////////////////////

    //wire    [OUT_WIDTH-1:0] probe_out_init_val;

    // Registers to hold state etc.
    reg               [2:0] internal_reg_r0;          // module internal register.
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
    reg  rd_op;              // True when operation in the opcode reg is a read, false when a write
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
    reg     [REG_WIDTH-1:0] data_from_internal_reg; // data from internal reg. MUX to output shift register
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
    reg     [REG_WIDTH-1:0] data_from_biu;          // to data_out_shift_register

    reg               [3:0] module_state, module_next_state;

    wire commit_int;
    wire clear_int;
    wire hold_probe_in;

    // VIO probe sync
    wire  [(INT_WIDTH ? INT_WIDTH-1 : 0):0] probe_in_sync;
    reg                   commit_sync1;
    reg                   commit_sync2;
    reg   [(OUT_WIDTH ? OUT_WIDTH-1 : 0):0] probe_out_sync;
    wire [127:0]              core_uuid = UUID;

    ////////////////////////////////////////
    // 

    assign module_cmd  = ~edb_user_dr[`DR_WIDTH-1];
    assign opcode_in   =  edb_user_dr[`DR_WIDTH-2 -: OP_WIDTH];
    assign address_in  =  edb_user_dr[`DR_WIDTH-2-OP_WIDTH -: ADDR_WIDTH];
    assign count_in    =  edb_user_dr[`DR_WIDTH-2-OP_WIDTH-ADDR_WIDTH -: COUNT_WIDTH];

    assign reg_select  =  edb_user_dr[`DR_WIDTH-2-OP_WIDTH -: REGSEL_WIDTH];

    assign data_to_biu = {bscan_TDI, edb_user_dr[`DR_WIDTH-1 -: REG_WIDTH-1]};

    assign {hold_probe_in, clear_int, commit_int} = internal_reg_r0[0 +: 3];

    ////////////////////////////////////////
    // 

    assign intreg_instruction = ((opcode_in == VIO_CMD_IREG_WR) | (opcode_in == VIO_CMD_IREG_SEL));

    assign intreg_write = (opcode_in == VIO_CMD_IREG_WR);

    assign burst_write =  //(opcode_in == VIO_CMD_BWRITE8)  | 
                          (opcode_in == VIO_CMD_BWRITE16) ; 
                          //(opcode_in == VIO_CMD_BWRITE32) | 
                          //(opcode_in == VIO_CMD_BWRITE64) 

    assign burst_read  =  //(opcode_in == VIO_CMD_BREAD8)  | 
                          (opcode_in == VIO_CMD_BREAD16) ; 
                          //(opcode_in == VIO_CMD_BREAD32) | 
                          //(opcode_in == VIO_CMD_BREAD64) 

    always @(*) begin
        case (opcode)
            //VIO_CMD_BWRITE8: begin
            //    word_size_bits  = 6'd7;  // Bits is actually bits-1, to make the FSM easier
            //    word_size_bytes = 4'd1;
            //    rd_op           = 1'b0;
            //end
            VIO_CMD_BWRITE16: begin
                word_size_bits  = 6'd15;  // Bits is actually bits-1, to make the FSM easier
                word_size_bytes = 4'd2;
                rd_op           = 1'b0;
            end
            //VIO_CMD_BWRITE32: begin
            //    word_size_bits  = 6'd31;  // Bits is actually bits-1, to make the FSM easier
            //    word_size_bytes = 4'd4;
            //    rd_op           = 1'b0;
            //end
            //VIO_CMD_BWRITE64: begin
            //    word_size_bits  = 6'd63;  // Bits is actually bits-1, to make the FSM easier
            //    word_size_bytes = 4'd8;
            //    rd_op           = 1'b0;
            //end

            //VIO_CMD_BREAD8: begin
            //    word_size_bits  = 6'd7;  // Bits is actually bits-1, to make the FSM easier
            //    word_size_bytes = 4'd1;
            //    rd_op           = 1'b1;
            //end
            VIO_CMD_BREAD16: begin
                word_size_bits  = 6'd15;  // Bits is actually bits-1, to make the FSM easier
                word_size_bytes = 4'd2;
                rd_op           = 1'b1;
            end
            //VIO_CMD_BREAD32: begin
            //    word_size_bits  = 6'd31;  // Bits is actually bits-1, to make the FSM easier
            //    word_size_bytes = 4'd4;
            //    rd_op           = 1'b1;
            //end
            //VIO_CMD_BREAD64: begin
            //    word_size_bits  = 6'd63;  // Bits is actually bits-1, to make the FSM easier
            //    word_size_bytes = 4'd4;
            //    rd_op           = 1'b1;
            //end

            default: begin
                word_size_bits  = 6'b00_0000;
                word_size_bytes = 4'b0000;
                rd_op           = 1'b0;
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

    always @(*) begin
        case (internal_register_select)
            INTREG_R0: begin
                data_from_internal_reg = internal_reg_r0;
            end
            INTREG_UUID_W0: begin
                data_from_internal_reg = core_uuid[0 +: 16];
            end
            INTREG_UUID_W1: begin
                data_from_internal_reg = core_uuid[16 +: 16];
            end
            INTREG_UUID_W2: begin
                data_from_internal_reg = core_uuid[32 +: 16];
            end
            INTREG_UUID_W3: begin
                data_from_internal_reg = core_uuid[48 +: 16];
            end
            INTREG_UUID_W4: begin
                data_from_internal_reg = core_uuid[64 +: 16];
            end
            INTREG_UUID_W5: begin
                data_from_internal_reg = core_uuid[80 +: 16];
            end
            INTREG_UUID_W6: begin
                data_from_internal_reg = core_uuid[96 +: 16];
            end
            INTREG_UUID_W7: begin
                data_from_internal_reg = core_uuid[112 +: 16];
            end
            default: begin
                data_from_internal_reg = 'h0;
            end
        endcase
    end

    always @(posedge bscan_TCK or posedge bscan_RESET) begin
        if (bscan_RESET) begin
            internal_reg_r0 <= 'h0;
        end 
        else if (intreg_ld_en && (reg_select == INTREG_R0)) begin
            internal_reg_r0 <= edb_user_dr[REG_MSB -: 3];
        end
    end

    ///////////////////////////////////////////////
    // Address counter

    assign data_to_addr_counter = (addr_sel) ? incremented_address[31:0] : address_in;
    assign incremented_address  = address_counter + word_size_bytes;

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
    // Probe in 
    assign biu_ready = 1'b1;

    genvar i;
    generate
        for (i = 0; i < INT_WIDTH; i = i + 1) begin : gen_probe_in_sync
            syncer sync_probe_in_U (
                .CLKA ( bscan_TCK ), 
                .RSTA ( 1'b0 ),
                .DA   ( probe_in_vec[i] ), 
                .ENA  ( ~hold_probe_in ),
                .CLKB ( clk ), 
                .RSTB ( 1'b0 ),
                .DB   ( probe_in_sync[i] ),
                .ENB  ( 1'b1 )
            );
        end
    endgenerate
    ////////////////////////////////////////

    wire [INT_DEPTH*REG_WIDTH-1:0] probe_in_sync_ceil;
    wire [REG_WIDTH-1:0] probe_in_sync_2d [0:INT_DEPTH-1];
    wire [REG_WIDTH-1:0] probe_in_mux_out;
    wire [INT_DEPTH_LOG2-1:0] sel;

    assign probe_in_sync_ceil = probe_in_sync;

    generate
        for (i = 0; i < INT_WIDTH; i = i + REG_WIDTH) begin: gen_probe_in_2d_wire
            assign probe_in_sync_2d[i/REG_WIDTH] = probe_in_sync_ceil[i +: REG_WIDTH];
        end
    endgenerate

    assign sel = address_counter[$clog2(REG_WIDTH/8) +: INT_DEPTH_LOG2];
    assign probe_in_mux_out = probe_in_sync_2d[sel];

    always @(posedge bscan_TCK) begin
        if (rd_op && biu_strobe) begin
            data_from_biu <= probe_in_mux_out;
        end
    end

    ////////////////////////////////////////
    // Probe out
    always @(posedge clk) begin
        commit_sync1 <= commit_int;
        commit_sync2 <= commit_sync1;
    end

    always @(posedge clk or posedge clear_int) begin
        if (clear_int) begin
            probe_out_vec <= PROBE_OUT_INIT_VAL;
        end 
        else if (commit_sync2) begin 
            probe_out_vec <= probe_out_sync;
        end
    end

    generate
        for (i = 0; i < OUT_WIDTH; i = i + 1) begin : gen_biu_to_probe_out
            always @(posedge bscan_TCK or posedge clear_int) begin
                if (clear_int) begin
                    probe_out_sync[i] <= PROBE_OUT_INIT_VAL[i];
                end 
                else if (!rd_op && biu_strobe && (address_counter[$clog2(REG_WIDTH/8) +: OUT_DEPTH_LOG2] == (i/REG_WIDTH))) begin
                    probe_out_sync[i] <= data_to_biu[i % REG_WIDTH];
                end
            end
        end
    endgenerate
    ////////////////////////////////////////

endmodule
// efx_vio_core


//
// 3-flops synchronizer with sync reset/enable
//
module syncer (
    input CLKA, DA, CLKB,
    input RSTA, ENA, RSTB, ENB,
    output reg DB
);

    reg d_clka, d_clkb;

    always @(posedge CLKA) begin
        if (RSTA)
            d_clka <= 1'b0;
        else if (ENA)
            d_clka <= DA;
    end

    always @(posedge CLKB) begin
        if (RSTB) begin
            d_clkb <= 1'b0;
            DB     <= 1'b0;
        end 
        else if (ENB) begin
            d_clkb <= d_clka;
            DB     <= d_clkb;
        end
    end

endmodule
// syncer

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

    integer i;
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

    parameter [1:0] PROBE0_TYPE  = 1,
    parameter [1:0] PROBE1_TYPE  = 1,
    parameter [1:0] PROBE2_TYPE  = 1,
    parameter [1:0] PROBE3_TYPE  = 1,
    parameter [1:0] PROBE4_TYPE  = 1,
    parameter [1:0] PROBE5_TYPE  = 1,
    parameter [1:0] PROBE6_TYPE  = 1,
    parameter [1:0] PROBE7_TYPE  = 1,
    parameter [1:0] PROBE8_TYPE  = 1,
    parameter [1:0] PROBE9_TYPE  = 1,
    parameter [1:0] PROBE10_TYPE = 1,
    parameter [1:0] PROBE11_TYPE = 1,
    parameter [1:0] PROBE12_TYPE = 1,
    parameter [1:0] PROBE13_TYPE = 1,
    parameter [1:0] PROBE14_TYPE = 1,
    parameter [1:0] PROBE15_TYPE = 1,
    parameter [1:0] PROBE16_TYPE = 1,
    parameter [1:0] PROBE17_TYPE = 1,
    parameter [1:0] PROBE18_TYPE = 1,
    parameter [1:0] PROBE19_TYPE = 1,
    parameter [1:0] PROBE20_TYPE = 1,
    parameter [1:0] PROBE21_TYPE = 1,
    parameter [1:0] PROBE22_TYPE = 1,
    parameter [1:0] PROBE23_TYPE = 1,
    parameter [1:0] PROBE24_TYPE = 1,
    parameter [1:0] PROBE25_TYPE = 1,
    parameter [1:0] PROBE26_TYPE = 1,
    parameter [1:0] PROBE27_TYPE = 1,
    parameter [1:0] PROBE28_TYPE = 1,
    parameter [1:0] PROBE29_TYPE = 1,
    parameter [1:0] PROBE30_TYPE = 1,
    parameter [1:0] PROBE31_TYPE = 1,
    parameter [1:0] PROBE32_TYPE = 1,
    parameter [1:0] PROBE33_TYPE = 1,
    parameter [1:0] PROBE34_TYPE = 1,
    parameter [1:0] PROBE35_TYPE = 1,
    parameter [1:0] PROBE36_TYPE = 1,
    parameter [1:0] PROBE37_TYPE = 1,
    parameter [1:0] PROBE38_TYPE = 1,
    parameter [1:0] PROBE39_TYPE = 1,
    parameter [1:0] PROBE40_TYPE = 1,
    parameter [1:0] PROBE41_TYPE = 1,
    parameter [1:0] PROBE42_TYPE = 1,
    parameter [1:0] PROBE43_TYPE = 1,
    parameter [1:0] PROBE44_TYPE = 1,
    parameter [1:0] PROBE45_TYPE = 1,
    parameter [1:0] PROBE46_TYPE = 1,
    parameter [1:0] PROBE47_TYPE = 1,
    parameter [1:0] PROBE48_TYPE = 1,
    parameter [1:0] PROBE49_TYPE = 1,
    parameter [1:0] PROBE50_TYPE = 1,
    parameter [1:0] PROBE51_TYPE = 1,
    parameter [1:0] PROBE52_TYPE = 1,
    parameter [1:0] PROBE53_TYPE = 1,
    parameter [1:0] PROBE54_TYPE = 1,
    parameter [1:0] PROBE55_TYPE = 1,
    parameter [1:0] PROBE56_TYPE = 1,
    parameter [1:0] PROBE57_TYPE = 1,
    parameter [1:0] PROBE58_TYPE = 1,
    parameter [1:0] PROBE59_TYPE = 1,
    parameter [1:0] PROBE60_TYPE = 1,
    parameter [1:0] PROBE61_TYPE = 1,
    parameter [1:0] PROBE62_TYPE = 1,
    parameter [1:0] PROBE63_TYPE = 1
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
    input [PROBE63_WIDTH-1:0] probe63
);

    function integer sum_dw_capture;
        input integer num_probes;
        input [64*11-1:0] width_array;
        input [64*2-1:0] type_array;
        integer i;
        begin
            sum_dw_capture = 0;
            for (i = 0; i < num_probes; i = i + 1) begin
                // DATA_AND_TRIGGER, DATA_ONLY
                if (type_array[i*2 +: 2] == 1 || type_array[i*2 +: 2] == 2) begin
                    sum_dw_capture = sum_dw_capture + width_array[i*11 +: 11];
                end
            end
        end
    endfunction

    // Return number of probes configured to DATA / DATA_AND_TRIGGER
    function integer sum_prb_data;
        input integer num_probes;
        input [64*2-1:0] type_array;
        integer i;
        begin
            sum_prb_data = 0;
            for (i = 0; i < num_probes; i = i + 1) begin
                // DATA_AND_TRIGGER, DATA_ONLY
                if (type_array[i*2 +: 2] == 1 || type_array[i*2 +: 2] == 2) begin
                    sum_prb_data = sum_prb_data + 1;
                end
            end
        end
    endfunction

    function integer sum_prb_trigger;
        input integer num_probes;
        input [64*2-1:0] type_array;
        integer i;
        begin
            sum_prb_trigger = 0;
            for (i = 0; i < num_probes; i = i + 1) begin
                // DATA_AND_TRIGGER, TRIGGER_ONLY
                if (type_array[i*2 +: 2] == 1 || type_array[i*2 +: 2] == 3) begin
                    sum_prb_trigger = sum_prb_trigger + 1;
                end
            end
        end
    endfunction
    
    function integer sum_dw_all;
        input integer num_probes;
        input [64*11-1:0] width_array;
        integer i;
        begin
            sum_dw_all = 0;
            for (i = 0; i < num_probes; i = i + 1) begin
                sum_dw_all = sum_dw_all + width_array[i*11 +: 11];
            end
        end
    endfunction



    //function integer regw;
    //    input integer probe_width;
    //    begin
    //        regw = probe_width*2 + 3;
    //    end
    //endfunction

    //function integer maxw;
    //    input integer num_probes;
    //    input [64*11-1:0] width_array;
    //    integer i;
    //    begin
    //        maxw = 0;
    //        for (i = 0; i < num_probes; i = i + 1)
    //            if (width_array[(i*11) +: 11] > maxw)
    //                maxw = width_array[(i*11) +: 11];
    //    end
    //endfunction


    localparam [64*11-1:0] PROBE_WIDTH_ARRAY = {
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

    localparam [64*2-1:0] PROBE_TYPE_ARRAY = {
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
    localparam CAPTURE_WIDTH = sum_dw_capture(NUM_PROBES, PROBE_WIDTH_ARRAY, PROBE_TYPE_ARRAY);

    // Number of probes with type = trigger / data trigger
    localparam TRIGGER_WIDTH = sum_prb_trigger(NUM_PROBES, PROBE_TYPE_ARRAY);

    // Number of probes with type = data / data trigger
    localparam NUM_DATA_PRB = sum_prb_data(NUM_PROBES, PROBE_TYPE_ARRAY);

    localparam ALL_WIDTH = sum_dw_all(NUM_PROBES, PROBE_WIDTH_ARRAY);

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
    localparam INTREG_R1 = 1; 
    localparam INTREG_CAP_MASK = 2;
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

    localparam MAX_PROBES = 64;

    localparam PIPE_CU = 1;
    localparam PIPE_TU = 1;
    localparam PROBE_TYPE_NOT_USED = 0;
    localparam PROBE_TYPE_TRIGGER_AND_DATA = 1;
    localparam PROBE_TYPE_DATA_ONLY = 2;
    localparam PROBE_TYPE_TRIGGER_ONLY = 3;

    ////////////////////////////////////////

    localparam REG_USAGE_TRIG_PATTERN   = 8'h01;
    localparam REG_USAGE_TRIG_VALUE     = 8'h02;
    localparam REG_USAGE_TRIG_MASK      = 8'h03;
    localparam REG_USAGE_CAP_PATTERN   = 8'h04;
    localparam REG_USAGE_CAP_VALUE     = 8'h05;
    localparam REG_USAGE_CAP_MASK      = 8'h06;
    // No operation
    localparam REG_USAGE_DEFAULT       = 8'hff;

    // Return usage_code from the register address offset
    function integer get_reg_usage_code;
        input integer addr_offset;
        input integer probe_width;
        input integer reg_width;
        integer num_reg_used;
        begin
            num_reg_used = (probe_width - 1)/reg_width + 1;
            get_reg_usage_code = REG_USAGE_DEFAULT;
            if (addr_offset == 0)
                // Trigger Pattern
                get_reg_usage_code = REG_USAGE_TRIG_PATTERN;
            else if (addr_offset < num_reg_used + 1)
                // Trigger Value
                get_reg_usage_code = REG_USAGE_TRIG_VALUE;
            else if (addr_offset < 2 * num_reg_used + 1)
                // Trigger Mask
                get_reg_usage_code = REG_USAGE_TRIG_MASK;
            else if (addr_offset == 2 * num_reg_used + 1)
                // Capture Pattern
                get_reg_usage_code = REG_USAGE_CAP_PATTERN;
            else if (addr_offset < 3 * num_reg_used + 2)
                // Capture Value
                get_reg_usage_code = REG_USAGE_CAP_VALUE;
            else if (addr_offset < 4 * num_reg_used + 2)
                // Capture Mask
                get_reg_usage_code = REG_USAGE_CAP_MASK;
        end
    endfunction

    function integer is_reg_using;
        input integer usage_code;
        input integer probe_type;
        begin
            is_reg_using = 1;
            if (usage_code == REG_USAGE_DEFAULT) begin
                is_reg_using = 0;
            end

            if (usage_code == REG_USAGE_TRIG_PATTERN || usage_code == REG_USAGE_TRIG_VALUE || usage_code == REG_USAGE_TRIG_MASK) begin
                if (probe_type == PROBE_TYPE_DATA_ONLY) begin
                    is_reg_using = 0;
                end
            end

            if (usage_code == REG_USAGE_CAP_PATTERN || usage_code == REG_USAGE_CAP_VALUE || usage_code == REG_USAGE_CAP_MASK) begin
                if (probe_type == PROBE_TYPE_TRIGGER_ONLY) begin
                    is_reg_using = 0;
                end else if (CAPTURE_CONTROL == 0) begin
                    is_reg_using = 0;
                end
            end
        end
    endfunction

    // Return data width from the usage_code
    function integer get_reg_data_width;
        input integer usage_code;
        begin
            case (usage_code)
                REG_USAGE_TRIG_PATTERN:
                    get_reg_data_width = 3;
                REG_USAGE_TRIG_VALUE:
                    get_reg_data_width = 64;
                REG_USAGE_TRIG_MASK:
                    get_reg_data_width = 64;
                REG_USAGE_CAP_PATTERN:
                    get_reg_data_width = 3;
                REG_USAGE_CAP_VALUE:
                    get_reg_data_width = 64;
                REG_USAGE_CAP_MASK:
                    get_reg_data_width = 64;
                default:
                    // Force synthesis error
                    get_reg_data_width = 0;
            endcase
        end
    endfunction

    localparam WINDOWS_ADDRESS_WIDTH = $clog2(BUF_MAX_ADDR_W);

    //wire [1023:0] probes [0:MAX_PROBES-1];
    localparam PROBES_WIDTH = MAX_PROBES + ALL_WIDTH - NUM_PROBES;
    wire [PROBES_WIDTH-1:0] probes;

    // Registers to hold state etc.
    wire     [R0_WIDTH-1:0] internal_reg_r0;          // module internal register.
    wire [R3_WIDTH-1:0] internal_reg_r3;
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
    reg  rd_op;              // True when operation in the opcode reg is a read, false when a write
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
    reg                       cap_buf_read_done;

    wire   [NUM_DATA_PRB-1:0] mux_capture_cmp;
    wire                      capture_enable;
    // Global Capture Condition Mask / Pattern
    reg   [1:0]               la_capture_pattern;
    wire                      la_capture_enable;
    wire [REG_WIDTH-1:0] register_conn [0:(1<<REGSEL_WIDTH)-1];
    reg [BUF_MAX_ADDR_W-1:0] la_num_trigger;
    reg [WINDOWS_ADDRESS_WIDTH-1:0] la_window_depth;
    wire                       la_soft_reset;
    wire [127:0]              core_uuid = UUID;

    ////////////////////////////////////////
    // 
    
    assign probes = {
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

    always @(*) begin
        case (opcode)
            LA_CMD_BREAD8: begin
                word_size_bits  = 6'd7;  // Bits is actually bits-1, to make the FSM easier
                word_size_bytes = 4'd1;
                rd_op           = 1'b1;
            end
            LA_CMD_BREAD16: begin
               word_size_bits  = 6'd15;  // Bits is actually bits-1, to make the FSM easier
               word_size_bytes = 4'd2;
               rd_op           = 1'b1;
            end
            LA_CMD_BREAD32: begin
               word_size_bits  = 6'd31;  // Bits is actually bits-1, to make the FSM easier
               word_size_bytes = 4'd4;
               rd_op           = 1'b1;
            end
            LA_CMD_BREAD64: begin
               word_size_bits  = 6'd63;  // Bits is actually bits-1, to make the FSM easier
               word_size_bytes = 4'd8;
               rd_op           = 1'b1;
            end
            default: begin
                word_size_bits  = 6'b00_0000;
                word_size_bytes = 4'b0000;
                rd_op           = 1'b0;
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
    assign data_from_internal_reg = register_conn[internal_register_select];

    assign register_conn[INTREG_UUID_LOWER] = core_uuid[0 +: 64];
    assign register_conn[INTREG_UUID_UPPER] = core_uuid[64 +: 64];

    // Actual register lines connection
    assign register_conn[INTREG_R0] = {{(REG_WIDTH-R0_WIDTH){1'b0}}, internal_reg_r0};
    assign register_conn[INTREG_R1] = la_trig_mask;
    // assign register_conn[INTREG_CAP_MASK] = la_capture_mask;
    assign register_conn[INTREG_WINDOW_PROP] = {{(REG_WIDTH-R3_WIDTH){1'b0}}, internal_reg_r3};

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
            la_trig_mask <= 64'b0;
        end 
        else if (intreg_ld_en && (reg_select == INTREG_R1)) begin
            la_trig_mask <= edb_user_dr[REG_MSB -: 64];
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
            localparam CAP_LSB = sum_dw_capture(i, PROBE_WIDTH_ARRAY, PROBE_TYPE_ARRAY);
            localparam REG_PER_PW = (PROBE_WIDTH-1)/REG_WIDTH + 1;
            // multiple of 2 > REG_PER_PW*2+1 = 1024/64*2+1 = 33
            localparam REG_DEPTH = 128;
            localparam ALL_LSB = sum_dw_all(i, PROBE_WIDTH_ARRAY);

            wire [PROBE_WIDTH-1:0] this_probe;
            reg  [PROBE_WIDTH-1:0] this_probe_p1, this_probe_p2;

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


            if (PROBE_TYPE != PROBE_TYPE_NOT_USED) begin
                wire [(REG_PER_PW*REG_WIDTH)-1:0] probe_compared, probe_mask;
                wire [2:0] probe_pattern;
                wire       probe_cout;

                wire [(REG_PER_PW*REG_WIDTH)-1:0] cap_probe_compared, cap_probe_mask;
                wire [2:0] cap_probe_pattern;
                wire       cap_probe_cout;

                // Setup logic for loading register when address selected
                for (j = 0 ; j < REG_DEPTH; j = j + 1) begin : GEN_REGS
                    localparam REG_ADDR = (1 + i)*REG_DEPTH + j; // addr mapping
                    localparam REG_USAGE = get_reg_usage_code(j, PROBE_WIDTH, REG_WIDTH);
                    localparam REG_DATA_WIDTH = get_reg_data_width(REG_USAGE);
                    localparam IS_REG_USING = is_reg_using(REG_USAGE, PROBE_TYPE);

                    if (IS_REG_USING != 0) begin
                        reg [REG_DATA_WIDTH -1 : 0] internal_reg_pr;

                        // Load corresponding data width from dr when the reg addr is selected
                        always @(posedge bscan_TCK or posedge bscan_RESET) begin
                            if (bscan_RESET) begin
                                internal_reg_pr <= 'h0;
                            end
                            else if (intreg_ld_en && (reg_select == REG_ADDR)) begin
                                internal_reg_pr <= edb_user_dr[0 +: REG_DATA_WIDTH];
                            end
                        end

                        assign register_conn[REG_ADDR] = internal_reg_pr;

                        // internal_reg_pr will contains the latest value from dr, we can use it now
                        if (REG_USAGE == REG_USAGE_TRIG_PATTERN)
                            begin
                                assign probe_pattern = internal_reg_pr;
                            end
                        else if (REG_USAGE == REG_USAGE_TRIG_VALUE)
                            begin
                                assign probe_compared[(j-1)*REG_WIDTH +: REG_WIDTH] = internal_reg_pr;
                            end
                        else if (REG_USAGE == REG_USAGE_TRIG_MASK)
                            begin
                                assign probe_mask[(j-REG_PER_PW-1)*REG_WIDTH +: REG_WIDTH] = internal_reg_pr;
                            end
                        else if (REG_USAGE == REG_USAGE_CAP_PATTERN)
                            begin
                                assign cap_probe_pattern = internal_reg_pr;
                            end
                        else if (REG_USAGE == REG_USAGE_CAP_VALUE)
                            begin
                                assign cap_probe_compared[(j - 2* REG_PER_PW - 2)*REG_WIDTH +: REG_WIDTH] = internal_reg_pr;
                            end
                        else if (REG_USAGE == REG_USAGE_CAP_MASK)
                            begin
                                assign cap_probe_mask[(j - 3* REG_PER_PW - 2)*REG_WIDTH +: REG_WIDTH] = internal_reg_pr;
                            end
                    end
                end

                if (PROBE_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE_TYPE == PROBE_TYPE_DATA_ONLY) begin
                    if (CAPTURE_CONTROL == 1) begin
                        compare_unit #(
                            .WIDTH (PROBE_WIDTH),
                            .PIPE   ( PIPE_CU )
                        ) capture_cu (
                            .clk         ( clk ),
                            .resetn      ( la_resetn ),
                            .data_in     ( this_probe_p2 ),
                            .compared_in ( cap_probe_compared[0 +: PROBE_WIDTH] ),
                            .mask_in     ( cap_probe_mask[0 +: PROBE_WIDTH] ),
                            .pattern_in  ( cap_probe_pattern ),
                            .compare_out ( cap_probe_cout )
                        );
                        // Combine the output of compare unit into mux_capture_cmp
                        assign mux_capture_cmp[sum_prb_data(i, PROBE_TYPE_ARRAY)] = cap_probe_cout;
                    end
                    assign cap_fifo_din[CAP_LSB +: PROBE_WIDTH] = this_probe_p2;

                end

                if (PROBE_TYPE == PROBE_TYPE_TRIGGER_AND_DATA || PROBE_TYPE == PROBE_TYPE_TRIGGER_ONLY) begin
                    compare_unit #(
                        .WIDTH  ( PROBE_WIDTH ),
                        .PIPE   ( PIPE_CU )
                    ) trigger_cu (
                        .clk         ( clk ),
                        .resetn      ( la_resetn ),
                        //.data_in     ( probes[i][0 +: PROBE_WIDTH] ),
                        .data_in     ( this_probe_p2 ),
                        .compared_in ( probe_compared[0 +: PROBE_WIDTH] ),
                        .mask_in     ( probe_mask[0 +: PROBE_WIDTH] ),
                        .pattern_in  ( probe_pattern ),
                        .compare_out ( probe_cout )
                    );

                    assign tu_data[sum_prb_trigger(i, PROBE_TYPE_ARRAY)] = probe_cout;
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
        .resetn         ( la_resetn ),
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
                    la_capture_mask <= 64'b0;
                end
                else if (intreg_ld_en && (reg_select == INTREG_CAP_MASK)) begin
                    la_capture_mask <= edb_user_dr[REG_MSB -: 64];
                end
            end
            assign register_conn[INTREG_CAP_MASK] = la_capture_mask;

            // Handle global capture condition
            trigger_unit #(
                .WIDTH      ( NUM_DATA_PRB ),
                .TRIGIN_EN  ( 0 ),
                .PIPE       ( PIPE_TU ),
                .TRIGGER_IF_MASK_ZERO ( 1 ) // Output high when mask is all zero
            ) global_capture_inst (
                .clk            ( clk ),
                .resetn         ( la_resetn ),
                .data_in        ( mux_capture_cmp ),
                .mask_in        ( la_capture_mask[0 +: NUM_DATA_PRB] ),
                .pattern_in     ( la_capture_pattern ),
                .trigger_in     ( 0 ),
                .trigger_out    ( capture_enable )
            );

            assign la_capture_enable = capture_enable;
        end else begin
            assign la_capture_enable = 1'b1;
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
        .rd_i               ( rd_op ),
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

    // MSB                                                                          LSB
    // window_addr(window_addr width - window_depth bit) |  cell_addr (window_depth bit)
    // Example:
    // window_depth = 4, addr_width = 10
    // MSP 6 bit = window_addr, 4 bit = cell_addr
    assign out_phy_addr = (window_addr << window_depth) | (cell_addr & {{(TOTAL_ADDR_WIDTH){1'b1}} >> (TOTAL_ADDR_WIDTH - window_depth)});

    // Get the most MSB bit of the cell addr, needed because the length of the cell addr depends on window_depth
    assign window_depth_plus_1 = window_depth + 1;
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
    input  next_win,

    input  [WINDOW_ADDR_WIDTH - 1: 0] window_depth,
    output empty,
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
    wire pointer_eq, pntr_msb_xor;
    wire [ADDR_WIDTH-1:0] phy_addr;

    wire segment_pointer_eq;
    wire segment_msb_xor;

    reg [ADDR_WIDTH:0] segment_wr_pointer;
    reg [ADDR_WIDTH:0] segment_rd_pointer;

    wire segment_wr_msb;
    wire segment_rd_msb;

    wire [ADDR_WIDTH - 1: 0] phy_segment_wr_addr;
    wire [ADDR_WIDTH - 1: 0] phy_segment_rd_addr;

    reg [ADDR_WIDTH:0] counter;
    reg [ADDR_WIDTH:0] total_counter;

    reg [ADDR_WIDTH:0] next_segment_wr_pointer;
    wire next_segment_wr_msb;
    wire [ADDR_WIDTH - 1: 0] next_phy_wr_addr;
    wire [ADDR_WIDTH:0] max_counter;

    reg full_p2;


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
            window_addr <= window_addr + 1;
            segment_rd_pointer <= 0;
            segment_wr_pointer <= 0;
            next_segment_wr_pointer <= 1;
            counter <= 0;
        end else begin
            if (pop) begin
                segment_rd_pointer <= segment_rd_pointer + 1;
            end

            if (push) begin
                segment_wr_pointer <= segment_wr_pointer + 1;
                next_segment_wr_pointer <= next_segment_wr_pointer + 1;
            end

            if (pop && !push) begin
                counter <= counter - 1;
            end else if (push && !pop) begin
                counter <= counter + 1;
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
                total_counter <= total_counter - 1;
            end else if (push && !pop) begin
                total_counter <= total_counter + 1;
            end else begin
                total_counter <= total_counter;
            end
        end
    end

    assign curr_cnt = counter;

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

    assign max_counter = (2 ** window_depth);
    assign prefull = (counter == max_counter - 1);
    assign preprefull =  (counter == max_counter - 2);

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
    input  rd_i,
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

    function integer least_pwr2;
        input integer target;
        integer i;
        begin
            least_pwr2 = 1;
            for (i = 31; i >= 0; i = i - 1) begin
                if ((1 << i) >= target)
                    least_pwr2 = 1 << i;
            end
        end
    endfunction

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
    localparam WPD_LEAST_PWR2 = least_pwr2(_64BIT_PER_WORD);

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

    integer i;
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
        .next_win (1'b0),
        // .window_addr ( fifo_window_cnt[ADDR_WIDTH -1:0]),
        .window_depth (la_window_depth),
        .empty   ( ),
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
    always @(*) begin
        for (i = 0; i < _64BIT_PER_WORD; i = i + 1) begin
            conn64[i] = dout_ceil[i * 64 +: 64];
        end
    end
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
    input clk, resetn,
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

            always @(posedge clk or negedge resetn) begin
                if (!resetn) begin
                    data_in_p1 <= 1'b0;
                    enable <= 1'b0;
                end else begin
                    data_in_p1 <= data_in;
                    enable <= 1'b1;
                end
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
                reg [WIDTH-1:0] exp1, exp2, exp3, exp4, exp5, exp6;

                always @(posedge clk) begin
                    exp1 <= (data_in | ~mask_in);
                    exp2 <= (compared_in | ~mask_in);
                    exp3 <= (data_in < compared_in);
                    exp4 <= (data_in <= compared_in);
                    exp5 <= (data_in > compared_in);
                    exp6 <= (data_in >= compared_in);
                    case (pattern_in)
                        EQ:
                            //compare_out <= (data_in | ~mask_in) == (compared_in | ~mask_in);
                            compare_out <= exp1 == exp2;
                        NOT_EQ:
                            //compare_out <= (data_in | ~mask_in) != (compared_in | ~mask_in);
                            compare_out <= exp1 != exp2;
                        LESS_THAN:
                            //compare_out <= (data_in < compared_in);
                            compare_out <= exp3;
                        LESS_EQ:
                            //compare_out <= (data_in <= compared_in);
                            compare_out <= exp4;
                        GRTR_THAN:
                            //compare_out <= (data_in > compared_in);
                            compare_out <= exp5;
                        GRTR_EQ:
                            //compare_out <= (data_in >= compared_in);
                            compare_out <= exp6;
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
    input clk, resetn,
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


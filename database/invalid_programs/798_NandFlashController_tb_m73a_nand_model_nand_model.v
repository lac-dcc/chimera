// This program was cloned from: https://github.com/cjhonlyone/NandFlashController
// License: GNU General Public License v3.0

/*******************************************************************************
*
* Confidential:  This file and all files delivered herewith are Micron Confidential Information.
*
*    File Name:  nand_model.V
*        Model:  BUS Functional
*    Simulator:  ModelSim
* Dependencies:  nand_parameters.vh and nand_defines.vh
*
*        Email:  modelsupport@micron.com
*      Company:  Micron Technology, Inc.
*  Part Number:  MT29F
*
*  Description:  Micron NAND Verilog Model
*
*   Limitation:
*
*   Disclaimer:  THESE DESIGNS ARE PROVIDED "AS IS" WITH NO WARRANTY
*                WHATSOEVER AND MICRON SPECIFICALLY DISCLAIMS ANY
*                IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR
*                A PARTICULAR PURPOSE, OR AGAINST INFRINGEMENT.
*
*                Copyright © 2006 Micron Semiconductor Products, Inc.
*                All rights researved
*
********************************************************************************/

`timescale 1ns / 1ps

`include "nand_defines.vh"

module nand_model (

`ifdef T2B1C1D1
    Ce2_n,
`else `ifdef T2B2C1D1
    Ce2_n, Rb2_n,
`else `ifdef T2B2C2D2
    Ce2_n, Rb2_n, Dq_Io2, Cle2, Ale2, Clk_We2_n, Wr_Re2_n, Wp2_n,
        `ifdef NAND_SYNC
        Dqs2,
        `endif
`else `ifdef T4B4C2D2
    Ce2_n, Ce3_n, Ce4_n, Rb2_n, Rb3_n, Rb4_n, Dq_Io2, Cle2, Ale2, Clk_We2_n, Wr_Re2_n, Wp2_n,
        `ifdef NAND_SYNC
        Dqs2,
        `endif
`else `ifdef T4B2C2D2
    Ce2_n, Ce3_n, Ce4_n, Rb2_n, Dq_Io2, Cle2, Ale2, Clk_We2_n, Wr_Re2_n, Wp2_n,
        `ifdef NAND_SYNC
        Dqs2,
        `endif
`endif `endif `endif `endif `endif

    Dq_Io, 
    Cle, 
    Ale, 
    Clk_We_n, 
    Wr_Re_n, 
    Dqs, 
    Ce_n, 
    Wp_n, 
    Rb_n
);

`include "nand_parameters.vh"

// Ports Declaration
    wire                    Lock = 1'b0;

`ifdef T2B1C1D1
    input Ce2_n; 
`else `ifdef T2B2C1D1
    input Ce2_n; output tri1 Rb2_n;
`else `ifdef T2B2C2D2
    input Ce2_n, Cle2, Ale2, Clk_We2_n, Wr_Re2_n, Wp2_n; output tri1 Rb2_n; inout [DQ_BITS-1:0] Dq_Io2;
        `ifdef NAND_SYNC
        inout Dqs2;
        `endif
`else `ifdef T4B4C2D2
    input Ce2_n, Ce3_n, Ce4_n, Cle2, Ale2, Clk_We2_n, Wr_Re2_n, Wp2_n; output tri1 Rb2_n, Rb3_n, Rb4_n; inout [DQ_BITS-1:0] Dq_Io2;
        `ifdef NAND_SYNC
        inout Dqs2;
        `endif
`else `ifdef T4B2C2D2
    input Ce2_n, Ce3_n, Ce4_n, Cle2, Ale2, Clk_We2_n, Wr_Re2_n, Wp2_n; output tri1 Rb2_n; inout [DQ_BITS-1:0] Dq_Io2;
        `ifdef NAND_SYNC
        inout Dqs2;
        `endif
`endif `endif `endif `endif `endif
inout     [DQ_BITS-1:0] Dq_Io;
inout Dqs; 
input                   Cle;
input                   Ale;
input                   Ce_n;
input                   Clk_We_n;
input                   Wr_Re_n;
input                   Wp_n;
output tri1             Rb_n;
wire  [2:0] PID = 3'h0;

parameter MAX_LUN_PER_TAR = 2; // do not change 
wire                    Pre     =      1'b0;
wire  [7:0]             ml_rdy        ;
reg                     tar2_sep_com  ;
wire [MAX_LUN_PER_TAR -1: 0] Rb_tar_n ;
wire [MAX_LUN_PER_TAR -1: 0] Rb_tar2_n;
wire [MAX_LUN_PER_TAR -1: 0] Rb_tar3_n;
wire [MAX_LUN_PER_TAR -1: 0] Rb_tar4_n;
                            
wire ENi	= 1'bz; 
wire ENo	= 1'bz; 
wire Dqs_c	= 1'bz; 
wire Re_c	= 1'bz; 
wire Dqs2_c	= 1'bz; 
wire Re2_c	= 1'bz; 

// Instantiation
    nand_die_model #(.mds(3'h0)) uut_0 (Dq_Io,  Cle,  Ale,  Ce_n,  Clk_We_n,  Wr_Re_n,  Wp_n, Rb_n,  Pre, Lock, Dqs, ml_rdy[0], Rb_tar_n[0], PID, ENi, ENo, Dqs_c, Re_c);
`ifdef T2B1C1D1
    nand_die_model #(.mds(3'h2)) uut_1 (Dq_Io,  Cle,  Ale,  Ce2_n, Clk_We_n,  Wr_Re_n,  Wp_n, Rb_n,  Pre, Lock, Dqs, ml_rdy[2], Rb_tar_n[1], PID, ENi, ENo, Dqs_c, Re_c);
    initial begin  tar2_sep_com = 1'b0; end 
    assign ml_rdy[7:3]  = {5{1'b1}};
    assign ml_rdy[1]    = 1'b1;
    assign Rb_tar2_n    = {MAX_LUN_PER_TAR{1'b1}};
    assign Rb_tar3_n    = {MAX_LUN_PER_TAR{1'b1}};
    assign Rb_tar4_n    = {MAX_LUN_PER_TAR{1'b1}};
    wire   Clk_We2_n    = 1'b0;
`else `ifdef T2B2C1D1
    `ifdef DIES4
        nand_die_model #(.mds(3'h1)) uut_1 (Dq_Io,  Cle,  Ale,  Ce_n,  Clk_We_n,  Wr_Re_n,  Wp_n,  Rb_n , Pre, Lock, Dqs, ml_rdy[1], Rb_tar_n[1] , PID, ENi, ENo, Dqs_c, Re_c);
        nand_die_model #(.mds(3'h2)) uut_2 (Dq_Io,  Cle,  Ale,  Ce2_n, Clk_We_n,  Wr_Re_n,  Wp_n,  Rb2_n, Pre, Lock, Dqs, ml_rdy[2], Rb_tar2_n[0], PID, ENi, ENo, Dqs_c, Re_c);
        nand_die_model #(.mds(3'h3)) uut_3 (Dq_Io,  Cle,  Ale,  Ce2_n, Clk_We_n,  Wr_Re_n,  Wp_n,  Rb2_n, Pre, Lock, Dqs, ml_rdy[3], Rb_tar2_n[1], PID, ENi, ENo, Dqs_c, Re_c);
        assign ml_rdy[7:4]  = {4{1'b1}};
    `else
        nand_die_model #(.mds(3'h2)) uut_1 (Dq_Io,  Cle,  Ale,  Ce2_n, Clk_We_n,  Wr_Re_n,  Wp_n, Rb2_n, Pre, Lock, Dqs, ml_rdy[2], Rb_tar2_n[0], PID, ENi, ENo, Dqs_c, Re_c);
        assign ml_rdy[7:3]  = {5{1'b1}};
        assign ml_rdy[1]    = 1'b1;
        assign Rb_tar_n[(MAX_LUN_PER_TAR-1):1]  = {(MAX_LUN_PER_TAR-1){1'b1}};
        assign Rb_tar2_n[(MAX_LUN_PER_TAR-1):1] = {(MAX_LUN_PER_TAR-1){1'b1}};
    `endif
    initial begin  tar2_sep_com = 1'b0; end
    assign Rb_tar3_n    = {MAX_LUN_PER_TAR{1'b1}};
    assign Rb_tar4_n    = {MAX_LUN_PER_TAR{1'b1}};
    wire   Clk_We2_n    = 1'b0;
`else `ifdef T2B2C2D2
    `ifdef DIES4
        nand_die_model #(.mds(3'h1)) uut_1 (Dq_Io,  Cle,  Ale,  Ce_n,  Clk_We_n,  Wr_Re_n,  Wp_n , Rb_n , Pre, Lock, Dqs,  ml_rdy[1], Rb_tar_n[1] , PID, ENi, ENo, Dqs_c,  Re_c );
        nand_die_model #(.mds(3'h2)) uut_2 (Dq_Io2, Cle2, Ale2, Ce2_n, Clk_We2_n, Wr_Re2_n, Wp2_n, Rb2_n, Pre, Lock, Dqs2, ml_rdy[2], Rb_tar2_n[0], PID, ENi, ENo, Dqs2_c, Re2_c);
        nand_die_model #(.mds(3'h3)) uut_3 (Dq_Io2, Cle2, Ale2, Ce2_n, Clk_We2_n, Wr_Re2_n, Wp2_n, Rb2_n, Pre, Lock, Dqs2, ml_rdy[3], Rb_tar2_n[1], PID, ENi, ENo, Dqs2_c, Re2_c);
        assign ml_rdy[7:4]  = {4{1'b1}};
    `else
        nand_die_model #(.mds(3'h2)) uut_1 (Dq_Io2, Cle2, Ale2, Ce2_n, Clk_We2_n, Wr_Re2_n, Wp2_n, Rb2_n, Pre, Lock, Dqs2, ml_rdy[2], Rb_tar2_n[0], PID, ENi, ENo, Dqs2_c, Re2_c);
        assign ml_rdy[7:3]  = {5{1'b1}};
        assign ml_rdy[1]    = 1'b1;
        assign Rb_tar_n[(MAX_LUN_PER_TAR-1):1]  = {(MAX_LUN_PER_TAR-1){1'b1}};
        assign Rb_tar2_n[(MAX_LUN_PER_TAR-1):1] = {(MAX_LUN_PER_TAR-1){1'b1}};
    `endif 
    initial begin  tar2_sep_com = 1'b1; end
    assign Rb_tar3_n    = {MAX_LUN_PER_TAR{1'b1}};
    assign Rb_tar4_n    = {MAX_LUN_PER_TAR{1'b1}};
`else `ifdef T4B4C2D2
    `ifdef DIES4
    	nand_die_model #(.mds(3'h2)) uut_1 (Dq_Io2, Cle2, Ale2, Ce2_n, Clk_We2_n, Wr_Re2_n, Wp2_n, Rb2_n, Pre, Lock, Dqs2, ml_rdy[2], Rb_tar2_n[0], PID, ENi, ENo, Dqs2_c, Re2_c);
    	nand_die_model #(.mds(3'h4)) uut_2 (Dq_Io,  Cle,  Ale,  Ce3_n, Clk_We_n,  Wr_Re_n , Wp_n , Rb3_n, Pre, Lock, Dqs,  ml_rdy[4], Rb_tar3_n[0], PID, ENi, ENo, Dqs_c,  Re_c );
    	nand_die_model #(.mds(3'h6)) uut_3 (Dq_Io2, Cle2, Ale2, Ce4_n, Clk_We2_n, Wr_Re2_n, Wp2_n, Rb4_n, Pre, Lock, Dqs2, ml_rdy[6], Rb_tar4_n[0], PID, ENi, ENo, Dqs2_c, Re2_c);
        assign ml_rdy[7]    = 1'b1;
        assign ml_rdy[5]    = 1'b1;
        assign ml_rdy[3]    = 1'b1;
        assign ml_rdy[1]    = 1'b1;
    `else
    	nand_die_model #(.mds(3'h1)) uut_1 (Dq_Io,  Cle,  Ale,  Ce_n,  Clk_We_n,  Wr_Re_n , Wp_n , Rb_n , Pre, Lock, Dqs,  ml_rdy[1], Rb_tar_n[1] , PID, ENi, ENo, Dqs_c,  Re_c );
    	nand_die_model #(.mds(3'h2)) uut_2 (Dq_Io2, Cle2, Ale2, Ce2_n, Clk_We2_n, Wr_Re2_n, Wp2_n, Rb2_n, Pre, Lock, Dqs2, ml_rdy[2], Rb_tar2_n[0], PID, ENi, ENo, Dqs2_c, Re2_c);
    	nand_die_model #(.mds(3'h3)) uut_3 (Dq_Io2, Cle2, Ale2, Ce2_n, Clk_We2_n, Wr_Re2_n, Wp2_n, Rb2_n, Pre, Lock, Dqs2, ml_rdy[3], Rb_tar2_n[1], PID, ENi, ENo, Dqs2_c, Re2_c);
    	nand_die_model #(.mds(3'h4)) uut_4 (Dq_Io,  Cle,  Ale,  Ce3_n, Clk_We_n,  Wr_Re_n , Wp_n , Rb3_n, Pre, Lock, Dqs,  ml_rdy[4], Rb_tar3_n[0], PID, ENi, ENo, Dqs_c,  Re_c );
    	nand_die_model #(.mds(3'h5)) uut_5 (Dq_Io,  Cle,  Ale,  Ce3_n, Clk_We_n,  Wr_Re_n , Wp_n , Rb3_n, Pre, Lock, Dqs,  ml_rdy[5], Rb_tar3_n[1], PID, ENi, ENo, Dqs_c,  Re_c );
    	nand_die_model #(.mds(3'h6)) uut_6 (Dq_Io2, Cle2, Ale2, Ce4_n, Clk_We2_n, Wr_Re2_n, Wp2_n, Rb4_n, Pre, Lock, Dqs2, ml_rdy[6], Rb_tar4_n[0], PID, ENi, ENo, Dqs2_c, Re2_c);
    	nand_die_model #(.mds(3'h7)) uut_7 (Dq_Io2, Cle2, Ale2, Ce4_n, Clk_We2_n, Wr_Re2_n, Wp2_n, Rb4_n, Pre, Lock, Dqs2, ml_rdy[7], Rb_tar4_n[1], PID, ENi, ENo, Dqs2_c, Re2_c);
    `endif 
    initial begin  tar2_sep_com = 1'b1; end
`else `ifdef T4B2C2D2
    nand_die_model #(.mds(3'h2)) uut_1 (Dq_Io2, Cle2, Ale2, Ce2_n, Clk_We2_n, Wr_Re2_n, Wp2_n, Rb2_n, Pre, Lock, Dqs2, ml_rdy[2], Rb_tar2_n[0], PID, ENi, ENo, Dqs2_c, Re2_c);
    nand_die_model #(.mds(3'h4)) uut_2 (Dq_Io,  Cle,  Ale,  Ce3_n, Clk_We_n,  Wr_Re_n , Wp_n , Rb_n , Pre, Lock, Dqs,  ml_rdy[4], Rb_tar_n[1] , PID, ENi, ENo, Dqs_c,  Re_c );
    nand_die_model #(.mds(3'h6)) uut_3 (Dq_Io2, Cle2, Ale2, Ce4_n, Clk_We2_n, Wr_Re2_n, Wp2_n, Rb2_n, Pre, Lock, Dqs2, ml_rdy[6], Rb_tar4_n[1], PID, ENi, ENo, Dqs2_c, Re2_c);
    assign ml_rdy[7]	= 1'b1;
    assign ml_rdy[5]	= 1'b1;
    assign ml_rdy[3]	= 1'b1;
    assign ml_rdy[1]	= 1'b1;
    initial begin  tar2_sep_com = 1'b1; end
`else    // T1B1C1D1
    `ifdef DIES2
        nand_die_model #(.mds(3'h1)) uut_1 (Dq_Io,  Cle,  Ale,  Ce_n,  Clk_We_n,  Wr_Re_n,  Wp_n, Rb_n,  Pre, Lock, Dqs, ml_rdy[1], Rb_tar_n[1], PID, ENi, ENo, Dqs_c,  Re_c );
        assign ml_rdy[7:2]  = {6{1'b1}};
    `else
        assign ml_rdy[7:1]  = {7{1'b1}};
    `endif
    initial begin  tar2_sep_com = 1'b0; end
    assign Rb_tar_n[(MAX_LUN_PER_TAR-1):1] = {(MAX_LUN_PER_TAR-1){1'b1}};
    assign Rb_tar2_n    = {MAX_LUN_PER_TAR{1'b1}};
    assign Rb_tar3_n    = {MAX_LUN_PER_TAR{1'b1}};
    assign Rb_tar4_n    = {MAX_LUN_PER_TAR{1'b1}};
    wire   Clk_We2_n    = 1'b0;
`endif `endif `endif `endif `endif


// -------------------------------------------------------------
// Multi-LUN command checks 
// -------------------------------------------------------------
//-----------------------------------------------------------------
// function : fn_ml_cmd
//  Function checks for Multi_LUN commands.  
//-----------------------------------------------------------------
function    fn_ml_cmd  ;
    input   [7:0]   dq_io ;
begin
   case (dq_io[7:0])
     8'h00, 8'h05, 8'h06, 8'h10, 8'h11, 8'h30, 8'h31, 8'h32, 8'h35, 8'h3F,
     8'h60, 8'h78, 8'h80, 8'h85, 8'hD0, 8'hD1, 8'hE0: 
       fn_ml_cmd  = 1'b1;
     default :
       fn_ml_cmd  = 1'b0;
   endcase 
end
endfunction
                 
// -------------------------------------------------------------
// Multi-LUN commands are prohibited while Reset, ID, or Config 
//  commands have an array busy.  
// Multi-LUN commands are commands used on devices with > 1 LUN
//   per target (CE#)
// -------------------------------------------------------------
always @(Clk_We_n) begin

    `ifdef T1B1C1D1
        `ifdef DIES2
            if((~ml_rdy[0] | ~ml_rdy[1]) & ~Ce_n & Cle & ~Ale & Clk_We_n & fn_ml_cmd(Dq_Io[7:0])) begin
                $display("%m at time %t: Error: Target 1 Multi-Lun Command following Reset, ID, or Config command %0h when Array Busy", $time, Dq_Io[7:0]);
            end 
        `endif 
    `else `ifdef T2B2C1D1
        `ifdef DIES4
            if((~ml_rdy[0] | ~ml_rdy[1]) & ~Ce_n & Cle & ~Ale & Clk_We_n & fn_ml_cmd(Dq_Io[7:0])) begin
                $display("%m at time %t: Error: Target 1 Multi-Lun Command following Reset, ID, or Config command %0h when Array Busy", $time, Dq_Io[7:0]);
            end 
        `endif 
    `else `ifdef T2B2C2D2
        `ifdef DIES4
            if((~ml_rdy[0] | ~ml_rdy[1]) & ~Ce_n & Cle & ~Ale & Clk_We_n & fn_ml_cmd(Dq_Io[7:0])) begin
                $display("%m at time %t: Error: Target 1 Multi-Lun Command following Reset, ID, or Config command %0h when Array Busy", $time, Dq_Io[7:0]);
            end 
        `endif 
    `else `ifdef T4B4C2D2
        `ifdef DIES4
        `else
            if((~ml_rdy[0] | ~ml_rdy[1]) & ~Ce_n & Cle & ~Ale & Clk_We_n & fn_ml_cmd(Dq_Io[7:0])) begin
            	$display("%m at time %t: Error: Target 1 Multi-Lun Command following Reset, ID, or Config command %0h when Array Busy", $time, Dq_Io[7:0]);
            end 
        `endif
    `endif `endif `endif `endif

    `ifdef T2B2C1D1
        `ifdef DIES4
            if((~ml_rdy[2] | ~ml_rdy[3]) & ~Ce2_n & Cle & ~Ale & Clk_We_n & ~tar2_sep_com & fn_ml_cmd(Dq_Io[7:0]) ) begin
                $display("%m at time %t: Error: Target 2 Multi-Lun Command following Reset, ID, or Config command %0h when Array Busy", $time, Dq_Io[7:0]);
            end 
        `endif 
    `endif

    `ifdef T4B4C2D2
        `ifdef DIES4
        `else
            if((~ml_rdy[4] | ~ml_rdy[5]) & ~Ce3_n & Cle & ~Ale & Clk_We_n & fn_ml_cmd(Dq_Io[7:0])) begin
            	$display("%m at time %t: Error: Target 3 Multi-Lun Command following Reset, ID, or Config command %0h when Array Busy", $time, Dq_Io[7:0]);
            end 
        `endif
    `endif
end

always @(Clk_We2_n) begin
    `ifdef T2B2C2D2
        `ifdef DIES4
            if((~ml_rdy[2] | ~ml_rdy[3]) & ~Ce2_n & Cle2 & ~Ale2 & Clk_We2_n & tar2_sep_com & fn_ml_cmd(Dq_Io2[7:0]) ) begin
                $display("%m at time %t: Error: Target 2 Multi-Lun Command following Reset, ID, or Config command %0h when Array Busy", $time, Dq_Io2[7:0]);
            end 
        `endif 
    `else `ifdef T4B4C2D2
        `ifdef DIES4
        `else
            if((~ml_rdy[2] | ~ml_rdy[3]) & ~Ce2_n & Cle2 & ~Ale2 & Clk_We2_n & tar2_sep_com & fn_ml_cmd(Dq_Io2[7:0]) ) begin
            	$display("%m at time %t: Error: Target 2 Multi-Lun Command following Reset, ID, or Config command %0h when Array Busy", $time, Dq_Io2[7:0]);
            end 
        `endif
    `endif `endif

    `ifdef T4B4C2D2
        `ifdef DIES4
        `else
            if((~ml_rdy[6] | ~ml_rdy[7]) & ~Ce4_n & Cle2 & ~Ale2 & Clk_We2_n & fn_ml_cmd(Dq_Io2[7:0]) ) begin
            	$display("%m at time %t: Error: Target 4 Multi-Lun Command following Reset, ID, or Config command %0h when Array Busy", $time, Dq_Io2[7:0]);
            end 
        `endif
    `endif
end


// -------------------------------------------------------------
// Multi-LUN commands (70h) prohibited during Multi-LUN ops
// -------------------------------------------------------------
always @(Clk_We_n) begin
    `ifdef T1B1C1D1
        `ifdef DIES2 // unknown class
            if(~(|Rb_tar_n) & uut_0.Rb_reset_n & ~Ce_n & Cle & ~Ale & Clk_We_n & Dq_Io[7:0]==8'h70) begin
                $display("%m at time %t: Error: Target 1 Read Status Command %0h during Multi-LUN ops prohibited", $time, Dq_Io[7:0]);
            end 
        `endif 
    `else `ifdef T2B2C1D1
        `ifdef DIES4 // class J
            if(~(|Rb_tar_n) & uut_0.Rb_reset_n & ~Ce_n & Cle & ~Ale & Clk_We_n & Dq_Io[7:0]==8'h70) begin
                $display("%m at time %t: Error: Target 1 Read Status Command %0h during Multi-LUN ops prohibited", $time, Dq_Io[7:0]);
            end 
        `endif 
    `else `ifdef T2B2C2D2
        `ifdef DIES4 // class K
            if(~(|Rb_tar_n) & uut_0.Rb_reset_n & ~Ce_n & Cle & ~Ale & Clk_We_n & Dq_Io[7:0]==8'h70) begin
                $display("%m at time %t: Error: Target 1 Read Status Command %0h during Multi-LUN ops prohibited", $time, Dq_Io[7:0]);
            end 
        `endif 
    `else `ifdef T4B4C2D2
        `ifdef DIES4
        `else // class U
            if(~(|Rb_tar_n) & uut_0.Rb_reset_n & ~Ce_n & Cle & ~Ale & Clk_We_n & Dq_Io[7:0]==8'h70) begin
            	$display("%m at time %t: Error: Target 1 Read Status Command %0h during Multi-LUN ops prohibited", $time, Dq_Io[7:0]);
            end 
        `endif 
    `endif `endif `endif `endif

    `ifdef T2B2C1D1
        `ifdef DIES4 // class J
            if(~(|Rb_tar2_n) & uut_2.Rb_reset_n & ~Ce2_n & Cle & ~Ale & Clk_We_n & Dq_Io[7:0]==8'h70 & ~tar2_sep_com) begin
                $display("%m at time %t: Error: Target 2 Read Status Command %0h during Multi-LUN ops prohibited", $time, Dq_Io[7:0]);
            end 
        `endif
    `endif

    `ifdef T4B4C2D2
        `ifdef DIES4
        `else // class U
            if(~(|Rb_tar3_n) & uut_4.Rb_reset_n & ~Ce3_n & Cle & ~Ale & Clk_We_n & Dq_Io[7:0]==8'h70) begin
            	$display("%m at time %t: Error: Target 3 Read Status Command %0h during Multi-LUN ops prohibited", $time, Dq_Io[7:0]);
            end 
        `endif 
    `endif
end 

always @(Clk_We2_n) begin
    `ifdef T2B2C2D2
        `ifdef DIES4 // class K
            if(~(|Rb_tar2_n) & uut_2.Rb_reset_n & ~Ce2_n & Cle2 & ~Ale2 & Clk_We2_n & Dq_Io2[7:0]==8'h70 & tar2_sep_com) begin
                $display("%m at time %t: Error: Target 2 Read Status Command %0h during Multi-LUN ops prohibited", $time, Dq_Io[7:0]);
            end 
        `endif
    `else `ifdef T4B4C2D2
        `ifdef DIES4
        `else // class U
            if(~(|Rb_tar2_n) & uut_2.Rb_reset_n & ~Ce2_n & Cle2 & ~Ale2 & Clk_We2_n & Dq_Io2[7:0]==8'h70 & tar2_sep_com) begin
            	$display("%m at time %t: Error: Target 2 Read Status Command %0h during Multi-LUN ops prohibited", $time, Dq_Io[7:0]);
            end 
        `endif 
    `endif `endif

    `ifdef T4B4C2D2
        `ifdef DIES4
        `else // class U
            if(~(|Rb_tar4_n) & uut_6.Rb_reset_n & ~Ce4_n & Cle2 & ~Ale2 & Clk_We2_n & Dq_Io2[7:0]==8'h70) begin
            	$display("%m at time %t: Error: Target 4 Read Status Command %0h during Multi-LUN ops prohibited", $time, Dq_Io[7:0]);
            end 
        `endif 
    `endif
end 
endmodule

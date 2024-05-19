// This program was cloned from: https://github.com/myriadrf/LimeSDR-USB_GW
// License: Apache License 2.0

// (C) 2001-2016 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/rel/15.1/ip/merlin/altera_customins_master_translator/altera_customins_master_translator.v#1 $
// $Revision: #1 $
// $Date: 2015/08/09 $
// $Author: swbranch $
// ------------------------------------------
// Custom instruction master translator
// ------------------------------------------
`timescale 1 ns / 1 ns

module altera_customins_master_translator 
#(
    parameter SHARED_COMB_AND_MULTI = 0
)
(
    // ------------------------------------------
    // Hybrid slave
    // ------------------------------------------
    input  wire [31:0] ci_slave_dataa,          //        ci_slave.dataa
    input  wire [31:0] ci_slave_datab,          //                .datab
    output wire [31:0] ci_slave_result,         //                .result
    input  wire [7:0]  ci_slave_n,              //                .n
    input  wire        ci_slave_readra,         //                .readra
    input  wire        ci_slave_readrb,         //                .readrb
    input  wire        ci_slave_writerc,        //                .writerc
    input  wire [4:0]  ci_slave_a,              //                .a
    input  wire [4:0]  ci_slave_b,              //                .b
    input  wire [4:0]  ci_slave_c,              //                .c
    input  wire [31:0] ci_slave_ipending,       //                .ipending
    input  wire        ci_slave_estatus,        //                .estatus
    input  wire        ci_slave_multi_clk,      //                .clk
    input  wire        ci_slave_multi_reset,    //                .reset
    input  wire        ci_slave_multi_reset_req,//                .reset_req
    input  wire        ci_slave_multi_clken,    //                .clk_en
    input  wire        ci_slave_multi_start,    //                .start
    output wire        ci_slave_multi_done,     //                .done
    input  wire [31:0] ci_slave_multi_dataa,    //                .multi_dataa
    input  wire [31:0] ci_slave_multi_datab,    //                .multi_datab
    output wire [31:0] ci_slave_multi_result,   //                .multi_result
    input  wire [7:0]  ci_slave_multi_n,        //                .multi_n
    input  wire        ci_slave_multi_readra,   //                .multi_readra
    input  wire        ci_slave_multi_readrb,   //                .multi_readrb
    input  wire        ci_slave_multi_writerc,  //                .multi_writerc
    input  wire [4:0]  ci_slave_multi_a,        //                .multi_a
    input  wire [4:0]  ci_slave_multi_b,        //                .multi_b
    input  wire [4:0]  ci_slave_multi_c,        //                .multi_c
    // ------------------------------------------
    // Comb master
    // ------------------------------------------
    output wire [31:0] comb_ci_master_dataa,    //  comb_ci_master.dataa
    output wire [31:0] comb_ci_master_datab,    //                .datab
    input  wire [31:0] comb_ci_master_result,   //                .result
    output wire [7:0]  comb_ci_master_n,        //                .n
    output wire        comb_ci_master_readra,   //                .readra
    output wire        comb_ci_master_readrb,   //                .readrb
    output wire        comb_ci_master_writerc,  //                .writerc
    output wire [4:0]  comb_ci_master_a,        //                .a
    output wire [4:0]  comb_ci_master_b,        //                .b
    output wire [4:0]  comb_ci_master_c,        //                .c
    output wire [31:0] comb_ci_master_ipending, //                .ipending
    output wire        comb_ci_master_estatus,  //                .estatus
    // ------------------------------------------
    // Multi master
    // ------------------------------------------
    output wire        multi_ci_master_clk,     // multi_ci_master.clk
    output wire        multi_ci_master_reset,   //                .reset
    output wire        multi_ci_master_reset_req, //              .reset_req
    output wire        multi_ci_master_clken,   //                .clk_en
    output wire        multi_ci_master_start,   //                .start
    input  wire        multi_ci_master_done,    //                .done
    output wire [31:0] multi_ci_master_dataa,   //                .dataa
    output wire [31:0] multi_ci_master_datab,   //                .datab
    input  wire [31:0] multi_ci_master_result,  //                .result
    output wire [7:0]  multi_ci_master_n,       //                .n
    output wire        multi_ci_master_readra,  //                .readra
    output wire        multi_ci_master_readrb,  //                .readrb
    output wire        multi_ci_master_writerc, //                .writerc
    output wire [4:0]  multi_ci_master_a,       //                .a
    output wire [4:0]  multi_ci_master_b,       //                .b
    output wire [4:0]  multi_ci_master_c        //                .c
	);

    assign comb_ci_master_dataa   = ci_slave_dataa;
    assign comb_ci_master_datab   = ci_slave_datab;
    assign comb_ci_master_n       = ci_slave_n;
    assign comb_ci_master_a       = ci_slave_a;
    assign comb_ci_master_b       = ci_slave_b;
    assign comb_ci_master_c       = ci_slave_c;
    assign comb_ci_master_readra  = ci_slave_readra;
    assign comb_ci_master_readrb  = ci_slave_readrb;
    assign comb_ci_master_writerc = ci_slave_writerc;
    assign comb_ci_master_ipending = ci_slave_ipending;
    assign comb_ci_master_estatus  = ci_slave_estatus;

    assign multi_ci_master_clk   = ci_slave_multi_clk;
    assign multi_ci_master_reset = ci_slave_multi_reset;
    assign multi_ci_master_reset_req = ci_slave_multi_reset_req;
    assign multi_ci_master_clken = ci_slave_multi_clken;
    assign multi_ci_master_start = ci_slave_multi_start;
    assign ci_slave_multi_done   = multi_ci_master_done;

    generate if (SHARED_COMB_AND_MULTI == 0) begin

        assign multi_ci_master_dataa   = ci_slave_multi_dataa;
        assign multi_ci_master_datab   = ci_slave_multi_datab;
        assign multi_ci_master_n       = ci_slave_multi_n;
        assign multi_ci_master_a       = ci_slave_multi_a;
        assign multi_ci_master_b       = ci_slave_multi_b;
        assign multi_ci_master_c       = ci_slave_multi_c;
        assign multi_ci_master_readra  = ci_slave_multi_readra;
        assign multi_ci_master_readrb  = ci_slave_multi_readrb;
        assign multi_ci_master_writerc = ci_slave_multi_writerc;
        
        assign ci_slave_result         = comb_ci_master_result;
        assign ci_slave_multi_result   = multi_ci_master_result;

    end else begin

	    assign multi_ci_master_dataa   = ci_slave_dataa;
	    assign multi_ci_master_datab   = ci_slave_datab;
        assign multi_ci_master_n       = ci_slave_n;
        assign multi_ci_master_a       = ci_slave_a;
        assign multi_ci_master_b       = ci_slave_b;
        assign multi_ci_master_c       = ci_slave_c;
        assign multi_ci_master_readra  = ci_slave_readra;
        assign multi_ci_master_readrb  = ci_slave_readrb;
        assign multi_ci_master_writerc = ci_slave_writerc;

        assign ci_slave_result = ci_slave_multi_done ? multi_ci_master_result :
                                    comb_ci_master_result;

    end

    endgenerate

endmodule

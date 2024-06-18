// This program was cloned from: https://github.com/manish03/LDPCENCDEC
// License: Apache License 2.0

// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * ldpcEncDec
 *
 * This is an example of a (trivially simple) user project,
 * showing how the user project can connect to the logic
 * analyzer, the wishbone bus, and the I/O pads.
 *
 * This project generates an integer count, which is output
 * on the user area GPIO pads (digital output only).  The
 * wishbone connection allows the project to be controlled
 * (start and stop) from the management SoC program.
 *
 * See the testbenches in directory "mprj_counter" for the
 * example programs that drive this user project.  The three
 * testbenches are "io_ports", "la_test1", and "la_test2".
 *
 *-------------------------------------------------------------
 */

module ldpcEncDec #(
parameter MM   = 'h 000a8 ,
parameter NN   = 'h 000d0 ,
parameter SUM_LEN        = $clog2(NN+1)+1,
    parameter BITS = 16
)(
`ifdef USE_POWER_PINS
    inout                                     vccd1,	// User area 1 1.8V supply
    inout                                     vssd1,	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input                                     wb_clk_i,
    input                                     wb_rst_i,
    input                                     wbs_stb_i,
    input                                     wbs_cyc_i,
    input                                     wbs_we_i,
    input       [3:0]                         wbs_sel_i,
    input       [31:0]                        wbs_dat_i,
    input       [31:0]                        wbs_adr_i,
    output                                    wbs_ack_o,
    output      [31:0]                        wbs_dat_o,

    // Logic Analyzer Signals
    //input       [127:0]                       la_data_in,
    //output wire [127:0]                       la_data_out,
    //input       [127:0]                       la_oenb,
    // IRQ
    //output wire [2:0]                         irq,

    // IOs
    //input       [BITS-1:0]                    io_in,
    //output wire [BITS-1:0]                    io_out,
    //output wire [BITS-1:0]                    io_oeb,


    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [BITS-1:0] io_in,
    output [BITS-1:0] io_out,
    output [BITS-1:0] io_oeb,

    // IRQ
    output [2:0] irq

    //input       [NN-MM-1:0]                   P_y_nr_in_port,
    //output      [NN-1:0]                      PO_y_nr_enc,
    //output                                    PO_valid_cword_enc,
    //input                                     P_sel_q0_0_frmC,
    //input                                     P_sel_q0_1_frmC,
    //input       [NN-1:0]                      P_err_intro_q0_0_frmC,
    //input       [NN-1:0]                      P_err_intro_q0_1_frmC,
    //input                                     P_err_intro,
    //input       [NN-1:0]                      P_q0_0_frmC,
    //input       [NN-1:0]                      P_q0_1_frmC,
    //output                                    PO_err_intro_decoder,
    //input       [MM-1:0]                      P_exp_syn,
    //input       [32-1:0]                      P_percent_probability_int,
    //input       [16-1:0]                      P_HamDist_loop_max,
    //input       [31:0]                        P_ldpc_from_io,
    //input       [16-1:0]                      P_HamDist_loop_percentage,
    //input       [16-1:0]                      P_HamDist_iir1,
    //input       [16-1:0]                      P_HamDist_iir2,
    //input       [16-1:0]                      P_HamDist_iir3,
    //output                                    PO_syn_valid_cword_dec,
    //input                                     P_start_dec,
    //output                                    PO_converged_loops_ended,
    //input       [32-1:0]                      P_reg_mprj_slave,
    //output                                    PO_converged_pass_fail,
    //output      [NN-1:0]                      PO_final_y_nr_dec,
    //input                                     P_pass_fail,
    //output                                    PO_tb_pass_fail_decoder,

);

//////////////////////////////////////////////////////////////////////////
    wire       [NN-MM-1:0]                   P_y_nr_in_port;
    wire                                     P_sel_q0_0_frmC;
    wire                                     P_sel_q0_1_frmC;
    wire       [NN-1:0]                      P_err_intro_q0_0_frmC;
    wire       [NN-1:0]                      P_err_intro_q0_1_frmC;
    wire                                     P_err_intro;
    wire       [NN-1:0]                      P_q0_0_frmC;
    wire       [NN-1:0]                      P_q0_1_frmC;
    wire       [MM-1:0]                      P_exp_syn;
    wire       [32-1:0]                      P_percent_probability_int;
    wire       [16-1:0]                      P_HamDist_loop_max;
    wire       [31:0]                        P_ldpc_from_io;
    wire       [16-1:0]                      P_HamDist_loop_percentage;
    wire       [16-1:0]                      P_HamDist_iir1;
    wire       [16-1:0]                      P_HamDist_iir2;
    wire       [16-1:0]                      P_HamDist_iir3;
    wire                                     P_start_dec;
    wire       [32-1:0]                      P_reg_mprj_slave;
    wire                                     P_pass_fail;
//////////////////////////////////////////////////////////////////////////
     wire [NN-1:0]                      PO_y_nr_enc;
     wire                               PO_valid_cword_enc;
     wire                               PO_err_intro_decoder;
     wire                               PO_syn_valid_cword_dec;
     wire                               PO_converged_loops_ended;
     wire                               PO_converged_pass_fail;
     wire [NN-1:0]                      PO_final_y_nr_dec;
     wire                               PO_tb_pass_fail_decoder;
////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
    wire        [NN-MM-1:0]                   w_y_nr_in_port;

    wire                                      w_sel_q0_0_frmC;
    wire                                      w_sel_q0_1_frmC;
    wire        [NN-1:0]                      w_err_intro_q0_0_frmC;
    wire        [NN-1:0]                      w_err_intro_q0_1_frmC;
    wire                                      w_err_intro;
    wire        [NN-1:0]                      w_q0_0_frmC;
    wire        [NN-1:0]                      w_q0_1_frmC;

    wire        [MM-1:0]                      w_exp_syn;
    wire        [32-1:0]                      w_percent_probability_int;
    wire        [16-1:0]                      w_HamDist_loop_max;
    wire        [31:0]                        w_ldpc_from_io;
    wire        [16-1:0]                      w_HamDist_loop_percentage;
    wire        [16-1:0]                      w_HamDist_iir1;
    wire        [16-1:0]                      w_HamDist_iir2;
    wire        [16-1:0]                      w_HamDist_iir3;



    wire                                      w_start_dec;

    wire        [32-1:0]                      w_reg_mprj_slave;


    wire                                      w_pass_fail;

    ///////////////////////////////////////////////////////////////////
 wire [31:0]                    ldpc_from_io;
    ///////////////////LDPC wire////////////////////////////////////////////////
 wire [NN-MM-1:0]               y_nr_in_port;
 wire [NN-1:0]                  y_nr_enc;
 wire                           valid_cword_enc;
    ///////////////////LDPC wire////////////////////////////////////////////////
 wire  [NN-1:0]                 q0_0;
 wire  [NN-1:0]                 q0_1;
 wire  [NN-1:0]                 q0_0_frmC;
 wire  [NN-1:0]                 q0_1_frmC;
 wire                           sel_q0_0_frmC;
 wire                           sel_q0_1_frmC;
 wire  [NN-1:0]                 err_intro_q0_0_frmC;
 wire  [NN-1:0]                 err_intro_q0_1_frmC;

 wire  [NN-1:0]                 final_y_nr_dec;

 wire  [MM-1:0]                 exp_syn;
 wire  [MM-1:0]                 l_exp_syn;
 wire  [31:0]                   percent_probability_int;

 wire  [32-1:0]                 HamDist_loop_max;
 wire  [32-1:0]                 HamDist_loop_percentage;

 wire  [32-1:0]                 HamDist_iir1;
 wire  [32-1:0]                 HamDist_iir2;
 wire  [32-1:0]                 HamDist_iir3;

 wire  [31:0]                   reg_mprj_slave;

 wire                           start_dec;
 wire                           start_dec_rtl;
 reg                            start_dec_rtl_Q;
 wire                           converged_loops_ended ; 
 wire                           converged_pass_fail ;
 wire                           syn_valid_cword_dec;

 wire                           i_wb_cyc;
 wire                           i_wb_stb;
 wire [31:0]                    reg_base_addr;
 wire                           pass_fail;
 wire                           err_intro;
 wire                           err_intro_decoder;
 wire                           tb_pass_fail_decoder;

 wire                           o_wb_stall;
 wire                           o_wb_err;
 wire                           o_wb_rty;
 wire [15:0]                    P_input_sel;
 wire [15:0]                    PO_output_sel;

////////////////////////////////////////////  /////////////////
wire P_inputnoutput;
wire P_input;
wire [15:0] P_in_out_sel;
reg PO_output;

 assign PO_output_sel = ~P_inputnoutput ? P_in_out_sel : 16'h0;
 assign P_input_sel   =  P_inputnoutput ? P_in_out_sel : 16'h0;

assign la_data_out = 128'b0;

assign P_inputnoutput   = io_in[0] ;
assign P_input          = io_in[1] ;

assign P_in_out_sel[0]  = io_in[2]  ;
assign P_in_out_sel[1]  = io_in[3]  ;
assign P_in_out_sel[2]  = io_in[4]  ;
assign P_in_out_sel[3]  = io_in[5]  ;
assign P_in_out_sel[4]  = io_in[6]  ;
assign P_in_out_sel[5]  = io_in[7]  ;
assign P_in_out_sel[6]  = io_in[8]  ;
assign P_in_out_sel[7]  = io_in[9]  ;
assign P_in_out_sel[8]  = io_in[10]  ;
assign P_in_out_sel[9]  = io_in[11]  ;
assign P_in_out_sel[10] = io_in[12] ;
assign P_in_out_sel[11] = io_in[13] ;
assign P_in_out_sel[12] = io_in[14] ;
assign P_in_out_sel[13] = 1'b0 ;
assign P_in_out_sel[14] = 1'b0 ;
assign P_in_out_sel[15] = 1'b0 ;



assign io_oeb[14:  0]                  = {(15){1'b1}};                       //input pins
assign io_oeb[15]                      = 1'b0;                              //output pins


assign io_out[14:  0]                 = {(15){1'b0}};                       //input pins
assign io_out[15]                     = PO_output;                         //output pins //15



assign irq = 3'b0;
////////////////////////////////////////////  /////////////////

//////////////////////////////////////////// Enc to Dec /////////////////
//////////////////////////////////////////////////////////////////////////
    //assign    la_data_out                      = {128{1'b0}};
    //assign    io_out                           = {BITS{1'b0}};
    //assign    io_oeb                           = {BITS{1'b0}};
    //assign    irq                              = {3{1'b0}};

    assign    w_y_nr_in_port                   = ldpc_from_io[0]  ? P_y_nr_in_port           : y_nr_in_port;
    assign    PO_y_nr_enc                      = y_nr_enc;
    assign    PO_valid_cword_enc               = valid_cword_enc;
    assign    w_sel_q0_0_frmC                  = ldpc_from_io[0] ? P_sel_q0_0_frmC           : sel_q0_0_frmC;
    assign    w_sel_q0_1_frmC                  = ldpc_from_io[0] ? P_sel_q0_1_frmC           : sel_q0_1_frmC;
    assign    w_err_intro_q0_0_frmC            = ldpc_from_io[0] ? P_err_intro_q0_0_frmC     : err_intro_q0_0_frmC;
    assign    w_err_intro_q0_1_frmC            = ldpc_from_io[0] ? P_err_intro_q0_1_frmC     : err_intro_q0_1_frmC;
    assign    w_err_intro                      = ldpc_from_io[0] ? P_err_intro               : err_intro;
    assign    w_q0_0_frmC                      = ldpc_from_io[0] ? P_q0_0_frmC               : q0_0_frmC;
    assign    w_q0_1_frmC                      = ldpc_from_io[0] ? P_q0_1_frmC               : q0_1_frmC;
    assign    PO_err_intro_decoder             = err_intro_decoder;
    assign    w_exp_syn                        = ldpc_from_io[0] ? P_exp_syn                 :l_exp_syn;
    assign    w_percent_probability_int        = ldpc_from_io[0] ? P_percent_probability_int :percent_probability_int;
    assign    w_HamDist_loop_max               = ldpc_from_io[0] ? P_HamDist_loop_max        :HamDist_loop_max[15:0];
    assign    w_ldpc_from_io                   = ldpc_from_io[0] ? P_ldpc_from_io            :ldpc_from_io;
    assign    w_HamDist_loop_percentage        = ldpc_from_io[0] ? P_HamDist_loop_percentage :HamDist_loop_percentage[15:0];
    assign    w_HamDist_iir1                   = ldpc_from_io[0] ? P_HamDist_iir1            :HamDist_iir1[15:0];
    assign    w_HamDist_iir2                   = ldpc_from_io[0] ? P_HamDist_iir2            :HamDist_iir2[15:0];
    assign    w_HamDist_iir3                   = ldpc_from_io[0] ? P_HamDist_iir3            :HamDist_iir3[15:0];
    assign    PO_syn_valid_cword_dec           = syn_valid_cword_dec;
    assign    w_start_dec                      = ldpc_from_io[0] ? P_start_dec               : start_dec;
    assign    PO_converged_loops_ended         = converged_loops_ended;
    assign    w_reg_mprj_slave                 = ldpc_from_io[0] ? P_reg_mprj_slave          : reg_mprj_slave;
    assign    PO_converged_pass_fail           = converged_pass_fail;
    assign    PO_final_y_nr_dec                = final_y_nr_dec;
    assign    w_pass_fail                      = ldpc_from_io[0] ? P_pass_fail               : pass_fail;
    assign    PO_tb_pass_fail_decoder          = tb_pass_fail_decoder;

   
////////////////////////////////////////////////////////////////////////
 assign P_y_nr_in_port [39]   = P_input_sel == 0  ? P_input : 0;
 assign P_y_nr_in_port [38]   = P_input_sel == 1  ? P_input : 0;
 assign P_y_nr_in_port [37]   = P_input_sel == 2  ? P_input : 0;
 assign P_y_nr_in_port [36]   = P_input_sel == 3  ? P_input : 0;
 assign P_y_nr_in_port [35]   = P_input_sel == 4  ? P_input : 0;
 assign P_y_nr_in_port [34]   = P_input_sel == 5  ? P_input : 0;
 assign P_y_nr_in_port [33]   = P_input_sel == 6  ? P_input : 0;
 assign P_y_nr_in_port [32]   = P_input_sel == 7  ? P_input : 0;
 assign P_y_nr_in_port [31]   = P_input_sel == 8  ? P_input : 0;
 assign P_y_nr_in_port [30]   = P_input_sel == 9  ? P_input : 0;
 assign P_y_nr_in_port [29]   = P_input_sel == 10  ? P_input : 0;
 assign P_y_nr_in_port [28]   = P_input_sel == 11  ? P_input : 0;
 assign P_y_nr_in_port [27]   = P_input_sel == 12  ? P_input : 0;
 assign P_y_nr_in_port [26]   = P_input_sel == 13  ? P_input : 0;
 assign P_y_nr_in_port [25]   = P_input_sel == 14  ? P_input : 0;
 assign P_y_nr_in_port [24]   = P_input_sel == 15  ? P_input : 0;
 assign P_y_nr_in_port [23]   = P_input_sel == 16  ? P_input : 0;
 assign P_y_nr_in_port [22]   = P_input_sel == 17  ? P_input : 0;
 assign P_y_nr_in_port [21]   = P_input_sel == 18  ? P_input : 0;
 assign P_y_nr_in_port [20]   = P_input_sel == 19  ? P_input : 0;
 assign P_y_nr_in_port [19]   = P_input_sel == 20  ? P_input : 0;
 assign P_y_nr_in_port [18]   = P_input_sel == 21  ? P_input : 0;
 assign P_y_nr_in_port [17]   = P_input_sel == 22  ? P_input : 0;
 assign P_y_nr_in_port [16]   = P_input_sel == 23  ? P_input : 0;
 assign P_y_nr_in_port [15]   = P_input_sel == 24  ? P_input : 0;
 assign P_y_nr_in_port [14]   = P_input_sel == 25  ? P_input : 0;
 assign P_y_nr_in_port [13]   = P_input_sel == 26  ? P_input : 0;
 assign P_y_nr_in_port [12]   = P_input_sel == 27  ? P_input : 0;
 assign P_y_nr_in_port [11]   = P_input_sel == 28  ? P_input : 0;
 assign P_y_nr_in_port [10]   = P_input_sel == 29  ? P_input : 0;
 assign P_y_nr_in_port [9]   = P_input_sel == 30  ? P_input : 0;
 assign P_y_nr_in_port [8]   = P_input_sel == 31  ? P_input : 0;
 assign P_y_nr_in_port [7]   = P_input_sel == 32  ? P_input : 0;
 assign P_y_nr_in_port [6]   = P_input_sel == 33  ? P_input : 0;
 assign P_y_nr_in_port [5]   = P_input_sel == 34  ? P_input : 0;
 assign P_y_nr_in_port [4]   = P_input_sel == 35  ? P_input : 0;
 assign P_y_nr_in_port [3]   = P_input_sel == 36  ? P_input : 0;
 assign P_y_nr_in_port [2]   = P_input_sel == 37  ? P_input : 0;
 assign P_y_nr_in_port [1]   = P_input_sel == 38  ? P_input : 0;
 assign P_y_nr_in_port [0]   = P_input_sel == 39  ? P_input : 0;
 assign P_sel_q0_0_frmC   = P_input_sel == 40  ? P_input : 0;
 assign P_sel_q0_1_frmC   = P_input_sel == 41  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [207]   = P_input_sel == 42  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [206]   = P_input_sel == 43  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [205]   = P_input_sel == 44  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [204]   = P_input_sel == 45  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [203]   = P_input_sel == 46  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [202]   = P_input_sel == 47  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [201]   = P_input_sel == 48  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [200]   = P_input_sel == 49  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [199]   = P_input_sel == 50  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [198]   = P_input_sel == 51  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [197]   = P_input_sel == 52  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [196]   = P_input_sel == 53  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [195]   = P_input_sel == 54  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [194]   = P_input_sel == 55  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [193]   = P_input_sel == 56  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [192]   = P_input_sel == 57  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [191]   = P_input_sel == 58  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [190]   = P_input_sel == 59  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [189]   = P_input_sel == 60  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [188]   = P_input_sel == 61  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [187]   = P_input_sel == 62  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [186]   = P_input_sel == 63  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [185]   = P_input_sel == 64  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [184]   = P_input_sel == 65  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [183]   = P_input_sel == 66  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [182]   = P_input_sel == 67  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [181]   = P_input_sel == 68  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [180]   = P_input_sel == 69  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [179]   = P_input_sel == 70  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [178]   = P_input_sel == 71  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [177]   = P_input_sel == 72  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [176]   = P_input_sel == 73  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [175]   = P_input_sel == 74  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [174]   = P_input_sel == 75  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [173]   = P_input_sel == 76  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [172]   = P_input_sel == 77  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [171]   = P_input_sel == 78  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [170]   = P_input_sel == 79  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [169]   = P_input_sel == 80  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [168]   = P_input_sel == 81  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [167]   = P_input_sel == 82  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [166]   = P_input_sel == 83  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [165]   = P_input_sel == 84  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [164]   = P_input_sel == 85  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [163]   = P_input_sel == 86  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [162]   = P_input_sel == 87  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [161]   = P_input_sel == 88  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [160]   = P_input_sel == 89  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [159]   = P_input_sel == 90  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [158]   = P_input_sel == 91  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [157]   = P_input_sel == 92  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [156]   = P_input_sel == 93  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [155]   = P_input_sel == 94  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [154]   = P_input_sel == 95  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [153]   = P_input_sel == 96  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [152]   = P_input_sel == 97  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [151]   = P_input_sel == 98  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [150]   = P_input_sel == 99  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [149]   = P_input_sel == 100  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [148]   = P_input_sel == 101  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [147]   = P_input_sel == 102  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [146]   = P_input_sel == 103  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [145]   = P_input_sel == 104  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [144]   = P_input_sel == 105  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [143]   = P_input_sel == 106  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [142]   = P_input_sel == 107  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [141]   = P_input_sel == 108  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [140]   = P_input_sel == 109  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [139]   = P_input_sel == 110  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [138]   = P_input_sel == 111  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [137]   = P_input_sel == 112  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [136]   = P_input_sel == 113  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [135]   = P_input_sel == 114  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [134]   = P_input_sel == 115  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [133]   = P_input_sel == 116  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [132]   = P_input_sel == 117  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [131]   = P_input_sel == 118  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [130]   = P_input_sel == 119  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [129]   = P_input_sel == 120  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [128]   = P_input_sel == 121  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [127]   = P_input_sel == 122  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [126]   = P_input_sel == 123  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [125]   = P_input_sel == 124  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [124]   = P_input_sel == 125  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [123]   = P_input_sel == 126  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [122]   = P_input_sel == 127  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [121]   = P_input_sel == 128  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [120]   = P_input_sel == 129  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [119]   = P_input_sel == 130  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [118]   = P_input_sel == 131  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [117]   = P_input_sel == 132  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [116]   = P_input_sel == 133  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [115]   = P_input_sel == 134  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [114]   = P_input_sel == 135  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [113]   = P_input_sel == 136  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [112]   = P_input_sel == 137  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [111]   = P_input_sel == 138  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [110]   = P_input_sel == 139  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [109]   = P_input_sel == 140  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [108]   = P_input_sel == 141  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [107]   = P_input_sel == 142  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [106]   = P_input_sel == 143  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [105]   = P_input_sel == 144  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [104]   = P_input_sel == 145  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [103]   = P_input_sel == 146  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [102]   = P_input_sel == 147  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [101]   = P_input_sel == 148  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [100]   = P_input_sel == 149  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [99]   = P_input_sel == 150  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [98]   = P_input_sel == 151  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [97]   = P_input_sel == 152  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [96]   = P_input_sel == 153  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [95]   = P_input_sel == 154  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [94]   = P_input_sel == 155  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [93]   = P_input_sel == 156  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [92]   = P_input_sel == 157  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [91]   = P_input_sel == 158  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [90]   = P_input_sel == 159  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [89]   = P_input_sel == 160  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [88]   = P_input_sel == 161  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [87]   = P_input_sel == 162  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [86]   = P_input_sel == 163  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [85]   = P_input_sel == 164  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [84]   = P_input_sel == 165  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [83]   = P_input_sel == 166  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [82]   = P_input_sel == 167  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [81]   = P_input_sel == 168  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [80]   = P_input_sel == 169  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [79]   = P_input_sel == 170  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [78]   = P_input_sel == 171  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [77]   = P_input_sel == 172  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [76]   = P_input_sel == 173  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [75]   = P_input_sel == 174  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [74]   = P_input_sel == 175  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [73]   = P_input_sel == 176  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [72]   = P_input_sel == 177  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [71]   = P_input_sel == 178  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [70]   = P_input_sel == 179  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [69]   = P_input_sel == 180  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [68]   = P_input_sel == 181  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [67]   = P_input_sel == 182  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [66]   = P_input_sel == 183  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [65]   = P_input_sel == 184  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [64]   = P_input_sel == 185  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [63]   = P_input_sel == 186  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [62]   = P_input_sel == 187  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [61]   = P_input_sel == 188  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [60]   = P_input_sel == 189  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [59]   = P_input_sel == 190  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [58]   = P_input_sel == 191  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [57]   = P_input_sel == 192  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [56]   = P_input_sel == 193  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [55]   = P_input_sel == 194  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [54]   = P_input_sel == 195  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [53]   = P_input_sel == 196  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [52]   = P_input_sel == 197  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [51]   = P_input_sel == 198  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [50]   = P_input_sel == 199  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [49]   = P_input_sel == 200  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [48]   = P_input_sel == 201  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [47]   = P_input_sel == 202  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [46]   = P_input_sel == 203  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [45]   = P_input_sel == 204  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [44]   = P_input_sel == 205  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [43]   = P_input_sel == 206  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [42]   = P_input_sel == 207  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [41]   = P_input_sel == 208  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [40]   = P_input_sel == 209  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [39]   = P_input_sel == 210  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [38]   = P_input_sel == 211  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [37]   = P_input_sel == 212  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [36]   = P_input_sel == 213  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [35]   = P_input_sel == 214  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [34]   = P_input_sel == 215  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [33]   = P_input_sel == 216  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [32]   = P_input_sel == 217  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [31]   = P_input_sel == 218  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [30]   = P_input_sel == 219  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [29]   = P_input_sel == 220  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [28]   = P_input_sel == 221  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [27]   = P_input_sel == 222  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [26]   = P_input_sel == 223  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [25]   = P_input_sel == 224  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [24]   = P_input_sel == 225  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [23]   = P_input_sel == 226  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [22]   = P_input_sel == 227  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [21]   = P_input_sel == 228  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [20]   = P_input_sel == 229  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [19]   = P_input_sel == 230  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [18]   = P_input_sel == 231  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [17]   = P_input_sel == 232  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [16]   = P_input_sel == 233  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [15]   = P_input_sel == 234  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [14]   = P_input_sel == 235  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [13]   = P_input_sel == 236  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [12]   = P_input_sel == 237  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [11]   = P_input_sel == 238  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [10]   = P_input_sel == 239  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [9]   = P_input_sel == 240  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [8]   = P_input_sel == 241  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [7]   = P_input_sel == 242  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [6]   = P_input_sel == 243  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [5]   = P_input_sel == 244  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [4]   = P_input_sel == 245  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [3]   = P_input_sel == 246  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [2]   = P_input_sel == 247  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [1]   = P_input_sel == 248  ? P_input : 0;
 assign P_err_intro_q0_0_frmC [0]   = P_input_sel == 249  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [207]   = P_input_sel == 250  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [206]   = P_input_sel == 251  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [205]   = P_input_sel == 252  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [204]   = P_input_sel == 253  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [203]   = P_input_sel == 254  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [202]   = P_input_sel == 255  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [201]   = P_input_sel == 256  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [200]   = P_input_sel == 257  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [199]   = P_input_sel == 258  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [198]   = P_input_sel == 259  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [197]   = P_input_sel == 260  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [196]   = P_input_sel == 261  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [195]   = P_input_sel == 262  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [194]   = P_input_sel == 263  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [193]   = P_input_sel == 264  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [192]   = P_input_sel == 265  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [191]   = P_input_sel == 266  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [190]   = P_input_sel == 267  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [189]   = P_input_sel == 268  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [188]   = P_input_sel == 269  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [187]   = P_input_sel == 270  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [186]   = P_input_sel == 271  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [185]   = P_input_sel == 272  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [184]   = P_input_sel == 273  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [183]   = P_input_sel == 274  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [182]   = P_input_sel == 275  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [181]   = P_input_sel == 276  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [180]   = P_input_sel == 277  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [179]   = P_input_sel == 278  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [178]   = P_input_sel == 279  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [177]   = P_input_sel == 280  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [176]   = P_input_sel == 281  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [175]   = P_input_sel == 282  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [174]   = P_input_sel == 283  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [173]   = P_input_sel == 284  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [172]   = P_input_sel == 285  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [171]   = P_input_sel == 286  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [170]   = P_input_sel == 287  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [169]   = P_input_sel == 288  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [168]   = P_input_sel == 289  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [167]   = P_input_sel == 290  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [166]   = P_input_sel == 291  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [165]   = P_input_sel == 292  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [164]   = P_input_sel == 293  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [163]   = P_input_sel == 294  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [162]   = P_input_sel == 295  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [161]   = P_input_sel == 296  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [160]   = P_input_sel == 297  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [159]   = P_input_sel == 298  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [158]   = P_input_sel == 299  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [157]   = P_input_sel == 300  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [156]   = P_input_sel == 301  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [155]   = P_input_sel == 302  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [154]   = P_input_sel == 303  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [153]   = P_input_sel == 304  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [152]   = P_input_sel == 305  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [151]   = P_input_sel == 306  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [150]   = P_input_sel == 307  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [149]   = P_input_sel == 308  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [148]   = P_input_sel == 309  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [147]   = P_input_sel == 310  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [146]   = P_input_sel == 311  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [145]   = P_input_sel == 312  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [144]   = P_input_sel == 313  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [143]   = P_input_sel == 314  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [142]   = P_input_sel == 315  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [141]   = P_input_sel == 316  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [140]   = P_input_sel == 317  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [139]   = P_input_sel == 318  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [138]   = P_input_sel == 319  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [137]   = P_input_sel == 320  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [136]   = P_input_sel == 321  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [135]   = P_input_sel == 322  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [134]   = P_input_sel == 323  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [133]   = P_input_sel == 324  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [132]   = P_input_sel == 325  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [131]   = P_input_sel == 326  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [130]   = P_input_sel == 327  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [129]   = P_input_sel == 328  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [128]   = P_input_sel == 329  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [127]   = P_input_sel == 330  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [126]   = P_input_sel == 331  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [125]   = P_input_sel == 332  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [124]   = P_input_sel == 333  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [123]   = P_input_sel == 334  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [122]   = P_input_sel == 335  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [121]   = P_input_sel == 336  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [120]   = P_input_sel == 337  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [119]   = P_input_sel == 338  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [118]   = P_input_sel == 339  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [117]   = P_input_sel == 340  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [116]   = P_input_sel == 341  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [115]   = P_input_sel == 342  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [114]   = P_input_sel == 343  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [113]   = P_input_sel == 344  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [112]   = P_input_sel == 345  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [111]   = P_input_sel == 346  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [110]   = P_input_sel == 347  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [109]   = P_input_sel == 348  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [108]   = P_input_sel == 349  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [107]   = P_input_sel == 350  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [106]   = P_input_sel == 351  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [105]   = P_input_sel == 352  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [104]   = P_input_sel == 353  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [103]   = P_input_sel == 354  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [102]   = P_input_sel == 355  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [101]   = P_input_sel == 356  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [100]   = P_input_sel == 357  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [99]   = P_input_sel == 358  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [98]   = P_input_sel == 359  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [97]   = P_input_sel == 360  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [96]   = P_input_sel == 361  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [95]   = P_input_sel == 362  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [94]   = P_input_sel == 363  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [93]   = P_input_sel == 364  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [92]   = P_input_sel == 365  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [91]   = P_input_sel == 366  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [90]   = P_input_sel == 367  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [89]   = P_input_sel == 368  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [88]   = P_input_sel == 369  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [87]   = P_input_sel == 370  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [86]   = P_input_sel == 371  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [85]   = P_input_sel == 372  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [84]   = P_input_sel == 373  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [83]   = P_input_sel == 374  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [82]   = P_input_sel == 375  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [81]   = P_input_sel == 376  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [80]   = P_input_sel == 377  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [79]   = P_input_sel == 378  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [78]   = P_input_sel == 379  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [77]   = P_input_sel == 380  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [76]   = P_input_sel == 381  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [75]   = P_input_sel == 382  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [74]   = P_input_sel == 383  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [73]   = P_input_sel == 384  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [72]   = P_input_sel == 385  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [71]   = P_input_sel == 386  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [70]   = P_input_sel == 387  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [69]   = P_input_sel == 388  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [68]   = P_input_sel == 389  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [67]   = P_input_sel == 390  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [66]   = P_input_sel == 391  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [65]   = P_input_sel == 392  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [64]   = P_input_sel == 393  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [63]   = P_input_sel == 394  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [62]   = P_input_sel == 395  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [61]   = P_input_sel == 396  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [60]   = P_input_sel == 397  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [59]   = P_input_sel == 398  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [58]   = P_input_sel == 399  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [57]   = P_input_sel == 400  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [56]   = P_input_sel == 401  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [55]   = P_input_sel == 402  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [54]   = P_input_sel == 403  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [53]   = P_input_sel == 404  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [52]   = P_input_sel == 405  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [51]   = P_input_sel == 406  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [50]   = P_input_sel == 407  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [49]   = P_input_sel == 408  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [48]   = P_input_sel == 409  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [47]   = P_input_sel == 410  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [46]   = P_input_sel == 411  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [45]   = P_input_sel == 412  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [44]   = P_input_sel == 413  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [43]   = P_input_sel == 414  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [42]   = P_input_sel == 415  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [41]   = P_input_sel == 416  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [40]   = P_input_sel == 417  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [39]   = P_input_sel == 418  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [38]   = P_input_sel == 419  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [37]   = P_input_sel == 420  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [36]   = P_input_sel == 421  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [35]   = P_input_sel == 422  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [34]   = P_input_sel == 423  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [33]   = P_input_sel == 424  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [32]   = P_input_sel == 425  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [31]   = P_input_sel == 426  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [30]   = P_input_sel == 427  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [29]   = P_input_sel == 428  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [28]   = P_input_sel == 429  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [27]   = P_input_sel == 430  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [26]   = P_input_sel == 431  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [25]   = P_input_sel == 432  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [24]   = P_input_sel == 433  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [23]   = P_input_sel == 434  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [22]   = P_input_sel == 435  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [21]   = P_input_sel == 436  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [20]   = P_input_sel == 437  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [19]   = P_input_sel == 438  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [18]   = P_input_sel == 439  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [17]   = P_input_sel == 440  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [16]   = P_input_sel == 441  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [15]   = P_input_sel == 442  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [14]   = P_input_sel == 443  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [13]   = P_input_sel == 444  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [12]   = P_input_sel == 445  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [11]   = P_input_sel == 446  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [10]   = P_input_sel == 447  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [9]   = P_input_sel == 448  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [8]   = P_input_sel == 449  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [7]   = P_input_sel == 450  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [6]   = P_input_sel == 451  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [5]   = P_input_sel == 452  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [4]   = P_input_sel == 453  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [3]   = P_input_sel == 454  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [2]   = P_input_sel == 455  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [1]   = P_input_sel == 456  ? P_input : 0;
 assign P_err_intro_q0_1_frmC [0]   = P_input_sel == 457  ? P_input : 0;
 assign P_err_intro   = P_input_sel == 458  ? P_input : 0;
 assign P_q0_0_frmC [207]   = P_input_sel == 459  ? P_input : 0;
 assign P_q0_0_frmC [206]   = P_input_sel == 460  ? P_input : 0;
 assign P_q0_0_frmC [205]   = P_input_sel == 461  ? P_input : 0;
 assign P_q0_0_frmC [204]   = P_input_sel == 462  ? P_input : 0;
 assign P_q0_0_frmC [203]   = P_input_sel == 463  ? P_input : 0;
 assign P_q0_0_frmC [202]   = P_input_sel == 464  ? P_input : 0;
 assign P_q0_0_frmC [201]   = P_input_sel == 465  ? P_input : 0;
 assign P_q0_0_frmC [200]   = P_input_sel == 466  ? P_input : 0;
 assign P_q0_0_frmC [199]   = P_input_sel == 467  ? P_input : 0;
 assign P_q0_0_frmC [198]   = P_input_sel == 468  ? P_input : 0;
 assign P_q0_0_frmC [197]   = P_input_sel == 469  ? P_input : 0;
 assign P_q0_0_frmC [196]   = P_input_sel == 470  ? P_input : 0;
 assign P_q0_0_frmC [195]   = P_input_sel == 471  ? P_input : 0;
 assign P_q0_0_frmC [194]   = P_input_sel == 472  ? P_input : 0;
 assign P_q0_0_frmC [193]   = P_input_sel == 473  ? P_input : 0;
 assign P_q0_0_frmC [192]   = P_input_sel == 474  ? P_input : 0;
 assign P_q0_0_frmC [191]   = P_input_sel == 475  ? P_input : 0;
 assign P_q0_0_frmC [190]   = P_input_sel == 476  ? P_input : 0;
 assign P_q0_0_frmC [189]   = P_input_sel == 477  ? P_input : 0;
 assign P_q0_0_frmC [188]   = P_input_sel == 478  ? P_input : 0;
 assign P_q0_0_frmC [187]   = P_input_sel == 479  ? P_input : 0;
 assign P_q0_0_frmC [186]   = P_input_sel == 480  ? P_input : 0;
 assign P_q0_0_frmC [185]   = P_input_sel == 481  ? P_input : 0;
 assign P_q0_0_frmC [184]   = P_input_sel == 482  ? P_input : 0;
 assign P_q0_0_frmC [183]   = P_input_sel == 483  ? P_input : 0;
 assign P_q0_0_frmC [182]   = P_input_sel == 484  ? P_input : 0;
 assign P_q0_0_frmC [181]   = P_input_sel == 485  ? P_input : 0;
 assign P_q0_0_frmC [180]   = P_input_sel == 486  ? P_input : 0;
 assign P_q0_0_frmC [179]   = P_input_sel == 487  ? P_input : 0;
 assign P_q0_0_frmC [178]   = P_input_sel == 488  ? P_input : 0;
 assign P_q0_0_frmC [177]   = P_input_sel == 489  ? P_input : 0;
 assign P_q0_0_frmC [176]   = P_input_sel == 490  ? P_input : 0;
 assign P_q0_0_frmC [175]   = P_input_sel == 491  ? P_input : 0;
 assign P_q0_0_frmC [174]   = P_input_sel == 492  ? P_input : 0;
 assign P_q0_0_frmC [173]   = P_input_sel == 493  ? P_input : 0;
 assign P_q0_0_frmC [172]   = P_input_sel == 494  ? P_input : 0;
 assign P_q0_0_frmC [171]   = P_input_sel == 495  ? P_input : 0;
 assign P_q0_0_frmC [170]   = P_input_sel == 496  ? P_input : 0;
 assign P_q0_0_frmC [169]   = P_input_sel == 497  ? P_input : 0;
 assign P_q0_0_frmC [168]   = P_input_sel == 498  ? P_input : 0;
 assign P_q0_0_frmC [167]   = P_input_sel == 499  ? P_input : 0;
 assign P_q0_0_frmC [166]   = P_input_sel == 500  ? P_input : 0;
 assign P_q0_0_frmC [165]   = P_input_sel == 501  ? P_input : 0;
 assign P_q0_0_frmC [164]   = P_input_sel == 502  ? P_input : 0;
 assign P_q0_0_frmC [163]   = P_input_sel == 503  ? P_input : 0;
 assign P_q0_0_frmC [162]   = P_input_sel == 504  ? P_input : 0;
 assign P_q0_0_frmC [161]   = P_input_sel == 505  ? P_input : 0;
 assign P_q0_0_frmC [160]   = P_input_sel == 506  ? P_input : 0;
 assign P_q0_0_frmC [159]   = P_input_sel == 507  ? P_input : 0;
 assign P_q0_0_frmC [158]   = P_input_sel == 508  ? P_input : 0;
 assign P_q0_0_frmC [157]   = P_input_sel == 509  ? P_input : 0;
 assign P_q0_0_frmC [156]   = P_input_sel == 510  ? P_input : 0;
 assign P_q0_0_frmC [155]   = P_input_sel == 511  ? P_input : 0;
 assign P_q0_0_frmC [154]   = P_input_sel == 512  ? P_input : 0;
 assign P_q0_0_frmC [153]   = P_input_sel == 513  ? P_input : 0;
 assign P_q0_0_frmC [152]   = P_input_sel == 514  ? P_input : 0;
 assign P_q0_0_frmC [151]   = P_input_sel == 515  ? P_input : 0;
 assign P_q0_0_frmC [150]   = P_input_sel == 516  ? P_input : 0;
 assign P_q0_0_frmC [149]   = P_input_sel == 517  ? P_input : 0;
 assign P_q0_0_frmC [148]   = P_input_sel == 518  ? P_input : 0;
 assign P_q0_0_frmC [147]   = P_input_sel == 519  ? P_input : 0;
 assign P_q0_0_frmC [146]   = P_input_sel == 520  ? P_input : 0;
 assign P_q0_0_frmC [145]   = P_input_sel == 521  ? P_input : 0;
 assign P_q0_0_frmC [144]   = P_input_sel == 522  ? P_input : 0;
 assign P_q0_0_frmC [143]   = P_input_sel == 523  ? P_input : 0;
 assign P_q0_0_frmC [142]   = P_input_sel == 524  ? P_input : 0;
 assign P_q0_0_frmC [141]   = P_input_sel == 525  ? P_input : 0;
 assign P_q0_0_frmC [140]   = P_input_sel == 526  ? P_input : 0;
 assign P_q0_0_frmC [139]   = P_input_sel == 527  ? P_input : 0;
 assign P_q0_0_frmC [138]   = P_input_sel == 528  ? P_input : 0;
 assign P_q0_0_frmC [137]   = P_input_sel == 529  ? P_input : 0;
 assign P_q0_0_frmC [136]   = P_input_sel == 530  ? P_input : 0;
 assign P_q0_0_frmC [135]   = P_input_sel == 531  ? P_input : 0;
 assign P_q0_0_frmC [134]   = P_input_sel == 532  ? P_input : 0;
 assign P_q0_0_frmC [133]   = P_input_sel == 533  ? P_input : 0;
 assign P_q0_0_frmC [132]   = P_input_sel == 534  ? P_input : 0;
 assign P_q0_0_frmC [131]   = P_input_sel == 535  ? P_input : 0;
 assign P_q0_0_frmC [130]   = P_input_sel == 536  ? P_input : 0;
 assign P_q0_0_frmC [129]   = P_input_sel == 537  ? P_input : 0;
 assign P_q0_0_frmC [128]   = P_input_sel == 538  ? P_input : 0;
 assign P_q0_0_frmC [127]   = P_input_sel == 539  ? P_input : 0;
 assign P_q0_0_frmC [126]   = P_input_sel == 540  ? P_input : 0;
 assign P_q0_0_frmC [125]   = P_input_sel == 541  ? P_input : 0;
 assign P_q0_0_frmC [124]   = P_input_sel == 542  ? P_input : 0;
 assign P_q0_0_frmC [123]   = P_input_sel == 543  ? P_input : 0;
 assign P_q0_0_frmC [122]   = P_input_sel == 544  ? P_input : 0;
 assign P_q0_0_frmC [121]   = P_input_sel == 545  ? P_input : 0;
 assign P_q0_0_frmC [120]   = P_input_sel == 546  ? P_input : 0;
 assign P_q0_0_frmC [119]   = P_input_sel == 547  ? P_input : 0;
 assign P_q0_0_frmC [118]   = P_input_sel == 548  ? P_input : 0;
 assign P_q0_0_frmC [117]   = P_input_sel == 549  ? P_input : 0;
 assign P_q0_0_frmC [116]   = P_input_sel == 550  ? P_input : 0;
 assign P_q0_0_frmC [115]   = P_input_sel == 551  ? P_input : 0;
 assign P_q0_0_frmC [114]   = P_input_sel == 552  ? P_input : 0;
 assign P_q0_0_frmC [113]   = P_input_sel == 553  ? P_input : 0;
 assign P_q0_0_frmC [112]   = P_input_sel == 554  ? P_input : 0;
 assign P_q0_0_frmC [111]   = P_input_sel == 555  ? P_input : 0;
 assign P_q0_0_frmC [110]   = P_input_sel == 556  ? P_input : 0;
 assign P_q0_0_frmC [109]   = P_input_sel == 557  ? P_input : 0;
 assign P_q0_0_frmC [108]   = P_input_sel == 558  ? P_input : 0;
 assign P_q0_0_frmC [107]   = P_input_sel == 559  ? P_input : 0;
 assign P_q0_0_frmC [106]   = P_input_sel == 560  ? P_input : 0;
 assign P_q0_0_frmC [105]   = P_input_sel == 561  ? P_input : 0;
 assign P_q0_0_frmC [104]   = P_input_sel == 562  ? P_input : 0;
 assign P_q0_0_frmC [103]   = P_input_sel == 563  ? P_input : 0;
 assign P_q0_0_frmC [102]   = P_input_sel == 564  ? P_input : 0;
 assign P_q0_0_frmC [101]   = P_input_sel == 565  ? P_input : 0;
 assign P_q0_0_frmC [100]   = P_input_sel == 566  ? P_input : 0;
 assign P_q0_0_frmC [99]   = P_input_sel == 567  ? P_input : 0;
 assign P_q0_0_frmC [98]   = P_input_sel == 568  ? P_input : 0;
 assign P_q0_0_frmC [97]   = P_input_sel == 569  ? P_input : 0;
 assign P_q0_0_frmC [96]   = P_input_sel == 570  ? P_input : 0;
 assign P_q0_0_frmC [95]   = P_input_sel == 571  ? P_input : 0;
 assign P_q0_0_frmC [94]   = P_input_sel == 572  ? P_input : 0;
 assign P_q0_0_frmC [93]   = P_input_sel == 573  ? P_input : 0;
 assign P_q0_0_frmC [92]   = P_input_sel == 574  ? P_input : 0;
 assign P_q0_0_frmC [91]   = P_input_sel == 575  ? P_input : 0;
 assign P_q0_0_frmC [90]   = P_input_sel == 576  ? P_input : 0;
 assign P_q0_0_frmC [89]   = P_input_sel == 577  ? P_input : 0;
 assign P_q0_0_frmC [88]   = P_input_sel == 578  ? P_input : 0;
 assign P_q0_0_frmC [87]   = P_input_sel == 579  ? P_input : 0;
 assign P_q0_0_frmC [86]   = P_input_sel == 580  ? P_input : 0;
 assign P_q0_0_frmC [85]   = P_input_sel == 581  ? P_input : 0;
 assign P_q0_0_frmC [84]   = P_input_sel == 582  ? P_input : 0;
 assign P_q0_0_frmC [83]   = P_input_sel == 583  ? P_input : 0;
 assign P_q0_0_frmC [82]   = P_input_sel == 584  ? P_input : 0;
 assign P_q0_0_frmC [81]   = P_input_sel == 585  ? P_input : 0;
 assign P_q0_0_frmC [80]   = P_input_sel == 586  ? P_input : 0;
 assign P_q0_0_frmC [79]   = P_input_sel == 587  ? P_input : 0;
 assign P_q0_0_frmC [78]   = P_input_sel == 588  ? P_input : 0;
 assign P_q0_0_frmC [77]   = P_input_sel == 589  ? P_input : 0;
 assign P_q0_0_frmC [76]   = P_input_sel == 590  ? P_input : 0;
 assign P_q0_0_frmC [75]   = P_input_sel == 591  ? P_input : 0;
 assign P_q0_0_frmC [74]   = P_input_sel == 592  ? P_input : 0;
 assign P_q0_0_frmC [73]   = P_input_sel == 593  ? P_input : 0;
 assign P_q0_0_frmC [72]   = P_input_sel == 594  ? P_input : 0;
 assign P_q0_0_frmC [71]   = P_input_sel == 595  ? P_input : 0;
 assign P_q0_0_frmC [70]   = P_input_sel == 596  ? P_input : 0;
 assign P_q0_0_frmC [69]   = P_input_sel == 597  ? P_input : 0;
 assign P_q0_0_frmC [68]   = P_input_sel == 598  ? P_input : 0;
 assign P_q0_0_frmC [67]   = P_input_sel == 599  ? P_input : 0;
 assign P_q0_0_frmC [66]   = P_input_sel == 600  ? P_input : 0;
 assign P_q0_0_frmC [65]   = P_input_sel == 601  ? P_input : 0;
 assign P_q0_0_frmC [64]   = P_input_sel == 602  ? P_input : 0;
 assign P_q0_0_frmC [63]   = P_input_sel == 603  ? P_input : 0;
 assign P_q0_0_frmC [62]   = P_input_sel == 604  ? P_input : 0;
 assign P_q0_0_frmC [61]   = P_input_sel == 605  ? P_input : 0;
 assign P_q0_0_frmC [60]   = P_input_sel == 606  ? P_input : 0;
 assign P_q0_0_frmC [59]   = P_input_sel == 607  ? P_input : 0;
 assign P_q0_0_frmC [58]   = P_input_sel == 608  ? P_input : 0;
 assign P_q0_0_frmC [57]   = P_input_sel == 609  ? P_input : 0;
 assign P_q0_0_frmC [56]   = P_input_sel == 610  ? P_input : 0;
 assign P_q0_0_frmC [55]   = P_input_sel == 611  ? P_input : 0;
 assign P_q0_0_frmC [54]   = P_input_sel == 612  ? P_input : 0;
 assign P_q0_0_frmC [53]   = P_input_sel == 613  ? P_input : 0;
 assign P_q0_0_frmC [52]   = P_input_sel == 614  ? P_input : 0;
 assign P_q0_0_frmC [51]   = P_input_sel == 615  ? P_input : 0;
 assign P_q0_0_frmC [50]   = P_input_sel == 616  ? P_input : 0;
 assign P_q0_0_frmC [49]   = P_input_sel == 617  ? P_input : 0;
 assign P_q0_0_frmC [48]   = P_input_sel == 618  ? P_input : 0;
 assign P_q0_0_frmC [47]   = P_input_sel == 619  ? P_input : 0;
 assign P_q0_0_frmC [46]   = P_input_sel == 620  ? P_input : 0;
 assign P_q0_0_frmC [45]   = P_input_sel == 621  ? P_input : 0;
 assign P_q0_0_frmC [44]   = P_input_sel == 622  ? P_input : 0;
 assign P_q0_0_frmC [43]   = P_input_sel == 623  ? P_input : 0;
 assign P_q0_0_frmC [42]   = P_input_sel == 624  ? P_input : 0;
 assign P_q0_0_frmC [41]   = P_input_sel == 625  ? P_input : 0;
 assign P_q0_0_frmC [40]   = P_input_sel == 626  ? P_input : 0;
 assign P_q0_0_frmC [39]   = P_input_sel == 627  ? P_input : 0;
 assign P_q0_0_frmC [38]   = P_input_sel == 628  ? P_input : 0;
 assign P_q0_0_frmC [37]   = P_input_sel == 629  ? P_input : 0;
 assign P_q0_0_frmC [36]   = P_input_sel == 630  ? P_input : 0;
 assign P_q0_0_frmC [35]   = P_input_sel == 631  ? P_input : 0;
 assign P_q0_0_frmC [34]   = P_input_sel == 632  ? P_input : 0;
 assign P_q0_0_frmC [33]   = P_input_sel == 633  ? P_input : 0;
 assign P_q0_0_frmC [32]   = P_input_sel == 634  ? P_input : 0;
 assign P_q0_0_frmC [31]   = P_input_sel == 635  ? P_input : 0;
 assign P_q0_0_frmC [30]   = P_input_sel == 636  ? P_input : 0;
 assign P_q0_0_frmC [29]   = P_input_sel == 637  ? P_input : 0;
 assign P_q0_0_frmC [28]   = P_input_sel == 638  ? P_input : 0;
 assign P_q0_0_frmC [27]   = P_input_sel == 639  ? P_input : 0;
 assign P_q0_0_frmC [26]   = P_input_sel == 640  ? P_input : 0;
 assign P_q0_0_frmC [25]   = P_input_sel == 641  ? P_input : 0;
 assign P_q0_0_frmC [24]   = P_input_sel == 642  ? P_input : 0;
 assign P_q0_0_frmC [23]   = P_input_sel == 643  ? P_input : 0;
 assign P_q0_0_frmC [22]   = P_input_sel == 644  ? P_input : 0;
 assign P_q0_0_frmC [21]   = P_input_sel == 645  ? P_input : 0;
 assign P_q0_0_frmC [20]   = P_input_sel == 646  ? P_input : 0;
 assign P_q0_0_frmC [19]   = P_input_sel == 647  ? P_input : 0;
 assign P_q0_0_frmC [18]   = P_input_sel == 648  ? P_input : 0;
 assign P_q0_0_frmC [17]   = P_input_sel == 649  ? P_input : 0;
 assign P_q0_0_frmC [16]   = P_input_sel == 650  ? P_input : 0;
 assign P_q0_0_frmC [15]   = P_input_sel == 651  ? P_input : 0;
 assign P_q0_0_frmC [14]   = P_input_sel == 652  ? P_input : 0;
 assign P_q0_0_frmC [13]   = P_input_sel == 653  ? P_input : 0;
 assign P_q0_0_frmC [12]   = P_input_sel == 654  ? P_input : 0;
 assign P_q0_0_frmC [11]   = P_input_sel == 655  ? P_input : 0;
 assign P_q0_0_frmC [10]   = P_input_sel == 656  ? P_input : 0;
 assign P_q0_0_frmC [9]   = P_input_sel == 657  ? P_input : 0;
 assign P_q0_0_frmC [8]   = P_input_sel == 658  ? P_input : 0;
 assign P_q0_0_frmC [7]   = P_input_sel == 659  ? P_input : 0;
 assign P_q0_0_frmC [6]   = P_input_sel == 660  ? P_input : 0;
 assign P_q0_0_frmC [5]   = P_input_sel == 661  ? P_input : 0;
 assign P_q0_0_frmC [4]   = P_input_sel == 662  ? P_input : 0;
 assign P_q0_0_frmC [3]   = P_input_sel == 663  ? P_input : 0;
 assign P_q0_0_frmC [2]   = P_input_sel == 664  ? P_input : 0;
 assign P_q0_0_frmC [1]   = P_input_sel == 665  ? P_input : 0;
 assign P_q0_0_frmC [0]   = P_input_sel == 666  ? P_input : 0;
 assign P_q0_1_frmC [207]   = P_input_sel == 667  ? P_input : 0;
 assign P_q0_1_frmC [206]   = P_input_sel == 668  ? P_input : 0;
 assign P_q0_1_frmC [205]   = P_input_sel == 669  ? P_input : 0;
 assign P_q0_1_frmC [204]   = P_input_sel == 670  ? P_input : 0;
 assign P_q0_1_frmC [203]   = P_input_sel == 671  ? P_input : 0;
 assign P_q0_1_frmC [202]   = P_input_sel == 672  ? P_input : 0;
 assign P_q0_1_frmC [201]   = P_input_sel == 673  ? P_input : 0;
 assign P_q0_1_frmC [200]   = P_input_sel == 674  ? P_input : 0;
 assign P_q0_1_frmC [199]   = P_input_sel == 675  ? P_input : 0;
 assign P_q0_1_frmC [198]   = P_input_sel == 676  ? P_input : 0;
 assign P_q0_1_frmC [197]   = P_input_sel == 677  ? P_input : 0;
 assign P_q0_1_frmC [196]   = P_input_sel == 678  ? P_input : 0;
 assign P_q0_1_frmC [195]   = P_input_sel == 679  ? P_input : 0;
 assign P_q0_1_frmC [194]   = P_input_sel == 680  ? P_input : 0;
 assign P_q0_1_frmC [193]   = P_input_sel == 681  ? P_input : 0;
 assign P_q0_1_frmC [192]   = P_input_sel == 682  ? P_input : 0;
 assign P_q0_1_frmC [191]   = P_input_sel == 683  ? P_input : 0;
 assign P_q0_1_frmC [190]   = P_input_sel == 684  ? P_input : 0;
 assign P_q0_1_frmC [189]   = P_input_sel == 685  ? P_input : 0;
 assign P_q0_1_frmC [188]   = P_input_sel == 686  ? P_input : 0;
 assign P_q0_1_frmC [187]   = P_input_sel == 687  ? P_input : 0;
 assign P_q0_1_frmC [186]   = P_input_sel == 688  ? P_input : 0;
 assign P_q0_1_frmC [185]   = P_input_sel == 689  ? P_input : 0;
 assign P_q0_1_frmC [184]   = P_input_sel == 690  ? P_input : 0;
 assign P_q0_1_frmC [183]   = P_input_sel == 691  ? P_input : 0;
 assign P_q0_1_frmC [182]   = P_input_sel == 692  ? P_input : 0;
 assign P_q0_1_frmC [181]   = P_input_sel == 693  ? P_input : 0;
 assign P_q0_1_frmC [180]   = P_input_sel == 694  ? P_input : 0;
 assign P_q0_1_frmC [179]   = P_input_sel == 695  ? P_input : 0;
 assign P_q0_1_frmC [178]   = P_input_sel == 696  ? P_input : 0;
 assign P_q0_1_frmC [177]   = P_input_sel == 697  ? P_input : 0;
 assign P_q0_1_frmC [176]   = P_input_sel == 698  ? P_input : 0;
 assign P_q0_1_frmC [175]   = P_input_sel == 699  ? P_input : 0;
 assign P_q0_1_frmC [174]   = P_input_sel == 700  ? P_input : 0;
 assign P_q0_1_frmC [173]   = P_input_sel == 701  ? P_input : 0;
 assign P_q0_1_frmC [172]   = P_input_sel == 702  ? P_input : 0;
 assign P_q0_1_frmC [171]   = P_input_sel == 703  ? P_input : 0;
 assign P_q0_1_frmC [170]   = P_input_sel == 704  ? P_input : 0;
 assign P_q0_1_frmC [169]   = P_input_sel == 705  ? P_input : 0;
 assign P_q0_1_frmC [168]   = P_input_sel == 706  ? P_input : 0;
 assign P_q0_1_frmC [167]   = P_input_sel == 707  ? P_input : 0;
 assign P_q0_1_frmC [166]   = P_input_sel == 708  ? P_input : 0;
 assign P_q0_1_frmC [165]   = P_input_sel == 709  ? P_input : 0;
 assign P_q0_1_frmC [164]   = P_input_sel == 710  ? P_input : 0;
 assign P_q0_1_frmC [163]   = P_input_sel == 711  ? P_input : 0;
 assign P_q0_1_frmC [162]   = P_input_sel == 712  ? P_input : 0;
 assign P_q0_1_frmC [161]   = P_input_sel == 713  ? P_input : 0;
 assign P_q0_1_frmC [160]   = P_input_sel == 714  ? P_input : 0;
 assign P_q0_1_frmC [159]   = P_input_sel == 715  ? P_input : 0;
 assign P_q0_1_frmC [158]   = P_input_sel == 716  ? P_input : 0;
 assign P_q0_1_frmC [157]   = P_input_sel == 717  ? P_input : 0;
 assign P_q0_1_frmC [156]   = P_input_sel == 718  ? P_input : 0;
 assign P_q0_1_frmC [155]   = P_input_sel == 719  ? P_input : 0;
 assign P_q0_1_frmC [154]   = P_input_sel == 720  ? P_input : 0;
 assign P_q0_1_frmC [153]   = P_input_sel == 721  ? P_input : 0;
 assign P_q0_1_frmC [152]   = P_input_sel == 722  ? P_input : 0;
 assign P_q0_1_frmC [151]   = P_input_sel == 723  ? P_input : 0;
 assign P_q0_1_frmC [150]   = P_input_sel == 724  ? P_input : 0;
 assign P_q0_1_frmC [149]   = P_input_sel == 725  ? P_input : 0;
 assign P_q0_1_frmC [148]   = P_input_sel == 726  ? P_input : 0;
 assign P_q0_1_frmC [147]   = P_input_sel == 727  ? P_input : 0;
 assign P_q0_1_frmC [146]   = P_input_sel == 728  ? P_input : 0;
 assign P_q0_1_frmC [145]   = P_input_sel == 729  ? P_input : 0;
 assign P_q0_1_frmC [144]   = P_input_sel == 730  ? P_input : 0;
 assign P_q0_1_frmC [143]   = P_input_sel == 731  ? P_input : 0;
 assign P_q0_1_frmC [142]   = P_input_sel == 732  ? P_input : 0;
 assign P_q0_1_frmC [141]   = P_input_sel == 733  ? P_input : 0;
 assign P_q0_1_frmC [140]   = P_input_sel == 734  ? P_input : 0;
 assign P_q0_1_frmC [139]   = P_input_sel == 735  ? P_input : 0;
 assign P_q0_1_frmC [138]   = P_input_sel == 736  ? P_input : 0;
 assign P_q0_1_frmC [137]   = P_input_sel == 737  ? P_input : 0;
 assign P_q0_1_frmC [136]   = P_input_sel == 738  ? P_input : 0;
 assign P_q0_1_frmC [135]   = P_input_sel == 739  ? P_input : 0;
 assign P_q0_1_frmC [134]   = P_input_sel == 740  ? P_input : 0;
 assign P_q0_1_frmC [133]   = P_input_sel == 741  ? P_input : 0;
 assign P_q0_1_frmC [132]   = P_input_sel == 742  ? P_input : 0;
 assign P_q0_1_frmC [131]   = P_input_sel == 743  ? P_input : 0;
 assign P_q0_1_frmC [130]   = P_input_sel == 744  ? P_input : 0;
 assign P_q0_1_frmC [129]   = P_input_sel == 745  ? P_input : 0;
 assign P_q0_1_frmC [128]   = P_input_sel == 746  ? P_input : 0;
 assign P_q0_1_frmC [127]   = P_input_sel == 747  ? P_input : 0;
 assign P_q0_1_frmC [126]   = P_input_sel == 748  ? P_input : 0;
 assign P_q0_1_frmC [125]   = P_input_sel == 749  ? P_input : 0;
 assign P_q0_1_frmC [124]   = P_input_sel == 750  ? P_input : 0;
 assign P_q0_1_frmC [123]   = P_input_sel == 751  ? P_input : 0;
 assign P_q0_1_frmC [122]   = P_input_sel == 752  ? P_input : 0;
 assign P_q0_1_frmC [121]   = P_input_sel == 753  ? P_input : 0;
 assign P_q0_1_frmC [120]   = P_input_sel == 754  ? P_input : 0;
 assign P_q0_1_frmC [119]   = P_input_sel == 755  ? P_input : 0;
 assign P_q0_1_frmC [118]   = P_input_sel == 756  ? P_input : 0;
 assign P_q0_1_frmC [117]   = P_input_sel == 757  ? P_input : 0;
 assign P_q0_1_frmC [116]   = P_input_sel == 758  ? P_input : 0;
 assign P_q0_1_frmC [115]   = P_input_sel == 759  ? P_input : 0;
 assign P_q0_1_frmC [114]   = P_input_sel == 760  ? P_input : 0;
 assign P_q0_1_frmC [113]   = P_input_sel == 761  ? P_input : 0;
 assign P_q0_1_frmC [112]   = P_input_sel == 762  ? P_input : 0;
 assign P_q0_1_frmC [111]   = P_input_sel == 763  ? P_input : 0;
 assign P_q0_1_frmC [110]   = P_input_sel == 764  ? P_input : 0;
 assign P_q0_1_frmC [109]   = P_input_sel == 765  ? P_input : 0;
 assign P_q0_1_frmC [108]   = P_input_sel == 766  ? P_input : 0;
 assign P_q0_1_frmC [107]   = P_input_sel == 767  ? P_input : 0;
 assign P_q0_1_frmC [106]   = P_input_sel == 768  ? P_input : 0;
 assign P_q0_1_frmC [105]   = P_input_sel == 769  ? P_input : 0;
 assign P_q0_1_frmC [104]   = P_input_sel == 770  ? P_input : 0;
 assign P_q0_1_frmC [103]   = P_input_sel == 771  ? P_input : 0;
 assign P_q0_1_frmC [102]   = P_input_sel == 772  ? P_input : 0;
 assign P_q0_1_frmC [101]   = P_input_sel == 773  ? P_input : 0;
 assign P_q0_1_frmC [100]   = P_input_sel == 774  ? P_input : 0;
 assign P_q0_1_frmC [99]   = P_input_sel == 775  ? P_input : 0;
 assign P_q0_1_frmC [98]   = P_input_sel == 776  ? P_input : 0;
 assign P_q0_1_frmC [97]   = P_input_sel == 777  ? P_input : 0;
 assign P_q0_1_frmC [96]   = P_input_sel == 778  ? P_input : 0;
 assign P_q0_1_frmC [95]   = P_input_sel == 779  ? P_input : 0;
 assign P_q0_1_frmC [94]   = P_input_sel == 780  ? P_input : 0;
 assign P_q0_1_frmC [93]   = P_input_sel == 781  ? P_input : 0;
 assign P_q0_1_frmC [92]   = P_input_sel == 782  ? P_input : 0;
 assign P_q0_1_frmC [91]   = P_input_sel == 783  ? P_input : 0;
 assign P_q0_1_frmC [90]   = P_input_sel == 784  ? P_input : 0;
 assign P_q0_1_frmC [89]   = P_input_sel == 785  ? P_input : 0;
 assign P_q0_1_frmC [88]   = P_input_sel == 786  ? P_input : 0;
 assign P_q0_1_frmC [87]   = P_input_sel == 787  ? P_input : 0;
 assign P_q0_1_frmC [86]   = P_input_sel == 788  ? P_input : 0;
 assign P_q0_1_frmC [85]   = P_input_sel == 789  ? P_input : 0;
 assign P_q0_1_frmC [84]   = P_input_sel == 790  ? P_input : 0;
 assign P_q0_1_frmC [83]   = P_input_sel == 791  ? P_input : 0;
 assign P_q0_1_frmC [82]   = P_input_sel == 792  ? P_input : 0;
 assign P_q0_1_frmC [81]   = P_input_sel == 793  ? P_input : 0;
 assign P_q0_1_frmC [80]   = P_input_sel == 794  ? P_input : 0;
 assign P_q0_1_frmC [79]   = P_input_sel == 795  ? P_input : 0;
 assign P_q0_1_frmC [78]   = P_input_sel == 796  ? P_input : 0;
 assign P_q0_1_frmC [77]   = P_input_sel == 797  ? P_input : 0;
 assign P_q0_1_frmC [76]   = P_input_sel == 798  ? P_input : 0;
 assign P_q0_1_frmC [75]   = P_input_sel == 799  ? P_input : 0;
 assign P_q0_1_frmC [74]   = P_input_sel == 800  ? P_input : 0;
 assign P_q0_1_frmC [73]   = P_input_sel == 801  ? P_input : 0;
 assign P_q0_1_frmC [72]   = P_input_sel == 802  ? P_input : 0;
 assign P_q0_1_frmC [71]   = P_input_sel == 803  ? P_input : 0;
 assign P_q0_1_frmC [70]   = P_input_sel == 804  ? P_input : 0;
 assign P_q0_1_frmC [69]   = P_input_sel == 805  ? P_input : 0;
 assign P_q0_1_frmC [68]   = P_input_sel == 806  ? P_input : 0;
 assign P_q0_1_frmC [67]   = P_input_sel == 807  ? P_input : 0;
 assign P_q0_1_frmC [66]   = P_input_sel == 808  ? P_input : 0;
 assign P_q0_1_frmC [65]   = P_input_sel == 809  ? P_input : 0;
 assign P_q0_1_frmC [64]   = P_input_sel == 810  ? P_input : 0;
 assign P_q0_1_frmC [63]   = P_input_sel == 811  ? P_input : 0;
 assign P_q0_1_frmC [62]   = P_input_sel == 812  ? P_input : 0;
 assign P_q0_1_frmC [61]   = P_input_sel == 813  ? P_input : 0;
 assign P_q0_1_frmC [60]   = P_input_sel == 814  ? P_input : 0;
 assign P_q0_1_frmC [59]   = P_input_sel == 815  ? P_input : 0;
 assign P_q0_1_frmC [58]   = P_input_sel == 816  ? P_input : 0;
 assign P_q0_1_frmC [57]   = P_input_sel == 817  ? P_input : 0;
 assign P_q0_1_frmC [56]   = P_input_sel == 818  ? P_input : 0;
 assign P_q0_1_frmC [55]   = P_input_sel == 819  ? P_input : 0;
 assign P_q0_1_frmC [54]   = P_input_sel == 820  ? P_input : 0;
 assign P_q0_1_frmC [53]   = P_input_sel == 821  ? P_input : 0;
 assign P_q0_1_frmC [52]   = P_input_sel == 822  ? P_input : 0;
 assign P_q0_1_frmC [51]   = P_input_sel == 823  ? P_input : 0;
 assign P_q0_1_frmC [50]   = P_input_sel == 824  ? P_input : 0;
 assign P_q0_1_frmC [49]   = P_input_sel == 825  ? P_input : 0;
 assign P_q0_1_frmC [48]   = P_input_sel == 826  ? P_input : 0;
 assign P_q0_1_frmC [47]   = P_input_sel == 827  ? P_input : 0;
 assign P_q0_1_frmC [46]   = P_input_sel == 828  ? P_input : 0;
 assign P_q0_1_frmC [45]   = P_input_sel == 829  ? P_input : 0;
 assign P_q0_1_frmC [44]   = P_input_sel == 830  ? P_input : 0;
 assign P_q0_1_frmC [43]   = P_input_sel == 831  ? P_input : 0;
 assign P_q0_1_frmC [42]   = P_input_sel == 832  ? P_input : 0;
 assign P_q0_1_frmC [41]   = P_input_sel == 833  ? P_input : 0;
 assign P_q0_1_frmC [40]   = P_input_sel == 834  ? P_input : 0;
 assign P_q0_1_frmC [39]   = P_input_sel == 835  ? P_input : 0;
 assign P_q0_1_frmC [38]   = P_input_sel == 836  ? P_input : 0;
 assign P_q0_1_frmC [37]   = P_input_sel == 837  ? P_input : 0;
 assign P_q0_1_frmC [36]   = P_input_sel == 838  ? P_input : 0;
 assign P_q0_1_frmC [35]   = P_input_sel == 839  ? P_input : 0;
 assign P_q0_1_frmC [34]   = P_input_sel == 840  ? P_input : 0;
 assign P_q0_1_frmC [33]   = P_input_sel == 841  ? P_input : 0;
 assign P_q0_1_frmC [32]   = P_input_sel == 842  ? P_input : 0;
 assign P_q0_1_frmC [31]   = P_input_sel == 843  ? P_input : 0;
 assign P_q0_1_frmC [30]   = P_input_sel == 844  ? P_input : 0;
 assign P_q0_1_frmC [29]   = P_input_sel == 845  ? P_input : 0;
 assign P_q0_1_frmC [28]   = P_input_sel == 846  ? P_input : 0;
 assign P_q0_1_frmC [27]   = P_input_sel == 847  ? P_input : 0;
 assign P_q0_1_frmC [26]   = P_input_sel == 848  ? P_input : 0;
 assign P_q0_1_frmC [25]   = P_input_sel == 849  ? P_input : 0;
 assign P_q0_1_frmC [24]   = P_input_sel == 850  ? P_input : 0;
 assign P_q0_1_frmC [23]   = P_input_sel == 851  ? P_input : 0;
 assign P_q0_1_frmC [22]   = P_input_sel == 852  ? P_input : 0;
 assign P_q0_1_frmC [21]   = P_input_sel == 853  ? P_input : 0;
 assign P_q0_1_frmC [20]   = P_input_sel == 854  ? P_input : 0;
 assign P_q0_1_frmC [19]   = P_input_sel == 855  ? P_input : 0;
 assign P_q0_1_frmC [18]   = P_input_sel == 856  ? P_input : 0;
 assign P_q0_1_frmC [17]   = P_input_sel == 857  ? P_input : 0;
 assign P_q0_1_frmC [16]   = P_input_sel == 858  ? P_input : 0;
 assign P_q0_1_frmC [15]   = P_input_sel == 859  ? P_input : 0;
 assign P_q0_1_frmC [14]   = P_input_sel == 860  ? P_input : 0;
 assign P_q0_1_frmC [13]   = P_input_sel == 861  ? P_input : 0;
 assign P_q0_1_frmC [12]   = P_input_sel == 862  ? P_input : 0;
 assign P_q0_1_frmC [11]   = P_input_sel == 863  ? P_input : 0;
 assign P_q0_1_frmC [10]   = P_input_sel == 864  ? P_input : 0;
 assign P_q0_1_frmC [9]   = P_input_sel == 865  ? P_input : 0;
 assign P_q0_1_frmC [8]   = P_input_sel == 866  ? P_input : 0;
 assign P_q0_1_frmC [7]   = P_input_sel == 867  ? P_input : 0;
 assign P_q0_1_frmC [6]   = P_input_sel == 868  ? P_input : 0;
 assign P_q0_1_frmC [5]   = P_input_sel == 869  ? P_input : 0;
 assign P_q0_1_frmC [4]   = P_input_sel == 870  ? P_input : 0;
 assign P_q0_1_frmC [3]   = P_input_sel == 871  ? P_input : 0;
 assign P_q0_1_frmC [2]   = P_input_sel == 872  ? P_input : 0;
 assign P_q0_1_frmC [1]   = P_input_sel == 873  ? P_input : 0;
 assign P_q0_1_frmC [0]   = P_input_sel == 874  ? P_input : 0;
 assign P_exp_syn [167]   = P_input_sel == 875  ? P_input : 0;
 assign P_exp_syn [166]   = P_input_sel == 876  ? P_input : 0;
 assign P_exp_syn [165]   = P_input_sel == 877  ? P_input : 0;
 assign P_exp_syn [164]   = P_input_sel == 878  ? P_input : 0;
 assign P_exp_syn [163]   = P_input_sel == 879  ? P_input : 0;
 assign P_exp_syn [162]   = P_input_sel == 880  ? P_input : 0;
 assign P_exp_syn [161]   = P_input_sel == 881  ? P_input : 0;
 assign P_exp_syn [160]   = P_input_sel == 882  ? P_input : 0;
 assign P_exp_syn [159]   = P_input_sel == 883  ? P_input : 0;
 assign P_exp_syn [158]   = P_input_sel == 884  ? P_input : 0;
 assign P_exp_syn [157]   = P_input_sel == 885  ? P_input : 0;
 assign P_exp_syn [156]   = P_input_sel == 886  ? P_input : 0;
 assign P_exp_syn [155]   = P_input_sel == 887  ? P_input : 0;
 assign P_exp_syn [154]   = P_input_sel == 888  ? P_input : 0;
 assign P_exp_syn [153]   = P_input_sel == 889  ? P_input : 0;
 assign P_exp_syn [152]   = P_input_sel == 890  ? P_input : 0;
 assign P_exp_syn [151]   = P_input_sel == 891  ? P_input : 0;
 assign P_exp_syn [150]   = P_input_sel == 892  ? P_input : 0;
 assign P_exp_syn [149]   = P_input_sel == 893  ? P_input : 0;
 assign P_exp_syn [148]   = P_input_sel == 894  ? P_input : 0;
 assign P_exp_syn [147]   = P_input_sel == 895  ? P_input : 0;
 assign P_exp_syn [146]   = P_input_sel == 896  ? P_input : 0;
 assign P_exp_syn [145]   = P_input_sel == 897  ? P_input : 0;
 assign P_exp_syn [144]   = P_input_sel == 898  ? P_input : 0;
 assign P_exp_syn [143]   = P_input_sel == 899  ? P_input : 0;
 assign P_exp_syn [142]   = P_input_sel == 900  ? P_input : 0;
 assign P_exp_syn [141]   = P_input_sel == 901  ? P_input : 0;
 assign P_exp_syn [140]   = P_input_sel == 902  ? P_input : 0;
 assign P_exp_syn [139]   = P_input_sel == 903  ? P_input : 0;
 assign P_exp_syn [138]   = P_input_sel == 904  ? P_input : 0;
 assign P_exp_syn [137]   = P_input_sel == 905  ? P_input : 0;
 assign P_exp_syn [136]   = P_input_sel == 906  ? P_input : 0;
 assign P_exp_syn [135]   = P_input_sel == 907  ? P_input : 0;
 assign P_exp_syn [134]   = P_input_sel == 908  ? P_input : 0;
 assign P_exp_syn [133]   = P_input_sel == 909  ? P_input : 0;
 assign P_exp_syn [132]   = P_input_sel == 910  ? P_input : 0;
 assign P_exp_syn [131]   = P_input_sel == 911  ? P_input : 0;
 assign P_exp_syn [130]   = P_input_sel == 912  ? P_input : 0;
 assign P_exp_syn [129]   = P_input_sel == 913  ? P_input : 0;
 assign P_exp_syn [128]   = P_input_sel == 914  ? P_input : 0;
 assign P_exp_syn [127]   = P_input_sel == 915  ? P_input : 0;
 assign P_exp_syn [126]   = P_input_sel == 916  ? P_input : 0;
 assign P_exp_syn [125]   = P_input_sel == 917  ? P_input : 0;
 assign P_exp_syn [124]   = P_input_sel == 918  ? P_input : 0;
 assign P_exp_syn [123]   = P_input_sel == 919  ? P_input : 0;
 assign P_exp_syn [122]   = P_input_sel == 920  ? P_input : 0;
 assign P_exp_syn [121]   = P_input_sel == 921  ? P_input : 0;
 assign P_exp_syn [120]   = P_input_sel == 922  ? P_input : 0;
 assign P_exp_syn [119]   = P_input_sel == 923  ? P_input : 0;
 assign P_exp_syn [118]   = P_input_sel == 924  ? P_input : 0;
 assign P_exp_syn [117]   = P_input_sel == 925  ? P_input : 0;
 assign P_exp_syn [116]   = P_input_sel == 926  ? P_input : 0;
 assign P_exp_syn [115]   = P_input_sel == 927  ? P_input : 0;
 assign P_exp_syn [114]   = P_input_sel == 928  ? P_input : 0;
 assign P_exp_syn [113]   = P_input_sel == 929  ? P_input : 0;
 assign P_exp_syn [112]   = P_input_sel == 930  ? P_input : 0;
 assign P_exp_syn [111]   = P_input_sel == 931  ? P_input : 0;
 assign P_exp_syn [110]   = P_input_sel == 932  ? P_input : 0;
 assign P_exp_syn [109]   = P_input_sel == 933  ? P_input : 0;
 assign P_exp_syn [108]   = P_input_sel == 934  ? P_input : 0;
 assign P_exp_syn [107]   = P_input_sel == 935  ? P_input : 0;
 assign P_exp_syn [106]   = P_input_sel == 936  ? P_input : 0;
 assign P_exp_syn [105]   = P_input_sel == 937  ? P_input : 0;
 assign P_exp_syn [104]   = P_input_sel == 938  ? P_input : 0;
 assign P_exp_syn [103]   = P_input_sel == 939  ? P_input : 0;
 assign P_exp_syn [102]   = P_input_sel == 940  ? P_input : 0;
 assign P_exp_syn [101]   = P_input_sel == 941  ? P_input : 0;
 assign P_exp_syn [100]   = P_input_sel == 942  ? P_input : 0;
 assign P_exp_syn [99]   = P_input_sel == 943  ? P_input : 0;
 assign P_exp_syn [98]   = P_input_sel == 944  ? P_input : 0;
 assign P_exp_syn [97]   = P_input_sel == 945  ? P_input : 0;
 assign P_exp_syn [96]   = P_input_sel == 946  ? P_input : 0;
 assign P_exp_syn [95]   = P_input_sel == 947  ? P_input : 0;
 assign P_exp_syn [94]   = P_input_sel == 948  ? P_input : 0;
 assign P_exp_syn [93]   = P_input_sel == 949  ? P_input : 0;
 assign P_exp_syn [92]   = P_input_sel == 950  ? P_input : 0;
 assign P_exp_syn [91]   = P_input_sel == 951  ? P_input : 0;
 assign P_exp_syn [90]   = P_input_sel == 952  ? P_input : 0;
 assign P_exp_syn [89]   = P_input_sel == 953  ? P_input : 0;
 assign P_exp_syn [88]   = P_input_sel == 954  ? P_input : 0;
 assign P_exp_syn [87]   = P_input_sel == 955  ? P_input : 0;
 assign P_exp_syn [86]   = P_input_sel == 956  ? P_input : 0;
 assign P_exp_syn [85]   = P_input_sel == 957  ? P_input : 0;
 assign P_exp_syn [84]   = P_input_sel == 958  ? P_input : 0;
 assign P_exp_syn [83]   = P_input_sel == 959  ? P_input : 0;
 assign P_exp_syn [82]   = P_input_sel == 960  ? P_input : 0;
 assign P_exp_syn [81]   = P_input_sel == 961  ? P_input : 0;
 assign P_exp_syn [80]   = P_input_sel == 962  ? P_input : 0;
 assign P_exp_syn [79]   = P_input_sel == 963  ? P_input : 0;
 assign P_exp_syn [78]   = P_input_sel == 964  ? P_input : 0;
 assign P_exp_syn [77]   = P_input_sel == 965  ? P_input : 0;
 assign P_exp_syn [76]   = P_input_sel == 966  ? P_input : 0;
 assign P_exp_syn [75]   = P_input_sel == 967  ? P_input : 0;
 assign P_exp_syn [74]   = P_input_sel == 968  ? P_input : 0;
 assign P_exp_syn [73]   = P_input_sel == 969  ? P_input : 0;
 assign P_exp_syn [72]   = P_input_sel == 970  ? P_input : 0;
 assign P_exp_syn [71]   = P_input_sel == 971  ? P_input : 0;
 assign P_exp_syn [70]   = P_input_sel == 972  ? P_input : 0;
 assign P_exp_syn [69]   = P_input_sel == 973  ? P_input : 0;
 assign P_exp_syn [68]   = P_input_sel == 974  ? P_input : 0;
 assign P_exp_syn [67]   = P_input_sel == 975  ? P_input : 0;
 assign P_exp_syn [66]   = P_input_sel == 976  ? P_input : 0;
 assign P_exp_syn [65]   = P_input_sel == 977  ? P_input : 0;
 assign P_exp_syn [64]   = P_input_sel == 978  ? P_input : 0;
 assign P_exp_syn [63]   = P_input_sel == 979  ? P_input : 0;
 assign P_exp_syn [62]   = P_input_sel == 980  ? P_input : 0;
 assign P_exp_syn [61]   = P_input_sel == 981  ? P_input : 0;
 assign P_exp_syn [60]   = P_input_sel == 982  ? P_input : 0;
 assign P_exp_syn [59]   = P_input_sel == 983  ? P_input : 0;
 assign P_exp_syn [58]   = P_input_sel == 984  ? P_input : 0;
 assign P_exp_syn [57]   = P_input_sel == 985  ? P_input : 0;
 assign P_exp_syn [56]   = P_input_sel == 986  ? P_input : 0;
 assign P_exp_syn [55]   = P_input_sel == 987  ? P_input : 0;
 assign P_exp_syn [54]   = P_input_sel == 988  ? P_input : 0;
 assign P_exp_syn [53]   = P_input_sel == 989  ? P_input : 0;
 assign P_exp_syn [52]   = P_input_sel == 990  ? P_input : 0;
 assign P_exp_syn [51]   = P_input_sel == 991  ? P_input : 0;
 assign P_exp_syn [50]   = P_input_sel == 992  ? P_input : 0;
 assign P_exp_syn [49]   = P_input_sel == 993  ? P_input : 0;
 assign P_exp_syn [48]   = P_input_sel == 994  ? P_input : 0;
 assign P_exp_syn [47]   = P_input_sel == 995  ? P_input : 0;
 assign P_exp_syn [46]   = P_input_sel == 996  ? P_input : 0;
 assign P_exp_syn [45]   = P_input_sel == 997  ? P_input : 0;
 assign P_exp_syn [44]   = P_input_sel == 998  ? P_input : 0;
 assign P_exp_syn [43]   = P_input_sel == 999  ? P_input : 0;
 assign P_exp_syn [42]   = P_input_sel == 1000  ? P_input : 0;
 assign P_exp_syn [41]   = P_input_sel == 1001  ? P_input : 0;
 assign P_exp_syn [40]   = P_input_sel == 1002  ? P_input : 0;
 assign P_exp_syn [39]   = P_input_sel == 1003  ? P_input : 0;
 assign P_exp_syn [38]   = P_input_sel == 1004  ? P_input : 0;
 assign P_exp_syn [37]   = P_input_sel == 1005  ? P_input : 0;
 assign P_exp_syn [36]   = P_input_sel == 1006  ? P_input : 0;
 assign P_exp_syn [35]   = P_input_sel == 1007  ? P_input : 0;
 assign P_exp_syn [34]   = P_input_sel == 1008  ? P_input : 0;
 assign P_exp_syn [33]   = P_input_sel == 1009  ? P_input : 0;
 assign P_exp_syn [32]   = P_input_sel == 1010  ? P_input : 0;
 assign P_exp_syn [31]   = P_input_sel == 1011  ? P_input : 0;
 assign P_exp_syn [30]   = P_input_sel == 1012  ? P_input : 0;
 assign P_exp_syn [29]   = P_input_sel == 1013  ? P_input : 0;
 assign P_exp_syn [28]   = P_input_sel == 1014  ? P_input : 0;
 assign P_exp_syn [27]   = P_input_sel == 1015  ? P_input : 0;
 assign P_exp_syn [26]   = P_input_sel == 1016  ? P_input : 0;
 assign P_exp_syn [25]   = P_input_sel == 1017  ? P_input : 0;
 assign P_exp_syn [24]   = P_input_sel == 1018  ? P_input : 0;
 assign P_exp_syn [23]   = P_input_sel == 1019  ? P_input : 0;
 assign P_exp_syn [22]   = P_input_sel == 1020  ? P_input : 0;
 assign P_exp_syn [21]   = P_input_sel == 1021  ? P_input : 0;
 assign P_exp_syn [20]   = P_input_sel == 1022  ? P_input : 0;
 assign P_exp_syn [19]   = P_input_sel == 1023  ? P_input : 0;
 assign P_exp_syn [18]   = P_input_sel == 1024  ? P_input : 0;
 assign P_exp_syn [17]   = P_input_sel == 1025  ? P_input : 0;
 assign P_exp_syn [16]   = P_input_sel == 1026  ? P_input : 0;
 assign P_exp_syn [15]   = P_input_sel == 1027  ? P_input : 0;
 assign P_exp_syn [14]   = P_input_sel == 1028  ? P_input : 0;
 assign P_exp_syn [13]   = P_input_sel == 1029  ? P_input : 0;
 assign P_exp_syn [12]   = P_input_sel == 1030  ? P_input : 0;
 assign P_exp_syn [11]   = P_input_sel == 1031  ? P_input : 0;
 assign P_exp_syn [10]   = P_input_sel == 1032  ? P_input : 0;
 assign P_exp_syn [9]   = P_input_sel == 1033  ? P_input : 0;
 assign P_exp_syn [8]   = P_input_sel == 1034  ? P_input : 0;
 assign P_exp_syn [7]   = P_input_sel == 1035  ? P_input : 0;
 assign P_exp_syn [6]   = P_input_sel == 1036  ? P_input : 0;
 assign P_exp_syn [5]   = P_input_sel == 1037  ? P_input : 0;
 assign P_exp_syn [4]   = P_input_sel == 1038  ? P_input : 0;
 assign P_exp_syn [3]   = P_input_sel == 1039  ? P_input : 0;
 assign P_exp_syn [2]   = P_input_sel == 1040  ? P_input : 0;
 assign P_exp_syn [1]   = P_input_sel == 1041  ? P_input : 0;
 assign P_exp_syn [0]   = P_input_sel == 1042  ? P_input : 0;
 assign P_percent_probability_int [31]   = P_input_sel == 1043  ? P_input : 0;
 assign P_percent_probability_int [30]   = P_input_sel == 1044  ? P_input : 0;
 assign P_percent_probability_int [29]   = P_input_sel == 1045  ? P_input : 0;
 assign P_percent_probability_int [28]   = P_input_sel == 1046  ? P_input : 0;
 assign P_percent_probability_int [27]   = P_input_sel == 1047  ? P_input : 0;
 assign P_percent_probability_int [26]   = P_input_sel == 1048  ? P_input : 0;
 assign P_percent_probability_int [25]   = P_input_sel == 1049  ? P_input : 0;
 assign P_percent_probability_int [24]   = P_input_sel == 1050  ? P_input : 0;
 assign P_percent_probability_int [23]   = P_input_sel == 1051  ? P_input : 0;
 assign P_percent_probability_int [22]   = P_input_sel == 1052  ? P_input : 0;
 assign P_percent_probability_int [21]   = P_input_sel == 1053  ? P_input : 0;
 assign P_percent_probability_int [20]   = P_input_sel == 1054  ? P_input : 0;
 assign P_percent_probability_int [19]   = P_input_sel == 1055  ? P_input : 0;
 assign P_percent_probability_int [18]   = P_input_sel == 1056  ? P_input : 0;
 assign P_percent_probability_int [17]   = P_input_sel == 1057  ? P_input : 0;
 assign P_percent_probability_int [16]   = P_input_sel == 1058  ? P_input : 0;
 assign P_percent_probability_int [15]   = P_input_sel == 1059  ? P_input : 0;
 assign P_percent_probability_int [14]   = P_input_sel == 1060  ? P_input : 0;
 assign P_percent_probability_int [13]   = P_input_sel == 1061  ? P_input : 0;
 assign P_percent_probability_int [12]   = P_input_sel == 1062  ? P_input : 0;
 assign P_percent_probability_int [11]   = P_input_sel == 1063  ? P_input : 0;
 assign P_percent_probability_int [10]   = P_input_sel == 1064  ? P_input : 0;
 assign P_percent_probability_int [9]   = P_input_sel == 1065  ? P_input : 0;
 assign P_percent_probability_int [8]   = P_input_sel == 1066  ? P_input : 0;
 assign P_percent_probability_int [7]   = P_input_sel == 1067  ? P_input : 0;
 assign P_percent_probability_int [6]   = P_input_sel == 1068  ? P_input : 0;
 assign P_percent_probability_int [5]   = P_input_sel == 1069  ? P_input : 0;
 assign P_percent_probability_int [4]   = P_input_sel == 1070  ? P_input : 0;
 assign P_percent_probability_int [3]   = P_input_sel == 1071  ? P_input : 0;
 assign P_percent_probability_int [2]   = P_input_sel == 1072  ? P_input : 0;
 assign P_percent_probability_int [1]   = P_input_sel == 1073  ? P_input : 0;
 assign P_percent_probability_int [0]   = P_input_sel == 1074  ? P_input : 0;
 assign P_HamDist_loop_max [15]   = P_input_sel == 1075  ? P_input : 0;
 assign P_HamDist_loop_max [14]   = P_input_sel == 1076  ? P_input : 0;
 assign P_HamDist_loop_max [13]   = P_input_sel == 1077  ? P_input : 0;
 assign P_HamDist_loop_max [12]   = P_input_sel == 1078  ? P_input : 0;
 assign P_HamDist_loop_max [11]   = P_input_sel == 1079  ? P_input : 0;
 assign P_HamDist_loop_max [10]   = P_input_sel == 1080  ? P_input : 0;
 assign P_HamDist_loop_max [9]   = P_input_sel == 1081  ? P_input : 0;
 assign P_HamDist_loop_max [8]   = P_input_sel == 1082  ? P_input : 0;
 assign P_HamDist_loop_max [7]   = P_input_sel == 1083  ? P_input : 0;
 assign P_HamDist_loop_max [6]   = P_input_sel == 1084  ? P_input : 0;
 assign P_HamDist_loop_max [5]   = P_input_sel == 1085  ? P_input : 0;
 assign P_HamDist_loop_max [4]   = P_input_sel == 1086  ? P_input : 0;
 assign P_HamDist_loop_max [3]   = P_input_sel == 1087  ? P_input : 0;
 assign P_HamDist_loop_max [2]   = P_input_sel == 1088  ? P_input : 0;
 assign P_HamDist_loop_max [1]   = P_input_sel == 1089  ? P_input : 0;
 assign P_HamDist_loop_max [0]   = P_input_sel == 1090  ? P_input : 0;
 assign P_ldpc_from_io [31]   = P_input_sel == 1091  ? P_input : 0;
 assign P_ldpc_from_io [30]   = P_input_sel == 1092  ? P_input : 0;
 assign P_ldpc_from_io [29]   = P_input_sel == 1093  ? P_input : 0;
 assign P_ldpc_from_io [28]   = P_input_sel == 1094  ? P_input : 0;
 assign P_ldpc_from_io [27]   = P_input_sel == 1095  ? P_input : 0;
 assign P_ldpc_from_io [26]   = P_input_sel == 1096  ? P_input : 0;
 assign P_ldpc_from_io [25]   = P_input_sel == 1097  ? P_input : 0;
 assign P_ldpc_from_io [24]   = P_input_sel == 1098  ? P_input : 0;
 assign P_ldpc_from_io [23]   = P_input_sel == 1099  ? P_input : 0;
 assign P_ldpc_from_io [22]   = P_input_sel == 1100  ? P_input : 0;
 assign P_ldpc_from_io [21]   = P_input_sel == 1101  ? P_input : 0;
 assign P_ldpc_from_io [20]   = P_input_sel == 1102  ? P_input : 0;
 assign P_ldpc_from_io [19]   = P_input_sel == 1103  ? P_input : 0;
 assign P_ldpc_from_io [18]   = P_input_sel == 1104  ? P_input : 0;
 assign P_ldpc_from_io [17]   = P_input_sel == 1105  ? P_input : 0;
 assign P_ldpc_from_io [16]   = P_input_sel == 1106  ? P_input : 0;
 assign P_ldpc_from_io [15]   = P_input_sel == 1107  ? P_input : 0;
 assign P_ldpc_from_io [14]   = P_input_sel == 1108  ? P_input : 0;
 assign P_ldpc_from_io [13]   = P_input_sel == 1109  ? P_input : 0;
 assign P_ldpc_from_io [12]   = P_input_sel == 1110  ? P_input : 0;
 assign P_ldpc_from_io [11]   = P_input_sel == 1111  ? P_input : 0;
 assign P_ldpc_from_io [10]   = P_input_sel == 1112  ? P_input : 0;
 assign P_ldpc_from_io [9]   = P_input_sel == 1113  ? P_input : 0;
 assign P_ldpc_from_io [8]   = P_input_sel == 1114  ? P_input : 0;
 assign P_ldpc_from_io [7]   = P_input_sel == 1115  ? P_input : 0;
 assign P_ldpc_from_io [6]   = P_input_sel == 1116  ? P_input : 0;
 assign P_ldpc_from_io [5]   = P_input_sel == 1117  ? P_input : 0;
 assign P_ldpc_from_io [4]   = P_input_sel == 1118  ? P_input : 0;
 assign P_ldpc_from_io [3]   = P_input_sel == 1119  ? P_input : 0;
 assign P_ldpc_from_io [2]   = P_input_sel == 1120  ? P_input : 0;
 assign P_ldpc_from_io [1]   = P_input_sel == 1121  ? P_input : 0;
 assign P_ldpc_from_io [0]   = P_input_sel == 1122  ? P_input : 0;
 assign P_HamDist_loop_percentage [15]   = P_input_sel == 1123  ? P_input : 0;
 assign P_HamDist_loop_percentage [14]   = P_input_sel == 1124  ? P_input : 0;
 assign P_HamDist_loop_percentage [13]   = P_input_sel == 1125  ? P_input : 0;
 assign P_HamDist_loop_percentage [12]   = P_input_sel == 1126  ? P_input : 0;
 assign P_HamDist_loop_percentage [11]   = P_input_sel == 1127  ? P_input : 0;
 assign P_HamDist_loop_percentage [10]   = P_input_sel == 1128  ? P_input : 0;
 assign P_HamDist_loop_percentage [9]   = P_input_sel == 1129  ? P_input : 0;
 assign P_HamDist_loop_percentage [8]   = P_input_sel == 1130  ? P_input : 0;
 assign P_HamDist_loop_percentage [7]   = P_input_sel == 1131  ? P_input : 0;
 assign P_HamDist_loop_percentage [6]   = P_input_sel == 1132  ? P_input : 0;
 assign P_HamDist_loop_percentage [5]   = P_input_sel == 1133  ? P_input : 0;
 assign P_HamDist_loop_percentage [4]   = P_input_sel == 1134  ? P_input : 0;
 assign P_HamDist_loop_percentage [3]   = P_input_sel == 1135  ? P_input : 0;
 assign P_HamDist_loop_percentage [2]   = P_input_sel == 1136  ? P_input : 0;
 assign P_HamDist_loop_percentage [1]   = P_input_sel == 1137  ? P_input : 0;
 assign P_HamDist_loop_percentage [0]   = P_input_sel == 1138  ? P_input : 0;
 assign P_HamDist_iir1 [15]   = P_input_sel == 1139  ? P_input : 0;
 assign P_HamDist_iir1 [14]   = P_input_sel == 1140  ? P_input : 0;
 assign P_HamDist_iir1 [13]   = P_input_sel == 1141  ? P_input : 0;
 assign P_HamDist_iir1 [12]   = P_input_sel == 1142  ? P_input : 0;
 assign P_HamDist_iir1 [11]   = P_input_sel == 1143  ? P_input : 0;
 assign P_HamDist_iir1 [10]   = P_input_sel == 1144  ? P_input : 0;
 assign P_HamDist_iir1 [9]   = P_input_sel == 1145  ? P_input : 0;
 assign P_HamDist_iir1 [8]   = P_input_sel == 1146  ? P_input : 0;
 assign P_HamDist_iir1 [7]   = P_input_sel == 1147  ? P_input : 0;
 assign P_HamDist_iir1 [6]   = P_input_sel == 1148  ? P_input : 0;
 assign P_HamDist_iir1 [5]   = P_input_sel == 1149  ? P_input : 0;
 assign P_HamDist_iir1 [4]   = P_input_sel == 1150  ? P_input : 0;
 assign P_HamDist_iir1 [3]   = P_input_sel == 1151  ? P_input : 0;
 assign P_HamDist_iir1 [2]   = P_input_sel == 1152  ? P_input : 0;
 assign P_HamDist_iir1 [1]   = P_input_sel == 1153  ? P_input : 0;
 assign P_HamDist_iir1 [0]   = P_input_sel == 1154  ? P_input : 0;
 assign P_HamDist_iir2 [15]   = P_input_sel == 1155  ? P_input : 0;
 assign P_HamDist_iir2 [14]   = P_input_sel == 1156  ? P_input : 0;
 assign P_HamDist_iir2 [13]   = P_input_sel == 1157  ? P_input : 0;
 assign P_HamDist_iir2 [12]   = P_input_sel == 1158  ? P_input : 0;
 assign P_HamDist_iir2 [11]   = P_input_sel == 1159  ? P_input : 0;
 assign P_HamDist_iir2 [10]   = P_input_sel == 1160  ? P_input : 0;
 assign P_HamDist_iir2 [9]   = P_input_sel == 1161  ? P_input : 0;
 assign P_HamDist_iir2 [8]   = P_input_sel == 1162  ? P_input : 0;
 assign P_HamDist_iir2 [7]   = P_input_sel == 1163  ? P_input : 0;
 assign P_HamDist_iir2 [6]   = P_input_sel == 1164  ? P_input : 0;
 assign P_HamDist_iir2 [5]   = P_input_sel == 1165  ? P_input : 0;
 assign P_HamDist_iir2 [4]   = P_input_sel == 1166  ? P_input : 0;
 assign P_HamDist_iir2 [3]   = P_input_sel == 1167  ? P_input : 0;
 assign P_HamDist_iir2 [2]   = P_input_sel == 1168  ? P_input : 0;
 assign P_HamDist_iir2 [1]   = P_input_sel == 1169  ? P_input : 0;
 assign P_HamDist_iir2 [0]   = P_input_sel == 1170  ? P_input : 0;
 assign P_HamDist_iir3 [15]   = P_input_sel == 1171  ? P_input : 0;
 assign P_HamDist_iir3 [14]   = P_input_sel == 1172  ? P_input : 0;
 assign P_HamDist_iir3 [13]   = P_input_sel == 1173  ? P_input : 0;
 assign P_HamDist_iir3 [12]   = P_input_sel == 1174  ? P_input : 0;
 assign P_HamDist_iir3 [11]   = P_input_sel == 1175  ? P_input : 0;
 assign P_HamDist_iir3 [10]   = P_input_sel == 1176  ? P_input : 0;
 assign P_HamDist_iir3 [9]   = P_input_sel == 1177  ? P_input : 0;
 assign P_HamDist_iir3 [8]   = P_input_sel == 1178  ? P_input : 0;
 assign P_HamDist_iir3 [7]   = P_input_sel == 1179  ? P_input : 0;
 assign P_HamDist_iir3 [6]   = P_input_sel == 1180  ? P_input : 0;
 assign P_HamDist_iir3 [5]   = P_input_sel == 1181  ? P_input : 0;
 assign P_HamDist_iir3 [4]   = P_input_sel == 1182  ? P_input : 0;
 assign P_HamDist_iir3 [3]   = P_input_sel == 1183  ? P_input : 0;
 assign P_HamDist_iir3 [2]   = P_input_sel == 1184  ? P_input : 0;
 assign P_HamDist_iir3 [1]   = P_input_sel == 1185  ? P_input : 0;
 assign P_HamDist_iir3 [0]   = P_input_sel == 1186  ? P_input : 0;
 assign P_start_dec   = P_input_sel == 1187  ? P_input : 0;
 assign P_reg_mprj_slave [31]   = P_input_sel == 1188  ? P_input : 0;
 assign P_reg_mprj_slave [30]   = P_input_sel == 1189  ? P_input : 0;
 assign P_reg_mprj_slave [29]   = P_input_sel == 1190  ? P_input : 0;
 assign P_reg_mprj_slave [28]   = P_input_sel == 1191  ? P_input : 0;
 assign P_reg_mprj_slave [27]   = P_input_sel == 1192  ? P_input : 0;
 assign P_reg_mprj_slave [26]   = P_input_sel == 1193  ? P_input : 0;
 assign P_reg_mprj_slave [25]   = P_input_sel == 1194  ? P_input : 0;
 assign P_reg_mprj_slave [24]   = P_input_sel == 1195  ? P_input : 0;
 assign P_reg_mprj_slave [23]   = P_input_sel == 1196  ? P_input : 0;
 assign P_reg_mprj_slave [22]   = P_input_sel == 1197  ? P_input : 0;
 assign P_reg_mprj_slave [21]   = P_input_sel == 1198  ? P_input : 0;
 assign P_reg_mprj_slave [20]   = P_input_sel == 1199  ? P_input : 0;
 assign P_reg_mprj_slave [19]   = P_input_sel == 1200  ? P_input : 0;
 assign P_reg_mprj_slave [18]   = P_input_sel == 1201  ? P_input : 0;
 assign P_reg_mprj_slave [17]   = P_input_sel == 1202  ? P_input : 0;
 assign P_reg_mprj_slave [16]   = P_input_sel == 1203  ? P_input : 0;
 assign P_reg_mprj_slave [15]   = P_input_sel == 1204  ? P_input : 0;
 assign P_reg_mprj_slave [14]   = P_input_sel == 1205  ? P_input : 0;
 assign P_reg_mprj_slave [13]   = P_input_sel == 1206  ? P_input : 0;
 assign P_reg_mprj_slave [12]   = P_input_sel == 1207  ? P_input : 0;
 assign P_reg_mprj_slave [11]   = P_input_sel == 1208  ? P_input : 0;
 assign P_reg_mprj_slave [10]   = P_input_sel == 1209  ? P_input : 0;
 assign P_reg_mprj_slave [9]   = P_input_sel == 1210  ? P_input : 0;
 assign P_reg_mprj_slave [8]   = P_input_sel == 1211  ? P_input : 0;
 assign P_reg_mprj_slave [7]   = P_input_sel == 1212  ? P_input : 0;
 assign P_reg_mprj_slave [6]   = P_input_sel == 1213  ? P_input : 0;
 assign P_reg_mprj_slave [5]   = P_input_sel == 1214  ? P_input : 0;
 assign P_reg_mprj_slave [4]   = P_input_sel == 1215  ? P_input : 0;
 assign P_reg_mprj_slave [3]   = P_input_sel == 1216  ? P_input : 0;
 assign P_reg_mprj_slave [2]   = P_input_sel == 1217  ? P_input : 0;
 assign P_reg_mprj_slave [1]   = P_input_sel == 1218  ? P_input : 0;
 assign P_reg_mprj_slave [0]   = P_input_sel == 1219  ? P_input : 0;
 assign P_pass_fail   = P_input_sel == 1220  ? P_input : 0;
////////////////////////////////////////////////////////////////////////
always_comb begin
 case (PO_output_sel)
   (0   )  : PO_output   =     PO_y_nr_enc [0] ;
   (1   )  : PO_output   =     PO_y_nr_enc [1] ;
   (2   )  : PO_output   =     PO_y_nr_enc [2] ;
   (3   )  : PO_output   =     PO_y_nr_enc [3] ;
   (4   )  : PO_output   =     PO_y_nr_enc [4] ;
   (5   )  : PO_output   =     PO_y_nr_enc [5] ;
   (6   )  : PO_output   =     PO_y_nr_enc [6] ;
   (7   )  : PO_output   =     PO_y_nr_enc [7] ;
   (8   )  : PO_output   =     PO_y_nr_enc [8] ;
   (9   )  : PO_output   =     PO_y_nr_enc [9] ;
   (10  )  : PO_output   =     PO_y_nr_enc [10] ;
   (11  )  : PO_output   =     PO_y_nr_enc [11] ;
   (12  )  : PO_output   =     PO_y_nr_enc [12] ;
   (13  )  : PO_output   =     PO_y_nr_enc [13] ;
   (14  )  : PO_output   =     PO_y_nr_enc [14] ;
   (15  )  : PO_output   =     PO_y_nr_enc [15] ;
   (16  )  : PO_output   =     PO_y_nr_enc [16] ;
   (17  )  : PO_output   =     PO_y_nr_enc [17] ;
   (18  )  : PO_output   =     PO_y_nr_enc [18] ;
   (19  )  : PO_output   =     PO_y_nr_enc [19] ;
   (20  )  : PO_output   =     PO_y_nr_enc [20] ;
   (21  )  : PO_output   =     PO_y_nr_enc [21] ;
   (22  )  : PO_output   =     PO_y_nr_enc [22] ;
   (23  )  : PO_output   =     PO_y_nr_enc [23] ;
   (24  )  : PO_output   =     PO_y_nr_enc [24] ;
   (25  )  : PO_output   =     PO_y_nr_enc [25] ;
   (26  )  : PO_output   =     PO_y_nr_enc [26] ;
   (27  )  : PO_output   =     PO_y_nr_enc [27] ;
   (28  )  : PO_output   =     PO_y_nr_enc [28] ;
   (29  )  : PO_output   =     PO_y_nr_enc [29] ;
   (30  )  : PO_output   =     PO_y_nr_enc [30] ;
   (31  )  : PO_output   =     PO_y_nr_enc [31] ;
   (32  )  : PO_output   =     PO_y_nr_enc [32] ;
   (33  )  : PO_output   =     PO_y_nr_enc [33] ;
   (34  )  : PO_output   =     PO_y_nr_enc [34] ;
   (35  )  : PO_output   =     PO_y_nr_enc [35] ;
   (36  )  : PO_output   =     PO_y_nr_enc [36] ;
   (37  )  : PO_output   =     PO_y_nr_enc [37] ;
   (38  )  : PO_output   =     PO_y_nr_enc [38] ;
   (39  )  : PO_output   =     PO_y_nr_enc [39] ;
   (40  )  : PO_output   =     PO_y_nr_enc [40] ;
   (41  )  : PO_output   =     PO_y_nr_enc [41] ;
   (42  )  : PO_output   =     PO_y_nr_enc [42] ;
   (43  )  : PO_output   =     PO_y_nr_enc [43] ;
   (44  )  : PO_output   =     PO_y_nr_enc [44] ;
   (45  )  : PO_output   =     PO_y_nr_enc [45] ;
   (46  )  : PO_output   =     PO_y_nr_enc [46] ;
   (47  )  : PO_output   =     PO_y_nr_enc [47] ;
   (48  )  : PO_output   =     PO_y_nr_enc [48] ;
   (49  )  : PO_output   =     PO_y_nr_enc [49] ;
   (50  )  : PO_output   =     PO_y_nr_enc [50] ;
   (51  )  : PO_output   =     PO_y_nr_enc [51] ;
   (52  )  : PO_output   =     PO_y_nr_enc [52] ;
   (53  )  : PO_output   =     PO_y_nr_enc [53] ;
   (54  )  : PO_output   =     PO_y_nr_enc [54] ;
   (55  )  : PO_output   =     PO_y_nr_enc [55] ;
   (56  )  : PO_output   =     PO_y_nr_enc [56] ;
   (57  )  : PO_output   =     PO_y_nr_enc [57] ;
   (58  )  : PO_output   =     PO_y_nr_enc [58] ;
   (59  )  : PO_output   =     PO_y_nr_enc [59] ;
   (60  )  : PO_output   =     PO_y_nr_enc [60] ;
   (61  )  : PO_output   =     PO_y_nr_enc [61] ;
   (62  )  : PO_output   =     PO_y_nr_enc [62] ;
   (63  )  : PO_output   =     PO_y_nr_enc [63] ;
   (64  )  : PO_output   =     PO_y_nr_enc [64] ;
   (65  )  : PO_output   =     PO_y_nr_enc [65] ;
   (66  )  : PO_output   =     PO_y_nr_enc [66] ;
   (67  )  : PO_output   =     PO_y_nr_enc [67] ;
   (68  )  : PO_output   =     PO_y_nr_enc [68] ;
   (69  )  : PO_output   =     PO_y_nr_enc [69] ;
   (70  )  : PO_output   =     PO_y_nr_enc [70] ;
   (71  )  : PO_output   =     PO_y_nr_enc [71] ;
   (72  )  : PO_output   =     PO_y_nr_enc [72] ;
   (73  )  : PO_output   =     PO_y_nr_enc [73] ;
   (74  )  : PO_output   =     PO_y_nr_enc [74] ;
   (75  )  : PO_output   =     PO_y_nr_enc [75] ;
   (76  )  : PO_output   =     PO_y_nr_enc [76] ;
   (77  )  : PO_output   =     PO_y_nr_enc [77] ;
   (78  )  : PO_output   =     PO_y_nr_enc [78] ;
   (79  )  : PO_output   =     PO_y_nr_enc [79] ;
   (80  )  : PO_output   =     PO_y_nr_enc [80] ;
   (81  )  : PO_output   =     PO_y_nr_enc [81] ;
   (82  )  : PO_output   =     PO_y_nr_enc [82] ;
   (83  )  : PO_output   =     PO_y_nr_enc [83] ;
   (84  )  : PO_output   =     PO_y_nr_enc [84] ;
   (85  )  : PO_output   =     PO_y_nr_enc [85] ;
   (86  )  : PO_output   =     PO_y_nr_enc [86] ;
   (87  )  : PO_output   =     PO_y_nr_enc [87] ;
   (88  )  : PO_output   =     PO_y_nr_enc [88] ;
   (89  )  : PO_output   =     PO_y_nr_enc [89] ;
   (90  )  : PO_output   =     PO_y_nr_enc [90] ;
   (91  )  : PO_output   =     PO_y_nr_enc [91] ;
   (92  )  : PO_output   =     PO_y_nr_enc [92] ;
   (93  )  : PO_output   =     PO_y_nr_enc [93] ;
   (94  )  : PO_output   =     PO_y_nr_enc [94] ;
   (95  )  : PO_output   =     PO_y_nr_enc [95] ;
   (96  )  : PO_output   =     PO_y_nr_enc [96] ;
   (97  )  : PO_output   =     PO_y_nr_enc [97] ;
   (98  )  : PO_output   =     PO_y_nr_enc [98] ;
   (99  )  : PO_output   =     PO_y_nr_enc [99] ;
   (100 )  : PO_output   =      PO_y_nr_enc [100] ;
   (101 )  : PO_output   =      PO_y_nr_enc [101] ;
   (102 )  : PO_output   =      PO_y_nr_enc [102] ;
   (103 )  : PO_output   =      PO_y_nr_enc [103] ;
   (104 )  : PO_output   =      PO_y_nr_enc [104] ;
   (105 )  : PO_output   =      PO_y_nr_enc [105] ;
   (106 )  : PO_output   =      PO_y_nr_enc [106] ;
   (107 )  : PO_output   =      PO_y_nr_enc [107] ;
   (108 )  : PO_output   =      PO_y_nr_enc [108] ;
   (109 )  : PO_output   =      PO_y_nr_enc [109] ;
   (110 )  : PO_output   =      PO_y_nr_enc [110] ;
   (111 )  : PO_output   =      PO_y_nr_enc [111] ;
   (112 )  : PO_output   =      PO_y_nr_enc [112] ;
   (113 )  : PO_output   =      PO_y_nr_enc [113] ;
   (114 )  : PO_output   =      PO_y_nr_enc [114] ;
   (115 )  : PO_output   =      PO_y_nr_enc [115] ;
   (116 )  : PO_output   =      PO_y_nr_enc [116] ;
   (117 )  : PO_output   =      PO_y_nr_enc [117] ;
   (118 )  : PO_output   =      PO_y_nr_enc [118] ;
   (119 )  : PO_output   =      PO_y_nr_enc [119] ;
   (120 )  : PO_output   =      PO_y_nr_enc [120] ;
   (121 )  : PO_output   =      PO_y_nr_enc [121] ;
   (122 )  : PO_output   =      PO_y_nr_enc [122] ;
   (123 )  : PO_output   =      PO_y_nr_enc [123] ;
   (124 )  : PO_output   =      PO_y_nr_enc [124] ;
   (125 )  : PO_output   =      PO_y_nr_enc [125] ;
   (126 )  : PO_output   =      PO_y_nr_enc [126] ;
   (127 )  : PO_output   =      PO_y_nr_enc [127] ;
   (128 )  : PO_output   =      PO_y_nr_enc [128] ;
   (129 )  : PO_output   =      PO_y_nr_enc [129] ;
   (130 )  : PO_output   =      PO_y_nr_enc [130] ;
   (131 )  : PO_output   =      PO_y_nr_enc [131] ;
   (132 )  : PO_output   =      PO_y_nr_enc [132] ;
   (133 )  : PO_output   =      PO_y_nr_enc [133] ;
   (134 )  : PO_output   =      PO_y_nr_enc [134] ;
   (135 )  : PO_output   =      PO_y_nr_enc [135] ;
   (136 )  : PO_output   =      PO_y_nr_enc [136] ;
   (137 )  : PO_output   =      PO_y_nr_enc [137] ;
   (138 )  : PO_output   =      PO_y_nr_enc [138] ;
   (139 )  : PO_output   =      PO_y_nr_enc [139] ;
   (140 )  : PO_output   =      PO_y_nr_enc [140] ;
   (141 )  : PO_output   =      PO_y_nr_enc [141] ;
   (142 )  : PO_output   =      PO_y_nr_enc [142] ;
   (143 )  : PO_output   =      PO_y_nr_enc [143] ;
   (144 )  : PO_output   =      PO_y_nr_enc [144] ;
   (145 )  : PO_output   =      PO_y_nr_enc [145] ;
   (146 )  : PO_output   =      PO_y_nr_enc [146] ;
   (147 )  : PO_output   =      PO_y_nr_enc [147] ;
   (148 )  : PO_output   =      PO_y_nr_enc [148] ;
   (149 )  : PO_output   =      PO_y_nr_enc [149] ;
   (150 )  : PO_output   =      PO_y_nr_enc [150] ;
   (151 )  : PO_output   =      PO_y_nr_enc [151] ;
   (152 )  : PO_output   =      PO_y_nr_enc [152] ;
   (153 )  : PO_output   =      PO_y_nr_enc [153] ;
   (154 )  : PO_output   =      PO_y_nr_enc [154] ;
   (155 )  : PO_output   =      PO_y_nr_enc [155] ;
   (156 )  : PO_output   =      PO_y_nr_enc [156] ;
   (157 )  : PO_output   =      PO_y_nr_enc [157] ;
   (158 )  : PO_output   =      PO_y_nr_enc [158] ;
   (159 )  : PO_output   =      PO_y_nr_enc [159] ;
   (160 )  : PO_output   =      PO_y_nr_enc [160] ;
   (161 )  : PO_output   =      PO_y_nr_enc [161] ;
   (162 )  : PO_output   =      PO_y_nr_enc [162] ;
   (163 )  : PO_output   =      PO_y_nr_enc [163] ;
   (164 )  : PO_output   =      PO_y_nr_enc [164] ;
   (165 )  : PO_output   =      PO_y_nr_enc [165] ;
   (166 )  : PO_output   =      PO_y_nr_enc [166] ;
   (167 )  : PO_output   =      PO_y_nr_enc [167] ;
   (168 )  : PO_output   =      PO_y_nr_enc [168] ;
   (169 )  : PO_output   =      PO_y_nr_enc [169] ;
   (170 )  : PO_output   =      PO_y_nr_enc [170] ;
   (171 )  : PO_output   =      PO_y_nr_enc [171] ;
   (172 )  : PO_output   =      PO_y_nr_enc [172] ;
   (173 )  : PO_output   =      PO_y_nr_enc [173] ;
   (174 )  : PO_output   =      PO_y_nr_enc [174] ;
   (175 )  : PO_output   =      PO_y_nr_enc [175] ;
   (176 )  : PO_output   =      PO_y_nr_enc [176] ;
   (177 )  : PO_output   =      PO_y_nr_enc [177] ;
   (178 )  : PO_output   =      PO_y_nr_enc [178] ;
   (179 )  : PO_output   =      PO_y_nr_enc [179] ;
   (180 )  : PO_output   =      PO_y_nr_enc [180] ;
   (181 )  : PO_output   =      PO_y_nr_enc [181] ;
   (182 )  : PO_output   =      PO_y_nr_enc [182] ;
   (183 )  : PO_output   =      PO_y_nr_enc [183] ;
   (184 )  : PO_output   =      PO_y_nr_enc [184] ;
   (185 )  : PO_output   =      PO_y_nr_enc [185] ;
   (186 )  : PO_output   =      PO_y_nr_enc [186] ;
   (187 )  : PO_output   =      PO_y_nr_enc [187] ;
   (188 )  : PO_output   =      PO_y_nr_enc [188] ;
   (189 )  : PO_output   =      PO_y_nr_enc [189] ;
   (190 )  : PO_output   =      PO_y_nr_enc [190] ;
   (191 )  : PO_output   =      PO_y_nr_enc [191] ;
   (192 )  : PO_output   =      PO_y_nr_enc [192] ;
   (193 )  : PO_output   =      PO_y_nr_enc [193] ;
   (194 )  : PO_output   =      PO_y_nr_enc [194] ;
   (195 )  : PO_output   =      PO_y_nr_enc [195] ;
   (196 )  : PO_output   =      PO_y_nr_enc [196] ;
   (197 )  : PO_output   =      PO_y_nr_enc [197] ;
   (198 )  : PO_output   =      PO_y_nr_enc [198] ;
   (199 )  : PO_output   =      PO_y_nr_enc [199] ;
   (200 )  : PO_output   =      PO_y_nr_enc [200] ;
   (201 )  : PO_output   =      PO_y_nr_enc [201] ;
   (202 )  : PO_output   =      PO_y_nr_enc [202] ;
   (203 )  : PO_output   =      PO_y_nr_enc [203] ;
   (204 )  : PO_output   =      PO_y_nr_enc [204] ;
   (205 )  : PO_output   =      PO_y_nr_enc [205] ;
   (206 )  : PO_output   =      PO_y_nr_enc [206] ;
   (207 )  : PO_output   =      PO_y_nr_enc [207] ;
   (208 )  : PO_output   =      PO_final_y_nr_dec [0] ;
   (209 )  : PO_output   =      PO_final_y_nr_dec [1] ;
   (210 )  : PO_output   =      PO_final_y_nr_dec [2] ;
   (211 )  : PO_output   =      PO_final_y_nr_dec [3] ;
   (212 )  : PO_output   =      PO_final_y_nr_dec [4] ;
   (213 )  : PO_output   =      PO_final_y_nr_dec [5] ;
   (214 )  : PO_output   =      PO_final_y_nr_dec [6] ;
   (215 )  : PO_output   =      PO_final_y_nr_dec [7] ;
   (216 )  : PO_output   =      PO_final_y_nr_dec [8] ;
   (217 )  : PO_output   =      PO_final_y_nr_dec [9] ;
   (218 )  : PO_output   =      PO_final_y_nr_dec [10] ;
   (219 )  : PO_output   =      PO_final_y_nr_dec [11] ;
   (220 )  : PO_output   =      PO_final_y_nr_dec [12] ;
   (221 )  : PO_output   =      PO_final_y_nr_dec [13] ;
   (222 )  : PO_output   =      PO_final_y_nr_dec [14] ;
   (223 )  : PO_output   =      PO_final_y_nr_dec [15] ;
   (224 )  : PO_output   =      PO_final_y_nr_dec [16] ;
   (225 )  : PO_output   =      PO_final_y_nr_dec [17] ;
   (226 )  : PO_output   =      PO_final_y_nr_dec [18] ;
   (227 )  : PO_output   =      PO_final_y_nr_dec [19] ;
   (228 )  : PO_output   =      PO_final_y_nr_dec [20] ;
   (229 )  : PO_output   =      PO_final_y_nr_dec [21] ;
   (230 )  : PO_output   =      PO_final_y_nr_dec [22] ;
   (231 )  : PO_output   =      PO_final_y_nr_dec [23] ;
   (232 )  : PO_output   =      PO_final_y_nr_dec [24] ;
   (233 )  : PO_output   =      PO_final_y_nr_dec [25] ;
   (234 )  : PO_output   =      PO_final_y_nr_dec [26] ;
   (235 )  : PO_output   =      PO_final_y_nr_dec [27] ;
   (236 )  : PO_output   =      PO_final_y_nr_dec [28] ;
   (237 )  : PO_output   =      PO_final_y_nr_dec [29] ;
   (238 )  : PO_output   =      PO_final_y_nr_dec [30] ;
   (239 )  : PO_output   =      PO_final_y_nr_dec [31] ;
   (240 )  : PO_output   =      PO_final_y_nr_dec [32] ;
   (241 )  : PO_output   =      PO_final_y_nr_dec [33] ;
   (242 )  : PO_output   =      PO_final_y_nr_dec [34] ;
   (243 )  : PO_output   =      PO_final_y_nr_dec [35] ;
   (244 )  : PO_output   =      PO_final_y_nr_dec [36] ;
   (245 )  : PO_output   =      PO_final_y_nr_dec [37] ;
   (246 )  : PO_output   =      PO_final_y_nr_dec [38] ;
   (247 )  : PO_output   =      PO_final_y_nr_dec [39] ;
   (248 )  : PO_output   =      PO_final_y_nr_dec [40] ;
   (249 )  : PO_output   =      PO_final_y_nr_dec [41] ;
   (250 )  : PO_output   =      PO_final_y_nr_dec [42] ;
   (251 )  : PO_output   =      PO_final_y_nr_dec [43] ;
   (252 )  : PO_output   =      PO_final_y_nr_dec [44] ;
   (253 )  : PO_output   =      PO_final_y_nr_dec [45] ;
   (254 )  : PO_output   =      PO_final_y_nr_dec [46] ;
   (255 )  : PO_output   =      PO_final_y_nr_dec [47] ;
   (256 )  : PO_output   =      PO_final_y_nr_dec [48] ;
   (257 )  : PO_output   =      PO_final_y_nr_dec [49] ;
   (258 )  : PO_output   =      PO_final_y_nr_dec [50] ;
   (259 )  : PO_output   =      PO_final_y_nr_dec [51] ;
   (260 )  : PO_output   =      PO_final_y_nr_dec [52] ;
   (261 )  : PO_output   =      PO_final_y_nr_dec [53] ;
   (262 )  : PO_output   =      PO_final_y_nr_dec [54] ;
   (263 )  : PO_output   =      PO_final_y_nr_dec [55] ;
   (264 )  : PO_output   =      PO_final_y_nr_dec [56] ;
   (265 )  : PO_output   =      PO_final_y_nr_dec [57] ;
   (266 )  : PO_output   =      PO_final_y_nr_dec [58] ;
   (267 )  : PO_output   =      PO_final_y_nr_dec [59] ;
   (268 )  : PO_output   =      PO_final_y_nr_dec [60] ;
   (269 )  : PO_output   =      PO_final_y_nr_dec [61] ;
   (270 )  : PO_output   =      PO_final_y_nr_dec [62] ;
   (271 )  : PO_output   =      PO_final_y_nr_dec [63] ;
   (272 )  : PO_output   =      PO_final_y_nr_dec [64] ;
   (273 )  : PO_output   =      PO_final_y_nr_dec [65] ;
   (274 )  : PO_output   =      PO_final_y_nr_dec [66] ;
   (275 )  : PO_output   =      PO_final_y_nr_dec [67] ;
   (276 )  : PO_output   =      PO_final_y_nr_dec [68] ;
   (277 )  : PO_output   =      PO_final_y_nr_dec [69] ;
   (278 )  : PO_output   =      PO_final_y_nr_dec [70] ;
   (279 )  : PO_output   =      PO_final_y_nr_dec [71] ;
   (280 )  : PO_output   =      PO_final_y_nr_dec [72] ;
   (281 )  : PO_output   =      PO_final_y_nr_dec [73] ;
   (282 )  : PO_output   =      PO_final_y_nr_dec [74] ;
   (283 )  : PO_output   =      PO_final_y_nr_dec [75] ;
   (284 )  : PO_output   =      PO_final_y_nr_dec [76] ;
   (285 )  : PO_output   =      PO_final_y_nr_dec [77] ;
   (286 )  : PO_output   =      PO_final_y_nr_dec [78] ;
   (287 )  : PO_output   =      PO_final_y_nr_dec [79] ;
   (288 )  : PO_output   =      PO_final_y_nr_dec [80] ;
   (289 )  : PO_output   =      PO_final_y_nr_dec [81] ;
   (290 )  : PO_output   =      PO_final_y_nr_dec [82] ;
   (291 )  : PO_output   =      PO_final_y_nr_dec [83] ;
   (292 )  : PO_output   =      PO_final_y_nr_dec [84] ;
   (293 )  : PO_output   =      PO_final_y_nr_dec [85] ;
   (294 )  : PO_output   =      PO_final_y_nr_dec [86] ;
   (295 )  : PO_output   =      PO_final_y_nr_dec [87] ;
   (296 )  : PO_output   =      PO_final_y_nr_dec [88] ;
   (297 )  : PO_output   =      PO_final_y_nr_dec [89] ;
   (298 )  : PO_output   =      PO_final_y_nr_dec [90] ;
   (299 )  : PO_output   =      PO_final_y_nr_dec [91] ;
   (300 )  : PO_output   =      PO_final_y_nr_dec [92] ;
   (301 )  : PO_output   =      PO_final_y_nr_dec [93] ;
   (302 )  : PO_output   =      PO_final_y_nr_dec [94] ;
   (303 )  : PO_output   =      PO_final_y_nr_dec [95] ;
   (304 )  : PO_output   =      PO_final_y_nr_dec [96] ;
   (305 )  : PO_output   =      PO_final_y_nr_dec [97] ;
   (306 )  : PO_output   =      PO_final_y_nr_dec [98] ;
   (307 )  : PO_output   =      PO_final_y_nr_dec [99] ;
   (308 )  : PO_output   =      PO_final_y_nr_dec [100] ;
   (309 )  : PO_output   =      PO_final_y_nr_dec [101] ;
   (310 )  : PO_output   =      PO_final_y_nr_dec [102] ;
   (311 )  : PO_output   =      PO_final_y_nr_dec [103] ;
   (312 )  : PO_output   =      PO_final_y_nr_dec [104] ;
   (313 )  : PO_output   =      PO_final_y_nr_dec [105] ;
   (314 )  : PO_output   =      PO_final_y_nr_dec [106] ;
   (315 )  : PO_output   =      PO_final_y_nr_dec [107] ;
   (316 )  : PO_output   =      PO_final_y_nr_dec [108] ;
   (317 )  : PO_output   =      PO_final_y_nr_dec [109] ;
   (318 )  : PO_output   =      PO_final_y_nr_dec [110] ;
   (319 )  : PO_output   =      PO_final_y_nr_dec [111] ;
   (320 )  : PO_output   =      PO_final_y_nr_dec [112] ;
   (321 )  : PO_output   =      PO_final_y_nr_dec [113] ;
   (322 )  : PO_output   =      PO_final_y_nr_dec [114] ;
   (323 )  : PO_output   =      PO_final_y_nr_dec [115] ;
   (324 )  : PO_output   =      PO_final_y_nr_dec [116] ;
   (325 )  : PO_output   =      PO_final_y_nr_dec [117] ;
   (326 )  : PO_output   =      PO_final_y_nr_dec [118] ;
   (327 )  : PO_output   =      PO_final_y_nr_dec [119] ;
   (328 )  : PO_output   =      PO_final_y_nr_dec [120] ;
   (329 )  : PO_output   =      PO_final_y_nr_dec [121] ;
   (330 )  : PO_output   =      PO_final_y_nr_dec [122] ;
   (331 )  : PO_output   =      PO_final_y_nr_dec [123] ;
   (332 )  : PO_output   =      PO_final_y_nr_dec [124] ;
   (333 )  : PO_output   =      PO_final_y_nr_dec [125] ;
   (334 )  : PO_output   =      PO_final_y_nr_dec [126] ;
   (335 )  : PO_output   =      PO_final_y_nr_dec [127] ;
   (336 )  : PO_output   =      PO_final_y_nr_dec [128] ;
   (337 )  : PO_output   =      PO_final_y_nr_dec [129] ;
   (338 )  : PO_output   =      PO_final_y_nr_dec [130] ;
   (339 )  : PO_output   =      PO_final_y_nr_dec [131] ;
   (340 )  : PO_output   =      PO_final_y_nr_dec [132] ;
   (341 )  : PO_output   =      PO_final_y_nr_dec [133] ;
   (342 )  : PO_output   =      PO_final_y_nr_dec [134] ;
   (343 )  : PO_output   =      PO_final_y_nr_dec [135] ;
   (344 )  : PO_output   =      PO_final_y_nr_dec [136] ;
   (345 )  : PO_output   =      PO_final_y_nr_dec [137] ;
   (346 )  : PO_output   =      PO_final_y_nr_dec [138] ;
   (347 )  : PO_output   =      PO_final_y_nr_dec [139] ;
   (348 )  : PO_output   =      PO_final_y_nr_dec [140] ;
   (349 )  : PO_output   =      PO_final_y_nr_dec [141] ;
   (350 )  : PO_output   =      PO_final_y_nr_dec [142] ;
   (351 )  : PO_output   =      PO_final_y_nr_dec [143] ;
   (352 )  : PO_output   =      PO_final_y_nr_dec [144] ;
   (353 )  : PO_output   =      PO_final_y_nr_dec [145] ;
   (354 )  : PO_output   =      PO_final_y_nr_dec [146] ;
   (355 )  : PO_output   =      PO_final_y_nr_dec [147] ;
   (356 )  : PO_output   =      PO_final_y_nr_dec [148] ;
   (357 )  : PO_output   =      PO_final_y_nr_dec [149] ;
   (358 )  : PO_output   =      PO_final_y_nr_dec [150] ;
   (359 )  : PO_output   =      PO_final_y_nr_dec [151] ;
   (360 )  : PO_output   =      PO_final_y_nr_dec [152] ;
   (361 )  : PO_output   =      PO_final_y_nr_dec [153] ;
   (362 )  : PO_output   =      PO_final_y_nr_dec [154] ;
   (363 )  : PO_output   =      PO_final_y_nr_dec [155] ;
   (364 )  : PO_output   =      PO_final_y_nr_dec [156] ;
   (365 )  : PO_output   =      PO_final_y_nr_dec [157] ;
   (366 )  : PO_output   =      PO_final_y_nr_dec [158] ;
   (367 )  : PO_output   =      PO_final_y_nr_dec [159] ;
   (368 )  : PO_output   =      PO_final_y_nr_dec [160] ;
   (369 )  : PO_output   =      PO_final_y_nr_dec [161] ;
   (370 )  : PO_output   =      PO_final_y_nr_dec [162] ;
   (371 )  : PO_output   =      PO_final_y_nr_dec [163] ;
   (372 )  : PO_output   =      PO_final_y_nr_dec [164] ;
   (373 )  : PO_output   =      PO_final_y_nr_dec [165] ;
   (374 )  : PO_output   =      PO_final_y_nr_dec [166] ;
   (375 )  : PO_output   =      PO_final_y_nr_dec [167] ;
   (376 )  : PO_output   =      PO_final_y_nr_dec [168] ;
   (377 )  : PO_output   =      PO_final_y_nr_dec [169] ;
   (378 )  : PO_output   =      PO_final_y_nr_dec [170] ;
   (379 )  : PO_output   =      PO_final_y_nr_dec [171] ;
   (380 )  : PO_output   =      PO_final_y_nr_dec [172] ;
   (381 )  : PO_output   =      PO_final_y_nr_dec [173] ;
   (382 )  : PO_output   =      PO_final_y_nr_dec [174] ;
   (383 )  : PO_output   =      PO_final_y_nr_dec [175] ;
   (384 )  : PO_output   =      PO_final_y_nr_dec [176] ;
   (385 )  : PO_output   =      PO_final_y_nr_dec [177] ;
   (386 )  : PO_output   =      PO_final_y_nr_dec [178] ;
   (387 )  : PO_output   =      PO_final_y_nr_dec [179] ;
   (388 )  : PO_output   =      PO_final_y_nr_dec [180] ;
   (389 )  : PO_output   =      PO_final_y_nr_dec [181] ;
   (390 )  : PO_output   =      PO_final_y_nr_dec [182] ;
   (391 )  : PO_output   =      PO_final_y_nr_dec [183] ;
   (392 )  : PO_output   =      PO_final_y_nr_dec [184] ;
   (393 )  : PO_output   =      PO_final_y_nr_dec [185] ;
   (394 )  : PO_output   =      PO_final_y_nr_dec [186] ;
   (395 )  : PO_output   =      PO_final_y_nr_dec [187] ;
   (396 )  : PO_output   =      PO_final_y_nr_dec [188] ;
   (397 )  : PO_output   =      PO_final_y_nr_dec [189] ;
   (398 )  : PO_output   =      PO_final_y_nr_dec [190] ;
   (399 )  : PO_output   =      PO_final_y_nr_dec [191] ;
   (400 )  : PO_output   =      PO_final_y_nr_dec [192] ;
   (401 )  : PO_output   =      PO_final_y_nr_dec [193] ;
   (402 )  : PO_output   =      PO_final_y_nr_dec [194] ;
   (403 )  : PO_output   =      PO_final_y_nr_dec [195] ;
   (404 )  : PO_output   =      PO_final_y_nr_dec [196] ;
   (405 )  : PO_output   =      PO_final_y_nr_dec [197] ;
   (406 )  : PO_output   =      PO_final_y_nr_dec [198] ;
   (407 )  : PO_output   =      PO_final_y_nr_dec [199] ;
   (408 )  : PO_output   =      PO_final_y_nr_dec [200] ;
   (409 )  : PO_output   =      PO_final_y_nr_dec [201] ;
   (410 )  : PO_output   =      PO_final_y_nr_dec [202] ;
   (411 )  : PO_output   =      PO_final_y_nr_dec [203] ;
   (412 )  : PO_output   =      PO_final_y_nr_dec [204] ;
   (413 )  : PO_output   =      PO_final_y_nr_dec [205] ;
   (414 )  : PO_output   =      PO_final_y_nr_dec [206] ;
   (415 )  : PO_output   =      PO_final_y_nr_dec [207] ;
   (416 )  : PO_output   =      PO_valid_cword_enc        ;
   (417 )  : PO_output   =      PO_err_intro_decoder      ;
   (418 )  : PO_output   =      PO_syn_valid_cword_dec    ;
   (419 )  : PO_output   =      PO_converged_pass_fail    ;
   (420 )  : PO_output   =      PO_tb_pass_fail_decoder   ;
   (421 )  : PO_output   =      PO_converged_loops_ended  ;
   default : PO_output   = 0;
   endcase
end
////////////////////////////////////////////////////////////////////////

assign l_exp_syn = {(MM){1'b0}};

genvar i;
generate
		for (i=0;i<NN;i++) begin
			assign q0_0[i] = w_sel_q0_0_frmC ? w_q0_0_frmC[i] : ((y_nr_enc[i] ? 1'b1:1'b1) ^ w_err_intro_q0_0_frmC[i]);
			assign q0_1[i] = w_sel_q0_1_frmC ? w_q0_1_frmC[i] : ((y_nr_enc[i] ? 1'b1:1'b0) ^ w_err_intro_q0_1_frmC[i]);
		end
endgenerate

assign err_intro_decoder = (~(q0_1 == y_nr_enc));
assign tb_pass_fail_decoder = (final_y_nr_dec == y_nr_enc);


    ///////////////////LDPC wire////////////////////////////////////////////////

    assign reg_base_addr = 32'h3001_0000;
    assign i_wb_cyc = (wbs_adr_i[31:13]==reg_base_addr[31:13]) ? wbs_cyc_i : 1'b0;
    assign i_wb_stb = (wbs_adr_i[31:13]==reg_base_addr[31:13]) ? wbs_stb_i : 1'b0;

    /////////////////////////////////////////////////////////////////////////////
    //wire start/////
    //:r LDPC_inc.sv     Begin File Include
    //
    //

    `include "LDPC_inc.sv"
                 
    //wire end///// LDPC_inc.sv   End File Include
    /////////////////////////////////////////////////////////////////////////////
    //assign start
    // :r LDPC_assign.sv     Begin File Include

    `include "LDPC_assign.sv"


    //assign end   End File Include
    /////////////////////////////////////////////////////////////////////////////

LDPC_CSR LDPC_CSR_U
(
  .i_wb_cyc(i_wb_cyc),
  .i_wb_stb(i_wb_stb),
  .o_wb_stall( o_wb_stall),
  .i_wb_adr(wbs_adr_i[12:0]),
  .i_wb_we(wbs_we_i),
  .i_wb_dat(wbs_dat_i),
  .i_wb_sel(wbs_sel_i),
  .o_wb_ack(wbs_ack_o),
  .o_wb_err( o_wb_err),
  .o_wb_rty( o_wb_rty),
  .o_wb_dat(wbs_dat_o),


  //////////////////////////////////////////////////////////////////////////
  //      rggen --plugin rggen-verilog -c config.yml LDPC_rggen.yml
  //      #// ln((1-p)/p)*(2**11) + 0.5
  //      #// modified bits = NN * p + 0.5
  //////////////////////////////////////////////////////////////////////////
  ///// connect start
  // :r LDPC_inst.sv    Begin File Include


  `include "LDPC_inst.sv"
  
  
  
  ///// connect end   End File Include
  //////////////////////////////////////////////////////////////////////////




  .i_clk(wb_clk_i),
  .i_rst_n(~wb_rst_i)
);


sntc_ldpc_encoder_wrapper sntc_ldpc_encoder_wrapper_U
(
.y_nr_in_port(w_y_nr_in_port),
.y_nr_enc(y_nr_enc),
.valid_cword_enc(valid_cword_enc),
.clr(1'b0),
.rstn(~wb_rst_i),
.clk(wb_clk_i)

);

sntc_ldpc_decoder_wrapper sntc_ldpc_decoder_wrapper_U
 (

.q0_0(q0_0),
.q0_1(q0_1),

.final_y_nr_dec(final_y_nr_dec),
.exp_syn(l_exp_syn),
.percent_probability_int (w_percent_probability_int),
.HamDist_loop_max(w_HamDist_loop_max),
.HamDist_loop_percentage( w_HamDist_loop_percentage),

.HamDist_iir1(w_HamDist_iir1),
.HamDist_iir2(w_HamDist_iir2),
.HamDist_iir3(w_HamDist_iir3),

.converged_loops_ended(converged_loops_ended),
.converged_pass_fail(converged_pass_fail),

.start_dec(start_dec_rtl),
.syn_valid_cword_dec(syn_valid_cword_dec),
.clr(1'b0),
.rstn(~wb_rst_i),
.clk(wb_clk_i)







);

assign start_dec_rtl = w_start_dec & ~start_dec_rtl_Q;
always @(posedge wb_clk_i) begin
	if (wb_rst_i) begin
		start_dec_rtl_Q <= 1'b0;
	end else begin
		start_dec_rtl_Q <= w_start_dec;
	end
end


endmodule

`default_nettype wire

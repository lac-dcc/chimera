// Copyright (C) 2020-2022 University of Zurich
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// Licensed under the Solderpad Hardware License v 2.1 (the “License”); you may not use this file except in compliance
// with the License, or, at your option, the Apache License version 2.0. You may obtain a copy of the License at
// https://solderpad.org/licenses/SHL-2.1/
//
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
// an “AS IS” BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.
//
//------------------------------------------------------------------------------
//
// "srnn.v" -  Spiking recurrent neural network core, including learning based on modified e-prop
// 
// Project: ReckOn - Spiking RECurrent neural network processor enabling ON-chip learning over second-long timescales
//
// Author:  C. Frenkel, Institute of Neuroinformatics, University of Zurich and ETH Zurich
//
// Cite/paper: [C. Frenkel and G. Indiveri, "ReckOn: A 28nm sub-mm² task-agnostic spiking recurrent neural network
//             processor enabling on-chip learning over second-long timescales," IEEE International Solid-State
//             Circuits Conference (ISSCC), 2022]
//
// Comments: -
//
//------------------------------------------------------------------------------



`define SRAM_BEHAV 1

module srnn #(
    parameter N = 256,
    parameter M = 8
)(
    // Global inputs   -------------------------------------
    input  wire                 CLK,
    input  wire                 RST,
    
    // Parameters ------------------------------------------
        // Control
    input  wire                 SPI_RST_MODE,
    input  wire        [   2:0] SPI_DO_EPROP,
    input  wire                 SPI_LOCAL_TICK,
    input  wire                 SPI_ERROR_HALT,
    input  wire        [   2:0] SPI_FP_LOC_WINP,
    input  wire        [   2:0] SPI_FP_LOC_WREC,
    input  wire        [   2:0] SPI_FP_LOC_WOUT,
    input  wire        [   2:0] SPI_FP_LOC_TINP,
    input  wire        [   2:0] SPI_FP_LOC_TREC,
    input  wire        [   2:0] SPI_FP_LOC_TOUT,
    input  wire        [   3:0] SPI_LEARN_SIG_SCALE,
    input  wire        [   2:0] SPI_REGUL_MODE,
    input  wire        [   1:0] SPI_REGUL_W,
    input  wire                 SPI_EN_STOCH_ROUND,
    input  wire        [   7:0] SPI_SRAM_SPEEDMODE,
    input  wire                 SPI_TIMING_MODE,
    input  wire                 SPI_REGRESSION,
    input  wire                 SPI_SINGLE_LABEL,
    input  wire                 SPI_NO_OUT_ACT,
    input  wire                 SPI_SEND_PER_TIMESTEP,
    input  wire                 SPI_SEND_LABEL_ONLY,
    input  wire                 SPI_NOISE_EN,
    input  wire                 SPI_FORCE_TRACES,
        // Network 
    input  wire        [  31:0] SPI_CYCLES_PER_TICK,
    input  wire        [ 127:0] SPI_ALPHA_CONF,
    input  wire        [   7:0] SPI_KAPPA,
    input  wire signed [  15:0] SPI_THR_H_0,
    input  wire signed [  15:0] SPI_THR_H_1,
    input  wire signed [  15:0] SPI_THR_H_2,
    input  wire signed [  15:0] SPI_THR_H_3,
    input  wire signed [   4:0] SPI_H_0,
    input  wire signed [   4:0] SPI_H_1,
    input  wire signed [   4:0] SPI_H_2,
    input  wire signed [   4:0] SPI_H_3,
    input  wire signed [   4:0] SPI_H_4,
    input  wire        [   4:0] SPI_LR_R_WINP,
    input  wire        [   4:0] SPI_LR_P_WINP,
    input  wire        [   4:0] SPI_LR_R_WREC,
    input  wire        [   4:0] SPI_LR_P_WREC,
    input  wire        [   4:0] SPI_LR_R_WOUT,
    input  wire        [   4:0] SPI_LR_P_WOUT,
    input  wire        [  24:0] SPI_SEED_INP,
    input  wire        [  24:0] SPI_SEED_REC,
    input  wire        [  21:0] SPI_SEED_OUT,
    input  wire        [  29:0] SPI_SEED_STRND_NEUR,
    input  wire        [  14:0] SPI_SEED_STRND_ONEUR,
    input  wire        [  29:0] SPI_SEED_STRND_TINP,
    input  wire        [  29:0] SPI_SEED_STRND_TREC,
    input  wire        [  29:0] SPI_SEED_STRND_TOUT,
    input  wire        [  16:0] SPI_SEED_NOISE_NEUR,
    input  wire        [ M-1:0] SPI_NUM_INP_NEUR,
    input  wire        [ M-1:0] SPI_NUM_REC_NEUR,
    input  wire        [   3:0] SPI_NUM_OUT_NEUR,
    input  wire        [  11:0] SPI_REGUL_F0,
    input  wire        [   4:0] SPI_REGUL_K_INP_R,
    input  wire        [   4:0] SPI_REGUL_K_INP_P,
    input  wire        [   4:0] SPI_REGUL_K_REC_R,
    input  wire        [   4:0] SPI_REGUL_K_REC_P,
    input  wire        [   4:0] SPI_REGUL_K_MUL,
    input  wire        [   3:0] SPI_NOISE_STR,

    // Inputs from SPI slave -------------------------------
    input  wire        [  15:0] SPI_ADDR,
    input  wire        [  31:0] SPI_DATA,
    input  wire                 SPI_EN_CONF,    //already synchronized
    input  wire                 PROG_NEUR,
    input  wire                 PROG_ONEUR,
    input  wire                 PROG_WINP,
    input  wire                 PROG_WREC,
    input  wire                 PROG_WOUT,
    input  wire                 PROG_SEED_INP,
    input  wire                 PROG_SEED_REC,
    input  wire                 PROG_SEED_OUT,
    input  wire                 PROG_SEED_STRND_NEUR,
    input  wire                 PROG_SEED_STRND_ONEUR,
    input  wire                 PROG_SEED_STRND_TINP,
    input  wire                 PROG_SEED_STRND_TREC,
    input  wire                 PROG_SEED_STRND_TOUT,
    input  wire                 PROG_SEED_NOISE_NEUR,
    input  wire                 READ_NEUR,
    input  wire                 READ_ONEUR,
    input  wire                 READ_WINP,
    input  wire                 READ_WREC,
    input  wire                 READ_WOUT,
    
    // Outputs to SPI slave --------------------------------
    output reg         [  31:0] SRNN_READBACK,

    // Core inputs -----------------------------------------
    input  wire        [ M-1:0] AERIN_ADDR,
    input  wire                 AERIN_REQ,
    output reg                  AERIN_ACK,
    input  wire                 AERIN_TAR_EN,
    input  wire                 TARGET_VALID,
    input  wire                 INFER_ACC,
    input  wire                 SAMPLE,
    input  wire                 TIME_TICK,
    
    // Core outputs ----------------------------------------
    output wire                 SPI_RDY,
    output wire                 TIMING_ERROR_RDY,

    // Core inouts -----------------------------------------
    output wire                 REQ_TAR,
    output reg                  OUT_REQ,
    input  wire                 OUT_ACK,
    output reg         [   7:0] OUT_DATA        
);
    
    //----------------------------------------------------------------------------------
    //    PARAMETERS 
    //----------------------------------------------------------------------------------

    // FSM states (states associated to unpublished blocks have been removed)
    localparam IDLE        = 4'd0; 
    localparam PROP        = 4'd1;
    localparam STEP        = 4'd2;
    localparam SDONE       = 4'd3;
    localparam GET_TAR     = 4'd4;
    localparam CONFIG      = 4'd5;
    localparam EPROP       = 4'd6;
    localparam SEND        = 4'd7;

    localparam WAIT        = 2'd0; 
    localparam CNT         = 2'd1;
    localparam EVT         = 2'd2;
    localparam SUPP        = 2'd3;
    
    
    //----------------------------------------------------------------------------------
    //    Internal regs and wires
    //----------------------------------------------------------------------------------

    // Sync barriers
    reg                 AERIN_REQ_sync_int            , AERIN_REQ_sync            ;
    reg                 SAMPLE_sync_int               , SAMPLE_sync               ;
    reg                 TARGET_VALID_sync_int         , TARGET_VALID_sync         ;
    reg                 INFER_ACC_sync_int            , INFER_ACC_sync            ;
    reg                 TIME_TICK_sync_int            , TIME_TICK_sync            , TIME_TICK_del            ;
    reg                 PROG_NEUR_sync_int            , PROG_NEUR_sync            , PROG_NEUR_del            ;
    reg                 PROG_ONEUR_sync_int           , PROG_ONEUR_sync           , PROG_ONEUR_del           ;
    reg                 PROG_WINP_sync_int            , PROG_WINP_sync            , PROG_WINP_del            ;
    reg                 PROG_WREC_sync_int            , PROG_WREC_sync            , PROG_WREC_del            ;
    reg                 PROG_WOUT_sync_int            , PROG_WOUT_sync            , PROG_WOUT_del            ;
    reg                 PROG_SEED_INP_sync_int        , PROG_SEED_INP_sync        , PROG_SEED_INP_del        ;
    reg                 PROG_SEED_REC_sync_int        , PROG_SEED_REC_sync        , PROG_SEED_REC_del        ;
    reg                 PROG_SEED_OUT_sync_int        , PROG_SEED_OUT_sync        , PROG_SEED_OUT_del        ;
    reg                 PROG_SEED_STRND_NEUR_sync_int , PROG_SEED_STRND_NEUR_sync , PROG_SEED_STRND_NEUR_del ;
    reg                 PROG_SEED_STRND_ONEUR_sync_int, PROG_SEED_STRND_ONEUR_sync, PROG_SEED_STRND_ONEUR_del;
    reg                 PROG_SEED_STRND_TINP_sync_int , PROG_SEED_STRND_TINP_sync , PROG_SEED_STRND_TINP_del ;
    reg                 PROG_SEED_STRND_TREC_sync_int , PROG_SEED_STRND_TREC_sync , PROG_SEED_STRND_TREC_del ;
    reg                 PROG_SEED_STRND_TOUT_sync_int , PROG_SEED_STRND_TOUT_sync , PROG_SEED_STRND_TOUT_del ;
    reg                 PROG_SEED_NOISE_NEUR_sync_int , PROG_SEED_NOISE_NEUR_sync , PROG_SEED_NOISE_NEUR_del ;
    reg                 READ_NEUR_sync_int            , READ_NEUR_sync            ;
    reg                 READ_ONEUR_sync_int           , READ_ONEUR_sync           ;
    reg                 READ_WINP_sync_int            , READ_WINP_sync            ;
    reg                 READ_WREC_sync_int            , READ_WREC_sync            ;
    reg                 READ_WOUT_sync_int            , READ_WOUT_sync            ;
    reg                 OUT_ACK_sync_int              , OUT_ACK_sync              ;
    wire                TIME_TICK_new                 ;
    wire                PROG_NEUR_new                 ;
    wire                PROG_ONEUR_new                ;
    wire                PROG_WINP_new                 ;
    wire                PROG_WREC_new                 ;
    wire                PROG_WOUT_new                 ;
    wire                PROG_SEED_INP_new             ;
    wire                PROG_SEED_REC_new             ;
    wire                PROG_SEED_OUT_new             ;
    wire                PROG_SEED_STRND_NEUR_new      ;
    wire                PROG_SEED_STRND_ONEUR_new     ;
    wire                PROG_SEED_STRND_TINP_new      ;
    wire                PROG_SEED_STRND_TREC_new      ;
    wire                PROG_SEED_STRND_TOUT_new      ;
    wire                PROG_SEED_NOISE_NEUR_new      ;
    wire        [M-1:0] SPI_NUM_NEUR, SPI_NUM_RECOUT  ;
    reg                 TIMING_ERROR                  ;


    // I/O
        // Receiving events
    wire         aerin_new;
    reg  [N-1:0] inp_events;
    reg  [N-1:0] inp_events_next;
        // Receiving targets
    reg  signed [15:0] reg_tar     [15:0];
    reg         [ 3:0] class_label       ;
    reg                got_label         ;
    wire               target_new        ;
    wire               target_done       ;
    reg         [ 4:0] target_cnt        ;
        // Sending classification results
    wire       send_done;
    reg  [4:0] send_cnt;
    wire [4:0] send_num;


    // Global controller
    reg  [  3:0] state, nextstate;
    wire         time_tick;
    reg  [ 31:0] tick_cnt;
    reg  [M-1:0] neur_step_cnt;


    // eprop handling
    reg  [  3:0] e_post_msb;
    reg  [  4:0] e_post_lsb;
    reg  [  M:0] e_pre;
    wire [M-1:0] e_post;
    reg          buf16_post;
    wire         skip_update_winp;
    wire         skip_update_wrec;
    wire         skip_update_wout;
    wire         eprop_done;

    wire        [M-2:0] neur_addr_eprop;
    wire                neur_cs_eprop;
    reg                 neur_cs_eprop_del;
    wire                winp_cs_eprop    , wrec_cs_eprop    , wout_cs_eprop    ;
    wire                winp_we_eprop    , wrec_we_eprop    , wout_we_eprop    ;
    wire        [M+3:0] winp_addr_eprop  , wrec_addr_eprop  ;
    wire        [M  :0] wout_addr_eprop  ;
    wire        [127:0] winp_data_i_eprop, wrec_data_i_eprop, wrec_data_i_eprop_temp, wout_data_i_eprop;
    wire        [127:0] winp_mask_eprop  , wrec_mask_eprop  , wout_mask_eprop  ;

    reg  signed [27:0] neur_learn_sigs_psum [15:0];
    wire signed [43:0] neur_learn_sigs_temp1;
    wire signed [15:0] neur_learn_sigs_temp2;
    reg  signed [15:0] learning_signals [15:0];
    wire signed [15:0] neur_u_eprop;
    wire        [11:0] trace_rec_reg, trace_rec_reg_f0;
    wire        [11:0] trace_inp_eprop, trace_rec_eprop;
    wire        [ 9:0] trace_out_eprop;
    wire signed [ 4:0] update_h;
    reg  signed [ 4:0] neur_h [15:0];
    reg         [11:0] trace_reg [15:0];
    wire               trace_reg_zero;

    wire                do_update_winp;
    wire                do_update_wrec;
    wire                do_update_wregi;
    wire                do_update_wregr;
    wire                do_update_wout;
    wire        [511:0] winp_rand;
    wire        [511:0] wrec_rand;
    wire        [447:0] wout_rand;

    wire                winp_en [15:0];
    wire                wrec_en [15:0];
    wire signed [ 31:0] prob_winp [15:0];
    wire signed [ 31:0] prob_wrec [15:0];
    wire signed [ 31:0] prob_winp_e [15:0];
    wire signed [ 31:0] prob_wrec_e [15:0];
    wire signed [ 31:0] prob_wregi [15:0];
    wire signed [ 31:0] prob_wregr [15:0];
    wire        [ 11:0] prob_wregm [15:0];
    wire signed [  5:0] prob_wregs [15:0];
    wire signed [ 36:0] prob_winp_k [15:0];
    wire signed [ 36:0] prob_wrec_k [15:0];
    wire signed [ 31:0] prob_winp_s [15:0];
    wire signed [ 31:0] prob_wrec_s [15:0];
    wire signed [ 27:0] prob_wout [15:0];


    // Event controller
    reg  [  1:0] state_evt, nextstate_evt;
    wire         inp_event;
    wire         inp_evt_trace, rec_evt_trace, out_evt_trace;
    wire         winp_cs_ctrl, wrec_cs_ctrl, wout_cs_ctrl;
    wire [M+3:0] winp_addr_ctrl, wrec_addr_ctrl;
    wire [M  :0] wout_addr_ctrl;
    wire         supp_cond;
    reg          wout_cs_del;
    reg          supp_cycle;
    reg  [M-1:0] neur128x2_cnt;
    reg  [M-1:0] neur256_cnt;


    // Neuron array and updates
    wire                neur_cs_ctrl, neur_we_ctrl;
    wire        [M-2:0] neur_addr_ctrl;
    reg         [127:0] neur_data_i_ctrl, neur_mask_ctrl;
    reg  signed [ 15:0] neur_u     [1:0];
    reg         [ 11:0] trace_inp  [1:0]; 
    reg         [ 11:0] trace_rec  [1:0]; 
    reg         [  9:0] trace_out  [1:0];
    wire        [  3:0] alpha_msb;
    wire        [ 15:0] alpha;
    wire signed [ 16:0] alpha_s;
    wire signed [ 15:0] thr;
    wire        [127:0] shift_winp;
    wire        [127:0] shift_wrec;
    wire        [ 31:0] neur_noise_rand;

    reg  signed [ 15:0] update_winp [1:0]; 
    reg  signed [ 15:0] update_wrec [1:0]; 
    reg  signed [ 15:0] update_wt [1:0]; 
    reg  signed [ 15:0] update_w  [1:0]; 
    reg  signed [ 15:0] update_u  [1:0]; 
    reg                 ovfl_p [1:0];
    reg                 ovfl_n [1:0];
    reg  signed [ 15:0] neur_u_next [1:0];

    wire        [ 14:0] neur_u_leak_rand [1:0];
    reg  signed [ 31:0] neur_u_leak [1:0];
    reg  signed [ 15:0] neur_u_stoc [1:0];
    reg  signed [ 15:0] neur_u_lkst [1:0];
    reg                 neur_u_spk [1:0];
    reg  signed [ 15:0] neur_u_step [1:0];

    reg         [N-1:0] neur_z;
    reg         [N-1:0] neur_dirty;

    wire        [  6:0] oneur_u_leak_rand;
    reg  signed [ 15:0] update_wout [15:0]; 
    reg  signed [ 15:0] update_out [15:0]; 
    reg                 ovfl_out_p [15:0]; 
    reg                 ovfl_out_n [15:0]; 
    reg  signed [ 15:0] oneur_out_next [15:0]; 
    wire signed [ 23:0] oneur_u_leak;
    wire signed [ 15:0] oneur_u_stoc, oneur_u_lkst;
    reg  signed [ 15:0] oneur_u [ 15:0];
    wire signed [ 15:0] oneur_err [15:0];

    wire        [ 14:0] trace_inp_rand [1:0];
    wire        [ 14:0] trace_rec_rand [1:0];
    wire        [  6:0] trace_out_rand [1:0];
    reg         [ 11:0] trace_inp_inc [1:0];
    reg         [ 27:0] trace_inp_step [1:0];
    reg         [ 11:0] trace_inp_stoc [1:0];
    reg         [ 11:0] trace_inp_lkst [1:0];
    reg         [ 11:0] trace_inp_next [1:0];
    reg         [ 11:0] trace_rec_inc [1:0];
    reg         [ 27:0] trace_rec_step [1:0];
    reg         [ 11:0] trace_rec_stoc [1:0];
    reg         [ 11:0] trace_rec_lkst [1:0];
    reg         [ 11:0] trace_rec_next [1:0];
    reg         [  9:0] trace_out_inc [1:0];
    reg         [ 17:0] trace_out_step [1:0];
    reg         [  9:0] trace_out_stoc [1:0];
    reg         [  9:0] trace_out_lkst [1:0];
    reg         [  9:0] trace_out_next [1:0];


    // Winner computation
    reg        [ 3:0] label_winner  [15:0];
    reg signed [15:0] neur_winner [15:0];
    reg        [15:0] cnt_winner  [15:0];
    reg        [15:0] aer_winner [15:0];
    reg        [ 3:0] send_winner [15:0];
    

    // Readback
    wire [127:0] neur_data_o_shift;
    wire [127:0] winp_data_o_shift;
    wire [127:0] wrec_data_o_shift;
    wire [127:0] wout_data_o_shift;


    // SRAMs
    wire                neur_cs;
    wire                neur_we;
    wire        [M-2:0] neur_addr;
    wire        [127:0] neur_data_i;
    wire        [127:0] neur_mask;
    wire        [127:0] neur_data_o;
    wire                winp_cs    , wrec_cs    , wout_cs    ;
    wire                winp_we    , wrec_we    , wout_we    ;
    wire        [M+3:0] winp_addr  , wrec_addr  ;
    wire        [M  :0] wout_addr  ;
    wire        [127:0] winp_data_i, wrec_data_i, wout_data_i;
    wire        [127:0] winp_mask  , wrec_mask  , wout_mask  ;
    wire        [127:0] winp_data_o, wrec_data_o, wout_data_o;
    

    // Other ariables for logic generation
    genvar       i, j, k, n;
    integer      kk;
    

    //----------------------------------------------------------------------------------
    //    Sync barriers
    //----------------------------------------------------------------------------------

    always @(posedge CLK, posedge RST) begin
        if (RST) begin
            TARGET_VALID_sync_int <= 1'b0;
            TARGET_VALID_sync     <= 1'b0;
        end else if (|SPI_DO_EPROP) begin
            TARGET_VALID_sync_int <= TARGET_VALID;
            TARGET_VALID_sync     <= TARGET_VALID_sync_int;
        end
    end
    
    always @(posedge CLK, posedge RST) begin
        if (RST) begin
            AERIN_REQ_sync_int           <= 1'b0;
            AERIN_REQ_sync               <= 1'b0;
            SAMPLE_sync_int              <= 1'b0;
            SAMPLE_sync                  <= 1'b0;
            INFER_ACC_sync_int           <= 1'b0;
            INFER_ACC_sync               <= 1'b0;
            OUT_ACK_sync_int             <= 1'b0;    
            OUT_ACK_sync                 <= 1'b0;  
        end else begin
            AERIN_REQ_sync_int           <= AERIN_REQ;
            AERIN_REQ_sync               <= AERIN_REQ_sync_int;
            SAMPLE_sync_int              <= SAMPLE;
            SAMPLE_sync                  <= SAMPLE_sync_int;
            INFER_ACC_sync_int           <= INFER_ACC;
            INFER_ACC_sync               <= INFER_ACC_sync_int;
            OUT_ACK_sync_int             <= OUT_ACK;    
            OUT_ACK_sync                 <= OUT_ACK_sync_int;  
        end
    end
    
    always @(posedge CLK, posedge RST) begin
        if (RST) begin
            PROG_NEUR_sync_int             <= 1'b0;
            PROG_NEUR_sync                 <= 1'b0;
            PROG_NEUR_del                  <= 1'b0;
            PROG_ONEUR_sync_int            <= 1'b0;
            PROG_ONEUR_sync                <= 1'b0;
            PROG_ONEUR_del                 <= 1'b0;
            PROG_WINP_sync_int             <= 1'b0;
            PROG_WINP_sync                 <= 1'b0;
            PROG_WINP_del                  <= 1'b0;
            PROG_WREC_sync_int             <= 1'b0;
            PROG_WREC_sync                 <= 1'b0;
            PROG_WREC_del                  <= 1'b0;
            PROG_WOUT_sync_int             <= 1'b0;
            PROG_WOUT_sync                 <= 1'b0;
            PROG_WOUT_del                  <= 1'b0;
            PROG_SEED_INP_sync_int         <= 1'b0;
            PROG_SEED_INP_sync             <= 1'b0;
            PROG_SEED_INP_del              <= 1'b0;
            PROG_SEED_REC_sync_int         <= 1'b0;
            PROG_SEED_REC_sync             <= 1'b0;
            PROG_SEED_REC_del              <= 1'b0;
            PROG_SEED_OUT_sync_int         <= 1'b0;
            PROG_SEED_OUT_sync             <= 1'b0;
            PROG_SEED_OUT_del              <= 1'b0;
            PROG_SEED_STRND_NEUR_sync_int  <= 1'b0;
            PROG_SEED_STRND_NEUR_sync      <= 1'b0;
            PROG_SEED_STRND_NEUR_del       <= 1'b0;
            PROG_SEED_STRND_ONEUR_sync_int <= 1'b0;
            PROG_SEED_STRND_ONEUR_sync     <= 1'b0;
            PROG_SEED_STRND_ONEUR_del      <= 1'b0;
            PROG_SEED_STRND_TINP_sync_int  <= 1'b0;
            PROG_SEED_STRND_TINP_sync      <= 1'b0;
            PROG_SEED_STRND_TINP_del       <= 1'b0;
            PROG_SEED_STRND_TREC_sync_int  <= 1'b0;
            PROG_SEED_STRND_TREC_sync      <= 1'b0;
            PROG_SEED_STRND_TREC_del       <= 1'b0;
            PROG_SEED_STRND_TOUT_sync_int  <= 1'b0;
            PROG_SEED_STRND_TOUT_sync      <= 1'b0;
            PROG_SEED_STRND_TOUT_del       <= 1'b0;
            PROG_SEED_NOISE_NEUR_sync_int  <= 1'b0;
            PROG_SEED_NOISE_NEUR_sync      <= 1'b0;
            PROG_SEED_NOISE_NEUR_del       <= 1'b0;
            READ_NEUR_sync_int             <= 1'b0;
            READ_NEUR_sync                 <= 1'b0;
            READ_ONEUR_sync_int            <= 1'b0;
            READ_ONEUR_sync                <= 1'b0;
            READ_WINP_sync_int             <= 1'b0;
            READ_WINP_sync                 <= 1'b0;
            READ_WREC_sync_int             <= 1'b0;
            READ_WREC_sync                 <= 1'b0;
            READ_WOUT_sync_int             <= 1'b0;
            READ_WOUT_sync                 <= 1'b0;
        end else if (SPI_EN_CONF) begin
            PROG_NEUR_sync_int             <= PROG_NEUR;
            PROG_NEUR_sync                 <= PROG_NEUR_sync_int;
            PROG_NEUR_del                  <= PROG_NEUR_sync;
            PROG_ONEUR_sync_int            <= PROG_ONEUR;
            PROG_ONEUR_sync                <= PROG_ONEUR_sync_int;
            PROG_ONEUR_del                 <= PROG_ONEUR_sync;
            PROG_WINP_sync_int             <= PROG_WINP;
            PROG_WINP_sync                 <= PROG_WINP_sync_int;
            PROG_WINP_del                  <= PROG_WINP_sync;
            PROG_WREC_sync_int             <= PROG_WREC;
            PROG_WREC_sync                 <= PROG_WREC_sync_int;
            PROG_WREC_del                  <= PROG_WREC_sync;
            PROG_WOUT_sync_int             <= PROG_WOUT;
            PROG_WOUT_sync                 <= PROG_WOUT_sync_int;
            PROG_WOUT_del                  <= PROG_WOUT_sync;
            PROG_SEED_INP_sync_int         <= PROG_SEED_INP;
            PROG_SEED_INP_sync             <= PROG_SEED_INP_sync_int;
            PROG_SEED_INP_del              <= PROG_SEED_INP_sync;
            PROG_SEED_REC_sync_int         <= PROG_SEED_REC;
            PROG_SEED_REC_sync             <= PROG_SEED_REC_sync_int;
            PROG_SEED_REC_del              <= PROG_SEED_REC_sync;
            PROG_SEED_OUT_sync_int         <= PROG_SEED_OUT;
            PROG_SEED_OUT_sync             <= PROG_SEED_OUT_sync_int;
            PROG_SEED_OUT_del              <= PROG_SEED_OUT_sync;
            PROG_SEED_STRND_NEUR_sync_int  <= PROG_SEED_STRND_NEUR;
            PROG_SEED_STRND_NEUR_sync      <= PROG_SEED_STRND_NEUR_sync_int;
            PROG_SEED_STRND_NEUR_del       <= PROG_SEED_STRND_NEUR_sync;
            PROG_SEED_STRND_ONEUR_sync_int <= PROG_SEED_STRND_ONEUR;
            PROG_SEED_STRND_ONEUR_sync     <= PROG_SEED_STRND_ONEUR_sync_int;
            PROG_SEED_STRND_ONEUR_del      <= PROG_SEED_STRND_ONEUR_sync;
            PROG_SEED_STRND_TINP_sync_int  <= PROG_SEED_STRND_TINP;
            PROG_SEED_STRND_TINP_sync      <= PROG_SEED_STRND_TINP_sync_int;
            PROG_SEED_STRND_TINP_del       <= PROG_SEED_STRND_TINP_sync;
            PROG_SEED_STRND_TREC_sync_int  <= PROG_SEED_STRND_TREC;
            PROG_SEED_STRND_TREC_sync      <= PROG_SEED_STRND_TREC_sync_int;
            PROG_SEED_STRND_TREC_del       <= PROG_SEED_STRND_TREC_sync;
            PROG_SEED_STRND_TOUT_sync_int  <= PROG_SEED_STRND_TOUT;
            PROG_SEED_STRND_TOUT_sync      <= PROG_SEED_STRND_TOUT_sync_int;
            PROG_SEED_STRND_TOUT_del       <= PROG_SEED_STRND_TOUT_sync;
            PROG_SEED_NOISE_NEUR_sync_int  <= PROG_SEED_NOISE_NEUR;
            PROG_SEED_NOISE_NEUR_sync      <= PROG_SEED_NOISE_NEUR_sync_int;
            PROG_SEED_NOISE_NEUR_del       <= PROG_SEED_NOISE_NEUR_sync;
            READ_NEUR_sync_int             <= READ_NEUR;
            READ_NEUR_sync                 <= READ_NEUR_sync_int;
            READ_ONEUR_sync_int            <= READ_ONEUR;
            READ_ONEUR_sync                <= READ_ONEUR_sync_int;
            READ_WINP_sync_int             <= READ_WINP;
            READ_WINP_sync                 <= READ_WINP_sync_int;
            READ_WREC_sync_int             <= READ_WREC;
            READ_WREC_sync                 <= READ_WREC_sync_int;
            READ_WOUT_sync_int             <= READ_WOUT;
            READ_WOUT_sync                 <= READ_WOUT_sync_int;
        end
    end
    
    always @(posedge CLK, posedge RST) begin
        if (RST) begin
            TIME_TICK_sync_int           <= 1'b0;
            TIME_TICK_sync               <= 1'b0;
            TIME_TICK_del                <= 1'b0;
        end else if (!SPI_LOCAL_TICK) begin
            TIME_TICK_sync_int           <= TIME_TICK;
            TIME_TICK_sync               <= TIME_TICK_sync_int;
            TIME_TICK_del                <= TIME_TICK_sync;
        end
    end    
    
    assign TIME_TICK_new             = TIME_TICK_sync             & ~TIME_TICK_del;
    assign PROG_NEUR_new             = PROG_NEUR_sync             & ~PROG_NEUR_del;
    assign PROG_ONEUR_new            = PROG_ONEUR_sync            & ~PROG_ONEUR_del;
    assign PROG_WINP_new             = PROG_WINP_sync             & ~PROG_WINP_del;
    assign PROG_WREC_new             = PROG_WREC_sync             & ~PROG_WREC_del;
    assign PROG_WOUT_new             = PROG_WOUT_sync             & ~PROG_WOUT_del;
    assign PROG_SEED_INP_new         = PROG_SEED_INP_sync         & ~PROG_SEED_INP_del;
    assign PROG_SEED_REC_new         = PROG_SEED_REC_sync         & ~PROG_SEED_REC_del;
    assign PROG_SEED_OUT_new         = PROG_SEED_OUT_sync         & ~PROG_SEED_OUT_del;
    assign PROG_SEED_STRND_NEUR_new  = PROG_SEED_STRND_NEUR_sync  & ~PROG_SEED_STRND_NEUR_del;
    assign PROG_SEED_STRND_ONEUR_new = PROG_SEED_STRND_ONEUR_sync & ~PROG_SEED_STRND_ONEUR_del;
    assign PROG_SEED_STRND_TINP_new  = PROG_SEED_STRND_TINP_sync  & ~PROG_SEED_STRND_TINP_del;
    assign PROG_SEED_STRND_TREC_new  = PROG_SEED_STRND_TREC_sync  & ~PROG_SEED_STRND_TREC_del;
    assign PROG_SEED_STRND_TOUT_new  = PROG_SEED_STRND_TOUT_sync  & ~PROG_SEED_STRND_TOUT_del;
    assign PROG_SEED_NOISE_NEUR_new  = PROG_SEED_NOISE_NEUR_sync  & ~PROG_SEED_NOISE_NEUR_del;

    assign SPI_NUM_NEUR     = (SPI_NUM_REC_NEUR > SPI_NUM_INP_NEUR) ? SPI_NUM_REC_NEUR : SPI_NUM_INP_NEUR;
    assign SPI_NUM_RECOUT   = ((SPI_NUM_REC_NEUR > SPI_NUM_OUT_NEUR ) && (SPI_NUM_REC_NEUR > SPI_NUM_INP_NEUR)) ? SPI_NUM_REC_NEUR : ((SPI_NUM_INP_NEUR > SPI_NUM_OUT_NEUR) ? SPI_NUM_INP_NEUR : SPI_NUM_OUT_NEUR);
    assign TIMING_ERROR_RDY = SPI_TIMING_MODE ? TIMING_ERROR : ((state == IDLE) | ((state == PROP) & (state_evt == WAIT) & (nextstate_evt == WAIT)));


    //----------------------------------------------------------------------------------
    //    Receiving events
    //----------------------------------------------------------------------------------

    assign aerin_new = ~AERIN_ACK & ~AERIN_TAR_EN & AERIN_REQ_sync;

    always @(posedge CLK, posedge RST)
        if (RST)
            AERIN_ACK <= 1'b0;
        else if (aerin_new | target_new)
            AERIN_ACK <= 1'b1;
        else if (AERIN_ACK && !AERIN_REQ_sync)
            AERIN_ACK <= 1'b0;


    generate
        for (i=0; i<N; i=i+1)
            always @(posedge CLK)
                if (RST || ((state != IDLE) && (nextstate == IDLE))) begin
                    inp_events[i]      <= 1'b0;
                    inp_events_next[i] <= 1'b0;
                end else if (time_tick) begin
                    inp_events[i]      <= inp_events_next[i];
                    inp_events_next[i] <= 1'b0;
                end else if (aerin_new && (i == AERIN_ADDR)) begin
                    inp_events_next[i] <= 1'b1;
                end else if (neur_cs_ctrl && neur_we_ctrl && ((state_evt == EVT) || (state_evt == SUPP)) && ((nextstate_evt == CNT) || (nextstate_evt == WAIT)) && (i[7:0] == neur256_cnt)) begin
                    inp_events[i]      <= 1'b0;
                end
    endgenerate


    //----------------------------------------------------------------------------------
    //    Receiving targets (for both classification and regression)
    //----------------------------------------------------------------------------------

    assign target_new  = ~AERIN_ACK & AERIN_TAR_EN & AERIN_REQ_sync;
    assign target_done = target_new & (~SPI_REGRESSION | ((target_cnt[4:1] == SPI_NUM_OUT_NEUR) & target_cnt[0]));
    assign REQ_TAR     = (state == GET_TAR);

    always @(posedge CLK)
        if (state == IDLE)
            target_cnt <= 5'b0;
        else if ((state == GET_TAR) && (nextstate != GET_TAR))
            target_cnt <= 5'b0;
        else if (target_new)
            target_cnt <= target_cnt + 5'b1;

    // Regression
    generate
        for (i=0; i<16; i=i+1) begin
            always @(posedge CLK)
                if (SPI_REGRESSION && target_new && (i == target_cnt[4:1]))
                    if (target_cnt[0])
                        reg_tar[i][15:8] <= AERIN_ADDR;
                    else
                        reg_tar[i][ 7:0] <= AERIN_ADDR;
        end
    endgenerate

    // Classification 
    always @(posedge CLK)
        if (!SPI_REGRESSION && target_new)
                class_label <= AERIN_ADDR[3:0];
    always @(posedge CLK)
        if (state == IDLE)
                got_label <= 1'b0;
        else if (!SPI_REGRESSION && target_new)
                got_label <= 1'b1;


    //----------------------------------------------------------------------------------
    //    Sending classification results
    //----------------------------------------------------------------------------------

    assign send_done = OUT_ACK_sync & OUT_REQ & (send_cnt == send_num);
    assign send_num  = SPI_SEND_LABEL_ONLY ? 5'd0 : {SPI_NUM_OUT_NEUR,1'b1};

    always @(posedge CLK)
        if (state == IDLE) begin
            OUT_REQ  <= 1'b0;
            OUT_DATA <= 8'b0;
            send_cnt <=  'd0;
        end else if ((state == SEND) && (nextstate != SEND)) begin
            OUT_REQ  <= 1'b0;
            send_cnt <=  'd0;
        end else if ((state == SEND) && (send_cnt <= send_num))
            if          (!OUT_ACK_sync && !OUT_REQ) begin
                OUT_REQ  <= 1'b1;
                OUT_DATA <= SPI_SEND_LABEL_ONLY ? {4'b0,send_winner[15]} : (send_cnt[0] ? oneur_u[send_cnt[4:1]][15:8] : oneur_u[send_cnt[4:1]][7:0]);
            end else if ( OUT_ACK_sync &&  OUT_REQ) begin
                OUT_REQ   <= 1'b0;
                send_cnt  <= send_cnt + 'd1;
            end


    //----------------------------------------------------------------------------------
    //    Global controller (FSM, timestep-driven)
    //----------------------------------------------------------------------------------

    // State register
    always @(posedge CLK, posedge RST)
    begin
        if      (RST)                             state <= IDLE;
        else if (SPI_ERROR_HALT && TIMING_ERROR)  state <= IDLE;
        else                                      state <= nextstate;
    end

    // Next state logic
    always @(*)
        case(state)
            IDLE   :  if      (SAMPLE_sync && time_tick)                                                       nextstate = PROP;
                    else                                                                                       nextstate = IDLE;
            PROP   :  if      (time_tick)                                                                      nextstate = STEP;
                    else                                                                                       nextstate = PROP;
            STEP   :  if      (neur_step_cnt == SPI_NUM_RECOUT)                                                nextstate = SDONE;
                    else                                                                                       nextstate = STEP;
            SDONE  :     if   (!SAMPLE_sync)                                                                   nextstate = SEND;
                    else if   (SPI_EN_CONF)                                                                    nextstate = CONFIG;
                    else if   (|SPI_DO_EPROP && (TARGET_VALID_sync || &SPI_REGUL_MODE[2:1]))
                           if (!(SPI_SINGLE_LABEL && got_label))                                               nextstate = GET_TAR;
                         else                                                                                  nextstate = EPROP;
                    else if   (SPI_SEND_PER_TIMESTEP)                                                          nextstate = SEND;
                    else                                                                                       nextstate = PROP;
            GET_TAR:     if   (target_done)                                                                    nextstate = EPROP;
                    else                                                                                       nextstate = GET_TAR;
            CONFIG :     if   (!SPI_EN_CONF)
                           if (|SPI_DO_EPROP && (TARGET_VALID_sync || &SPI_REGUL_MODE[2:1]))
                             if (!(SPI_SINGLE_LABEL && got_label))                                             nextstate = GET_TAR;
                        else                                                                                   nextstate = EPROP;
                      else if   (SPI_SEND_PER_TIMESTEP)                                                        nextstate = SEND;
                      else                                                                                     nextstate = PROP;
                    else                                                                                       nextstate = CONFIG;
            EPROP  :     if   (eprop_done && SPI_SEND_PER_TIMESTEP)                                            nextstate = SEND;
                    else if   (eprop_done && SAMPLE_sync)                                                      nextstate = PROP;
                    else                                                                                       nextstate = EPROP;
            SEND   :     if   (send_done && SPI_SEND_PER_TIMESTEP && SAMPLE_sync)                              nextstate = PROP;
                    else if   (send_done)                                                                      nextstate = IDLE;
                    else                                                                                       nextstate = SEND;
            default:                                                                                           nextstate = IDLE;
        endcase 

    // SPI readyness
    assign SPI_RDY = (state == CONFIG);

    // Time handling
    always @(posedge CLK)
        if      (SPI_LOCAL_TICK && (state != IDLE) && (tick_cnt != SPI_CYCLES_PER_TICK)) tick_cnt <= tick_cnt + 32'd1;
        else                                                                             tick_cnt <= 32'd1;
    assign time_tick = SPI_LOCAL_TICK ? (tick_cnt == SPI_CYCLES_PER_TICK) : TIME_TICK_new;

    // Step handling
    always @(posedge CLK)
        if      (nextstate != STEP)
            neur_step_cnt <= 'd0;
        else if (state == STEP)
            neur_step_cnt <= neur_step_cnt + 'd1;

    // Timing error
    always @(posedge CLK, posedge RST)
        if      (RST)                                                                                                  TIMING_ERROR <= 1'b0;
        else if (time_tick && ( ((state != IDLE) && (state != PROP)) || ((state == PROP) && (state_evt != WAIT)) ) )   TIMING_ERROR <= 1'b1;



    // ----------------------------------------------------- e-prop handling --------------------------------------------------------------

    always @(posedge CLK)
        if ((state != EPROP) && (nextstate == EPROP)) begin
            e_pre      <=  'd0;
            e_post_msb <=  'd0;
            e_post_lsb <=  'd0;
            buf16_post <= 1'b1;
        end else if (state == EPROP) begin
            if (buf16_post) begin
                e_post_lsb <= e_post_lsb + 'd1;
                e_post_msb <= ((SPI_DO_EPROP == 3'b100) &  &e_post_lsb) ? (e_post_msb + 'd1) : e_post_msb; 
                buf16_post <=  (SPI_DO_EPROP == 3'b100) | ~&e_post_lsb;
            end else begin
                e_pre      <= ((e_pre[M:1] == SPI_NUM_NEUR) & e_pre[0]) ? 'd0 : (e_pre + 'd1);
                e_post_msb <= ((e_pre[M:1] == SPI_NUM_NEUR) & e_pre[0]) ? (e_post_msb + 'd1) : e_post_msb;
                buf16_post <= ((e_pre[M:1] == SPI_NUM_NEUR) & e_pre[0]);
            end
        end
    always @(posedge CLK)
        if (state == EPROP)
            neur_cs_eprop_del <= (neur_cs_eprop & buf16_post);
        else
            neur_cs_eprop_del <= 1'b0;
    assign eprop_done       = (SPI_DO_EPROP == 3'b100) ? ((e_post_msb == SPI_NUM_REC_NEUR[M-1:4]) & (e_post_lsb[4:1] == SPI_NUM_REC_NEUR[3:0]) & e_post_lsb[0])
                                                       : ((e_post_msb == SPI_NUM_REC_NEUR[M-1:4]) & (e_pre[M:1] == SPI_NUM_NEUR) & e_pre[0]);
    assign skip_update_winp = e_pre[0] & ~|(trace_inp[e_pre[1]]      >> SPI_FP_LOC_TINP) & trace_reg_zero;
    assign skip_update_wrec = e_pre[0] & ~|(trace_rec[e_pre[1]]      >> SPI_FP_LOC_TREC) & trace_reg_zero;
    assign skip_update_wout = ~|(trace_out[e_post_lsb[1]] >> SPI_FP_LOC_TOUT) & e_post_lsb[0];
    assign e_post           = {e_post_msb,e_post_lsb[4:1]}; 

    // Output logic     
        // Neur
    assign neur_cs_eprop     = (state == EPROP) & (buf16_post ? ((e_post     <= SPI_NUM_NEUR) & TARGET_VALID_sync & ~|e_post_lsb[1:0])
                                                              : ((e_pre[M:1] <= SPI_NUM_NEUR) & TARGET_VALID_sync & ~|e_pre[1:0]));
    assign neur_addr_eprop   = buf16_post ? e_post[M-1:1] : e_pre[M:2];
        // Wout
    assign wout_cs_eprop     = (state == EPROP) & buf16_post & ~skip_update_wout & (e_post <= SPI_NUM_REC_NEUR) & TARGET_VALID_sync & |SPI_DO_EPROP;
    assign wout_we_eprop     = e_post_lsb[0] & wout_cs_eprop & SPI_DO_EPROP[2];
    assign wout_addr_eprop   = {1'b0, e_post};
        // Winp, Wrec
    assign winp_cs_eprop     = (state == EPROP) & ~buf16_post & ~skip_update_winp & (e_pre[M:1] <= SPI_NUM_INP_NEUR) & (TARGET_VALID_sync | (&SPI_REGUL_MODE[2:1] & SPI_REGUL_W[0])) & SPI_DO_EPROP[0];
    assign wrec_cs_eprop     = (state == EPROP) & ~buf16_post & ~skip_update_wrec & (e_pre[M:1] <= SPI_NUM_REC_NEUR) & (TARGET_VALID_sync | (&SPI_REGUL_MODE[2:1] & SPI_REGUL_W[1])) & SPI_DO_EPROP[1];
    assign winp_we_eprop     = e_pre[0] & winp_cs_eprop;
    assign wrec_we_eprop     = e_pre[0] & wrec_cs_eprop;
    assign winp_addr_eprop   = {e_pre[M:1],e_post_msb}; 
    assign wrec_addr_eprop   = {e_pre[M:1],e_post_msb}; 
    
    // Learning signals (of post-synaptic neurons)
    always @(*) 
        if (e_post_lsb[0] & |SPI_DO_EPROP[1:0]) begin
            neur_learn_sigs_psum[0] = (oneur_err[0]*$signed(wout_data_o[7:0]));
            for (kk=1; kk<16; kk=kk+1)
                neur_learn_sigs_psum[kk] = (kk > SPI_NUM_OUT_NEUR) ? neur_learn_sigs_psum[kk-1] : ((oneur_err[kk]*$signed(wout_data_o[kk*8+:8])) + neur_learn_sigs_psum[kk-1]);
        end else 
            for (kk=0; kk<16; kk=kk+1)
                neur_learn_sigs_psum[kk] = 28'h0000000;
    assign neur_learn_sigs_temp1 = {{16{neur_learn_sigs_psum[15][27]}},neur_learn_sigs_psum[15]} << SPI_LEARN_SIG_SCALE;
    assign neur_learn_sigs_temp2 = (neur_learn_sigs_temp1[43:27] != {17{neur_learn_sigs_psum[15][27]}}) ? (neur_learn_sigs_psum[15][27] ? $signed(16'h8000) : $signed(16'h7FFF)) : $signed(neur_learn_sigs_temp1[27:12]);
    generate
        for (i=0; i<16; i=i+1) begin
            always @(posedge CLK)
                if ((state == EPROP) && (i == e_post_lsb[4:1]) && e_post_lsb[0])
                    learning_signals[i] <=  (e_post <= SPI_NUM_REC_NEUR) ? neur_learn_sigs_temp2 : $signed(16'd0);
        end
    endgenerate

    // Pseudo-derivatives and regularization traces (of post-synaptic neurons)
    assign neur_u_eprop     = e_post[0] ? neur_u[1]    : neur_u[0];
    assign trace_rec_reg    = e_post[0] ? trace_rec[1] : trace_rec[0];
    assign trace_rec_reg_f0 = (trace_rec_reg >> SPI_FP_LOC_TREC) - SPI_REGUL_F0;
    assign trace_inp_eprop  = (e_pre[1]  ? trace_inp[1] : trace_inp[0]) >> SPI_FP_LOC_TINP;
    assign trace_rec_eprop  = (e_pre[1]  ? trace_rec[1] : trace_rec[0]) >> SPI_FP_LOC_TREC;
    assign trace_out_eprop  = (e_post[0] ? trace_out[1] : trace_out[0]) >> SPI_FP_LOC_TOUT;
    assign update_h = ((state == EPROP) && buf16_post) ? ((neur_u_eprop < SPI_THR_H_0) ? SPI_H_0
                                                       : ((neur_u_eprop < SPI_THR_H_1) ? SPI_H_1
                                                       : ((neur_u_eprop < SPI_THR_H_2) ? SPI_H_2
                                                       : ((neur_u_eprop < SPI_THR_H_3) ? SPI_H_3
                                                                                       : SPI_H_4))))
                                                       : $signed(5'd0);
    generate
        for (n=0; n<16; n=n+1) begin
            always @(posedge CLK)
                if (e_post_lsb[0] && (n == e_post_lsb[4:1]))
                    neur_h[n] <= update_h;
            always @(posedge CLK)
                if (e_post_lsb[0] && (n == e_post_lsb[4:1]) && |SPI_REGUL_MODE)
                    trace_reg[n] <= (trace_rec_reg_f0 > (trace_rec_reg >> SPI_FP_LOC_TREC)) ? 12'd0 : trace_rec_reg_f0;
        end
    endgenerate
    assign trace_reg_zero = ~|SPI_REGUL_MODE ? 1'b1 : ~(|trace_reg[ 0] | |trace_reg[ 1] | |trace_reg[ 2] | |trace_reg[ 3] | 
                                                        |trace_reg[ 4] | |trace_reg[ 5] | |trace_reg[ 6] | |trace_reg[ 7] | 
                                                        |trace_reg[ 8] | |trace_reg[ 9] | |trace_reg[10] | |trace_reg[11] | 
                                                        |trace_reg[12] | |trace_reg[13] | |trace_reg[14] | |trace_reg[15]);

    // Input/Recurrent weight update
    assign do_update_winp  = winp_we_eprop & TARGET_VALID_sync;
    assign do_update_wrec  = wrec_we_eprop & TARGET_VALID_sync;
    assign do_update_wregi = winp_we_eprop & |SPI_REGUL_MODE & SPI_REGUL_W[0];
    assign do_update_wregr = wrec_we_eprop & |SPI_REGUL_MODE & SPI_REGUL_W[1];
    lfsr_winp_wrec lfsr_winp_0 (
        .clk(CLK),
        .rst(RST),
        .en(winp_we_eprop),
        .rst_val(25'h1),
        .seed(SPI_SEED_INP),
        .prog(PROG_SEED_INP_new),
        .out(winp_rand)
    );
    lfsr_winp_wrec lfsr_wrec_0 (
        .clk(CLK),
        .rst(RST),
        .en(wrec_we_eprop),
        .rst_val(25'h0424242),
        .seed(SPI_SEED_REC),
        .prog(PROG_SEED_REC_new),
        .out(wrec_rand)
    );

    generate
        for (n=0; n<16; n=n+1) begin
            assign winp_en[n]        = do_update_winp & |neur_h[n];
            assign wrec_en[n]        = do_update_wrec & |neur_h[n];

            assign prob_winp_e[n]    = winp_en[n] ? (learning_signals[n] * $signed({1'b0,trace_inp_eprop}) * neur_h[n]) : $signed(32'd0);
            assign prob_wrec_e[n]    = wrec_en[n] ? (learning_signals[n] * $signed({1'b0,trace_rec_eprop}) * neur_h[n]) : $signed(32'd0);
            
            assign prob_wregi[n]     = (SPI_REGUL_MODE[1] &  SPI_REGUL_W[0]) ? (($signed({20'b0,trace_reg[n]}) << SPI_REGUL_K_INP_P) >> SPI_REGUL_K_INP_R) : $signed(32'd0);
            assign prob_wregr[n]     = (SPI_REGUL_MODE[1] &  SPI_REGUL_W[1]) ? (($signed({20'b0,trace_reg[n]}) << SPI_REGUL_K_REC_P) >> SPI_REGUL_K_REC_R) : $signed(32'd0);
            assign prob_wregm[n]     = (SPI_REGUL_MODE[0] & |SPI_REGUL_W   ) ? (trace_reg[n] >> SPI_REGUL_K_MUL) : 12'd0;
            assign prob_wregs[n]     = (~SPI_REGUL_MODE[0] || ~|SPI_REGUL_W) ? $signed(6'd16) : ((|prob_wregm[n][11:4]) ? $signed(6'd0) : ($signed(6'd16) - $signed({2'b0,prob_wregm[n][3:0]})));

            assign prob_winp_k[n]    = prob_winp_e[n][31] ? (prob_winp_e[n] * $signed(6'd16)) : (prob_winp_e[n] * prob_wregs[n]);
            assign prob_wrec_k[n]    = prob_wrec_e[n][31] ? (prob_wrec_e[n] * $signed(6'd16)) : (prob_wrec_e[n] * prob_wregs[n]);

            assign prob_winp_s[n]    = $signed(prob_winp_k[n][35:4]) - prob_wregi[n];
            assign prob_winp[n]      = (~prob_winp_s[n][31] & prob_winp_k[n][31]) ? $signed(32'h80000000) : prob_winp_s[n];
            assign prob_wrec_s[n]    = $signed(prob_wrec_k[n][35:4]) - prob_wregr[n];
            assign prob_wrec[n]      = (~prob_wrec_s[n][31] & prob_wrec_k[n][31]) ? $signed(32'h80000000) : prob_wrec_s[n];

            stoch_update #(
                .WIDTH_IN(32),
                .LR_IN(5)
            ) stoch_update_winp (                                            
                .prob(prob_winp[n]),
                .w_in(winp_data_o[8*n+7:8*n]),
                .en(winp_en[n] | do_update_wregi),
                .lr_r(SPI_LR_R_WINP),
                .lr_p(SPI_LR_P_WINP),
                .rnd(winp_rand[32*n+31:32*n]),
                .w_out(winp_data_i_eprop[8*n+7:8*n]),
                .mask(winp_mask_eprop[8*n+7:8*n])
            );
            stoch_update #(
                .WIDTH_IN(32),
                .LR_IN(5)
            ) stoch_update_wrec (                                            
                .prob(prob_wrec[n]),
                .w_in(wrec_data_o[8*n+7:8*n]),
                .en(wrec_en[n] | do_update_wregr),
                .lr_r(SPI_LR_R_WREC),
                .lr_p(SPI_LR_P_WREC),
                .rnd(wrec_rand[32*n+31:32*n]),
                .w_out(wrec_data_i_eprop_temp[8*n+7:8*n]),
                .mask(wrec_mask_eprop[8*n+7:8*n])
            );
        assign wrec_data_i_eprop[8*n+7:8*n] = ((wrec_addr_eprop[11:8] == wrec_addr_eprop[3:0]) && (n == wrec_addr_eprop[7:4])) ? 8'h00 : wrec_data_i_eprop_temp[8*n+7:8*n];
        end
    endgenerate

    // Output weight update
    assign do_update_wout = wout_we_eprop;
    lfsr_wout lfsr_wout_0 (
        .clk(CLK),
        .rst(RST),
        .en(do_update_wout),
        .rst_val(22'h1),
        .seed(SPI_SEED_OUT),
        .prog(PROG_SEED_OUT_new),
        .out(wout_rand)
    );
    generate
        for (k=0; k<16; k=k+1) begin
            assign prob_wout[k] = do_update_wout ? (oneur_err[k] * $signed({1'b0,trace_out_eprop})) : $signed(28'd0);
            stoch_update #(
                .WIDTH_IN(28),
                .LR_IN(5)
            ) stoch_update_wout (                                            
                .prob(prob_wout[k]),
                .w_in(wout_data_o[8*k+7:8*k]),
                .en(do_update_wout),
                .lr_r(SPI_LR_R_WOUT),
                .lr_p(SPI_LR_P_WOUT),
                .rnd(wout_rand[28*k+27:28*k]),
                .w_out(wout_data_i_eprop[8*k+7:8*k]),
                .mask(wout_mask_eprop[8*k+7:8*k])
            );
        end
    endgenerate


    //----------------------------------------------------------------------------------
    //    Event controller (FSM, input-driven)
    //----------------------------------------------------------------------------------

    // State register
    always @(posedge CLK, posedge RST)
    begin
        if   (RST) state_evt <= WAIT;
        else       state_evt <= nextstate_evt;
    end
    
    // Next state logic
    always @(*)
        case(state_evt)
            WAIT   :  if      ((state != PROP) && (nextstate == PROP))                                            nextstate_evt = CNT;
                    else                                                                                          nextstate_evt = WAIT;
            CNT    :     if   (neur_z[neur256_cnt] || inp_event)                                                  nextstate_evt = EVT;
                    else if   (neur256_cnt == SPI_NUM_NEUR)                                                       nextstate_evt = WAIT;
                    else                                                                                          nextstate_evt = CNT;
            EVT    :  if      ((neur128x2_cnt[M-1:1] == SPI_NUM_REC_NEUR[M-1:1]) && neur128x2_cnt[0] && (neur256_cnt == SPI_NUM_NEUR))
                        if    (supp_cond)                                                                         nextstate_evt = SUPP;
                        else                                                                                      nextstate_evt = WAIT;
                    else if   ((neur128x2_cnt[M-1:1] == SPI_NUM_REC_NEUR[M-1:1]) && neur128x2_cnt[0])
                        if    (supp_cond)                                                                         nextstate_evt = SUPP;
                        else                                                                                      nextstate_evt = CNT;
                    else                                                                                          nextstate_evt = EVT;
            SUPP   :     if   (supp_cycle  && (neur256_cnt == SPI_NUM_NEUR))                                      nextstate_evt = WAIT;
                    else if   (supp_cycle)                                                                        nextstate_evt = CNT;
                    else                                                                                          nextstate_evt = SUPP;
            default:                                                                                              nextstate_evt = WAIT;
        endcase 


    // Output logic
    assign inp_event      = inp_events[neur256_cnt];
    assign inp_evt_trace  = ((state_evt == EVT) || (state_evt == SUPP)) & inp_event           & (neur_addr_ctrl == neur256_cnt[M-1:1]) & (SPI_DO_EPROP[0] | SPI_FORCE_TRACES);
    assign rec_evt_trace  =  (state_evt == EVT)                         & neur_z[neur256_cnt] & (neur_addr_ctrl == neur256_cnt[M-1:1]) & (SPI_DO_EPROP[1] | SPI_FORCE_TRACES);
    assign out_evt_trace  =  (state_evt == EVT)                         & neur_z[neur256_cnt] & (neur_addr_ctrl == neur256_cnt[M-1:1]) & (SPI_DO_EPROP[2] | SPI_FORCE_TRACES);
    assign winp_cs_ctrl   = (state_evt == EVT) & ~|neur128x2_cnt[3:0] & inp_event;
    assign wrec_cs_ctrl   = (state_evt == EVT) & ~|neur128x2_cnt[3:0] & neur_z[neur256_cnt];
    assign winp_addr_ctrl = {neur256_cnt,neur128x2_cnt[M-1:4]};
    assign wrec_addr_ctrl = {neur256_cnt,neur128x2_cnt[M-1:4]};
    assign wout_cs_ctrl   = (state_evt == CNT) & (nextstate_evt == EVT) & neur_z[neur256_cnt];
    assign wout_addr_ctrl = {1'b0,neur256_cnt};
    assign supp_cond      = inp_event & (neur256_cnt > SPI_NUM_REC_NEUR) & (SPI_DO_EPROP[0] | SPI_FORCE_TRACES);
    always @(posedge CLK)
        wout_cs_del <= wout_cs_ctrl;
    always @(posedge CLK)
        supp_cycle <= (state_evt == SUPP);

    // Control
    always @(posedge CLK)
        if      (nextstate_evt != EVT)
            neur128x2_cnt <= 'd0;
        else if (state_evt == EVT)
            neur128x2_cnt <= neur128x2_cnt + 'd1;
    always @(posedge CLK)
        if      (state_evt == WAIT)
            neur256_cnt <= 'd0;
        else if (nextstate_evt == CNT) 
            neur256_cnt <= neur256_cnt + 'd1;


    //----------------------------------------------------------------------------------
    //    Neuron array and update computation
    //----------------------------------------------------------------------------------

    assign neur_cs_ctrl   = (state_evt == EVT)                        | (state_evt == SUPP)                       | (state == STEP);
    assign neur_we_ctrl   = neur128x2_cnt[0]                          | supp_cycle                                | neur_step_cnt[0];
    assign neur_addr_ctrl = (state_evt == EVT) ? neur128x2_cnt[M-1:1] : ((state_evt == SUPP) ? neur256_cnt[M-1:1] : neur_step_cnt[M-1:1]);

    generate
        for (n=0; n<2; n=n+1)
            always @(*) begin
                // Input encoding
                neur_data_i_ctrl[50*n+15:50*n+ 0] = (state_evt == EVT) ? neur_u_next[n][15:0] : neur_u_step[n][15:0];        // Membrane potential
                neur_mask_ctrl[  50*n+15:50*n+ 0] = {16{neur_we_ctrl & ~supp_cycle}};
                neur_data_i_ctrl[50*n+27:50*n+16] = trace_inp_next[n];                                                       // Input traces
                neur_mask_ctrl[  50*n+27:50*n+16] = {12{neur_we_ctrl & (  ((inp_evt_trace & (n[0] == neur256_cnt[0])) | !neur_dirty[(neur_addr_ctrl << 1)+n])
                                                                        | neur_step_cnt[0])}};
                neur_data_i_ctrl[50*n+39:50*n+28] = trace_rec_next[n];                                                       // Recurrent traces
                neur_mask_ctrl[  50*n+39:50*n+28] = {12{neur_we_ctrl & (  ((rec_evt_trace & (n[0] == neur256_cnt[0])) | !neur_dirty[(neur_addr_ctrl << 1)+n])
                                                                        | neur_step_cnt[0])}};
                neur_data_i_ctrl[50*n+49:50*n+40] = trace_out_next[n];                                                       // Output traces
                neur_mask_ctrl[  50*n+49:50*n+40] = {10{neur_we_ctrl & (  ((out_evt_trace & (n[0] == neur256_cnt[0])) | !neur_dirty[(neur_addr_ctrl << 1)+n])
                                                                        | neur_step_cnt[0])}};

                neur_data_i_ctrl[14*n+113:14*n+100] = 14'b0;
                neur_mask_ctrl[  14*n+113:14*n+100] = 14'b0;
                // Output decoding
                neur_u[n]     = neur_dirty[(neur_addr_ctrl << 1)+n] ? $signed(neur_data_o[50*n+15:50*n+ 0]) : $signed(16'd0);
                trace_inp[n]  = neur_dirty[(neur_addr_ctrl << 1)+n] ?         neur_data_o[50*n+27:50*n+16]  :         12'd0 ;
                trace_rec[n]  = neur_dirty[(neur_addr_ctrl << 1)+n] ?         neur_data_o[50*n+39:50*n+28]  :         12'd0 ;
                trace_out[n]  = neur_dirty[(neur_addr_ctrl << 1)+n] ?         neur_data_o[50*n+49:50*n+40]  :         10'd0 ;
            end
    endgenerate
    assign alpha_msb = SPI_ALPHA_CONF[neur_addr_ctrl] ? 4'h8 : 4'h7;
    assign alpha     =         {     alpha_msb,neur_data_o[127:116]} ;
    assign alpha_s   = $signed({1'b0,alpha_msb,neur_data_o[127:116]});
    assign thr       = $signed(neur_data_o[115:100]);


    // Hidden neurons
    assign shift_winp = winp_data_o >> ({4'b0,neur128x2_cnt[3:1]}<<4);
    assign shift_wrec = wrec_data_o >> ({4'b0,neur128x2_cnt[3:1]}<<4);
    lfsr_noise_neur lfsr_noise_neur (
        .clk(CLK),
        .rst(RST),
        .en(SPI_NOISE_EN & (state == PROP) & neur128x2_cnt[0]),
        .rst_val(17'h1F0F1),
        .seed(SPI_SEED_NOISE_NEUR),
        .prog(PROG_SEED_NOISE_NEUR_new),
        .out(neur_noise_rand)
    );
    generate
        for (n=0; n<2; n=n+1) begin
            always @(*) begin
                update_winp[n] = (neur128x2_cnt[0] && inp_event          ) ? ($signed({{8{shift_winp[n*8+7]}},shift_winp[n*8+7:n*8]})<<SPI_FP_LOC_WINP) : $signed(16'd0);
                update_wrec[n] = (neur128x2_cnt[0] && neur_z[neur256_cnt]) ? ($signed({{8{shift_wrec[n*8+7]}},shift_wrec[n*8+7:n*8]})<<SPI_FP_LOC_WREC) : $signed(16'd0);
                update_wt[n]   = update_wrec[n] + update_winp[n];
                update_w[n]    =  ( update_wt[n][15] & ~update_wrec[n][15] & ~update_winp[n][15]) ? $signed(16'h7FFF) :
                                 ((~update_wt[n][15] &  update_wrec[n][15] &  update_winp[n][15]) ? $signed(16'h8000) :
                                                                                                    update_wt[n]);
                update_u[n]    = neur_u[n] + update_w[n] + (SPI_NOISE_EN ? ($signed(neur_noise_rand[n*16+15:n*16]) >>> SPI_NOISE_STR) : $signed(16'd0));
                ovfl_p[n]      = ~neur_u[n][15] & ~update_w[n][15] &  update_u[n][15];
                ovfl_n[n]      =  neur_u[n][15] &  update_w[n][15] & ~update_u[n][15];
                neur_u_next[n] = ovfl_p[n] ? $signed(16'h7FFF) : (ovfl_n[n] ? $signed(16'h8000) : update_u[n]);
            end
            lfsr_neur_stochround lfsr_strnd_neur_u (
                .clk(CLK),
                .rst(RST),
                .en(SPI_EN_STOCH_ROUND & (state == STEP) & neur_step_cnt[0] & (alpha != 16'h8000)),
                .rst_val(n ? 15'h70F0 : 15'h1234),
                .seed(SPI_SEED_STRND_NEUR[15*n+14:15*n]),
                .prog(PROG_SEED_STRND_NEUR_new),
                .out(neur_u_leak_rand[n])
            );
            always @(*) begin
                neur_u_leak[n] = ((state == STEP) && neur_step_cnt[0]) ? (neur_u[n]*alpha_s) : $signed(32'd0);
                neur_u_stoc[n] = (SPI_EN_STOCH_ROUND && (alpha != 16'h8000) && (neur_u_leak[n][14:0] >= neur_u_leak_rand[n]) && |neur_u_leak[n][30:15]) ? $signed(16'd1) : $signed(16'd0);  //more cropped ones --> more probability to increment (for both pos. and neg.)
                neur_u_lkst[n] = $signed(neur_u_leak[n][30:15]) + neur_u_stoc[n];
                neur_u_spk[n]  = ((state == STEP) && neur_step_cnt[0]) & (neur_u[n] >= thr);
                neur_u_step[n] = ((state == STEP) && neur_step_cnt[0]) ? (neur_u_spk[n] ? (SPI_RST_MODE ? $signed(16'd0) : (neur_u_lkst[n]-thr)) : neur_u_lkst[n]) : $signed(16'd0);
            end
        end
    endgenerate
    generate
        for (j=0; j<N; j=j+1) begin
            always @(posedge CLK)
                if (RST || ((state != IDLE) && (nextstate == IDLE)))
                    neur_z[j] <= 1'b0;
                else if (PROG_NEUR_new && SPI_ADDR[9] && (j == SPI_ADDR[M-1:0]))
                    neur_z[j] <= SPI_DATA[0];
                else if ((state == STEP) && (j[M-1:1] == neur_step_cnt[M-1:1]))
                    neur_z[j] <= neur_u_spk[j[0]];
                else if (neur_cs_ctrl && neur_we_ctrl && ((state_evt == EVT) || (state_evt == SUPP)) && ((nextstate_evt == CNT) || (nextstate_evt == WAIT)) && (j[7:0] == neur256_cnt))
                    neur_z[j] <= 1'b0;
            always @(posedge CLK)
                if (RST || ((state != IDLE) && (nextstate == IDLE)))
                    neur_dirty[j] <= 1'b0;
                else if (PROG_NEUR_new && SPI_ADDR[9] && (j == SPI_ADDR[M-1:0]))
                    neur_dirty[j] <= SPI_DATA[1];
                else if (neur_cs && neur_we && (j[M-1:1] == neur_addr))
                    neur_dirty[j] <= 1'b1;
        end
    endgenerate


    // Output neurons
    lfsr_oneur_stochround lfsr_strnd_oneur_u (
        .clk(CLK),
        .rst(RST),
        .en(SPI_EN_STOCH_ROUND & (state == STEP) & (SPI_KAPPA != 8'h80) & ~|neur_step_cnt[M-1:4]),
        .rst_val(15'h7ABA),
        .seed(SPI_SEED_STRND_ONEUR),
        .prog(PROG_SEED_STRND_ONEUR_new),
        .out(oneur_u_leak_rand)
    );
    generate
        for (k=0; k<16; k=k+1)
            always @(*) begin
                update_wout[k]    = wout_cs_del ? ($signed({{8{wout_data_o[k*8+7]}},wout_data_o[k*8+7:k*8]})<<SPI_FP_LOC_WOUT) : $signed(16'd0);
                update_out[k]     = oneur_u[k] + update_wout[k];
                ovfl_out_p[k]     = ~oneur_u[k][15] & ~update_wout[k][15] &  update_out[k][15];
                ovfl_out_n[k]     =  oneur_u[k][15] &  update_wout[k][15] & ~update_out[k][15];
                oneur_out_next[k] = ovfl_out_p[k] ? $signed(16'h7FFF) : (ovfl_out_n[k] ? $signed(16'h8000) : update_out[k]);
            end
    endgenerate
    assign oneur_u_leak = ((state == STEP) && ~|neur_step_cnt[M-1:4]) ? (oneur_u[neur_step_cnt[3:0]]*$signed({1'b0,SPI_KAPPA})) : $signed(24'd0);
    assign oneur_u_stoc = (SPI_EN_STOCH_ROUND && (SPI_KAPPA != 8'h80) && (oneur_u_leak[6:0] >= oneur_u_leak_rand) && |oneur_u_leak[22:7]) ? $signed(16'd1) : $signed(16'd0);  //more cropped ones --> more probability to increment (for both pos. and neg.)
    assign oneur_u_lkst = $signed(oneur_u_leak[22:7]) + oneur_u_stoc;
    generate
        for (k=0; k<16; k=k+1)
            always @(posedge CLK)
                if (RST || ((state != IDLE) && (nextstate == IDLE)))
                    oneur_u[k] <= $signed(16'd0);
                else if (PROG_ONEUR_new && (k == SPI_ADDR[3:0]))
                    oneur_u[k] <= SPI_DATA[15:0]; 
                else if (k <= SPI_NUM_OUT_NEUR)
                    if (wout_cs_del)
                        oneur_u[k] <= oneur_out_next[k];
                    else if ((state == STEP) && (k == neur_step_cnt[3:0]) && ~|neur_step_cnt[M-1:4])
                        oneur_u[k] <= oneur_u_lkst;
    endgenerate


    // Hardsigmoid activation function and error computation if e-prop is enabled
    generate
        for (k=0; k<16; k=k+1)
            output_act_err output_act_err (
                .en(|SPI_DO_EPROP & TARGET_VALID_sync & (k <= SPI_NUM_OUT_NEUR)),
                .regr(SPI_REGRESSION),
                .act(~SPI_NO_OUT_ACT),
                .label(class_label==k[3:0]),
                .target(reg_tar[k]),
                .vo(oneur_u[k]),
                .e(oneur_err[k])
            );
    endgenerate


    // Input, recurrent and output trace update
    generate
        for (n=0; n<2; n=n+1) begin
            lfsr_neur_stochround lfsr_strnd_tinp (
                .clk(CLK),
                .rst(RST),
                .en(SPI_EN_STOCH_ROUND & (state == STEP) & neur_step_cnt[0]),
                .rst_val(n ? 15'h7FCF : 15'h1348),
                .seed(SPI_SEED_STRND_TINP[15*n+14:15*n]),
                .prog(PROG_SEED_STRND_TINP_new),
                .out(trace_inp_rand[n])
            );
            lfsr_neur_stochround lfsr_strnd_trec (
                .clk(CLK),
                .rst(RST),
                .en(SPI_EN_STOCH_ROUND & (state == STEP) & neur_step_cnt[0]),
                .rst_val(n ? 15'h7BEA : 15'h4321),
                .seed(SPI_SEED_STRND_TREC[15*n+14:15*n]),
                .prog(PROG_SEED_STRND_TREC_new),
                .out(trace_rec_rand[n])
            );
            lfsr_oneur_stochround lfsr_strnd_tout (
                .clk(CLK),
                .rst(RST),
                .en(SPI_EN_STOCH_ROUND & (state == STEP) & neur_step_cnt[0]),
                .rst_val(n ? 15'h7EF0 : 15'h3FF3),
                .seed(SPI_SEED_STRND_TOUT[15*n+14:15*n]),
                .prog(PROG_SEED_STRND_TOUT_new),
                .out(trace_out_rand[n])
            );
            always @(*) begin
                trace_inp_inc[n]  = (inp_evt_trace & (n[0] == neur256_cnt[0])) ? (trace_inp[n] + (12'd8 << SPI_FP_LOC_TINP)) : 12'b0;
                trace_inp_step[n] = (state == STEP) ? (trace_inp[n]*alpha) : 28'b0;
                trace_inp_stoc[n] = (SPI_EN_STOCH_ROUND && (alpha != 16'h8000) && (trace_inp_step[n][14:0] >= trace_inp_rand[n]) && |trace_inp_step[n][26:15]) ? 12'd1 : 12'd0;  //more cropped ones --> more probability to increment (for both pos. and neg.)
                trace_inp_lkst[n] = trace_inp_step[n][26:15] + trace_inp_stoc[n];
                trace_inp_next[n] = (inp_evt_trace & (n[0] == neur256_cnt[0])) ? ((trace_inp_inc[n] < trace_inp[n]) ? 12'hFFF : trace_inp_inc[n])
                                                                               : ((state == STEP) ? trace_inp_lkst[n] : trace_inp[n]);
                trace_rec_inc[n]  = (rec_evt_trace & (n[0] == neur256_cnt[0])) ? (trace_rec[n] + (12'd8 << SPI_FP_LOC_TREC)) : 12'b0;
                trace_rec_step[n] = (state == STEP) ? (trace_rec[n]*alpha) : 28'b0;
                trace_rec_stoc[n] = (SPI_EN_STOCH_ROUND && (alpha != 16'h8000) && (trace_rec_step[n][14:0] >= trace_rec_rand[n]) && |trace_rec_step[n][26:15]) ? 12'd1 : 12'd0;  //more cropped ones --> more probability to increment (for both pos. and neg.)
                trace_rec_lkst[n] = trace_rec_step[n][26:15] + trace_rec_stoc[n];
                trace_rec_next[n] = (rec_evt_trace & (n[0] == neur256_cnt[0])) ? ((trace_rec_inc[n] < trace_rec[n]) ? 12'hFFF : trace_rec_inc[n])
                                                                               : ((state == STEP) ? trace_rec_lkst[n] : trace_rec[n]);
                trace_out_inc[n]  = (out_evt_trace & (n[0] == neur256_cnt[0])) ? (trace_out[n] + (10'd2 << SPI_FP_LOC_TOUT)) : 10'b0;
                trace_out_step[n] = (state == STEP) ? (trace_out[n]*SPI_KAPPA) : 18'b0;
                trace_out_stoc[n] = (SPI_EN_STOCH_ROUND && (SPI_KAPPA != 8'h80) && (trace_out_step[n][6:0] >= trace_out_rand[n]) && |trace_out_step[n][16:7]) ? 10'd1 : 10'd0;  //more cropped ones --> more probability to increment (for both pos. and neg.)
                trace_out_lkst[n] = trace_out_step[n][16:7] + trace_out_stoc[n];
                trace_out_next[n] = (out_evt_trace & (n[0] == neur256_cnt[0])) ? ((trace_out_inc[n] < trace_out[n]) ? 10'h3FF : trace_out_inc[n])
                                                                               : ((state == STEP) ? trace_out_lkst[n] : trace_out[n]);
            end
        end
    endgenerate


    //----------------------------------------------------------------------------------
    //    SRAMs
    //----------------------------------------------------------------------------------

    // Neuron SRAM 
    SRAM_128x128_wrapper neurons (
        // Global inputs
        .CK         (CLK),
        .SM         (SPI_SRAM_SPEEDMODE[7:6]),
        // Control and data inputs
        .CS         (neur_cs),
        .WE         (neur_we),
        .A          (neur_addr),
        .D          (neur_data_i),
        .M          (neur_mask),
        // Data output
        .Q          (neur_data_o)
    );
    assign neur_cs     = PROG_NEUR_new ?                                          1'b1           : (READ_NEUR_sync ?           1'b1 : ((state==EPROP) ? neur_cs_eprop     : neur_cs_ctrl    ));
    assign neur_we     = PROG_NEUR_new ?                                          1'b1           : (READ_NEUR_sync ?           1'b0 :                                       neur_we_ctrl     );
    assign neur_addr   = PROG_NEUR_new ?                                          SPI_ADDR[ 8:2] : (READ_NEUR_sync ? SPI_ADDR[ 8:2] : ((state==EPROP) ? neur_addr_eprop   : neur_addr_ctrl  ));
    assign neur_data_i = PROG_NEUR_new ? ({96'b0,SPI_DATA[31:0]} << ({5'b0,SPI_ADDR[1:0]}<<5)) :                                                                            neur_data_i_ctrl  ;
    assign neur_mask   = PROG_NEUR_new ? ({96'b0,32'hFFFFFFFF  } << ({5'b0,SPI_ADDR[1:0]}<<5)) :                                                                            neur_mask_ctrl    ;

    // Input weights SRAM
    SRAM_4096x128_wrapper weights_inp (       
        // Global inputs
        .CK         (CLK),
        .SM         (SPI_SRAM_SPEEDMODE[5:4]),
        // Control and data inputs
        .CS         (winp_cs),
        .WE         (winp_we),
        .A          (winp_addr),
        .D          (winp_data_i),
        .M          (winp_mask),
        // Data output
        .Q          (winp_data_o)
    );
    assign winp_cs     = PROG_WINP_new ?                                          1'b1           : (READ_WINP_sync ?           1'b1 : ((state==EPROP) ? winp_cs_eprop     : winp_cs_ctrl    ));
    assign winp_we     = PROG_WINP_new ?                                          1'b1           : (READ_WINP_sync ?           1'b0 :                                       winp_we_eprop    );
    assign winp_addr   = PROG_WINP_new ?                                          SPI_ADDR[13:2] : (READ_WINP_sync ? SPI_ADDR[13:2] : ((state==EPROP) ? winp_addr_eprop   : winp_addr_ctrl  ));
    assign winp_data_i = PROG_WINP_new ? ({96'b0,SPI_DATA[31:0]} << ({5'b0,SPI_ADDR[1:0]} << 5)) :                                                                          winp_data_i_eprop ;
    assign winp_mask   = PROG_WINP_new ? ({96'b0,32'hFFFFFFFF  } << ({5'b0,SPI_ADDR[1:0]} << 5)) :                                                                          winp_mask_eprop   ;

    // Recurrent weights SRAM
    SRAM_4096x128_wrapper weights_rec (       
        // Global inputs
        .CK         (CLK),
        .SM         (SPI_SRAM_SPEEDMODE[3:2]),
        // Control and data inputs
        .CS         (wrec_cs),
        .WE         (wrec_we),
        .A          (wrec_addr),
        .D          (wrec_data_i),
        .M          (wrec_mask),
        // Data output
        .Q          (wrec_data_o)
    );
    assign wrec_cs     = PROG_WREC_new ?                                          1'b1           : (READ_WREC_sync ?           1'b1 : ((state==EPROP) ? wrec_cs_eprop     : wrec_cs_ctrl    ));
    assign wrec_we     = PROG_WREC_new ?                                          1'b1           : (READ_WREC_sync ?           1'b0 :                                       wrec_we_eprop    );
    assign wrec_addr   = PROG_WREC_new ?                                          SPI_ADDR[13:2] : (READ_WREC_sync ? SPI_ADDR[13:2] : ((state==EPROP) ? wrec_addr_eprop   : wrec_addr_ctrl  ));
    assign wrec_data_i = PROG_WREC_new ? ({96'b0,SPI_DATA[31:0]} << ({5'b0,SPI_ADDR[1:0]} << 5)) :                                                                          wrec_data_i_eprop ;
    assign wrec_mask   = PROG_WREC_new ? ({96'b0,32'hFFFFFFFF  } << ({5'b0,SPI_ADDR[1:0]} << 5)) :                                                                          wrec_mask_eprop   ;

    // Output weights SRAM 
    SRAM_512x128_wrapper weights_out (
        // Global inputs
        .CK         (CLK),
        .SM         (SPI_SRAM_SPEEDMODE[1:0]),
        // Control and data inputs
        .CS         (wout_cs),
        .WE         (wout_we),
        .A          (wout_addr),
        .D          (wout_data_i),
        .M          (wout_mask),
        // Data output
        .Q          (wout_data_o)
    );
    assign wout_cs     = PROG_WOUT_new ?                                          1'b1           : (READ_WOUT_sync ?           1'b1 : ((state==EPROP) ? wout_cs_eprop     : wout_cs_ctrl    ));
    assign wout_we     = PROG_WOUT_new ?                                          1'b1           : (READ_WOUT_sync ?           1'b0 :                                       wout_we_eprop    );
    assign wout_addr   = PROG_WOUT_new ?                                          SPI_ADDR[10:2] : (READ_WOUT_sync ? SPI_ADDR[10:2] : ((state==EPROP) ? wout_addr_eprop   : wout_addr_ctrl  ));
    assign wout_data_i = PROG_WOUT_new ? ({96'b0,SPI_DATA[31:0]} << ({5'b0,SPI_ADDR[1:0]}<<5)) :                                                                            wout_data_i_eprop ;
    assign wout_mask   = PROG_WOUT_new ? ({96'b0,32'hFFFFFFFF  } << ({5'b0,SPI_ADDR[1:0]}<<5)) :                                                                            wout_mask_eprop   ;


    //----------------------------------------------------------------------------------
    //    Winner computation
    //----------------------------------------------------------------------------------

    // Identifying winner neuron
    always @(*) begin 
        if (!SPI_REGRESSION && INFER_ACC_sync && (state == SDONE)) begin
            neur_winner[0]  = oneur_u[0];
            label_winner[0] = 4'd0;
            for (kk=1; kk<16; kk=kk+1)
                if ((kk <= SPI_NUM_OUT_NEUR) && (oneur_u[kk] > neur_winner[kk-1])) begin
                   neur_winner[kk]  = oneur_u[kk];
                   label_winner[kk] = kk[3:0];
                end else begin
                   neur_winner[kk]  = neur_winner[kk-1];
                   label_winner[kk] = label_winner[kk-1];
                end
        end else begin
            for (kk=0; kk<16; kk=kk+1) begin
               neur_winner[kk]  = 16'b0;
               label_winner[kk] = 4'b0;
            end
        end
    end
    generate
        for (k=0; k<16; k=k+1)
            always @(posedge CLK)
                if (state == IDLE)
                    cnt_winner[k] <= 16'b0;
                else if ((k <= SPI_NUM_OUT_NEUR) && INFER_ACC_sync && (state == SDONE) && (k[3:0] == label_winner[15]))
                    cnt_winner[k] <= cnt_winner[k] + 16'd1;
    endgenerate
    always @(*) begin
        if (!SPI_REGRESSION && (state==SEND)) begin
            aer_winner[0]  = cnt_winner[0];
            send_winner[0] = 4'd0;
            for (kk=1; kk<16; kk=kk+1)
                if ((kk <= SPI_NUM_OUT_NEUR) && (cnt_winner[kk] > aer_winner[kk-1])) begin
                   aer_winner[kk]  = cnt_winner[kk];
                   send_winner[kk] = kk[3:0];
                end else begin
                   aer_winner[kk]  = aer_winner[kk-1];
                   send_winner[kk] = send_winner[kk-1];
                end
        end else begin
            for (kk=0; kk<16; kk=kk+1) begin
               aer_winner[kk]  = 16'b0;
               send_winner[kk] = 4'b0;
            end
        end
    end


    //----------------------------------------------------------------------------------
    //    Readback
    //----------------------------------------------------------------------------------

    assign winp_data_o_shift = winp_data_o >> ({5'b0,SPI_ADDR[1:0]}<<5);
    assign wrec_data_o_shift = wrec_data_o >> ({5'b0,SPI_ADDR[1:0]}<<5);
    assign wout_data_o_shift = wout_data_o >> ({5'b0,SPI_ADDR[1:0]}<<5);
    assign neur_data_o_shift = neur_data_o >> ({5'b0,SPI_ADDR[1:0]}<<5);
    
    always @(posedge CLK)
        if      (READ_NEUR_sync) 
            SRNN_READBACK <= neur_data_o_shift[31:0];
        else if (READ_ONEUR_sync) 
            SRNN_READBACK <= {16'd0,oneur_u[SPI_ADDR[3:0]]};
        else if (READ_WINP_sync) 
            SRNN_READBACK <= winp_data_o_shift[31:0];
        else if (READ_WREC_sync) 
            SRNN_READBACK <= wrec_data_o_shift[31:0];
        else if (READ_WOUT_sync) 
            SRNN_READBACK <= wout_data_o_shift[31:0];


endmodule




module SRAM_4096x128_wrapper (

    // Global inputs
    input          CK,                       // Clock (synchronous read/write)
    input  [  1:0] SM,                       // Speed mode

    // Control and data inputs
    input          CS,                       // Chip select (active high)
    input          WE,                       // Write enable (active high)
    input  [ 11:0] A,                        // Address bus 
    input  [127:0] D,                        // Data input bus (write)
    input  [127:0] M,                        // Mask bus (write, 1=overwrite)

    // Data output
    output [127:0] Q                         // Data output bus (read)   
);

    `ifdef SRAM_BEHAV
        //  Simple behavioral code for simulation, to be replaced by a 4096-word 128-bit SRAM macro 
        //  or Block RAM (BRAM) memory with the same format for FPGA implementations.      
            reg [127:0] SRAM[4095:0];
            reg [127:0] Qr;
            always @(posedge CK) begin
                Qr <= CS ? SRAM[A] : Qr;
                if (CS & WE) SRAM[A] <= (D & M) | (SRAM[A] & ~M);
            end
            assign Q = Qr;
    `else
        
        //                                                      //
        // SRAM macro instantiation goes here                   //
        // (technology-specific cells/macros have been removed) //
        //                                                      //

    `endif
    
endmodule

module SRAM_512x128_wrapper (

    // Global inputs
    input          CK,                       // Clock (synchronous read/write)
    input  [  1:0] SM,                       // Speed mode

    // Control and data inputs
    input          CS,                       // Chip select (active high)
    input          WE,                       // Write enable (active high)
    input  [  8:0] A,                        // Address bus 
    input  [127:0] D,                        // Data input bus (write)
    input  [127:0] M,                        // Mask bus (write, 1=overwrite)

    // Data output
    output [127:0] Q                         // Data output bus (read)   
);

    `ifdef SRAM_BEHAV
        //  Simple behavioral code for simulation, to be replaced by a 512-word 128-bit SRAM macro 
        //  or Block RAM (BRAM) memory with the same format for FPGA implementations.      
            reg [127:0] SRAM[511:0];
            reg [127:0] Qr;
            always @(posedge CK) begin
                Qr <= CS ? SRAM[A] : Qr;
                if (CS & WE) SRAM[A] <= (D & M) | (SRAM[A] & ~M);
            end
            assign Q = Qr;
    `else
        
        //                                                      //
        // SRAM macro instantiation goes here                   //
        // (technology-specific cells/macros have been removed) //
        //                                                      //

    `endif
    
endmodule

module SRAM_128x128_wrapper (

    // Global inputs
    input          CK,                       // Clock (synchronous read/write)
    input  [  1:0] SM,                       // Speed mode

    // Control and data inputs
    input          CS,                       // Chip select (active high)
    input          WE,                       // Write enable (active high)
    input  [  6:0] A,                        // Address bus 
    input  [127:0] D,                        // Data input bus (write)
    input  [127:0] M,                        // Mask bus (write, 1=overwrite)

    // Data output
    output [127:0] Q                         // Data output bus (read)   
);

    `ifdef SRAM_BEHAV
        //  Simple behavioral code for simulation, to be replaced by a 128-word 128-bit SRAM macro 
        //  or Block RAM (BRAM) memory with the same format for FPGA implementations.      
            reg [127:0] SRAM[127:0];
            reg [127:0] Qr;
            always @(posedge CK) begin
                Qr <= CS ? SRAM[A] : Qr;
                if (CS & WE) SRAM[A] <= (D & M) | (SRAM[A] & ~M);
            end
            assign Q = Qr;
    `else
        
        //                                                      //
        // SRAM macro instantiation goes here                   //
        // (technology-specific cells/macros have been removed) //
        //                                                      //

    `endif
    
endmodule    


module output_act_err (
    input  wire               en,
    input  wire               regr,
    input  wire               act,
    input  wire               label,
    input  wire signed [15:0] target,
    input  wire signed [15:0] vo,
    output wire signed [15:0] e
);
    reg  signed [15:0] yt;
    reg  signed [15:0] y;
    wire signed [15:0] e_temp;
    wire               ovfl_p, ovfl_n;

    // Output
    always @(*)
        if (en)
            if (act)
                if      (vo >  $signed( 16'd2047))
                    y = $signed(16'd2048);
                else if (vo <  $signed(-16'd2048))
                    y = $signed(16'd0);
                else
                    y = $signed((vo + $signed(16'd2048)) >>> 1);
            else
                y = vo;
        else
            y = $signed(16'd0);

    // Target
    always @(*)
        if (en)
            if (regr)              // Regression
                yt = target;
            else                   // Classification
                yt = label ? $signed(16'd2048) : $signed(16'd0);
        else
            yt = $signed(16'd0);

    // Error
    assign e_temp = yt - y;
    assign ovfl_p = ~yt[15] &  y[15] &  e_temp[15];
    assign ovfl_n =  yt[15] & ~y[15] & ~e_temp[15];
    assign e      = ovfl_p ? $signed(16'h7FFF) : (ovfl_n ? $signed(16'h8000) : e_temp);

endmodule


module stoch_update #(
    parameter WIDTH_IN = 16,
    parameter    LR_IN = 4
)(
    input  wire signed [WIDTH_IN-1:0] prob,
    input  wire signed [         7:0] w_in,
    input  wire                       en,        
    input  wire        [   LR_IN-1:0] lr_r,        
    input  wire        [   LR_IN-1:0] lr_p,
    input  wire        [WIDTH_IN-1:0] rnd,
    output wire signed [         7:0] w_out,
    output wire        [         7:0] mask
);
    wire                       prob_0, prob_m, prob_ovfl;
    wire                       update;
    wire                       overflow;
    wire                       no_change;
    wire signed [         7:0] w_updated;
    wire        [WIDTH_IN-1:0] prob_abs, prob_tot;
    wire  [WIDTH_IN+(1<<LR_IN)-1:0] prob_lrp;
    
    assign prob_0    = (prob == 'd0) | ~en;
    assign prob_m    = (~|prob[WIDTH_IN-2:0] & prob[WIDTH_IN-1]);
    assign prob_abs  = prob_0 ? 'd0 : (prob[WIDTH_IN-1] ? {$signed(~prob)+$signed('d1)} : prob);
    assign prob_lrp  = {{(1<<LR_IN){1'b0}},prob_abs} << lr_p;
    assign prob_ovfl = |prob_lrp[WIDTH_IN+(1<<LR_IN)-1:WIDTH_IN];
    assign prob_tot  = (prob_ovfl ? {WIDTH_IN{1'b1}} : prob_lrp[WIDTH_IN-1:0]) >> lr_r;
    assign update    = prob_m | (prob_tot >= rnd);
    
    assign no_change = prob_0 | ~update;
    assign w_updated = prob[WIDTH_IN-1] ? (w_in - $signed(8'd1)) : (w_in + $signed(8'd1));
    assign overflow  = (w_in[7] & ~w_updated[7] & prob[WIDTH_IN-1]) | (~w_in[7] & w_updated[7] & ~prob[WIDTH_IN-1]);
    assign w_out     = (no_change | overflow) ? w_in : w_updated;
    assign mask      = {8{~no_change}};

endmodule

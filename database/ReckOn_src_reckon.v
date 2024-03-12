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
// "reckon.v" -  Toplevel file
// 
// Project: ReckOn - Spiking RECurrent neural network processor enabling ON-chip learning over second-long timescales
//
// Author:  C. Frenkel, Institute of Neuroinformatics, University of Zurich and ETH Zurich
//
// Cite/paper: [C. Frenkel and G. Indiveri, "ReckOn: A 28nm sub-mm² task-agnostic spiking recurrent neural network
//             processor enabling on-chip learning over second-long timescales," IEEE International Solid-State
//             Circuits Conference (ISSCC), 2022]
//
// Comments: Unpublished parts were removed. Padring (made of technology-specific cells) has been removed from the toplevel.
//
//------------------------------------------------------------------------------


`define EXT_CLK_ONLY 1

module reckon #(
    parameter N = 256,
    parameter M = 8
)(
    // Global inputs   -------------------------------
    input  wire         CLK_EXT,     
    input  wire         CLK_INT_EN,   
    input  wire         RST,
    
    // SPI slave       -------------------------------
    input  wire         SCK,
    input  wire         MOSI,
    output wire         MISO,

    // Input bus and control inputs ------------------
    input  wire [M-1:0] AERIN_ADDR,
    input  wire         AERIN_REQ,
    output wire         AERIN_ACK,
    input  wire         AERIN_TAR_EN,
    input  wire         SAMPLE,
    input  wire         TIME_TICK,
    input  wire         TARGET_VALID,
    input  wire         INFER_ACC,

    // Output bus and control outputs ----------------
    output wire         SPI_RDY,
    output wire         TIMING_ERROR_RDY,
    output wire         OUT_REQ,
    input  wire         OUT_ACK,
    output wire [  7:0] OUT_DATA
);

    //----------------------------------------------------------------------------------
    //    Internal regs and wires
    //----------------------------------------------------------------------------------

    // Reset and clock
    wire                 CLK, CLK_INT;
    wire                 CLK_INT_MON;
    reg                  RST_sync_int, RST_sync;
    reg                  SPI_EN_CONF_sync_int, SPI_EN_CONF_sync;

    // SPI
    wire                 MISO_int;
    wire                 REQ_TAR;
    wire        [  15:0] SPI_ADDR;
    wire        [  31:0] SPI_DATA;
    wire                 SPI_EN_CONF;
    wire        [  31:0] SRNN_READBACK;
        // Toplevel
    wire        [   8:0] SPI_RO_STAGE_SEL;
    wire                 SPI_GET_CLKINT_OUT;
    wire                 SPI_GET_TAR_REQ_OUT;
        // Control
    wire                 SPI_RST_MODE;
    wire        [   2:0] SPI_DO_EPROP;
    wire                 SPI_LOCAL_TICK;
    wire                 SPI_ERROR_HALT;
    wire        [   2:0] SPI_FP_LOC_WINP;
    wire        [   2:0] SPI_FP_LOC_WREC;
    wire        [   2:0] SPI_FP_LOC_WOUT;
    wire        [   2:0] SPI_FP_LOC_TINP;
    wire        [   2:0] SPI_FP_LOC_TREC;
    wire        [   2:0] SPI_FP_LOC_TOUT;
    wire        [   3:0] SPI_LEARN_SIG_SCALE;
    wire        [   2:0] SPI_REGUL_MODE;
    wire        [   1:0] SPI_REGUL_W;
    wire                 SPI_EN_STOCH_ROUND;
    wire        [   7:0] SPI_SRAM_SPEEDMODE;
    wire                 SPI_TIMING_MODE;
    wire                 SPI_REGRESSION;
    wire                 SPI_SINGLE_LABEL;
    wire                 SPI_NO_OUT_ACT;
    wire                 SPI_SEND_PER_TIMESTEP;
    wire                 SPI_SEND_LABEL_ONLY;
    wire                 SPI_NOISE_EN;
    wire                 SPI_FORCE_TRACES;
        // Network 
    wire        [  31:0] SPI_CYCLES_PER_TICK;
    wire        [ 127:0] SPI_ALPHA_CONF;
    wire        [   7:0] SPI_KAPPA;
    wire signed [  15:0] SPI_THR_H_0;
    wire signed [  15:0] SPI_THR_H_1;
    wire signed [  15:0] SPI_THR_H_2;
    wire signed [  15:0] SPI_THR_H_3;
    wire signed [   4:0] SPI_H_0;
    wire signed [   4:0] SPI_H_1;
    wire signed [   4:0] SPI_H_2;
    wire signed [   4:0] SPI_H_3;
    wire signed [   4:0] SPI_H_4;
    wire        [   4:0] SPI_LR_R_WINP;
    wire        [   4:0] SPI_LR_P_WINP;
    wire        [   4:0] SPI_LR_R_WREC;
    wire        [   4:0] SPI_LR_P_WREC;
    wire        [   4:0] SPI_LR_R_WOUT;
    wire        [   4:0] SPI_LR_P_WOUT;
    wire        [  24:0] SPI_SEED_INP;
    wire        [  24:0] SPI_SEED_REC;
    wire        [  21:0] SPI_SEED_OUT;
    wire        [  29:0] SPI_SEED_STRND_NEUR;
    wire        [  14:0] SPI_SEED_STRND_ONEUR;
    wire        [  29:0] SPI_SEED_STRND_TINP;
    wire        [  29:0] SPI_SEED_STRND_TREC;
    wire        [  29:0] SPI_SEED_STRND_TOUT;
    wire        [  16:0] SPI_SEED_NOISE_NEUR;
    wire        [ M-1:0] SPI_NUM_INP_NEUR;
    wire        [ M-1:0] SPI_NUM_REC_NEUR;
    wire        [   3:0] SPI_NUM_OUT_NEUR;
    wire        [  11:0] SPI_REGUL_F0;
    wire        [   4:0] SPI_REGUL_K_INP_R;
    wire        [   4:0] SPI_REGUL_K_INP_P;
    wire        [   4:0] SPI_REGUL_K_REC_R;
    wire        [   4:0] SPI_REGUL_K_REC_P;
    wire        [   4:0] SPI_REGUL_K_MUL;
    wire        [   3:0] SPI_NOISE_STR;
        // Programming triggers
    wire                 PROG_NEUR;
    wire                 PROG_ONEUR;
    wire                 PROG_WINP;
    wire                 PROG_WREC;
    wire                 PROG_WOUT;
    wire                 PROG_SEED_INP;
    wire                 PROG_SEED_REC;
    wire                 PROG_SEED_OUT;
    wire                 PROG_SEED_STRND_NEUR;
    wire                 PROG_SEED_STRND_ONEUR;
    wire                 PROG_SEED_STRND_TINP;
    wire                 PROG_SEED_STRND_TREC;
    wire                 PROG_SEED_STRND_TOUT;
    wire                 PROG_SEED_NOISE_NEUR;
    wire                 READ_NEUR;
    wire                 READ_ONEUR;
    wire                 READ_WINP;
    wire                 READ_WREC;
    wire                 READ_WOUT;


    //----------------------------------------------------------------------------------
    //    Reset (with double sync barrier)
    //----------------------------------------------------------------------------------
    
    always @(posedge CLK) begin
        RST_sync_int <= RST;
        RST_sync     <= RST_sync_int;
    end

    
    //----------------------------------------------------------------------------------
    //  Clock generator (optional)
    //----------------------------------------------------------------------------------



    `ifdef EXT_CLK_ONLY
        assign CLK_INT     = 1'b0;
        assign CLK_INT_div = 1'b0;
    `else
        
        //                                                      //
        // Dummy clk gen and div instantiations go here         //
        // Implementations to be provided separately            //
        // (technology-specific cells/macros have been removed) //
        //                                                      //
        clock_generator clock_generator_0 (
            .EN(CLK_INT_EN),
            .STAGE_SEL(SPI_RO_STAGE_SEL),
            .OUT(CLK_INT)
        );
        assign CLK_INT_MON = CLK_INT & SPI_GET_CLKINT_OUT;
        clock_divider clock_divider_0 (
            .RST(RST),
            .CLK(CLK_INT_MON),
            .CLK_DIV(CLK_INT_div)
        );
        //                                                      //
        //                                                      //

    `endif

    clk_or clk_or_0 (
        .CLK_EXT(CLK_EXT),
        .CLK_INT(CLK_INT),
        .CLK(CLK)
    );
    
    assign MISO = MISO_int | (SPI_GET_CLKINT_OUT & CLK_INT_div) | (SPI_GET_TAR_REQ_OUT & REQ_TAR);  // Monitor the divided clock on the MISO pin

    
    //----------------------------------------------------------------------------------
    //    SPI + parameter bank + clock int/ext handling
    //----------------------------------------------------------------------------------

    spi_slave #(
        .N(N),
        .M(M)
    ) spi_slave_0 (
        // Global inputs -------------------------
        .RST_async(RST),
    
        // SPI slave interface -------------------
        .SCK(SCK),
        .MISO(MISO_int),
        .MOSI(MOSI),
        
        // Global output -------------------------
        .SPI_ADDR(SPI_ADDR),
        .SPI_DATA(SPI_DATA),
        .SPI_EN_CONF(SPI_EN_CONF),
    
        // Parameter outputs ---------------------
            // Toplevel
        .SPI_RO_STAGE_SEL(SPI_RO_STAGE_SEL),
        .SPI_GET_CLKINT_OUT(SPI_GET_CLKINT_OUT),
        .SPI_GET_TAR_REQ_OUT(SPI_GET_TAR_REQ_OUT),
            // Control
        .SPI_RST_MODE(SPI_RST_MODE),
        .SPI_DO_EPROP(SPI_DO_EPROP),
        .SPI_LOCAL_TICK(SPI_LOCAL_TICK),
        .SPI_ERROR_HALT(SPI_ERROR_HALT),
        .SPI_FP_LOC_WINP(SPI_FP_LOC_WINP),
        .SPI_FP_LOC_WREC(SPI_FP_LOC_WREC),
        .SPI_FP_LOC_WOUT(SPI_FP_LOC_WOUT),
        .SPI_FP_LOC_TINP(SPI_FP_LOC_TINP),
        .SPI_FP_LOC_TREC(SPI_FP_LOC_TREC),
        .SPI_FP_LOC_TOUT(SPI_FP_LOC_TOUT),
        .SPI_LEARN_SIG_SCALE(SPI_LEARN_SIG_SCALE),
        .SPI_REGUL_MODE(SPI_REGUL_MODE),
        .SPI_REGUL_W(SPI_REGUL_W),
        .SPI_EN_STOCH_ROUND(SPI_EN_STOCH_ROUND),
        .SPI_SRAM_SPEEDMODE(SPI_SRAM_SPEEDMODE),
        .SPI_TIMING_MODE(SPI_TIMING_MODE),
        .SPI_REGRESSION(SPI_REGRESSION),
        .SPI_SINGLE_LABEL(SPI_SINGLE_LABEL),
        .SPI_NO_OUT_ACT(SPI_NO_OUT_ACT),
        .SPI_SEND_PER_TIMESTEP(SPI_SEND_PER_TIMESTEP),
        .SPI_SEND_LABEL_ONLY(SPI_SEND_LABEL_ONLY),
        .SPI_NOISE_EN(SPI_NOISE_EN),
        .SPI_FORCE_TRACES(SPI_FORCE_TRACES),
            // Network
        .SPI_CYCLES_PER_TICK(SPI_CYCLES_PER_TICK),
        .SPI_ALPHA_CONF(SPI_ALPHA_CONF),
        .SPI_KAPPA(SPI_KAPPA),
        .SPI_THR_H_0(SPI_THR_H_0),
        .SPI_THR_H_1(SPI_THR_H_1),
        .SPI_THR_H_2(SPI_THR_H_2),
        .SPI_THR_H_3(SPI_THR_H_3),
        .SPI_H_0(SPI_H_0),
        .SPI_H_1(SPI_H_1),
        .SPI_H_2(SPI_H_2),
        .SPI_H_3(SPI_H_3),
        .SPI_H_4(SPI_H_4),
        .SPI_LR_R_WINP(SPI_LR_R_WINP),
        .SPI_LR_P_WINP(SPI_LR_P_WINP),
        .SPI_LR_R_WREC(SPI_LR_R_WREC),
        .SPI_LR_P_WREC(SPI_LR_P_WREC),
        .SPI_LR_R_WOUT(SPI_LR_R_WOUT),
        .SPI_LR_P_WOUT(SPI_LR_P_WOUT),
        .SPI_SEED_INP(SPI_SEED_INP),
        .SPI_SEED_REC(SPI_SEED_REC),
        .SPI_SEED_OUT(SPI_SEED_OUT),
        .SPI_SEED_STRND_NEUR(SPI_SEED_STRND_NEUR),
        .SPI_SEED_STRND_ONEUR(SPI_SEED_STRND_ONEUR),
        .SPI_SEED_STRND_TINP(SPI_SEED_STRND_TINP),
        .SPI_SEED_STRND_TREC(SPI_SEED_STRND_TREC),
        .SPI_SEED_STRND_TOUT(SPI_SEED_STRND_TOUT),
        .SPI_SEED_NOISE_NEUR(SPI_SEED_NOISE_NEUR),
        .SPI_NUM_INP_NEUR(SPI_NUM_INP_NEUR),
        .SPI_NUM_REC_NEUR(SPI_NUM_REC_NEUR),
        .SPI_NUM_OUT_NEUR(SPI_NUM_OUT_NEUR),
        .SPI_REGUL_F0(SPI_REGUL_F0),
        .SPI_REGUL_K_INP_R(SPI_REGUL_K_INP_R),
        .SPI_REGUL_K_INP_P(SPI_REGUL_K_INP_P),
        .SPI_REGUL_K_REC_R(SPI_REGUL_K_REC_R),
        .SPI_REGUL_K_REC_P(SPI_REGUL_K_REC_P),
        .SPI_REGUL_K_MUL(SPI_REGUL_K_MUL),
        .SPI_NOISE_STR(SPI_NOISE_STR),
            // Programming triggers
        .PROG_NEUR(PROG_NEUR),
        .PROG_ONEUR(PROG_ONEUR),
        .PROG_WINP(PROG_WINP),
        .PROG_WREC(PROG_WREC),
        .PROG_WOUT(PROG_WOUT),
        .PROG_SEED_INP(PROG_SEED_INP),
        .PROG_SEED_REC(PROG_SEED_REC),
        .PROG_SEED_OUT(PROG_SEED_OUT),
        .PROG_SEED_STRND_NEUR(PROG_SEED_STRND_NEUR),
        .PROG_SEED_STRND_ONEUR(PROG_SEED_STRND_ONEUR),
        .PROG_SEED_STRND_TINP(PROG_SEED_STRND_TINP),
        .PROG_SEED_STRND_TREC(PROG_SEED_STRND_TREC),
        .PROG_SEED_STRND_TOUT(PROG_SEED_STRND_TOUT),
        .PROG_SEED_NOISE_NEUR(PROG_SEED_NOISE_NEUR),
        .READ_NEUR(READ_NEUR),
        .READ_ONEUR(READ_ONEUR),
        .READ_WINP(READ_WINP),
        .READ_WREC(READ_WREC),
        .READ_WOUT(READ_WOUT),

        // Inputs from SRNN ----------------------
        .SRNN_READBACK(SRNN_READBACK)
    );
    
    
    //----------------------------------------------------------------------------------
    //    Spiking recurrent neural network core
    //----------------------------------------------------------------------------------

    srnn #(
        .N(N),
        .M(M)
    ) srnn_0 (
        // Global inputs   ------------------------------------
        .CLK(CLK),
        .RST(RST_sync),
        
        // Parameters -----------------------------------------
            // Control
        .SPI_RST_MODE(SPI_RST_MODE),
        .SPI_DO_EPROP(SPI_DO_EPROP),
        .SPI_LOCAL_TICK(SPI_LOCAL_TICK),
        .SPI_ERROR_HALT(SPI_ERROR_HALT),
        .SPI_FP_LOC_WINP(SPI_FP_LOC_WINP),
        .SPI_FP_LOC_WREC(SPI_FP_LOC_WREC),
        .SPI_FP_LOC_WOUT(SPI_FP_LOC_WOUT),
        .SPI_FP_LOC_TINP(SPI_FP_LOC_TINP),
        .SPI_FP_LOC_TREC(SPI_FP_LOC_TREC),
        .SPI_FP_LOC_TOUT(SPI_FP_LOC_TOUT),
        .SPI_LEARN_SIG_SCALE(SPI_LEARN_SIG_SCALE),
        .SPI_REGUL_MODE(SPI_REGUL_MODE),
        .SPI_REGUL_W(SPI_REGUL_W),
        .SPI_EN_STOCH_ROUND(SPI_EN_STOCH_ROUND),
        .SPI_SRAM_SPEEDMODE(SPI_SRAM_SPEEDMODE),
        .SPI_TIMING_MODE(SPI_TIMING_MODE),
        .SPI_REGRESSION(SPI_REGRESSION),
        .SPI_SINGLE_LABEL(SPI_SINGLE_LABEL),
        .SPI_NO_OUT_ACT(SPI_NO_OUT_ACT),
        .SPI_SEND_PER_TIMESTEP(SPI_SEND_PER_TIMESTEP),
        .SPI_SEND_LABEL_ONLY(SPI_SEND_LABEL_ONLY),
        .SPI_NOISE_EN(SPI_NOISE_EN),
        .SPI_FORCE_TRACES(SPI_FORCE_TRACES),
            // Network
        .SPI_CYCLES_PER_TICK(SPI_CYCLES_PER_TICK),
        .SPI_ALPHA_CONF(SPI_ALPHA_CONF),
        .SPI_KAPPA(SPI_KAPPA),
        .SPI_THR_H_0(SPI_THR_H_0),
        .SPI_THR_H_1(SPI_THR_H_1),
        .SPI_THR_H_2(SPI_THR_H_2),
        .SPI_THR_H_3(SPI_THR_H_3),
        .SPI_H_0(SPI_H_0),
        .SPI_H_1(SPI_H_1),
        .SPI_H_2(SPI_H_2),
        .SPI_H_3(SPI_H_3),
        .SPI_H_4(SPI_H_4),
        .SPI_LR_R_WINP(SPI_LR_R_WINP),
        .SPI_LR_P_WINP(SPI_LR_P_WINP),
        .SPI_LR_R_WREC(SPI_LR_R_WREC),
        .SPI_LR_P_WREC(SPI_LR_P_WREC),
        .SPI_LR_R_WOUT(SPI_LR_R_WOUT),
        .SPI_LR_P_WOUT(SPI_LR_P_WOUT),
        .SPI_SEED_INP(SPI_SEED_INP),
        .SPI_SEED_REC(SPI_SEED_REC),
        .SPI_SEED_OUT(SPI_SEED_OUT),
        .SPI_SEED_STRND_NEUR(SPI_SEED_STRND_NEUR),
        .SPI_SEED_STRND_ONEUR(SPI_SEED_STRND_ONEUR),
        .SPI_SEED_STRND_TINP(SPI_SEED_STRND_TINP),
        .SPI_SEED_STRND_TREC(SPI_SEED_STRND_TREC),
        .SPI_SEED_STRND_TOUT(SPI_SEED_STRND_TOUT),
        .SPI_SEED_NOISE_NEUR(SPI_SEED_NOISE_NEUR),
        .SPI_NUM_INP_NEUR(SPI_NUM_INP_NEUR),
        .SPI_NUM_REC_NEUR(SPI_NUM_REC_NEUR),
        .SPI_NUM_OUT_NEUR(SPI_NUM_OUT_NEUR),
        .SPI_REGUL_F0(SPI_REGUL_F0),
        .SPI_REGUL_K_INP_R(SPI_REGUL_K_INP_R),
        .SPI_REGUL_K_INP_P(SPI_REGUL_K_INP_P),
        .SPI_REGUL_K_REC_R(SPI_REGUL_K_REC_R),
        .SPI_REGUL_K_REC_P(SPI_REGUL_K_REC_P),
        .SPI_REGUL_K_MUL(SPI_REGUL_K_MUL),
        .SPI_NOISE_STR(SPI_NOISE_STR),
        
        // Inputs from SPI slave ------------------------------
        .SPI_ADDR(SPI_ADDR),
        .SPI_DATA(SPI_DATA),
        .SPI_EN_CONF(SPI_EN_CONF),
        .PROG_NEUR(PROG_NEUR),
        .PROG_ONEUR(PROG_ONEUR),
        .PROG_WINP(PROG_WINP),
        .PROG_WREC(PROG_WREC),
        .PROG_WOUT(PROG_WOUT),
        .PROG_SEED_INP(PROG_SEED_INP),
        .PROG_SEED_REC(PROG_SEED_REC),
        .PROG_SEED_OUT(PROG_SEED_OUT),
        .PROG_SEED_STRND_NEUR(PROG_SEED_STRND_NEUR),
        .PROG_SEED_STRND_ONEUR(PROG_SEED_STRND_ONEUR),
        .PROG_SEED_STRND_TINP(PROG_SEED_STRND_TINP),
        .PROG_SEED_STRND_TREC(PROG_SEED_STRND_TREC),
        .PROG_SEED_STRND_TOUT(PROG_SEED_STRND_TOUT),
        .PROG_SEED_NOISE_NEUR(PROG_SEED_NOISE_NEUR),
        .READ_NEUR(READ_NEUR),
        .READ_ONEUR(READ_ONEUR),
        .READ_WINP(READ_WINP),
        .READ_WREC(READ_WREC),
        .READ_WOUT(READ_WOUT),
    
        // Outputs to SPI slave --------------------------------
        .SRNN_READBACK(SRNN_READBACK),
        
        // Core inputs            -----------------------------
        .AERIN_ADDR(AERIN_ADDR),
        .AERIN_REQ(AERIN_REQ),
        .AERIN_ACK(AERIN_ACK),
        .AERIN_TAR_EN(AERIN_TAR_EN),
        .TARGET_VALID(TARGET_VALID),
        .INFER_ACC(INFER_ACC),
        .SAMPLE(SAMPLE),
        .TIME_TICK(TIME_TICK),
        
        // Core outputs          ------------------------------
        .SPI_RDY(SPI_RDY),
        .TIMING_ERROR_RDY(TIMING_ERROR_RDY),

        // Output bus            ------------------------------
        .REQ_TAR(REQ_TAR),
        .OUT_REQ(OUT_REQ),
        .OUT_ACK(OUT_ACK),
        .OUT_DATA(OUT_DATA)
    );
     
    
endmodule


// Separate clock OR module for easier SDC constraints definition
module clk_or (
    // Inputs
        input  wire        CLK_EXT,
        input  wire        CLK_INT,
    // Outputs
        output wire        CLK
);
    
    assign CLK = CLK_EXT | CLK_INT;
    
endmodule

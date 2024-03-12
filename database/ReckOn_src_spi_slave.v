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
// "spi_slave.v" -  32-bit SPI slave bus 
// 
// Project: ReckOn - Spiking RECurrent neural network processor enabling ON-chip learning over second-long timescales
//
// Author:  C. Frenkel, Institute of Neuroinformatics, University of Zurich and ETH Zurich
//
// Cite/paper: [C. Frenkel and G. Indiveri, "ReckOn: A 28nm sub-mm² task-agnostic spiking recurrent neural network
//             processor enabling on-chip learning over second-long timescales," IEEE International Solid-State
//             Circuits Conference (ISSCC), 2022]
//
// Comments: SPI doc and address space as follows:
//    
//     32-bit SPI shift register    (falling edge)
//     Address organization: {[R/Wb][Code<2:0>][NumWrites<11:0>][StartAddr<15:0>]} - Total 32 bits (supports max 2047 reads at a time!)
//                                If code==cfg:
//                                        Addr<15:0>:  config register address
//                                If code==neur (each pair of hidden neurons occupy a single 128-bit word in memory):
//                                    If Addr<9>==0 (SRAM programming):
//                                        Addr<8:2>:   SRAM address
//                                        Addr<1:0>:   word 32-bit chunk address
//                                    If Addr<9>==1 (reserved registers programming for debug purposes):
//                                        Addr<7:0>:   neuron index
//                                If code==neur_out (each output neuron occupies a 16-bit membrane potential, register-file-based storage):
//                                        Addr<3:0>:   output neuron index
//                                If code==inp_weights (each weight occupies single byte, SRAM words are 128-bit):
//                                        Addr<13:2>:  SRAM address
//                                        Addr< 1:0>:  word 32-bit chunk address
//                                If code==rec_weights (each weight occupies single byte, SRAM words are 128-bit):
//                                        Addr<13:2>:  SRAM address
//                                        Addr< 1:0>:  word 32-bit chunk address
//                                If code==out_weights (each weight occupies a single byte, 8-bit register storage):
//                                        Addr<10:2>:  SRAM address
//                                        Addr< 1:0>:  word 32-bit chunk address
//     Data    organization: {[Data<31:0>]} - Total 32 bits
//                             Data<31:0> contains 32-bit data received from SPI, not all bits of which may be used
//     Codes               : 3'b000: cfg (not readable)
//                           3'b001: neur
//                           3'b010: neur_out
//                           3'b011: inp_weights
//                           3'b100: rec_weights
//                           3'b101: out_weights
//
//------------------------------------------------------------------------------



module spi_slave  #(
    parameter N = 256,
    parameter M = 8
)(

    // Global inputs -------------------------
    input  wire                 RST_async,

    // SPI slave interface -------------------
    input  wire                 SCK,
    output wire                 MISO,
    input  wire                 MOSI,

    // Global output -------------------------
    output  reg        [  15:0] SPI_ADDR,
    output  reg        [  31:0] SPI_DATA,
    output  reg                 SPI_EN_CONF,
    
    // Parameter outputs ---------------------
        // Toplevel
    output  reg        [   8:0] SPI_RO_STAGE_SEL,
    output  reg                 SPI_GET_CLKINT_OUT,
    output  reg                 SPI_GET_TAR_REQ_OUT,
        // Control
    output  reg                 SPI_RST_MODE,
    output  reg        [   2:0] SPI_DO_EPROP,
    output  reg                 SPI_LOCAL_TICK,
    output  reg                 SPI_ERROR_HALT,
    output  reg        [   2:0] SPI_FP_LOC_WINP,
    output  reg        [   2:0] SPI_FP_LOC_WREC,
    output  reg        [   2:0] SPI_FP_LOC_WOUT,
    output  reg        [   2:0] SPI_FP_LOC_TINP,
    output  reg        [   2:0] SPI_FP_LOC_TREC,
    output  reg        [   2:0] SPI_FP_LOC_TOUT,
    output  reg        [   3:0] SPI_LEARN_SIG_SCALE,
    output  reg        [   2:0] SPI_REGUL_MODE,
    output  reg        [   1:0] SPI_REGUL_W,
    output  reg                 SPI_EN_STOCH_ROUND,
    output  reg        [   7:0] SPI_SRAM_SPEEDMODE,
    output  reg                 SPI_TIMING_MODE,
    output  reg                 SPI_REGRESSION,
    output  reg                 SPI_SINGLE_LABEL,
    output  reg                 SPI_NO_OUT_ACT,
    output  reg                 SPI_SEND_PER_TIMESTEP,
    output  reg                 SPI_SEND_LABEL_ONLY,
    output  reg                 SPI_NOISE_EN,
    output  reg                 SPI_FORCE_TRACES,
        // Network 
    output  reg        [  31:0] SPI_CYCLES_PER_TICK,
    output  reg        [ 127:0] SPI_ALPHA_CONF,
    output  reg        [   7:0] SPI_KAPPA,
    output  reg signed [  15:0] SPI_THR_H_0,
    output  reg signed [  15:0] SPI_THR_H_1,
    output  reg signed [  15:0] SPI_THR_H_2,
    output  reg signed [  15:0] SPI_THR_H_3,
    output  reg signed [   4:0] SPI_H_0,
    output  reg signed [   4:0] SPI_H_1,
    output  reg signed [   4:0] SPI_H_2,
    output  reg signed [   4:0] SPI_H_3,
    output  reg signed [   4:0] SPI_H_4,
    output  reg        [   4:0] SPI_LR_R_WINP,
    output  reg        [   4:0] SPI_LR_P_WINP,
    output  reg        [   4:0] SPI_LR_R_WREC,
    output  reg        [   4:0] SPI_LR_P_WREC,
    output  reg        [   4:0] SPI_LR_R_WOUT,
    output  reg        [   4:0] SPI_LR_P_WOUT,
    output  reg        [  24:0] SPI_SEED_INP,
    output  reg        [  24:0] SPI_SEED_REC,
    output  reg        [  21:0] SPI_SEED_OUT,
    output  reg        [  29:0] SPI_SEED_STRND_NEUR,
    output  reg        [  14:0] SPI_SEED_STRND_ONEUR,
    output  reg        [  29:0] SPI_SEED_STRND_TINP,
    output  reg        [  29:0] SPI_SEED_STRND_TREC,
    output  reg        [  29:0] SPI_SEED_STRND_TOUT,
    output  reg        [  16:0] SPI_SEED_NOISE_NEUR,
    output  reg        [ M-1:0] SPI_NUM_INP_NEUR,
    output  reg        [ M-1:0] SPI_NUM_REC_NEUR,
    output  reg        [   3:0] SPI_NUM_OUT_NEUR,
    output  reg        [  11:0] SPI_REGUL_F0,
    output  reg        [   4:0] SPI_REGUL_K_INP_R,
    output  reg        [   4:0] SPI_REGUL_K_INP_P,
    output  reg        [   4:0] SPI_REGUL_K_REC_R,
    output  reg        [   4:0] SPI_REGUL_K_REC_P,
    output  reg        [   4:0] SPI_REGUL_K_MUL,
    output  reg        [   3:0] SPI_NOISE_STR,
        // Programming triggers
    output  reg                 PROG_NEUR,
    output  reg                 PROG_ONEUR,
    output  reg                 PROG_WINP,
    output  reg                 PROG_WREC,
    output  reg                 PROG_WOUT,
    output  reg                 PROG_SEED_INP,
    output  reg                 PROG_SEED_REC,
    output  reg                 PROG_SEED_OUT,
    output  reg                 PROG_SEED_STRND_NEUR,
    output  reg                 PROG_SEED_STRND_ONEUR,
    output  reg                 PROG_SEED_STRND_TINP,
    output  reg                 PROG_SEED_STRND_TREC,
    output  reg                 PROG_SEED_STRND_TOUT,
    output  reg                 PROG_SEED_NOISE_NEUR,
    output  reg                 READ_NEUR,
    output  reg                 READ_ONEUR,
    output  reg                 READ_WINP,
    output  reg                 READ_WREC,
    output  reg                 READ_WOUT,
    
    // Inputs from SRNN ------------------------
    input   wire       [  31:0] SRNN_READBACK
); 

    //----------------------------------------------------------------------------------
    //    REG & WIRES :
    //----------------------------------------------------------------------------------
    
    reg  [16:0] spi_cnt;
    
    reg  [31:0] spi_shift_reg_out, spi_shift_reg_in;
    reg  [31:0] spi_addr;
    wire [11:0] num_write;
    
    genvar      i;
    

    //----------------------------------------------------------------------------------
    //    SPI circuitry
    //----------------------------------------------------------------------------------

    // SPI counter
    always @(negedge SCK, posedge RST_async)
        if      (RST_async)                                      spi_cnt <= 17'd0;
        else if (&spi_cnt[4:0] && (spi_cnt[16:5] >= num_write))  spi_cnt <= 17'd0;
        else                                                     spi_cnt <= spi_cnt + 17'd1;
    assign num_write = (spi_cnt == 17'd31) ? spi_shift_reg_in[27:16] : spi_addr[27:16];

    always @(negedge SCK, posedge RST_async)
        if      (RST_async)                                      spi_addr <= 32'd0;
        else if (spi_cnt == 17'd31)                              spi_addr <= spi_shift_reg_in[31:0];
    
    always @(posedge SCK)
        spi_shift_reg_in <= {spi_shift_reg_in[30:0], MOSI};
        
    always @(negedge SCK, posedge RST_async)
        if (RST_async) begin
            spi_shift_reg_out     <= 32'b0;
            PROG_NEUR             <= 1'b0;
            PROG_ONEUR            <= 1'b0;
            PROG_WINP             <= 1'b0;
            PROG_WREC             <= 1'b0;
            PROG_WOUT             <= 1'b0;
            PROG_SEED_INP         <= 1'b0;
            PROG_SEED_REC         <= 1'b0;
            PROG_SEED_OUT         <= 1'b0;
            PROG_SEED_STRND_NEUR  <= 1'b0;
            PROG_SEED_STRND_ONEUR <= 1'b0;
            PROG_SEED_STRND_TINP  <= 1'b0;
            PROG_SEED_STRND_TREC  <= 1'b0;
            PROG_SEED_STRND_TOUT  <= 1'b0;
            PROG_SEED_NOISE_NEUR  <= 1'b0;
            READ_NEUR             <= 1'b0;
            READ_ONEUR            <= 1'b0;
            READ_WINP             <= 1'b0;
            READ_WREC             <= 1'b0;
            READ_WOUT             <= 1'b0;
        end else if (!spi_addr[31] && &spi_cnt[4:0] && |spi_cnt[16:5]) begin
            spi_shift_reg_out     <= 32'b0;
            PROG_NEUR             <=  (spi_addr[30:28] == 3'b001);
            PROG_ONEUR            <=  (spi_addr[30:28] == 3'b010);
            PROG_WINP             <=  (spi_addr[30:28] == 3'b011);
            PROG_WREC             <=  (spi_addr[30:28] == 3'b100);
            PROG_WOUT             <=  (spi_addr[30:28] == 3'b101);
            PROG_SEED_INP         <= ((spi_addr[30:28] == 3'b000) && (spi_addr[15:0] == 16'd85));
            PROG_SEED_REC         <= ((spi_addr[30:28] == 3'b000) && (spi_addr[15:0] == 16'd86));
            PROG_SEED_OUT         <= ((spi_addr[30:28] == 3'b000) && (spi_addr[15:0] == 16'd87));
            PROG_SEED_STRND_NEUR  <= ((spi_addr[30:28] == 3'b000) && (spi_addr[15:0] == 16'd88));
            PROG_SEED_STRND_ONEUR <= ((spi_addr[30:28] == 3'b000) && (spi_addr[15:0] == 16'd89));
            PROG_SEED_STRND_TINP  <= ((spi_addr[30:28] == 3'b000) && (spi_addr[15:0] == 16'd90));
            PROG_SEED_STRND_TREC  <= ((spi_addr[30:28] == 3'b000) && (spi_addr[15:0] == 16'd91));
            PROG_SEED_STRND_TOUT  <= ((spi_addr[30:28] == 3'b000) && (spi_addr[15:0] == 16'd92));
            PROG_SEED_NOISE_NEUR  <= ((spi_addr[30:28] == 3'b000) && (spi_addr[15:0] == 16'd93));
            SPI_ADDR              <=   spi_addr[15:0] + {4'b0,spi_cnt[16:5]} - 16'd1;
            SPI_DATA              <=   spi_shift_reg_in;
        end else if ( spi_shift_reg_in[31] && (spi_cnt == 17'd31)) begin
            spi_shift_reg_out     <=  {spi_shift_reg_out[30:0], 1'b0};
            READ_NEUR             <=  (spi_shift_reg_in[30:28] == 3'b001);
            READ_ONEUR            <=  (spi_shift_reg_in[30:28] == 3'b010);
            READ_WINP             <=  (spi_shift_reg_in[30:28] == 3'b011);
            READ_WREC             <=  (spi_shift_reg_in[30:28] == 3'b100);
            READ_WOUT             <=  (spi_shift_reg_in[30:28] == 3'b101);
            SPI_ADDR              <=   spi_shift_reg_in[15:0];
        end else if ( spi_addr[31] && &spi_cnt[4:0] && |spi_cnt[16:5] && (spi_cnt[16:5] < num_write)) begin
            spi_shift_reg_out     <=  {spi_shift_reg_out[30:0], 1'b0};
            READ_NEUR             <=  (spi_addr[30:28] == 3'b001);
            READ_ONEUR            <=  (spi_addr[30:28] == 3'b010);
            READ_WINP             <=  (spi_addr[30:28] == 3'b011);
            READ_WREC             <=  (spi_addr[30:28] == 3'b100);
            READ_WOUT             <=  (spi_addr[30:28] == 3'b101);
            SPI_ADDR              <=   spi_addr[15:0] + {4'b0,spi_cnt[16:5]};
        end else if ( spi_addr[31] && ~|spi_cnt[4:0] && |spi_cnt[16:5]) begin
            spi_shift_reg_out     <= SRNN_READBACK << 1;
            READ_NEUR             <= 1'b0;
            READ_ONEUR            <= 1'b0;
            READ_WINP             <= 1'b0;
            READ_WREC             <= 1'b0;
            READ_WOUT             <= 1'b0;
            PROG_NEUR             <= 1'b0;
            PROG_ONEUR            <= 1'b0;
            PROG_WINP             <= 1'b0;
            PROG_WREC             <= 1'b0;
            PROG_WOUT             <= 1'b0;
            PROG_SEED_INP         <= 1'b0;
            PROG_SEED_REC         <= 1'b0;
            PROG_SEED_OUT         <= 1'b0;
            PROG_SEED_STRND_NEUR  <= 1'b0;
            PROG_SEED_STRND_ONEUR <= 1'b0;
            PROG_SEED_STRND_TINP  <= 1'b0;
            PROG_SEED_STRND_TREC  <= 1'b0;
            PROG_SEED_STRND_TOUT  <= 1'b0;
            PROG_SEED_NOISE_NEUR  <= 1'b0;
        end else if (spi_cnt[4:0] == 5'd0) begin
            PROG_NEUR             <= 1'b0;
            PROG_ONEUR            <= 1'b0;
            PROG_WINP             <= 1'b0;
            PROG_WREC             <= 1'b0;
            PROG_WOUT             <= 1'b0;
            PROG_SEED_INP         <= 1'b0;
            PROG_SEED_REC         <= 1'b0;
            PROG_SEED_OUT         <= 1'b0;
            PROG_SEED_STRND_NEUR  <= 1'b0;
            PROG_SEED_STRND_ONEUR <= 1'b0;
            PROG_SEED_STRND_TINP  <= 1'b0;
            PROG_SEED_STRND_TREC  <= 1'b0;
            PROG_SEED_STRND_TOUT  <= 1'b0;
            PROG_SEED_NOISE_NEUR  <= 1'b0;
        end else begin
            spi_shift_reg_out   <= {spi_shift_reg_out[30:0], 1'b0};
        end
        
    // SPI MISO
    assign MISO = (spi_addr[31] && ~|spi_cnt[4:0] && |spi_cnt[16:5]) ? SRNN_READBACK[31] : spi_shift_reg_out[31];

    
    //----------------------------------------------------------------------------------
    //    Output config. registers
    //----------------------------------------------------------------------------------
    

    // Toplevel

    //SPI_EN_CONF - 1 bit - address 0
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_EN_CONF <= 1'b1;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd0 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_EN_CONF <= MOSI;
    
    //SPI_RO_STAGE_SEL - 9 bits - address 1
    always @(posedge SCK, posedge RST_async)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd1 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_RO_STAGE_SEL <= {spi_shift_reg_in[7:0], MOSI};
        
    //SPI_GET_CLKINT_OUT - 1 bit - address 2
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_GET_CLKINT_OUT <= 1'b0;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd2 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_GET_CLKINT_OUT <= MOSI;
        
    //SPI_GET_TAR_REQ_OUT - 1 bit - address 3
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_GET_TAR_REQ_OUT <= 1'b1;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd3 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_GET_TAR_REQ_OUT <= MOSI;

    /*                                                 *
     * Some address room for other params if necessary *
     *                                                 */


    // Control

    //SPI_RST_MODE - 1 bit - address 8
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_RST_MODE <= 1'b0;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd8 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_RST_MODE <= MOSI;
    
    //SPI_DO_EPROP - 3 bits - address 9
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_DO_EPROP <= 3'b111;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd9 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_DO_EPROP <= {spi_shift_reg_in[1:0], MOSI};

    //SPI_LOCAL_TICK - 1 bit - address 10
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_LOCAL_TICK <= 1'b0;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd10) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_LOCAL_TICK <= MOSI;
    
    //SPI_ERROR_HALT - 1 bits - address 11
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_ERROR_HALT <= 1'b1;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd11) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_ERROR_HALT <= MOSI;
    
    //SPI_FP_LOC_WINP - 3 bits - address 12
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_FP_LOC_WINP <= 3'b000;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd12) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_FP_LOC_WINP <= {spi_shift_reg_in[1:0], MOSI};
    
    //SPI_FP_LOC_WREC - 3 bits - address 13
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_FP_LOC_WREC <= 3'b000;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd13) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_FP_LOC_WREC <= {spi_shift_reg_in[1:0], MOSI};
    
    //SPI_FP_LOC_WOUT - 3 bits - address 14
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_FP_LOC_WOUT <= 3'b000;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd14) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_FP_LOC_WOUT <= {spi_shift_reg_in[1:0], MOSI};
    
    //SPI_FP_LOC_TINP - 3 bits - address 15
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_FP_LOC_TINP <= 3'b000;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd15) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_FP_LOC_TINP <= {spi_shift_reg_in[1:0], MOSI};
    
    //SPI_FP_LOC_TREC - 3 bits - address 16
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_FP_LOC_TREC <= 3'b000;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd16) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_FP_LOC_TREC <= {spi_shift_reg_in[1:0], MOSI};
    
    //SPI_FP_LOC_TOUT - 3 bits - address 17
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_FP_LOC_TOUT <= 3'b000;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd17) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_FP_LOC_TOUT <= {spi_shift_reg_in[1:0], MOSI};
    
    //SPI_LEARN_SIG_SCALE - 4 bits - address 18
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_LEARN_SIG_SCALE <= 4'b0000;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd18) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_LEARN_SIG_SCALE <= {spi_shift_reg_in[2:0], MOSI};
    
    //SPI_REGUL_MODE - 3 bits - address 19
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_REGUL_MODE <= 3'b000;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd19) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_REGUL_MODE <= {spi_shift_reg_in[1:0], MOSI};
    
    //SPI_REGUL_W - 2 bits - address 20
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_REGUL_W <= 2'b00;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd20) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_REGUL_W <= {spi_shift_reg_in[0], MOSI};
        
    //SPI_EN_STOCH_ROUND - 1 bit - address 21
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_EN_STOCH_ROUND <= 1'b0;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd21) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_EN_STOCH_ROUND <= MOSI;
    
    //SPI_SRAM_SPEEDMODE - 8 bits - address 22
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_SRAM_SPEEDMODE <= 8'h00;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd22) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_SRAM_SPEEDMODE <= {spi_shift_reg_in[6:0], MOSI};
        
    //SPI_TIMING_MODE - 1 bit - address 23
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_TIMING_MODE <= 1'b0;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd23) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_TIMING_MODE <= MOSI;

    //Config register at address 24 removed (unpublished block)

    //SPI_REGRESSION - 1 bit - address 25
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_REGRESSION <= 1'b0;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd25) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_REGRESSION <= MOSI;

    //SPI_SINGLE_LABEL - 1 bit - address 26
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_SINGLE_LABEL <= 1'b1;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd26) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_SINGLE_LABEL <= MOSI;

    //SPI_NO_OUT_ACT - 1 bit - address 27
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_NO_OUT_ACT <= 1'b0;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd27) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_NO_OUT_ACT <= MOSI;

    //Config register at address 28 removed (unpublished block)

    //Config register at address 29 removed (unpublished block)

    //SPI_SEND_PER_TIMESTEP - 1 bit - address 30
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_SEND_PER_TIMESTEP <= 1'b0;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd30) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_SEND_PER_TIMESTEP <= MOSI;

    //SPI_SEND_LABEL_ONLY - 1 bit - address 31
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_SEND_LABEL_ONLY <= 1'b1;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd31) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_SEND_LABEL_ONLY <= MOSI;

    //SPI_NOISE_EN - 1 bit - address 32
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_NOISE_EN <= 1'b0;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd32) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_NOISE_EN <= MOSI;

    //SPI_FORCE_TRACES - 1 bit - address 33
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                              SPI_FORCE_TRACES <= 1'b0;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd33) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_FORCE_TRACES <= MOSI;

    //Config register at address 34 removed (unpublished block)


    /*                                                 *
     * Some address room for other params if necessary *
     *                                                 */


    // Network
    
    //SPI_CYCLES_PER_TICK - 32 bits - address 64
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd64 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_CYCLES_PER_TICK <= {spi_shift_reg_in[30:0], MOSI};
    
    //SPI_ALPHA_CONF - 128 bits - addresses 65-68
    generate
        for (i=0; i<4; i=i+1) begin
            always @(posedge SCK, posedge RST_async)
                if      (RST_async)                                                                              SPI_ALPHA_CONF[32*i+31:32*i] <= 32'h00000000;
                else if (~|spi_addr[31:28] && (spi_addr[15:0] == (16'd65+i)) && &spi_cnt[4:0] && |spi_cnt[16:5]) SPI_ALPHA_CONF[32*i+31:32*i] <= {spi_shift_reg_in[30:0], MOSI};
        end
    endgenerate
    
    //SPI_KAPPA - 8 bits - address 69
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                               SPI_KAPPA <= 8'b01111010;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd69 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_KAPPA <= {spi_shift_reg_in[6:0], MOSI};
    
    //SPI_THR_H_0 - 16 bits - address 70
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd70 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_THR_H_0 <= {spi_shift_reg_in[14:0], MOSI};
    
    //SPI_THR_H_1 - 16 bits - address 71
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd71 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_THR_H_1 <= {spi_shift_reg_in[14:0], MOSI};
    
    //SPI_THR_H_2 - 16 bits - address 72
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd72 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_THR_H_2 <= {spi_shift_reg_in[14:0], MOSI};
    
    //SPI_THR_H_3 - 16 bits - address 73
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd73 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_THR_H_3 <= {spi_shift_reg_in[14:0], MOSI};
    
    //SPI_H_0 - 5 bits - address 74
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd74 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_H_0 <= {spi_shift_reg_in[3:0], MOSI};
    
    //SPI_H_1 - 5 bits - address 75
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd75 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_H_1 <= {spi_shift_reg_in[3:0], MOSI};
    
    //SPI_H_2 - 5 bits - address 76
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd76 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_H_2 <= {spi_shift_reg_in[3:0], MOSI};
    
    //SPI_H_3 - 5 bits - address 77
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd77 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_H_3 <= {spi_shift_reg_in[3:0], MOSI};
    
    //SPI_H_4 - 5 bits - address 78
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd78 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_H_4 <= {spi_shift_reg_in[3:0], MOSI};
    
    //SPI_LR_R_WINP - 5 bits - address 79
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd79 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_LR_R_WINP <= {spi_shift_reg_in[3:0], MOSI};
    
    //SPI_LR_P_WINP - 5 bits - address 80
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd80 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_LR_P_WINP <= {spi_shift_reg_in[3:0], MOSI};
    
    //SPI_LR_R_WREC - 5 bits - address 81
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd81 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_LR_R_WREC <= {spi_shift_reg_in[3:0], MOSI};
    
    //SPI_LR_P_WREC - 5 bits - address 82
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd82 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_LR_P_WREC <= {spi_shift_reg_in[3:0], MOSI};
    
    //SPI_LR_R_WOUT - 5 bits - address 83
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd83 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_LR_R_WOUT <= {spi_shift_reg_in[3:0], MOSI};
    
    //SPI_LR_P_WOUT - 5 bits - address 84
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd84 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_LR_P_WOUT <= {spi_shift_reg_in[3:0], MOSI};
    
    //SPI_SEED_INP - 25 bits - address 85
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd85 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_SEED_INP <= {spi_shift_reg_in[23:0], MOSI};
    
    //SPI_SEED_REC - 25 bits - address 86
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd86 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_SEED_REC <= {spi_shift_reg_in[23:0], MOSI};
    
    //SPI_SEED_OUT - 22 bits - address 87
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd87 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_SEED_OUT <= {spi_shift_reg_in[20:0], MOSI};
    
    //SPI_SEED_STRND_NEUR - 30 bits - address 88
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd88 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_SEED_STRND_NEUR <= {spi_shift_reg_in[28:0], MOSI};
    
    //SPI_SEED_STRND_ONEUR - 15 bits - address 89
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd89 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_SEED_STRND_ONEUR <= {spi_shift_reg_in[13:0], MOSI};
    
    //SPI_SEED_STRND_TINP - 30 bits - address 90
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd90 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_SEED_STRND_TINP <= {spi_shift_reg_in[28:0], MOSI};
    
    //SPI_SEED_STRND_TREC - 30 bits - address 91
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd91 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_SEED_STRND_TREC <= {spi_shift_reg_in[28:0], MOSI};
    
    //SPI_SEED_STRND_TOUT - 30 bits - address 92
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd92 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_SEED_STRND_TOUT <= {spi_shift_reg_in[28:0], MOSI};
    
    //SPI_SEED_NOISE_NEUR - 17 bits - address 93
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd93 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_SEED_NOISE_NEUR <= {spi_shift_reg_in[15:0], MOSI};
    
    //SPI_NUM_INP_NEUR - M bits - address 94
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                               SPI_NUM_INP_NEUR <= {M{1'b1}};
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd94 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_NUM_INP_NEUR <= {spi_shift_reg_in[M-2:0], MOSI};
    
    //SPI_NUM_REC_NEUR - M bits - address 95
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                               SPI_NUM_REC_NEUR <= {M{1'b1}};
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd95 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_NUM_REC_NEUR <= {spi_shift_reg_in[M-2:0], MOSI};
    
    //SPI_NUM_OUT_NEUR - 4 bits - address 96
    always @(posedge SCK, posedge RST_async)
        if      (RST_async)                                                                               SPI_NUM_OUT_NEUR <= 4'hF;
        else if (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd96 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_NUM_OUT_NEUR <= {spi_shift_reg_in[2:0], MOSI};

    //Config register at address 97 removed (unpublished block)
    
    //SPI_REGUL_F0 - 12 bits - address 98
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd98 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_REGUL_F0 <= {spi_shift_reg_in[10:0], MOSI};
    
    //SPI_REGUL_K_INP_R - 5 bits - address 99
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd99 ) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_REGUL_K_INP_R <= {spi_shift_reg_in[3:0], MOSI};
    
    //SPI_REGUL_K_INP_P - 5 bits - address 100
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd100) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_REGUL_K_INP_P <= {spi_shift_reg_in[3:0], MOSI};
    
    //SPI_REGUL_K_REC_R - 5 bits - address 101
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd101) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_REGUL_K_REC_R <= {spi_shift_reg_in[3:0], MOSI};
    
    //SPI_REGUL_K_REC_P - 5 bits - address 102
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd102) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_REGUL_K_REC_P <= {spi_shift_reg_in[3:0], MOSI};
    
    //SPI_REGUL_K_MUL - 5 bits - address 103
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd103) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_REGUL_K_MUL <= {spi_shift_reg_in[3:0], MOSI};
    
    //SPI_NOISE_STR - 4 bits - address 104
    always @(posedge SCK)
        if      (~|spi_addr[31:28] && (spi_addr[15:0] == 16'd104) && &spi_cnt[4:0] && |spi_cnt[16:5])     SPI_NOISE_STR <= {spi_shift_reg_in[2:0], MOSI};


    /*                                                 *
     * Some address room for other params if necessary *
     *                                                 */

    
    
endmodule

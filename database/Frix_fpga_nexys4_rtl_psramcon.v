// This program was cloned from: https://github.com/archlabo/Frix
// License: BSD 2-Clause "Simplified" License

/*
 * Copyright (c) 2015, Arch Laboratory
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

module psramcon (
                     // inputs:
                     az_addr,
                     az_be_n,
                     az_cs,
                     az_data,
                     az_rd_n,
                     az_wr_n,
                     clk,
                     reset,

                     // outputs:
                     za_data,
                     za_valid,
                     za_waitrequest,

                     PSRAM_CLK,
                     PSRAM_ADV_N,
                     PSRAM_CE_N,
                     PSRAM_OE_N,
                     PSRAM_WE_N,
                     PSRAM_LB_N,
                     PSRAM_UB_N,
                     PSRAM_DATA,
                     PSRAM_ADDR
                     );

    output  [ 31: 0] za_data;
    output           za_valid;
    output           za_waitrequest;

    input [ 24: 0]   az_addr;
    input [  3: 0]   az_be_n;
    input            az_cs;
    input [ 31: 0]   az_data;
    input            az_rd_n;
    input            az_wr_n;
    input            clk;
    input            reset;

    output wire      PSRAM_CLK;
    output wire      PSRAM_ADV_N;
    output wire      PSRAM_CE_N;
    output wire      PSRAM_OE_N;
    output wire      PSRAM_WE_N;
    output wire      PSRAM_LB_N;
    output wire      PSRAM_UB_N;
    inout wire [15:0] PSRAM_DATA;
    output wire [22:0] PSRAM_ADDR;

    reg [21:0]         addr_buf;
    reg [31:0]         din_buf;
    reg [3:0]          be_buf;

    reg [22:0]         addr_16;
    reg [15:0]         din_16;
    reg [1:0]          be_16;
    reg                we_16, re_16;
    wire [15:0]        dout_16;
    wire               d_valid_16;
    wire               busy_16;


    wire               CLK = clk;
    wire               RST_X = ~reset;
    wire [21:0]        ADDR = az_addr[21:0];
    wire [31:0]        DIN = az_data;
    wire               WE = ~az_wr_n;
    wire               RE = ~az_rd_n;
    wire [3:0]         BE = ~az_be_n;
    wire               WAITREQUEST;
    reg [31:0]         DOUT;
    reg                DVALID;
    assign za_waitrequest = WAITREQUEST;
    assign za_data = DOUT;
    assign za_valid = DVALID;


    psramcon_16 psramcon_16(CLK, RST_X, addr_16, addr_16, din_16, we_16, re_16, 2'b11, busy_16, dout_16, d_valid_16,
                         PSRAM_CLK, PSRAM_ADV_N, PSRAM_CE_N, PSRAM_OE_N, PSRAM_WE_N, PSRAM_LB_N, PSRAM_UB_N, PSRAM_DATA, PSRAM_ADDR);

    reg [3:0]          state;
    parameter IDLE      = 0;
    parameter W_PHASE0  = 1;
    parameter W_PHASE01 = 2;
    parameter W_PHASE1  = 3;
    parameter W_PHASE11 = 4;
    parameter W_PHASE2  = 5;
    parameter R_PHASE0  = 6;
    parameter R_PHASE1  = 7;
    parameter R_PHASE2  = 8;

    assign WAITREQUEST = (state != IDLE);

    always @(posedge CLK) begin
        if(!RST_X) begin
            state   <= IDLE;
            addr_16 <= 0;
            din_16  <= 0;
            be_16   <= 2'b11;
            we_16   <= 0;
            re_16   <= 0;
        end else begin
            case(state)
              IDLE: begin
                  DOUT    <= 0;
                  DVALID  <= 0;

                  state    <= (WE) ? W_PHASE0 : (RE) ? R_PHASE0 : IDLE;
                  addr_buf <= ADDR;
                  din_buf  <= DIN;
                  be_buf   <= BE;
              end
              W_PHASE0: begin
                  if(be_buf[1:0] == 2'b11) begin
                      state   <= W_PHASE1;
                      addr_16 <= {addr_buf, 1'b0};
                      din_16  <= din_buf[15:0];
                      we_16   <= 1;
                  end else begin
                      state   <= W_PHASE01;
                      addr_16 <= {addr_buf, 1'b0};
                      re_16   <= 1;
                  end
              end
              W_PHASE01: begin
                  if(busy_16) begin re_16 <= 0; end
                  else if(d_valid_16) begin
                      state <= W_PHASE1;
                      addr_16 <= {addr_buf, 1'b0};
                      din_16[7:0]  <= (be_buf[0]) ? din_buf[7:0] : dout_16[7:0];
                      din_16[15:8] <= (be_buf[1]) ? din_buf[15:8] : dout_16[15:8];
                      we_16 <= 1;
                  end
              end
              W_PHASE1: begin
                  if(busy_16) begin we_16 <= 0; end
                  else if(be_buf[3:2] == 2'b11) begin
                      state   <= W_PHASE2;
                      addr_16 <= {addr_buf, 1'b1};
                      din_16  <= din_buf[31:16];
                      we_16   <= 1;
                  end else begin
                      state   <= W_PHASE11;
                      addr_16 <= {addr_buf, 1'b1};
                      re_16   <= 1;
                  end
              end
              W_PHASE11: begin
                  if(busy_16) begin re_16 <= 0; end
                  else if(d_valid_16) begin
                      state <= W_PHASE2;
                      addr_16 <= {addr_buf, 1'b1};
                      din_16[7:0]  <= (be_buf[2]) ? din_buf[23:16] : dout_16[7:0];
                      din_16[15:8] <= (be_buf[3]) ? din_buf[31:24] : dout_16[15:8];
                      we_16 <= 1;
                  end
              end
              W_PHASE2: begin
                  if(busy_16) begin we_16 <= 0; end
                  else begin
                      state   <= IDLE;
                      addr_16 <= 0;
                      din_16  <= 0;
                      we_16   <= 0;
                  end
              end
              R_PHASE0: begin
                  state   <= R_PHASE1;
                  addr_16 <= {addr_buf, 1'b0};
                  re_16   <= 1;
              end
              R_PHASE1: begin
                  if(busy_16) begin re_16 <= 0; end
                  else if(d_valid_16) begin
                      state       <= R_PHASE2;
                      addr_16     <= {addr_buf, 1'b1};
                      re_16       <= 1;
                      DOUT[15:0] <= dout_16;
                  end
              end
              R_PHASE2: begin
                  if(busy_16) begin we_16 <= 0; end
                  else if(d_valid_16) begin
                      state        <= IDLE;
                      addr_16      <= 0;
                      re_16        <= 0;
                      DOUT[31:16] <= dout_16;
                      DVALID      <= 1;
                  end
              end
            endcase
        end
    end

endmodule


/****************************************************************************************/
module psramcon_16(input  wire        CLK,
                   input wire        RST_X,
                   input wire [22:0] WADDR, // input write address
                   input wire [22:0] RADDR, // input read  address
                   input wire [15:0] D_IN, // input data
                   input wire        WE, // write enable
                   input wire        RE, // read enable
                   input wire [1:0]  BE, // byte enable
                   output wire       BUSY, // it's busy during operation
                   output reg [15:0] RDOUT, // read data
                   output reg        RDOUT_EN, // read data is enable
                   output wire       MCLK, // PSRAM_CLK
                   output wire       ADV_X, // PSRAM_ADV_X
                   output reg        CE_X, // PSRAM_CE_X
                   output reg        OE_X, // PSRAM_OE_X
                   output reg        WE_X, // PSRAM_WE_X
                   output reg        LB_X, // PSRAM_LB_X
                   output reg        UB_X, // PSRAM_UB_X
                   inout wire [15:0] D_OUT, // PSRAM_DATA
                   output reg [22:0] A_OUT);    // PSRAM_ADDR

    parameter IDLE     = 0;
    parameter W_PHASE0 = 1;
    parameter W_PHASE1 = 2;
    parameter W_PHASE2 = 3;
    parameter W_PHASE3 = 4;
    parameter W_PHASE4 = 5;
    parameter R_PHASE0 = 6;
    parameter R_PHASE1 = 7;
    parameter R_PHASE2 = 8;
    parameter R_PHASE3 = 9;
    parameter R_PHASE4 = 10;


    assign MCLK  = 0;
    assign ADV_X = 0;
    assign BUSY  = (state != IDLE);

    reg [3:0]                     state;
    reg [15:0]                    D_KEPT;
    reg                           write_mode;
    reg                           read_mode;
    always @(negedge CLK) begin
        if (!RST_X) begin
            A_OUT      <= 0;
            D_KEPT     <= 0;
            OE_X       <= 1;
            WE_X       <= 1;
            CE_X       <= 1;
            LB_X       <= 0;
            UB_X       <= 0;
            write_mode <= 0;
            read_mode  <= 0;
            state      <= IDLE;
            RDOUT_EN   <= 0;
        end else begin
            case (state)
              /***************************************/
              IDLE: begin
                  RDOUT_EN   <= 0;
                  RDOUT      <= 0;
                  read_mode  <= 0;
                  write_mode <= 0;
                  state      <= (WE) ? W_PHASE0 : (RE) ? R_PHASE0 : state;
                  A_OUT      <= (WE) ? WADDR : (RE) ? RADDR : 0;
                  D_KEPT     <= (WE) ? D_IN : 0;
                  LB_X       <= (WE) ? ~BE[0] : 0;
                  UB_X       <= (WE) ? ~BE[1] : 0;
              end
              /***** WRITE **********************************/
              W_PHASE0: begin
                  //              A_OUT      <= WADDR;
                  //              D_KEPT     <= D_IN;
                  CE_X       <= 0;
                  WE_X       <= 0;
                  write_mode <= 1;
                  state      <= W_PHASE1;
              end
              W_PHASE1: begin
                  state      <= W_PHASE2;
              end
              W_PHASE2: begin
                  state      <= W_PHASE3;
              end
              W_PHASE3: begin
                  state      <= W_PHASE4;
              end
              W_PHASE4: begin
                  CE_X       <= 1;
                  WE_X       <= 1;
                  write_mode <= 1;
                  state      <= IDLE;
              end
              /***** READ **********************************/
              R_PHASE0: begin
                  //              A_OUT     <= RADDR;
                  CE_X      <= 0;
                  OE_X      <= 0;
                  read_mode <= 1;
                  state <= R_PHASE1;
              end
              R_PHASE1: begin
                  state <= R_PHASE2;
              end
              R_PHASE2: begin
                  state <= R_PHASE3;
              end
              R_PHASE3: begin
                  state <= R_PHASE4;
              end
              R_PHASE4: begin
                  CE_X      <= 1;
                  OE_X      <= 1;
                  read_mode <= 0;
                  RDOUT_EN  <= 1;
                  RDOUT     <= D_OUT;
                  state     <= IDLE;
              end
            endcase
        end
    end
    assign D_OUT = (write_mode) ? D_KEPT : 16'hzzzz;

endmodule

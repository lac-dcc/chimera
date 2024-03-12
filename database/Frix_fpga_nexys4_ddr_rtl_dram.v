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

/* ----- Do not change ----- */
`define DRAM_CMD_WRITE 3'b000
`define DRAM_CMD_READ  3'b001
`define DDR2_DATA      15:0
`define DDR2_ADDR      12:0
`define DDR2_CMD       2:0
// `define APPADDR_WIDTH  29
`define APPADDR_WIDTH  27
`define APPDATA_WIDTH  128
`define APPMASK_WIDTH  (`APPDATA_WIDTH / 8)

module DRAMCON(input wire                      CLK200M,
               input wire                      RST_IN,
               output wire                     CLK_OUT,
               output wire                     RST_OUT,
               // User logic interface ports
               input wire [`APPADDR_WIDTH-1:0] D_ADDR,
               input wire [`APPDATA_WIDTH-1:0] D_DIN,
               input wire                      D_WE,
               input wire                      D_RE,
               output reg [`APPDATA_WIDTH-1:0] D_DOUT,
               output reg                      D_DOUTEN,
               output wire                     D_BUSY,
               // Memory interface ports
               inout wire [`DDR2_DATA]         DDR2DQ,
               inout wire [1:0]                DDR2DQS_N,
               inout wire [1:0]                DDR2DQS_P,
               output wire [`DDR2_ADDR]        DDR2ADDR,
               output wire [2:0]               DDR2BA,
               output wire                     DDR2RAS_N,
               output wire                     DDR2CAS_N,
               output wire                     DDR2WE_N,
               output wire [0:0]               DDR2CK_P,
               output wire [0:0]               DDR2CK_N,
               output wire [0:0]               DDR2CKE,
               output wire [0:0]               DDR2CS_N,
               output wire [1:0]               DDR2DM,
               output wire [0:0]               DDR2ODT);

    // inputs of u_dram
    reg [`APPADDR_WIDTH-1:0]                   app_addr;
    reg [`DDR2_CMD]                            app_cmd;
    reg                                        app_en;
    reg [`APPDATA_WIDTH-1:0]                   app_wdf_data;
    reg                                        app_wdf_end;
    reg [`APPMASK_WIDTH-1:0]                   app_wdf_mask;
    reg                                        app_wdf_wren;
    wire                                       app_sr_req  = 0;  // no used
    wire                                       app_ref_req = 0;  // no used
    wire                                       app_zq_req  = 0;  // no used

    // outputs of u_dram
    wire [`APPDATA_WIDTH-1:0]                  app_rd_data;
    wire                                       app_rd_data_end;
    wire                                       app_rd_data_valid;
    wire                                       app_rdy;
    wire                                       app_wdf_rdy;
    wire                                       app_sr_active;    // no used
    wire                                       app_ref_ack;      // no used
    wire                                       app_zq_ack;       // no used
    wire                                       ui_clk;
    wire                                       ui_clk_sync_rst;
    wire                                       init_calib_complete;

    mig
      u_mig (
             // Memory interface ports
             .ddr2_dq                        (DDR2DQ),
             .ddr2_dqs_n                     (DDR2DQS_N),
             .ddr2_dqs_p                     (DDR2DQS_P),
             .ddr2_addr                      (DDR2ADDR),
             .ddr2_ba                        (DDR2BA),
             .ddr2_ras_n                     (DDR2RAS_N),
             .ddr2_cas_n                     (DDR2CAS_N),
             .ddr2_we_n                      (DDR2WE_N),
             .ddr2_ck_p                      (DDR2CK_P),
             .ddr2_ck_n                      (DDR2CK_N),
             .ddr2_cke                       (DDR2CKE),
             .ddr2_cs_n                      (DDR2CS_N),
             .ddr2_dm                        (DDR2DM),
             .ddr2_odt                       (DDR2ODT),
             // Clock input ports
             .sys_clk_i                      (CLK200M),
             // Application interface ports
             .app_addr                       (app_addr),
             .app_cmd                        (app_cmd),
             .app_en                         (app_en),
             .app_wdf_data                   (app_wdf_data),
             .app_wdf_end                    (app_wdf_end),
             .app_wdf_mask                   (app_wdf_mask),
             .app_wdf_wren                   (app_wdf_wren),
             .app_rd_data                    (app_rd_data),
             .app_rd_data_end                (app_rd_data_end),
             .app_rd_data_valid              (app_rd_data_valid),
             .app_rdy                        (app_rdy),
             .app_wdf_rdy                    (app_wdf_rdy),
             .app_sr_req                     (app_sr_req),
             .app_sr_active                  (app_sr_active),
             .app_ref_req                    (app_ref_req),
             .app_ref_ack                    (app_ref_ack),
             .app_zq_req                     (app_zq_req),
             .app_zq_ack                     (app_zq_ack),
             .ui_clk                         (ui_clk),
             .ui_clk_sync_rst                (ui_clk_sync_rst),
             .init_calib_complete            (init_calib_complete),
             .sys_rst                        (RST_IN)
             );

    // INST_TAG_END ------ End INSTANTIATION Template ---------

    assign D_BUSY  = (mode != WAIT_REQ);
    assign CLK_OUT = ui_clk;
    assign RST_OUT = (ui_clk_sync_rst || ~init_calib_complete);  // High Active

    ///// READ & WRITE PORT CONTROL (begin) //////////////////////////////////////
    localparam INIT     = 0;  // INIT must be 0
    localparam WAIT_REQ = 1;
    localparam WRITE    = 2;
    localparam READ     = 3;

    reg [1:0]                                  mode;
    reg [1:0]                                  state;
    reg [3:0]                                  cnt;
    reg [`APPDATA_WIDTH-1:0]                   app_wdf_data_buf;
    reg                                        write_finish;
    reg                                        error_reg;
    always @(posedge ui_clk) begin
        if (ui_clk_sync_rst) begin
            mode         <= INIT;
            state        <= 0;
            app_addr     <= 0;
            app_cmd      <= 0;
            app_en       <= 0;
            app_wdf_data <= 0;
            app_wdf_wren <= 0;
            app_wdf_mask <= 0;
            app_wdf_end  <= 0;
            cnt          <= 0;
            D_DOUT       <= 0;
            D_DOUTEN     <= 0;
            write_finish <= 0;
            error_reg    <= 0;
        end else begin
            case (mode)
              INIT: begin     // initialize
                  if (init_calib_complete) mode <= WAIT_REQ;
              end
              WAIT_REQ: begin // wait request
                  app_addr            <= D_ADDR;
                  app_en              <= 0;
                  app_wdf_data_buf    <= D_DIN;
                  app_wdf_mask        <= {`APPMASK_WIDTH{1'b0}};
                  if      (D_WE) mode <= WRITE;
                  else if (D_RE) mode <= READ;
              end
              WRITE: begin
                  case (state)
                    0: begin
                        app_cmd <= `DRAM_CMD_WRITE;
                        app_en  <= 1;
                        state   <= 1;
                        cnt     <= 0;
                    end
                    1: begin
                        if (app_rdy) begin
                            app_en <= 0;
                        end
                        if (app_wdf_rdy) begin
                            cnt <= cnt + 1;
                            if (cnt == 1) begin
                                app_wdf_wren <= 0;
                                app_wdf_end  <= 0;
                                write_finish <= 1;
                            end else if (cnt == 0) begin
                                app_wdf_data <= app_wdf_data_buf;
                                app_wdf_wren <= 1;
                                app_wdf_end  <= 1;
                            end
                        end
                        if (!app_en && write_finish) begin
                            mode         <= WAIT_REQ;
                            state        <= 0;
                            cnt          <= 0;
                            write_finish <= 0;
                        end
                    end
                  endcase
              end
              READ: begin
                  case (state)
                    0: begin
                        app_cmd <= `DRAM_CMD_READ;
                        app_en  <= 1;
                        state   <= 1;
                        cnt     <= 0;
                    end
                    1: begin
                        if (app_rdy) app_en <= 0;
                        if (app_rd_data_valid) begin
                            if (app_rd_data_end) cnt <= 1;
                            D_DOUT <= app_rd_data;
                        end
                        if (!app_en && cnt) begin
                            state    <= 2;
                            D_DOUTEN <= 1;
                        end
                    end
                    2: begin
                        D_DOUTEN <= 0;
                        mode     <= WAIT_REQ;
                        state    <= 0;
                        cnt      <= 0;
                    end
                  endcase
              end
            endcase
        end
    end
    ///// READ & WRITE PORT CONTROL (end)   //////////////////////////////////////

endmodule

`default_nettype wire

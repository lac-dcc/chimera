// This program was cloned from: https://github.com/splinedrive/RISCV-KianV-BareMetalStyle
// License: Apache License 2.0

/*
 *  kianv.v - a simple RISC-V rv32ima
 *
 *  copyright (c) 2023 hirosh dabui <hirosh@dabui.de>
 *
 *  permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  the software is provided "as is" and the author disclaims all warranties
 *  with regard to this software including all implied warranties of
 *  merchantability and fitness. in no event shall the author be liable for
 *  any special, direct, indirect, or consequential damages or any damages
 *  whatsoever resulting from loss of use, data or profits, whether in an
 *  action of contract, negligence or other tortious action, arising out of
 *  or in connection with the use or performance of this software.
 *
 */
`default_nettype none
/*verilator lint_off UNUSEDSIGNAL*/
module spi #(
    parameter CPOL = 1'b0
) (
    input wire clk,
    input wire resetn,

    input wire ctrl,  /* 0: cs control, 1: data */
    output wire [31:0] rdata,
    input wire [31:0] wdata,
    input wire [3:0] wstrb,
    input wire [15:0] div,
    input wire valid,
    output wire ready,

    output wire cen,
    output reg  sclk,
    input  wire sio1_so_miso,
    output wire sio0_si_mosi
);

  reg [5:0] xfer_cycles;
  reg [31:0] rx_data;
  reg [31:0] rx_data_next;

  reg sclk_next;
  reg sio_out_next;
  reg [7:0] spi_buf_next;
  reg [5:0] xfer_cycles_next;
  reg ready_xfer_next;
  reg ready_xfer;

  reg spi_cen;
  reg spi_cen_nxt;

  reg sio_out;
  wire sio_in;

  assign sio0_si_mosi = sio_out;
  assign sio_in = sio1_so_miso;

  wire in_xfer = |xfer_cycles;
  assign rdata = ctrl ? rx_data : {in_xfer, 30'b0, spi_cen};

  reg ready_ctrl;
  reg ready_ctrl_next;

  assign ready = ready_xfer || ready_ctrl;
  assign cen   = spi_cen;

  always @(posedge clk) begin
    if (!resetn) begin
      spi_cen <= 1'b1;
      ready_ctrl <= 1'b0;
    end else begin
      spi_cen <= spi_cen_nxt;
      ready_ctrl <= ready_ctrl_next;
    end
  end

  wire ctrl_access = !ctrl & valid;
  always @(*) begin
    ready_ctrl_next = 1'b0;
    spi_cen_nxt = spi_cen;
    if (ctrl_access) begin
      if (wstrb[0]) spi_cen_nxt = ~wdata[0];
      ready_ctrl_next = 1'b1;
    end
  end

  localparam [0:0] S0_IDLE = 0;
  localparam [0:0] S1_WAIT_FOR_XFER_DONE = 1;

  reg [17:0] tick_cnt;
  wire tick = tick_cnt == ({2'b0, div} - 1);
  always @(posedge clk) begin
    if (!resetn || tick || ~in_xfer) begin
      tick_cnt <= 0;
    end else begin
      if (in_xfer) tick_cnt <= tick_cnt + 1;
    end
  end

  reg [0:0] state, next_state;
  reg [7:0] spi_buf;

  always @(posedge clk) begin
    if (!resetn) begin
      sclk <= CPOL;
      sio_out <= 1'b0;
      spi_buf <= 0;
      xfer_cycles <= 0;
      ready_xfer <= 0;
      state <= S0_IDLE;
      rx_data <= 0;
    end else begin
      state <= next_state;
      sclk <= sclk_next;
      sio_out <= sio_out_next;
      spi_buf <= spi_buf_next;
      xfer_cycles <= xfer_cycles_next;
      rx_data <= rx_data_next;
      ready_xfer <= ready_xfer_next;
    end
  end

  always @(*) begin
    next_state = state;
    sclk_next = sclk;
    sio_out_next = sio_out;
    spi_buf_next = spi_buf;
    ready_xfer_next = ready_xfer;
    rx_data_next = rx_data;
    xfer_cycles_next = xfer_cycles;

    if (in_xfer) begin
      if (tick || (div == 0)) begin
        sio_out_next = spi_buf[7];
        if (sclk) begin
          sclk_next = 1'b0;
        end else begin
          sclk_next = 1'b1;
          spi_buf_next = {spi_buf[6:0], sio_in};
          xfer_cycles_next = xfer_cycles - 1;
        end
      end

    end else begin
      case (state)
        S0_IDLE: begin
          if (valid && ctrl) begin  // && !ready_xfer) begin  // && !ready_xfer) begin

            if (wstrb[0]) begin
              //ready_xfer_next = 1'b1;
              spi_buf_next = wdata[7:0];
              xfer_cycles_next = 8;  /* byte */
            end else begin
              xfer_cycles_next = 0;  /* byte */
              //ready_xfer_next = 1'b1;
            end
            ready_xfer_next = 1'b1;

            next_state = S1_WAIT_FOR_XFER_DONE;

          end else begin  //if (!valid && ready_xfer) begin
            sclk_next = CPOL;
            xfer_cycles_next = 0;
            ready_xfer_next = 1'b0;
          end
        end

        S1_WAIT_FOR_XFER_DONE: begin
          rx_data_next = {24'b0, spi_buf};
          //ready_xfer_next = 1'b1;
          next_state   = S0_IDLE;
        end

        default: next_state = S0_IDLE;
      endcase

    end

  end

endmodule
/*verilator lint_on UNUSEDSIGNAL*/

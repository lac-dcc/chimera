// This program was cloned from: https://github.com/splinedrive/RISCV-KianV-BareMetalStyle
// License: Apache License 2.0

/*
 *  my_rx_uart - a simple rx uart
 *
 *  copyright (c) 2021  hirosh dabui <hirosh@dabui.de>
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
module rx_uart (
    input wire clk,
    input wire resetn,
    input wire rx_in,
    input wire data_rd,
    input wire [15:0] div,
    output reg error,
    output wire [31:0] data
);

  reg [2:0] state;
  reg [2:0] return_state;
  reg [2:0] bit_idx;
  reg [7:0] rx_data;
  reg ready;

  reg [16:0] wait_states;

  reg [2:0] rx_in_sync;
  always @(posedge clk) begin
    if (!resetn) begin
      rx_in_sync <= 0;
    end else begin
      rx_in_sync <= {rx_in_sync[1:0], rx_in};
    end
  end

  wire fifo_full;
  wire fifo_empty;
  wire [7:0] fifo_out;

  fifo #(
      .DATA_WIDTH(8),
      .DEPTH     (16)
  ) fifo_i (
      .clk   (clk),
      .resetn(resetn),
      .din   (rx_data[7:0]),
      .dout  (fifo_out),
      .push  (ready & ~fifo_full),
      .pop   (data_rd & ~fifo_empty),
      .full  (fifo_full),
      .empty (fifo_empty)
  );

  assign data = fifo_empty ? ~0 : {24'd0, fifo_out};


  always @(posedge clk) begin
    /*
            if (ready) begin
              $write("%c", rcvd_buf);
              $fflush;
            end
            */

    if (!resetn) begin
      state <= 0;
      ready <= 1'b0;
      error <= 1'b0;
      wait_states <= 1;

      bit_idx <= 0;
      rx_data <= 0;
    end else begin

      case (state)

        0: begin  /* idle */
          ready <= 1'b0;
          error <= 1'b0;
          if (rx_in_sync[2:1] == 2'b10) begin  // high to low
            wait_states <= {1'b0, div >> 1};
            return_state <= 1;
            state <= 4;
          end
        end

        1: begin
          if (~rx_in_sync[2]) begin  // still low?
            wait_states <= {1'b0, div};
            return_state <= 2;
            state <= 4;
          end else begin
            state <= 0;  // idle
          end
        end

        2: begin
          rx_data[bit_idx] <= rx_in_sync[2];  /* lsb first */
          bit_idx <= bit_idx + 1;

          wait_states <= {1'b0, div};
          return_state <= &bit_idx ? 3 : 2;
          state <= 4;
        end

        3: begin
          if (~rx_in_sync[2]) begin  // stop bit must high
            error <= 1'b1;
            state <= 0;
          end else begin
            wait_states <= {1'b0, div};
            return_state <= 0;
            state <= 4;
          end
        end

        4: begin  /* wait states */
          if (wait_states == 1) begin
            if (return_state == 0) begin
              ready <= 1'b1;
            end
            state <= return_state;
          end
          wait_states <= wait_states - 1;
        end

        default: begin
          state <= 0;
        end

      endcase

    end
  end  /* !reset */

endmodule

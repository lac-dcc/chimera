// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

/**
 * Simplistic Ibex bus implementation
 *
 * This module is designed for demo and simulation purposes, do not use it in
 * a real-world system.
 *
 * This implementation doesn't handle the full bus protocol, but makes the
 * following simplifying assumptions.
 *
 * - All devices (slaves) must respond in the next cycle after the request.
 * - Host (master) arbitration is strictly priority based.
 */
 
module console #(
  // passed to simulator via log_name of output_char DPI call
  parameter string LogName = "./log/console.log",
  // If set flush on every char (useful for monitoring output whilst
  // simulation is running).
  parameter bit    FlushOnChar = 1
) (
  input wire              clk_i,
  input wire              rst_ni,

  input  wire             req_i,
  input  wire             we_i,
  input  wire[3:0]        be_i,
  input  wire[31:0]       addr_i,
  input  wire[31:0]       wdata_i,
  output reg              rvalid_o,
  output reg[31:0]        rdata_o
);

  localparam reg[7:0] CHAR_OUT_ADDR = 8'h0;
  localparam reg[7:0] SIM_CTRL_ADDR = 8'h2;

  reg [7:0] ctrl_addr;
  reg [2:0] sim_finish = 3'b000;

  integer log_fd;

  initial begin
    log_fd = $fopen(LogName, "w");
  end

  final begin
    $fclose(log_fd);
  end

  assign ctrl_addr = addr_i[9:2];

  always @(posedge clk_i or negedge rst_ni) begin
    if (~rst_ni) begin
      rvalid_o <= 0;
      sim_finish <= 'b0;
    end else begin
      // Immeditely respond to any request
      rvalid_o <= req_i;

      if (req_i & we_i) begin
        case (ctrl_addr)

          CHAR_OUT_ADDR: begin
            if (be_i[0]) begin
              $fwrite(log_fd, "%c", wdata_i[7:0]);
              $display("%c", wdata_i[7:0]);
              if(FlushOnChar) begin
                $fflush(log_fd);
              end
            end
          end

          SIM_CTRL_ADDR: begin
            if ((be_i[0] & wdata_i[0]) && (sim_finish == 'b0)) begin
              $display("Terminating simulation by software request.");
              sim_finish <= 3'b001;
            end
          end

          default: begin
            
          end
          
        endcase
      end
    end

    if (sim_finish != 'b0) begin
      sim_finish <= sim_finish + 1;
    end
    if (sim_finish >= 3'b010) begin
      $finish;
    end
  end

  assign rdata_o = '0;
endmodule

// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns / 1ps

`include "iob_lib.vh"

module iob_pulse_gen
  #(
    parameter START=5,
    parameter DURATION=5
    )
  (
   `IOB_INPUT(clk, 1),
   `IOB_INPUT(rst, 1),
   `IOB_INPUT(restart, 1),
   `IOB_OUTPUT_VAR(pulse_out, 1)
   );

   localparam WIDTH = DURATION==1? 1: $clog2(DURATION);
   
   reg [WIDTH-1:0] cnt;
   
   always @(posedge clk, posedge rst) begin
      if (rst) begin
         cnt <= {WIDTH{1'b0}};
         pulse_out <= 1'b0;
      end else if (restart) begin
         cnt <= {WIDTH{1'b0}};
         pulse_out <= 1'b0;
      end else begin
        cnt <= cnt+1'b1;
        if ( cnt == START )
          pulse_out <= 1'b1;
        else if ( cnt == (START+DURATION) ) begin
           pulse_out <= 1'b0;
           cnt <= cnt;
        end
      end
   end

endmodule

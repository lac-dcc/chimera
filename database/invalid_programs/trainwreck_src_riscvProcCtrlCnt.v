`include "macros.vh"

module riscvProcCtrlCnt#
(
  parameter limit = 8
)
(
  input clk,
  input reset,

  input enq,
  input deq,

  output empty,
  output full
);
  localparam bits = `ceilLog2(limit+1);

  reg [bits-1:0] counter;

  always @(posedge clk)
  begin
    if (reset)
      counter <= {bits{1'b0}};
    else
    begin
      if (enq && !deq)
        counter <= counter + {{(bits-1){1'b0}},1'b1};
      else if (!enq && deq)
        counter <= counter - {{(bits-1){1'b0}},1'b1};
    end
  end

  assign empty = (counter == 0);
  assign full = (counter == limit[bits-1:0]);

endmodule

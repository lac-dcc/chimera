`include "macros.vh"

module rs232_tx_ctrl #(parameter CLOCKS_PER_BAUD = 16)
(
  input  wire       clk,
  input  wire       reset,

  output wire       rdy,
  input  wire       val,
  input  wire [7:0] bits,

  output wire       TxD
);

  reg [`ceilLog2(CLOCKS_PER_BAUD)-1:0] cnt;
  reg [8:0] outreg;
  reg [3:0] bitcnt;
  integer i;

  wire rs232_tick = cnt == CLOCKS_PER_BAUD-1;

  always @(posedge clk)
  begin
    if (reset)
      cnt <= {`ceilLog2(CLOCKS_PER_BAUD){1'b0}};
    else
      cnt <= rs232_tick ? 1'b0 : cnt+1'b1;

    if (reset)
      bitcnt <= 4'b0;
    else if (rdy && val || rs232_tick)
      bitcnt <= bitcnt == 4'd10 ? 1'b0 : bitcnt+1'b1;

    if (reset)
      outreg <= {9{1'b1}};
    else
    if (rdy && val)
    begin
      // ModelSim is fucking retarded.  outreg <= {bits, 1'b0} crashes it!!
      outreg[0] <= 1'b0;
      for (i = 0; i < 8; i=i+1)
        outreg[i+1] <= bits[i];
    end
    else if (rs232_tick)
      outreg <= {1'b1, outreg[8:1]};
  end

  assign rdy = (&(~bitcnt)) && (&(~cnt));
  assign TxD = outreg[0];

endmodule

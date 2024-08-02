// This program was cloned from: https://github.com/n1gp/Anvelina_PROIII
// License: GNU General Public License v3.0

// cdc_sync_strobe

// tansfer data between clock domain on strobe signal 



`timescale 1 ns/100 ps

module cdc_sync_strobe #(parameter SIZE = 1)
  (input  wire [SIZE-1:0] siga,
   input  wire            rstb, clkb, strobe,
   output reg  [SIZE-1:0] sigb);
	
reg [SIZE-1:0] q1;	
	
always @(posedge clkb)
begin
  if (rstb)
    {sigb,q1} <= 2'b00;
  else if (strobe)
    {sigb,q1} <= {q1,siga};
end

endmodule

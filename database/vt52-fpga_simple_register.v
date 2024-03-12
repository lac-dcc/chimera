/**
 * Basic register with synchronous set & reset
 */
module simple_register
  #(parameter SIZE = 8)
   (input wire clk,
    input wire reset,
    input wire [SIZE-1:0] idata,
    input wire wen,
    output reg [SIZE-1:0] odata
    );

   always @(posedge clk) begin
      if (reset) odata <= 0;
      else if (wen) odata = idata;
   end
endmodule


module fifo_1depth(
   clk, 
   clr,
   // input side
   we,
   dati,
   full,
   // output side
   dato,
   empty,
   re
);

parameter
   dw = 8;  // ram data width

input       clk;   // Clock
input       clr;

input       we;
input [dw-1:0] dati;
output      full;

output [dw-1:0] dato;
output      empty;
input       re;

reg empty;
reg [dw-1:0] dato;

always @(posedge clk) begin
   if (clr) begin
      empty <= 1'b1;
      dato <= {dw{1'bx}};
   end
   else if (~empty) begin
      if (re & ~we) begin
         empty <= 1'b1;
         dato <= {dw{1'bx}};
      end
      else if (re & we) begin
         empty <= 1'b0;
         dato <= dati;
      end 
   end
   else begin
      if (we) begin
         empty <= 1'b0;
         dato <= dati;
      end
   end
end

assign full = ~(empty | re);

endmodule

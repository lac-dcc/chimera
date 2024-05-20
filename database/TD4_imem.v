// This program was cloned from: https://github.com/akita11/TD4
// License: MIT License

module imem(addr, data);
   input [3:0] addr;
   output [7:0] data;
   reg [7:0] data;

   always @(addr) begin
      case (addr)
	4'h0 : data <= 8'h53;
	4'h1 : data <= 8'h90;
	4'h2 : data <= 8'h51;
	4'h3 : data <= 8'h90;
	4'h4 : data <= 8'hf2;
      endcase
   end
endmodule

     

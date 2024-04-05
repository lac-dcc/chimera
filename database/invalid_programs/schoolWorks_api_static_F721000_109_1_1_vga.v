module vga (clock,reset,r,g,b)
begin
	input clock,reset,r,g,b;
	wire clk_vga;
	clk_divi myclk(clock,reset,32'd,clk_vga);
end
module clk_divi (clk,rst,counter,div_clk);
	input clk,rst;
	input [31:0]counter;
	output div_clk;
	reg div_clk;
	reg [31:0]count;
	always @ (posedge clk)
	begin 
		if (!rst)
		begin 
		count <= 32'd0;
		div_clk <=1'b0;
		end
		else
		begin 
			if (count == counter)
			begin 
			count<=32'd0;
			div_clk <=~div_clk;
			end
			else
			begin 
				count <= count + 32'd1;
			end
		end
   end
endmodule

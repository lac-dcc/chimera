// This program was cloned from: https://github.com/Efinix-Inc/xyloni
// License: MIT License

`timescale 1ns/1ps

module sobel_feldman_tb();

localparam	Y_DEPTH	= 8;

reg		r_arst;
reg		r_pclk;

reg		[Y_DEPTH-1:0]r_pixel_11_11;
reg		[Y_DEPTH-1:0]r_pixel_00_11;
reg		[Y_DEPTH-1:0]r_pixel_01_11;

reg		[Y_DEPTH-1:0]r_pixel_11_11_1P;
reg		[Y_DEPTH-1:0]r_pixel_00_11_1P;
reg		[Y_DEPTH-1:0]r_pixel_01_11_1P;

wire	[Y_DEPTH-1:0]w_pixel;

sobel_feldman
#(
	.Y_DEPTH(Y_DEPTH)
)
inst_sobel_pixel
(
	.i_arst(r_arst),
	.i_pclk(r_pclk),
	
	.i_pixel_11_11(r_pixel_11_11_1P),
	.i_pixel_00_11(r_pixel_00_11_1P),
	.i_pixel_01_11(r_pixel_01_11_1P),
	
	.o_pixel(w_pixel)
);

initial
begin
	r_pclk	<= 1'b1;
	forever
		#2.5	r_pclk	<= ~r_pclk;
end

initial
begin
		r_arst			<= 1'b1;
		r_pixel_11_11	<= {Y_DEPTH{1'b0}};
		r_pixel_00_11	<= {Y_DEPTH{1'b0}};
		r_pixel_01_11	<= {Y_DEPTH{1'b0}};
	
	#10	r_arst			<= 1'b0;
		r_pixel_11_11	<= 8'd225;
		r_pixel_00_11	<= 8'd0;
		r_pixel_01_11	<= 8'd76;
		
	#5	r_pixel_11_11	<= 8'd105;
		r_pixel_00_11	<= 8'd255;
		r_pixel_01_11	<= 8'd149;
		
	#5	r_pixel_11_11	<= 8'd178;
		r_pixel_00_11	<= 8'd128;
		r_pixel_01_11	<= 8'd29;
	
	#5	r_pixel_11_11	<= {Y_DEPTH{1'b0}};
		r_pixel_00_11	<= {Y_DEPTH{1'b0}};
		r_pixel_11_11	<= {Y_DEPTH{1'b0}};
end

always@(posedge r_arst or posedge r_pclk)
begin
	if (r_arst)
	begin
		r_pixel_11_11_1P	<= {Y_DEPTH{1'b0}};
		r_pixel_00_11_1P	<= {Y_DEPTH{1'b0}};
		r_pixel_01_11_1P	<= {Y_DEPTH{1'b0}};
	end
	else
	begin
		r_pixel_11_11_1P	<= r_pixel_11_11;
		r_pixel_00_11_1P	<= r_pixel_00_11;
		r_pixel_01_11_1P	<= r_pixel_01_11;
	end
end

endmodule

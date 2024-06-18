// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module FIFO_top
#(
	parameter RESOLUTION_H = 1280,
				 RESOLUTION_V = 960,
				 V_BOTTOM = 1,
             V_SYNC   = 3,
             V_TOP    = 30,
				 H_FRONT  =  80,
             H_SYNC   =  136,
             H_BACK   =  216,
				 HPOS_WIDTH = $clog2 (RESOLUTION_H+H_FRONT+H_SYNC+H_BACK),
				 VPOS_WIDTH = $clog2 (RESOLUTION_V+V_BOTTOM+V_SYNC+V_TOP),
				 FIFODEPTH=30
)
(
  input                clk,
  input                rst,
  input                push,
  input                toppop,
  input  [HPOS_WIDTH-1:0] hpos_write,
  input  [VPOS_WIDTH-1:0] vpos_write,
  input  [2:0] RGB_write,
  output [HPOS_WIDTH-1:0] hpos_read,
  output [VPOS_WIDTH-1:0] vpos_read,
  output [2:0] RGB_read,
  output               empty,
  output               full
);
reg [2:0] counter = 0;
reg pop=0;
wire hposempty,vposempty,RGBempty,hposfull,vposfull,RGBfull;

flip_flop_fifo
#(
	.width(HPOS_WIDTH),
	.depth(FIFODEPTH)
)
HPOS_FIFO
(
	.clk			(clk),
	.rst			(rst),
	.push			(push),
	.pop			(pop),
	.write_data	(hpos_write),
	.read_data	(hpos_read),
	.empty		(hposempty),
	.full			(hposfull)
);

flip_flop_fifo
#(
	.width(VPOS_WIDTH),
	.depth(FIFODEPTH)
)
VPOS_FIFO
(
	.clk			(clk),
	.rst			(rst),
	.push			(push),
	.pop			(pop),
	.write_data	(vpos_write),
	.read_data	(vpos_read),
	.empty		(vposempty),
	.full			(vposfull)
);

flip_flop_fifo
#(
	.width(3),
	.depth(FIFODEPTH)
)
RGB_FIFO
(
	.clk			(clk),
	.rst			(rst),
	.push			(push),
	.pop			(pop),
	.write_data	(RGB_write),
	.read_data	(RGB_read),
	.empty		(RGBempty),
	.full			(RGBfull)
);

always@(posedge clk) begin
if(toppop) begin 
counter <= counter + 1;
if(counter == 1) pop <= 1;
else pop <= 0;
if(counter == 'd4) counter <= 0;
end
end
assign empty=hposempty&vposempty&RGBempty;
assign full=hposfull&vposfull&RGBfull;


endmodule
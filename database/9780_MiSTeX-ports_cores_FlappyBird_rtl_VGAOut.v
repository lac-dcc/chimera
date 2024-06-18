// This program was cloned from: https://github.com/MiSTeX-devel/MiSTeX-ports
// License: BSD 3-Clause "New" or "Revised" License

/////////////////////////////////////////////////////////////////////////
module VGAOut(Clk, vga_h_sync, vga_v_sync, vblank, hblank, CounterX, CounterY);
input Clk;
output reg vga_h_sync, vga_v_sync;
output reg vblank;
output reg hblank;
output reg [15:0] CounterX;
output reg [15:0] CounterY;

//////////////////////////////////////////////////
wire CounterXmaxed = (CounterX==10'd799);

always @(posedge Clk) begin
	if(CounterXmaxed)
		CounterX <= 15'd0;
	else
		CounterX <= CounterX + 1'd1;
end

always @(posedge Clk) begin
	if (CounterXmaxed) begin
		CounterY <= CounterY + 1'd1;
		if (CounterY > 523)
			CounterY <= 15'd0;
	end
end

reg	vga_HS, vga_VS;
always @(posedge Clk)
begin
	vga_HS <= (CounterX >= 655) && (CounterX < 752); // change this value to move the display horizontally
	vga_VS <= (CounterY >= 490) && (CounterY < 492); // change this value to move the display vertically
end

//reg inDisplayArea;
always @(posedge Clk) begin :displayarea
	reg hbl, vbl;

	vbl <= (CounterY > 479);
	hbl <= (CounterX > 639);

	vblank <= vbl;
	hblank <= hbl;

	vga_h_sync <= vga_HS;
	if(~vga_h_sync & vga_HS) vga_v_sync <= vga_VS;
end

endmodule

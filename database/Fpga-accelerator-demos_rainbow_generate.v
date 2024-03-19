module rainbow_generate(
    input           	  clk     ,
    input           	  rst_n   ,

    input   	[ 9:0]  x_pix   ,
    input   	[ 9:0]  y_pix   ,

    output reg [23:0]  data
);

parameter red       = 24'hFF0000;
parameter green     = 24'h00FF00;
parameter blue      = 24'h0000FF;
parameter purple    = 24'h9B30FF;
parameter yellow    = 24'hFFFF00;
parameter cyan      = 24'h00FFFF;
parameter orange    = 24'hFFA500;
parameter white     = 24'hFFFFFF;

parameter bar_wide = 10'd640 / 10'd8;

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		data <= 24'b0;
	end
	else begin
		if(x_pix < bar_wide * 11'd1)
			data <= red;
		else if(x_pix < bar_wide * 11'd2)
			data <= green;
		else if(x_pix < bar_wide * 11'd3)
			data <= blue;
		else if(x_pix < bar_wide * 11'd4)
			data <= purple;
		else if(x_pix < bar_wide * 11'd5)
			data <= yellow;
		else if(x_pix < bar_wide * 11'd6)
			data <= cyan;
		else if(x_pix < bar_wide * 11'd7)
			data <= orange;
		else
			data <= white;
	end
end

endmodule

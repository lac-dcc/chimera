// This program was cloned from: https://github.com/Efinix-Inc/xyloni
// License: MIT License

module subsampling
#(
	parameter	XI_SUBSAMPLE	= 1,
	parameter	YI_SUBSAMPLE	= 1,
	parameter	XO_SUBSAMPLE	= 2,
	parameter	YO_SUBSAMPLE	= 2,
	parameter	MCU_WIDTH		= 8,
	parameter	MCU_HEIGHT		= 8,
	parameter	COLOR_PRECISION	= 8,
	parameter	REGISTER		= "YES"
)
(
	input	i_arst,
	input	i_sysclk,
	input	i_we,
	input	[COLOR_PRECISION-1:0]i_color,
	output	o_we,
	output	[COLOR_PRECISION-1:0]o_color
);

function integer log2;
	input	integer	val;
	integer	i;
	begin
		log2 = 0;
		for (i=0; 2**i<val; i=i+1)
			log2 = i+1;
	end
endfunction

wire	w_x_subsample;
wire	w_y_subsample;
wire	[log2(MCU_WIDTH)-1:0]w_mcu_width;
wire	[log2(MCU_HEIGHT)-1:0]w_mcu_height;

reg		r_x_1P;
reg		r_y_1P;
reg		[log2(MCU_WIDTH)-1:0]r_w_1P;
reg		[log2(MCU_HEIGHT)-1:0]r_h_1P;
reg		r_we_1P;
reg		[COLOR_PRECISION-1:0]r_color_1P;

wire	w_we_0P;
wire	[COLOR_PRECISION-1:0]w_color_0P;

assign	w_x_subsample	= XO_SUBSAMPLE/XI_SUBSAMPLE-1'b1;
assign	w_y_subsample	= YO_SUBSAMPLE/YI_SUBSAMPLE-1'b1;
assign	w_mcu_width		= MCU_WIDTH-1'b1;
assign	w_mcu_height	= MCU_HEIGHT-1'b1;

assign	w_we_0P		= (r_y_1P == 1'b0 && r_x_1P == 1'b0)?
						i_we:1'b0;
assign	w_color_0P	= i_color;

always@(posedge i_arst or posedge i_sysclk)
begin
	if (i_arst)
	begin
		r_x_1P		<= 1'b0;
		r_y_1P		<= 1'b0;
		r_w_1P		<= {log2(MCU_WIDTH){1'b0}};
		r_h_1P		<= {log2(MCU_HEIGHT){1'b0}};
		r_we_1P		<= 1'b0;
		r_color_1P	<= {COLOR_PRECISION{1'b0}};
	end
	else
	begin
		if (i_we)
		begin
			r_x_1P	<= r_x_1P+1'b1;
			r_w_1P	<= r_w_1P+1'b1;
			if (r_x_1P == w_x_subsample)
				r_x_1P	<= 1'b0;
			
			if (r_w_1P == w_mcu_width)
			begin
				r_w_1P	<= {log2(MCU_WIDTH){1'b0}};
				r_y_1P	<= r_y_1P+1'b1;
				r_h_1P	<= r_h_1P+1'b1;
				if (r_y_1P == w_y_subsample)
					r_y_1P	<= 1'b0;
				if (r_h_1P == w_mcu_height)
					r_h_1P	<= {log2(MCU_HEIGHT){1'b0}};
			end
		end
		
		r_we_1P		<= w_we_0P;
		r_color_1P	<= w_color_0P;
	end
end

generate
	if (REGISTER == "YES")
	begin
		assign	o_we	= r_we_1P;
		assign	o_color	= r_color_1P;
	end
	else
	begin
		assign	o_we	= w_we_0P;
		assign	o_color	= w_color_0P;
	end
endgenerate

endmodule

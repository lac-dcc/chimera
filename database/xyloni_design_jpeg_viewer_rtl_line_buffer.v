module line_buffer
#(
	parameter	COLOR_PRECISION	= 8,
	parameter	MAX_HRES		= 480,
	parameter	HRES_WIDTH		= 9,
	parameter	LINE			= 16,
	parameter	Y_XI_SUBSAMPLE	= 1,
	parameter	Y_YI_SUBSAMPLE	= 1,
	parameter	C_XI_SUBSAMPLE	= 2,
	parameter	C_YI_SUBSAMPLE	= 2,
	parameter	Y_XO_SUBSAMPLE	= 1,
	parameter	Y_YO_SUBSAMPLE	= 1,
	parameter	C_XO_SUBSAMPLE	= 2,
	parameter	C_YO_SUBSAMPLE	= 2,
	parameter	WR_ADDRESSING	= "BLOCK",
	parameter	RD_ADDRESSING	= "LINE",
	parameter	MCU_WIDTH		= 8,
	parameter	MCU_HEIGHT		= 8,
	parameter	BRAM_OUTPUT_REG	= "FALSE"
)
(
	input	i_arst,
	input	i_sysclk,
	input	[HRES_WIDTH-1:0]i_hres,

	input	i_Y_we,
	input	i_U_we,
	input	i_V_we,
	input	[COLOR_PRECISION-1:0]i_Y_wd,
	input	[COLOR_PRECISION-1:0]i_U_wd,
	input	[COLOR_PRECISION-1:0]i_V_wd,
	output	o_full,
	
	input	i_re,
	output	[COLOR_PRECISION-1:0]o_Y_rd,
	output	[COLOR_PRECISION-1:0]o_U_rd,
	output	[COLOR_PRECISION-1:0]o_V_rd,
	output	o_nempty
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

reg		[log2(MAX_HRES)-1:0]	r_wr_hres_x_1P;
reg		[log2(MCU_WIDTH)-1:0]	r_wr_mcu_x_1P;
reg		[log2(LINE)-1:0]		r_wr_hres_y_1P;
reg		[log2(MCU_HEIGHT)-1:0]	r_wr_mcu_y_1P;
reg		r_wr_sample_x_cnt_1P;
reg		r_wr_sample_y_cnt_1P;
reg		r_full_1P;

reg		[log2(MAX_HRES)-1:0]	r_rd_hres_x_1P;
reg		[log2(MCU_WIDTH)-1:0]	r_rd_mcu_x_1P;
reg		[log2(LINE)-1:0]		r_rd_hres_y_1P;
reg		[log2(MCU_HEIGHT)-1:0]	r_rd_mcu_y_1P;
reg		r_nempty_1P;

wire	[log2(MAX_HRES)-1:0]w_hres;
wire	[log2(LINE)+log2(MAX_HRES)-1:0]w_Y_wr_addr_1P;
wire	[log2(LINE)+log2(MAX_HRES)-1:0]w_Y_rd_addr_1P;
wire	[log2(LINE/C_YO_SUBSAMPLE)+log2(MAX_HRES/C_XO_SUBSAMPLE)-1:0]w_C_wr_addr_1P;
wire	[log2(LINE/C_YO_SUBSAMPLE)+log2(MAX_HRES/C_XO_SUBSAMPLE)-1:0]w_C_rd_addr_1P;

wire	[log2(MCU_WIDTH)-1:0]w_wr_x_mcu_end;
wire	[log2(MCU_WIDTH)-1:0]w_wr_y_mcu_end;
wire	w_wr_x_subsample;
wire	w_wr_y_subsample;
wire	[2:0]w_mcu_width_offset;
wire	[2:0]w_mcu_height_offset;
wire	[3:0]w_mcu_width_offset_x2;
wire	[3:0]w_mcu_height_offset_x2;

assign	w_hres			= i_hres;
assign	w_Y_wr_addr_1P	= {r_wr_hres_y_1P, r_wr_hres_x_1P};
assign	w_Y_rd_addr_1P	= {r_rd_hres_y_1P, r_rd_hres_x_1P};

`ifdef RTL_SIM
initial
begin
	$display("hihi line_buffer.v");
	$display("Y_XI_SUBSAMPLE = %d", Y_XI_SUBSAMPLE);
	$display("Y_YI_SUBSAMPLE = %d", Y_YI_SUBSAMPLE);
	$display("C_XI_SUBSAMPLE = %d", C_XI_SUBSAMPLE);
	$display("C_YI_SUBSAMPLE = %d", C_YI_SUBSAMPLE);
	$display("Y_XO_SUBSAMPLE = %d", Y_XO_SUBSAMPLE);
	$display("Y_YO_SUBSAMPLE = %d", Y_YO_SUBSAMPLE);
	$display("C_XO_SUBSAMPLE = %d", C_XO_SUBSAMPLE);
	$display("C_YO_SUBSAMPLE = %d", C_YO_SUBSAMPLE);
	$display("HRES = %d", i_hres);
end
`endif

generate
begin
	if (WR_ADDRESSING == "BLOCK")
	begin
		if (C_YI_SUBSAMPLE == 1 && C_XI_SUBSAMPLE == 1 && C_YO_SUBSAMPLE == 2 && C_XO_SUBSAMPLE == 2)
		begin
			assign	w_C_wr_addr_1P	= { r_wr_hres_y_1P[log2(MCU_HEIGHT)-1:C_YO_SUBSAMPLE-1], r_wr_hres_x_1P[log2(MAX_HRES)-1:C_XO_SUBSAMPLE-1]};
		end
		else if (C_YI_SUBSAMPLE == 2 && C_XI_SUBSAMPLE == 2 && C_YO_SUBSAMPLE == 2 && C_XO_SUBSAMPLE == 2)
		begin
			assign	w_C_wr_addr_1P	= {	r_wr_hres_y_1P[log2(MCU_HEIGHT)-1:0],
										r_wr_hres_x_1P[log2(MAX_HRES)-1:log2(MCU_WIDTH)+C_XO_SUBSAMPLE-1],
										r_wr_hres_x_1P[log2(MCU_WIDTH)-1:0]};
		end
	end
	else
		assign	w_C_wr_addr_1P	= {r_wr_hres_y_1P[log2(LINE)-1:C_YO_SUBSAMPLE-1], r_wr_hres_x_1P[log2(MAX_HRES)-1:C_XO_SUBSAMPLE-1]};
end
endgenerate
assign	w_C_rd_addr_1P	= {r_rd_hres_y_1P[log2(LINE)-1:C_YO_SUBSAMPLE-1], r_rd_hres_x_1P[log2(MAX_HRES)-1:C_XO_SUBSAMPLE-1]};

assign	w_wr_x_mcu_end		= MCU_WIDTH-1'b1;
assign	w_wr_y_mcu_end		= MCU_HEIGHT-1'b1;
assign	w_wr_x_subsample	= C_XO_SUBSAMPLE-1'b1;
assign	w_wr_y_subsample	= C_YO_SUBSAMPLE-1'b1;

assign	w_mcu_width_offset		= MCU_WIDTH-1'b1;
assign	w_mcu_height_offset		= MCU_HEIGHT-1'b1;
assign	w_mcu_width_offset_x2	= MCU_WIDTH*2-1'b1;
assign	w_mcu_height_offset_x2	= MCU_HEIGHT*2-1'b1;

simple_dual_port_ram
#(
	.DATA_WIDTH		(COLOR_PRECISION),
	.ADDR_WIDTH		(log2(LINE/Y_YO_SUBSAMPLE)+log2(MAX_HRES/Y_XO_SUBSAMPLE)),
	.OUTPUT_REG		("FALSE"),
	.RAM_INIT_FILE	(""),
	.RAM_INIT_RADIX	("")
)
inst_line_buffer_Y
(
	.wdata	(i_Y_wd),
	.waddr	(w_Y_wr_addr_1P),
	.raddr	(w_Y_rd_addr_1P),
	.we		(i_Y_we),
	.wclk	(i_sysclk),
	.re		(1'b1),
	.rclk	(i_sysclk),
	.rdata	(o_Y_rd)
);

simple_dual_port_ram
#(
	.DATA_WIDTH		(COLOR_PRECISION),
	.ADDR_WIDTH		(log2(LINE/C_YO_SUBSAMPLE)+log2(MAX_HRES/C_XO_SUBSAMPLE)),
	.OUTPUT_REG		("FALSE"),
	.RAM_INIT_FILE	(""),
	.RAM_INIT_RADIX	("")
)
inst_line_buffer_U
(
	.wdata	(i_U_wd),
	.waddr	(w_C_wr_addr_1P),
	.raddr	(w_C_rd_addr_1P),
	.we		(i_U_we),
	.wclk	(i_sysclk),
	.re		(1'b1),
	.rclk	(i_sysclk),
	.rdata	(o_U_rd)
);

simple_dual_port_ram
#(
	.DATA_WIDTH		(COLOR_PRECISION),
	.ADDR_WIDTH		(log2(LINE/C_YO_SUBSAMPLE)+log2(MAX_HRES/C_XO_SUBSAMPLE)),
	.OUTPUT_REG		("FALSE"),
	.RAM_INIT_FILE	(""),
	.RAM_INIT_RADIX	("")
)
inst_line_buffer_V
(
	.wdata	(i_V_wd),
	.waddr	(w_C_wr_addr_1P),
	.raddr	(w_C_rd_addr_1P),
	.we		(i_V_we),
	.wclk	(i_sysclk),
	.re		(1'b1),
	.rclk	(i_sysclk),
	.rdata	(o_V_rd)
);

always@(posedge i_arst or posedge i_sysclk)
begin
	if (i_arst)
	begin
		r_wr_hres_x_1P			<= {log2(MAX_HRES){1'b0}};
		r_wr_mcu_x_1P			<= {log2(MCU_WIDTH){1'b0}};
		r_wr_sample_x_cnt_1P	<= {1{1'b0}};
		r_wr_hres_y_1P			<= {log2(LINE){1'b0}};
		r_wr_mcu_y_1P			<= {log2(MCU_HEIGHT){1'b0}};
		r_wr_sample_y_cnt_1P	<= {1{1'b0}};
		r_full_1P				<= 1'b0;
		
		r_rd_hres_x_1P	<= {log2(MAX_HRES){1'b0}};
		r_rd_mcu_x_1P	<= {log2(MCU_WIDTH){1'b0}};
		r_rd_hres_y_1P	<= {log2(LINE){1'b0}};
		r_rd_mcu_y_1P	<= {log2(MCU_HEIGHT){1'b0}};
		r_nempty_1P		<= 1'b0;
	end
	else
	begin
		if (WR_ADDRESSING == "BLOCK")
		begin
			if (i_Y_we)
			begin
				r_wr_hres_x_1P	<= r_wr_hres_x_1P+1'b1;
				r_wr_mcu_x_1P		<= r_wr_mcu_x_1P+1'b1;
				if (r_wr_mcu_x_1P == w_wr_x_mcu_end)
				begin
					r_wr_hres_x_1P	<= r_wr_hres_x_1P-w_mcu_width_offset;
					r_wr_hres_y_1P	<= r_wr_hres_y_1P+1'b1;
					r_wr_mcu_y_1P	<= r_wr_mcu_y_1P+1'b1;
					if (r_wr_mcu_y_1P == w_wr_y_mcu_end)
					begin
						r_wr_hres_x_1P			<= r_wr_hres_x_1P+1'b1;
						r_wr_hres_y_1P			<= r_wr_hres_y_1P-w_mcu_height_offset;
						if (C_XI_SUBSAMPLE != 1)
						begin
							r_wr_sample_x_cnt_1P	<= r_wr_sample_x_cnt_1P+1'b1;
							if (r_wr_sample_x_cnt_1P == w_wr_x_subsample)
							begin
								r_wr_hres_x_1P			<= r_wr_hres_x_1P-w_mcu_width_offset_x2;
								r_wr_hres_y_1P			<= r_wr_hres_y_1P+1'b1;
								r_wr_sample_x_cnt_1P	<= {1{1'b0}};
								if (C_YI_SUBSAMPLE != 1)
								begin
									r_wr_sample_y_cnt_1P	<= r_wr_sample_y_cnt_1P+1'b1;
									if (r_wr_sample_y_cnt_1P == w_wr_y_subsample)
									begin
										r_wr_hres_x_1P			<= r_wr_hres_x_1P+1'b1;
										r_wr_hres_y_1P			<= r_wr_hres_y_1P-w_mcu_height_offset_x2;
										r_wr_sample_y_cnt_1P	<= {1{1'b0}};
//										if (r_wr_hres_x_1P == w_hres-1'b1)
										if (r_wr_hres_x_1P == w_hres)
										begin
											r_wr_hres_x_1P			<= {log2(MAX_HRES){1'b0}};
											r_wr_hres_y_1P			<= r_wr_hres_y_1P+1'b1;
											// T8 specific
											r_full_1P		<= 1'b1;
											r_nempty_1P		<= 1'b1;
										end
									end
								end
//								else if (r_wr_hres_x_1P == w_hres-1'b1)
								else if (r_wr_hres_x_1P == w_hres)
								begin
									r_wr_hres_x_1P			<= {log2(MAX_HRES){1'b0}};
									r_wr_hres_y_1P			<= r_wr_hres_y_1P+1'b1;
									// T8 specific
									r_full_1P		<= 1'b1;
									r_nempty_1P		<= 1'b1;
								end
							end
						end
//						else if (r_wr_hres_x_1P == w_hres-1'b1)
						else if (r_wr_hres_x_1P == w_hres)
						begin
							r_wr_hres_x_1P			<= {log2(MAX_HRES){1'b0}};
							r_wr_hres_y_1P			<= r_wr_hres_y_1P+1'b1;
							// T8 specific
							r_full_1P		<= 1'b1;
							r_nempty_1P		<= 1'b1;
						end
					end
				end
			end
		end	
		else
		begin
			if (i_Y_we)
			begin
				r_wr_hres_x_1P	<= r_wr_hres_x_1P+1'b1;
//				if (r_wr_hres_x_1P == w_hres-1'b1)
				if (r_wr_hres_x_1P == w_hres)
				begin
					r_wr_hres_x_1P	<= {log2(MAX_HRES){1'b0}};
					r_wr_hres_y_1P	<= r_wr_hres_y_1P+1'b1;
					if (r_wr_hres_y_1P == LINE-1'b1)
					begin
						r_wr_hres_y_1P	<= {log2(LINE){1'b0}};
						// T8 specific
						r_full_1P		<= 1'b1;
						r_nempty_1P		<= 1'b1;
					end
				end
			end
		end
		
		if (RD_ADDRESSING == "BLOCK")
		begin
			if (i_re & r_nempty_1P)
			begin
				r_rd_hres_x_1P	<= r_rd_hres_x_1P+1'b1;
				r_rd_mcu_x_1P	<= r_rd_mcu_x_1P+1'b1;
				if (r_rd_mcu_x_1P == MCU_WIDTH-1'b1)
				begin
					r_rd_hres_x_1P	<= r_rd_hres_x_1P-w_mcu_width_offset;
					r_rd_mcu_x_1P	<= {log2(MCU_WIDTH){1'b0}};
					r_rd_hres_y_1P	<= r_rd_hres_y_1P+1'b1;
					r_rd_mcu_y_1P	<= r_rd_mcu_y_1P+1'b1;
					if (r_rd_mcu_y_1P == MCU_HEIGHT-1'b1)
					begin
						r_rd_hres_x_1P			<= r_rd_hres_x_1P+1'b1;
						r_rd_hres_y_1P			<= r_rd_hres_y_1P-w_mcu_height_offset;
//						if (r_rd_hres_x_1P == w_hres-1'b1)
						if (r_rd_hres_x_1P == w_hres)
						begin
							r_rd_hres_x_1P			<= {log2(MAX_HRES){1'b0}};
							r_rd_mcu_y_1P			<= {log2(MCU_HEIGHT){1'b0}};
							r_rd_hres_y_1P			<= r_rd_hres_y_1P+1'b1;
							// T8 specific
							r_full_1P		<= 1'b0;
							r_nempty_1P		<= 1'b0;
						end
					end
				end
			end
		end
		else
		begin
			if (i_re & r_nempty_1P)
			begin
				r_rd_hres_x_1P	<= r_rd_hres_x_1P+1'b1;
//				if (r_rd_hres_x_1P == w_hres-1'b1)
				if (r_rd_hres_x_1P == w_hres)
				begin
					r_rd_hres_x_1P	<= {log2(MAX_HRES){1'b0}};
					r_rd_hres_y_1P	<= r_rd_hres_y_1P+1'b1;
					if (r_rd_hres_y_1P == LINE-1'b1)
					begin
						r_rd_hres_y_1P	<= {log2(LINE){1'b0}};
						// T8 specific
						r_full_1P		<= 1'b0;
						r_nempty_1P		<= 1'b0;
					end
				end
			end
		end
	end
end

assign	o_full		= r_full_1P;
assign	o_nempty	= r_nempty_1P;

endmodule

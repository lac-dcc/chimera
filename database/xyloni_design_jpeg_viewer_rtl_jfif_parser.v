module jfif_parser
#(
	parameter	SOS_CNT_W	= 4
)
(
	input	i_arst,
	input	i_sysclk,
`ifdef DBG_MODE
	output	[1:0]o_sos_status,
`endif
	
	input	i_byte_en,
	input	[7:0]i_byte,
	output	o_jfif_ready,
	output	o_jfif_eoi,
	
	input	i_sos_re,
	output	o_sos_start,
	output	[15:0]o_sos_width,
	output	[15:0]o_sos_height,
	output	o_sos_scan_en,
	output	o_sos_ecs_bit
);

sos_parser
#(
	.CNT_W		(SOS_CNT_W)
)
inst_sos_parser
(
	.i_arst		(i_arst),
	.i_sysclk	(i_sysclk),
`ifdef DBG_MODE
	.o_scan_status	(o_sos_status),
`endif
	
	.i_byte_en	(i_byte_en),
	.i_byte		(i_byte),
	.o_ready	(o_jfif_ready),
	.o_eoi		(o_jfif_eoi),
	
	.i_re		(i_sos_re),
	.o_start	(o_sos_start),
	.o_width	(o_sos_width),
	.o_height	(o_sos_height),
	.o_scan_en	(o_sos_scan_en),
	.o_ecs_bit	(o_sos_ecs_bit)
);

endmodule

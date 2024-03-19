`timescale 1ns/1ns
`define	EOF	32'hFFFFFFFF

module sos_parser_tb();

localparam	CNT_W	= 4;

integer	jpeg_file;
integer	temp;

reg		r_arst;
reg		r_sysclk;
reg		r_byte_en;
reg		[7:0]r_byte[0:1023];
reg		[15:0]r_ptr;
wire	[7:0]w_byte;
wire	w_ready;
reg		r_re;
wire	w_start;
wire	w_scan_en;
wire	w_ecs_bit;

assign	w_byte	= r_byte[r_ptr];

sos_parser
#(
	.CNT_W(CNT_W)
)
inst_sos_parser
(
	.i_arst		(r_arst),
	.i_sysclk	(r_sysclk),
	.i_byte_en	(r_byte_en),
	.i_byte		(w_byte),
	.o_ready	(w_ready),
	.i_re		(r_re),
	.o_start	(w_start),
	.o_scan_en	(w_scan_en),
	.o_ecs_bit	(w_ecs_bit)
);

initial
begin
	jpeg_file	= $fopen("test_pattern_01.jpg", "rb");
	temp		= $fread(r_byte, jpeg_file, 0, 1023);
	$fclose(jpeg_file);
end

initial
begin
	r_arst	<= 1'b1;
	#10	r_arst	<= 1'b0;
end

initial
begin
	r_sysclk	<= 1'b1;
	forever
		#2.5	r_sysclk	<= ~r_sysclk;
end

always@(posedge r_arst or posedge r_sysclk)
begin
	if (r_arst)
	begin
		r_byte_en	<= 1'b0;
		r_ptr		<= 'h0;
		r_re		<= 1'b0;
	end
	else
	begin
		r_byte_en	<= 1'b1;
		if (w_ready)
			r_ptr		<= r_ptr+1'b1;
		r_re		<= 1'b1;
	end
end

endmodule

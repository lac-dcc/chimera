module sos_parser
#(
	parameter	CNT_W	= 4
)
(
	input	i_arst,
	input	i_sysclk,
`ifdef DBG_MODE
	output	[1:0]o_scan_status,
`endif

	input	i_byte_en,
	input	[7:0]i_byte,
	output	o_ready,
	output	o_eoi,
	
	input	i_re,
	output	o_start,
	output	[15:0]o_width,
	output	[15:0]o_height,
	output	o_scan_en,
	output	o_ecs_bit
);

localparam	c_MRK	= 8'hFF;
localparam	c_PAD	= 8'h00;
localparam	c_SOI	= 8'hD8;
localparam	c_SOF0	= 8'hC0;	// Basline DCT
localparam	c_DHT	= 8'hC4;
localparam	c_DQT	= 8'hDB;
localparam	c_DRI	= 8'hDD;
localparam	c_SOS	= 8'hDA;
localparam	c_RST	= 5'b11010;	//XXX
localparam	c_APP	= 4'hE;		//X
localparam	c_COM	= 8'hFE;
localparam	c_EOI	= 8'hD9;

/*==============================
For YUV Sequential DCT Baseline
Ls	12
Ns	3
Csj	
Tdj	Don't care with fixed DHT DC
Taj	Don't care with fixed DHT AC
Ss	0
Se	63
Ah	0
Al	0
==============================*/

localparam	s_idle			= 2'b00;
localparam	s_scan_res		= 2'b01;
localparam	s_scan_header	= 2'b10;
localparam	s_scan_data		= 2'b11;

reg	r_marker_1P;
reg	[7:0]r_sr_1P;
reg	[1:0]r_scan_status_1P;
reg	r_ready_1P;
reg	[CNT_W-1:0]r_cnt_1P;
reg	r_start_1P;
reg	[15:0]r_width_1P;
reg	[15:0]r_height_1P;
reg	r_scan_en_1P;
reg	r_eoi_1P;

always@(posedge i_arst or posedge i_sysclk)
begin
	if (i_arst)
	begin
		r_marker_1P			<= 1'b0;
		r_sr_1P				<= {8{1'b0}};
		r_scan_status_1P	<= s_idle;
		r_ready_1P			<= 1'b1;
		r_cnt_1P			<= {CNT_W{1'b0}};
		r_start_1P			<= 1'b0;
		r_width_1P			<= {16{1'b0}};
		r_height_1P			<= {16{1'b0}};
		r_scan_en_1P		<= 1'b0;
		r_eoi_1P			<= 1'b0;
	end
	else
	begin
		r_ready_1P			<= 1'b1;
		r_start_1P			<= 1'b0;
		r_eoi_1P			<= 1'b0;
//		if (i_byte == 8'hFF)
//		if (i_byte_en && i_byte == c_MRK)
//			r_marker_1P	<= 1'b1;
//		else
//			r_marker_1P	<= 1'b0;
//		
//		if (i_byte_en)
//			r_sr_1P		<= i_byte;
		
		case (r_scan_status_1P)
			s_idle:
			begin
				if (i_byte_en)
				begin
					if (i_byte == c_MRK)
						r_marker_1P	<= 1'b1;
					else
						r_marker_1P	<= 1'b0;
					
					r_sr_1P		<= i_byte;
				
					if (r_marker_1P)
					begin
						if (i_byte == c_SOF0)
						begin
							r_scan_status_1P	<= s_scan_res;
						end
						else if (i_byte == c_SOS)
						begin
							r_scan_status_1P	<= s_scan_header;
							r_start_1P			<= 1'b1;
						end
					end
				end
			end
			
			s_scan_res:
			begin
				if (i_byte_en)
				begin
					r_sr_1P		<= i_byte;
					r_cnt_1P	<= r_cnt_1P+1'b1;
					if (r_cnt_1P == 4'd3)
						r_height_1P[15:8]	<= i_byte;
					else if (r_cnt_1P == 4'd4)
						r_height_1P[7:0]	<= i_byte;
					else if (r_cnt_1P == 4'd5)
						r_width_1P[15:8]	<= i_byte;
					else if (r_cnt_1P == 4'd6)
					begin
						r_width_1P[7:0]		<= i_byte;
						
						r_scan_status_1P	<= s_idle;
						r_cnt_1P			<= {CNT_W{1'b0}};
					end
				end
			end
			
			s_scan_header:
			begin
				if (i_byte_en)
				begin
					r_sr_1P		<= i_byte;
					r_cnt_1P	<= r_cnt_1P+1'b1;
					if (r_cnt_1P == 4'd12)
					begin
						r_scan_status_1P	<= s_scan_data;
						r_ready_1P			<= 1'b0;
						r_cnt_1P			<= {CNT_W{1'b0}};
						r_scan_en_1P		<= 1'b1;
					end
				end
			end
			
			s_scan_data:
			begin
				r_ready_1P			<= 1'b0;
				r_scan_en_1P		<= i_byte_en;
				if (i_byte_en)
				begin
					if (i_byte == c_MRK)
					begin
						r_marker_1P	<= 1'b1;
						if (~r_ready_1P)
						r_ready_1P	<= 1'b1;
						if (r_cnt_1P == 4'd7)
							r_scan_en_1P		<= 1'b0;
					end
				end
				if (i_re & r_scan_en_1P)
				begin
					r_cnt_1P	<= r_cnt_1P+1'b1;
					r_sr_1P		<= {r_sr_1P[6:0], 1'b0};
					if (r_cnt_1P == 4'd7)
					begin
						r_ready_1P	<= 1'b1;
						r_cnt_1P	<= {CNT_W{1'b0}};
						r_sr_1P		<= i_byte;
						if (r_marker_1P)
						begin
							if (i_byte == c_PAD)
							begin
								r_marker_1P	<= 1'b0;
								r_sr_1P		<= 8'hFF;
							end
							else if (i_byte == c_EOI)
							begin
								r_scan_status_1P	<= s_idle;
								r_scan_en_1P		<= 1'b0;
								r_ready_1P			<= 1'b1;
								r_eoi_1P			<= 1'b1;
							end
						end
					end
				end
				else
				begin
					r_sr_1P	<= r_sr_1P;
				end
			end
			
			default:
			begin
				r_marker_1P			<= 1'b0;
				r_sr_1P				<= {8{1'b0}};
				r_scan_status_1P	<= s_idle;
				r_ready_1P			<= 1'b1;
				r_cnt_1P			<= {CNT_W{1'b0}};
				r_start_1P			<= 1'b0;
				r_scan_en_1P		<= 1'b0;
				r_eoi_1P			<= 1'b0;
			end
		endcase
	end
end

assign	o_ready		= r_ready_1P;
assign	o_eoi		= r_eoi_1P;
assign	o_start		= r_start_1P;
assign	o_width		= r_width_1P;
assign	o_height	= r_height_1P;
assign	o_scan_en	= r_scan_en_1P;
assign	o_ecs_bit	= r_sr_1P[7];
`ifdef DBG_MODE
assign	o_scan_status	= r_scan_status_1P;
`endif

endmodule

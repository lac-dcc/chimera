`include "../rtl/nt35510.vh"

module mpu_interface
#(
	parameter	HRES_WIDTH	= 9,
	parameter	VRES_WIDTH	= 10,
	parameter	DATA_WIDTH	= 24,
	parameter	DLYC_WIDTH	= 22,
	parameter	DLY_VAL		= 1,
	parameter	TCHW		= 2,
	parameter	TWRL		= 4,
	parameter	TWRH		= 4,
	parameter	TRDL		= 4,
	parameter	TRDH		= 4,
	parameter	RGB_IN_L	= 2
)
(
	input	i_arst,
	input	i_sysclk,
	input	[HRES_WIDTH-1:0]i_width,
	input	[VRES_WIDTH-1:0]i_height,
	input	[HRES_WIDTH-1:0]i_pixel,
	input	i_on,
	input	i_off,
	input	i_mode,

	input	i_de,
	input	[DATA_WIDTH-1:0]i_rgb,
	output	o_ack,
	
	output	[3:0]o_state,
	output	[HRES_WIDTH-1:0]o_x,
	output	[VRES_WIDTH-1:0]o_y,
	output	o_init_done,
	output	o_csx,
	output	o_dcx,
	output	o_wrx,
	output	o_rdx,
	output	[DATA_WIDTH-1:0]o_d,
	output	[DATA_WIDTH-1:0]o_oe
);

localparam	s_reset		= 3'b000;
localparam	s_init		= 3'b001;
localparam	s_delay		= 3'b010;
localparam	s_idle		= 3'b011;
localparam	s_rawwr		= 3'b100;
localparam	s_ramwrd	= 3'b101;
localparam	s_sleep		= 3'b110;

wire	w_nop;
wire	w_sel;
wire	w_cmd;
wire	w_dat;
wire	[5:0]w_tWRL;
wire	[5:0]w_tWRH;
wire	[5:0]w_tRDL;
wire	[5:0]w_tRDH;
wire	[DLYC_WIDTH-1:0]w_dly_val;
wire	[2:0]w_rgb_in_l;

assign	w_nop		= `DES;
assign	w_sel		= `SEL;
assign	w_cmd		= `CMD;
assign	w_dat		= `DAT;
assign	w_tWRL		= TWRL-1'b1;
assign	w_tWRH		= TWRL+TWRH-1'b1;
assign	w_tRDL		= TRDL-1'b1;
assign	w_tRDH		= TRDL+TRDH-1'b1;
assign	w_dly_val	= DLY_VAL;
assign	w_rgb_in_l	= RGB_IN_L;

wire	[15:0]w_reg;
wire	w_dcx;

reg		[2:0]r_state_1P;
reg		r_init_done_1P;
reg		[4:0]r_cnt_1P;
reg		[DLYC_WIDTH-1:0]r_dly_1P;
reg		[HRES_WIDTH-1:0]r_x_1P;
reg		[VRES_WIDTH-1:0]r_y_1P;
reg		[HRES_WIDTH-1:0]r_p_1P;
reg		r_ack_1P;

reg		r_ren_1P;
reg		r_csx_1P;
reg		r_dcx_1P;
reg		r_wrx_1P;
reg		r_rdx_1P;
reg		[DATA_WIDTH-1:0]r_d_1P;
reg		[DATA_WIDTH-1:0]r_oe_1P;
reg		[5:0]r_cycle_1P;
reg		[2:0]r_rgb_in_l_1P;

nt35510_reg
inst_nt35510_reg
(
	.i_adr	(r_cnt_1P),
	.o_reg	(w_reg),
	.o_dcx	(w_dcx)
);

`ifdef RTL_SIM
initial
begin
	$display("Hihi mpu_interface.v");
	$display("DLY_VAL = %h", w_dly_val);
	$display("DLYC_WIDTH = %d", DLYC_WIDTH);
end
`endif

always@(posedge i_arst or posedge i_sysclk)
begin
	if (i_arst)
	begin
		r_state_1P		<= s_reset;
		r_init_done_1P	<= 1'b0;
		r_cnt_1P		<= {5{1'b0}};
		r_dly_1P		<= {DLYC_WIDTH{1'b0}};
		r_x_1P			<= {HRES_WIDTH{1'b0}};
		r_y_1P			<= {VRES_WIDTH{1'b0}};
		r_x_1P			<= {HRES_WIDTH{1'b0}};
		r_ack_1P		<= 1'b0;
		
		r_ren_1P		<= 1'b0;
		r_csx_1P		<= w_nop;
		r_dcx_1P		<= w_dat;
		r_wrx_1P		<= w_nop;
		r_rdx_1P		<= w_nop;
		r_d_1P			<= {8'h0, 8'h0, 8'h0};
		r_oe_1P			<= {DATA_WIDTH{1'b0}};
		r_cycle_1P		<= {6{1'b0}};
		r_rgb_in_l_1P	<= {3{1'b0}};
	end
	else
	begin
		r_ack_1P		<= 1'b0;
		r_ren_1P		<= 1'b0;
		
		case (r_state_1P)
			s_reset:
			begin
				r_dly_1P	<= r_dly_1P+1'b1;
				if (r_dly_1P == w_dly_val)
				begin
					r_state_1P	<= s_init;
					r_csx_1P	<= w_sel;
					r_dcx_1P	<= w_dcx;
					r_wrx_1P	<= w_sel;
					r_rdx_1P	<= w_nop;
					r_d_1P		<= {8'h0, w_reg};
					r_oe_1P		<= {DATA_WIDTH{1'b1}};
					
					r_cnt_1P	<= r_cnt_1P+1'b1;
`ifdef RTL_SIM
					r_dly_1P	<= {DLYC_WIDTH{1'b0}};
`endif
				end
			end
			
			s_init:
			begin
				r_cycle_1P	<= r_cycle_1P+1'b1;
				if (r_cycle_1P == w_tWRL)
					r_wrx_1P	<= ~r_wrx_1P;
				else if (r_cycle_1P == w_tWRH)
				begin
					r_wrx_1P	<= ~r_wrx_1P;
					r_cycle_1P	<= {6{1'b0}};
					r_dcx_1P	<= w_dcx;
					r_d_1P		<= {8'h0, w_reg};
					
					r_cnt_1P	<= r_cnt_1P+1'b1;
					if (r_cnt_1P == `DELAY)
					begin
						r_state_1P	<= s_delay;
						r_csx_1P	<= w_nop;
						r_dcx_1P	<= w_dat;
						r_wrx_1P	<= w_nop;
						r_rdx_1P	<= w_nop;
						r_d_1P		<= {8'h0, 8'h0, 8'h0};
						r_oe_1P		<= {DATA_WIDTH{1'b0}};
						r_cnt_1P	<= r_cnt_1P;
					end
					else if (r_cnt_1P == `INIT_DONE)
					begin
						r_state_1P		<= s_idle;
						r_init_done_1P	<= 1'b1;
						r_csx_1P		<= w_nop;
						r_dcx_1P		<= w_dat;
						r_wrx_1P		<= w_nop;
						r_rdx_1P		<= w_nop;
						r_d_1P			<= {8'h0, 8'h0, 8'h0};
						r_oe_1P			<= {DATA_WIDTH{1'b0}};
						r_cnt_1P		<= `SLEEP;
					end
					else if (r_cnt_1P == `EOF)
					begin
						r_state_1P		<= s_sleep;
						r_init_done_1P	<= 1'b0;
						r_csx_1P		<= w_nop;
						r_dcx_1P		<= w_dat;
						r_wrx_1P		<= w_nop;
						r_rdx_1P		<= w_nop;
						r_d_1P			<= {8'h0, 8'h0, 8'h0};
						r_oe_1P			<= {DATA_WIDTH{1'b0}};
						r_cnt_1P		<= {5{1'b0}};
					end
				end
			end
			
			s_delay:
			begin
				r_dly_1P	<= r_dly_1P+1'b1;
				if (r_dly_1P == w_dly_val)
				begin
					r_state_1P	<= s_init;
					r_csx_1P	<= w_sel;
					r_dcx_1P	<= w_dcx;
					r_wrx_1P	<= w_sel;
					r_rdx_1P	<= w_nop;
					r_d_1P		<= {8'h0, w_reg};
					r_oe_1P		<= {DATA_WIDTH{1'b1}};
					
					r_cnt_1P	<= r_cnt_1P+1'b1;
`ifdef RTL_SIM
					r_dly_1P	<= {DLYC_WIDTH{1'b0}};
`endif
				end
			end
			
			s_idle:
			begin
				if (i_off)
				begin
					r_state_1P	<= s_init;
					r_csx_1P	<= w_sel;
					r_dcx_1P	<= w_dcx;
					r_wrx_1P	<= w_sel;
					r_rdx_1P	<= w_nop;
					r_d_1P		<= {8'h0, w_reg};
					r_oe_1P		<= {DATA_WIDTH{1'b1}};
					r_cnt_1P	<= r_cnt_1P+1'b1;
				end
				else if (i_de)
				begin
					r_state_1P	<= s_rawwr;
					r_csx_1P	<= w_sel;
					r_dcx_1P	<= w_cmd;
					r_wrx_1P	<= w_sel;
					r_rdx_1P	<= w_nop;
					r_oe_1P		<= {DATA_WIDTH{1'b1}};
					if (i_mode)
					begin
						r_p_1P		<= r_x_1P+i_pixel;
						r_d_1P		<= {8'h0, `RAMWRC, 8'h0};
					end
					else
					begin
						r_p_1P		<= i_width;
						r_d_1P		<= {8'h0, `RAMWR, 8'h0};
					end
				end
				
			end
			
			s_rawwr:
			begin
				r_csx_1P	<= w_sel;
//				r_dcx_1P	<= w_cmd;
				r_rdx_1P	<= w_nop;
				r_cycle_1P	<= r_cycle_1P+1'b1;
				if (r_cycle_1P == w_tWRL)
				begin
					r_ack_1P	<= 1'b1;
					r_wrx_1P	<= ~r_wrx_1P;
				end
				else if (r_cycle_1P == w_tWRH)
				begin
					r_dcx_1P		<= w_dat;
					r_cycle_1P		<= {6{1'b0}};
					begin
						r_state_1P		<= s_ramwrd;
						r_wrx_1P		<= ~r_wrx_1P;
						r_d_1P			<= i_rgb;
					end
				end
			end
			
			s_ramwrd:
			begin
				r_csx_1P	<= w_sel;
				r_dcx_1P	<= w_dat;
				r_rdx_1P	<= w_nop;
				r_cycle_1P	<= r_cycle_1P+1'b1;
				if (r_cycle_1P == w_tWRL)
				begin
					r_ack_1P	<= 1'b1;
					r_wrx_1P	<= ~r_wrx_1P;
				end
				else if (r_cycle_1P == w_tWRH)
				begin
					r_wrx_1P	<= ~r_wrx_1P;
					r_d_1P		<= i_rgb;
					r_x_1P		<= r_x_1P+1'b1;
					r_cycle_1P	<= {6{1'b0}};
					if (r_x_1P == i_width)
					begin
						r_x_1P	<= {HRES_WIDTH{1'b0}};
						r_y_1P	<= r_y_1P+1'b1;
						
						if (r_y_1P == i_height)
						begin
							r_state_1P	<= s_idle;
							r_csx_1P	<= w_nop;
							r_wrx_1P	<= w_nop;
							r_d_1P		<= {8'h0, 8'h0, 8'h0};
							r_oe_1P		<= {DATA_WIDTH{1'b0}};
							r_y_1P		<= {VRES_WIDTH{1'b0}};
						end
					end
					if (i_mode && r_x_1P == r_p_1P)
					begin
						r_state_1P	<= s_idle;
						r_csx_1P	<= w_nop;
						r_wrx_1P	<= w_nop;
						r_d_1P		<= {8'h0, 8'h0, 8'h0};
						r_oe_1P		<= {DATA_WIDTH{1'b0}};
					end
				end
			end
			
			s_sleep:
			begin
				if (i_on)
					r_state_1P	<= s_reset;
			end
			
			default:
			begin
				r_state_1P		<= s_reset;
				r_init_done_1P	<= 1'b0;
				r_cnt_1P		<= {5{1'b0}};
				r_dly_1P		<= {DLYC_WIDTH{1'b0}};
				r_x_1P			<= {HRES_WIDTH{1'b0}};
				r_y_1P			<= {VRES_WIDTH{1'b0}};
				
				r_ren_1P		<= 1'b0;
				r_csx_1P		<= w_nop;
				r_dcx_1P		<= w_dat;
				r_wrx_1P		<= w_nop;
				r_rdx_1P		<= w_nop;
				r_d_1P			<= {8'h0, 8'h0, 8'h0};
				r_oe_1P			<= {DATA_WIDTH{1'b0}};
				r_cycle_1P		<= {6{1'b0}};
				r_rgb_in_l_1P	<= {3{1'b0}};
			end
		endcase
	end
end

assign	o_ack		= r_ack_1P;
assign	o_state		= r_state_1P;
assign	o_x			= r_x_1P;
assign	o_u			= r_y_1P;
assign	o_init_done	= r_init_done_1P;
assign	o_ren		= r_ren_1P;
assign	o_csx		= r_csx_1P;
assign	o_dcx		= r_dcx_1P;
assign	o_wrx		= r_wrx_1P;
assign	o_rdx		= r_rdx_1P;
assign	o_d			= r_d_1P;
assign	o_oe		= r_oe_1P;

endmodule

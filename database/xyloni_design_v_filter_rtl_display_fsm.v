module display_fsm
#(
	parameter	TIMER_WIDTH	= 16
)
(
	input	i_arst,
	input	i_osc,
	input	i_pclk,
	input	i_sw_n,
	input	i_pll_locked,
	
	output	o_srst,
	output	o_pll_locked,
	output	o_posterize_en,
	output	[1:0]o_display_sel
);

localparam	c_idle_streaming	= 3'b100;
localparam	c_full_sobel		= 3'b101;
localparam	c_half_sobel		= 3'b110;
localparam	c_half_posterize	= 3'b000;

localparam	s_m_idle_streaming	= 3'b000;
localparam	s_m_full_sobel		= 3'b001;
localparam	s_m_half_sobel		= 3'b010;
localparam	s_m_half_posterize	= 3'b011;
localparam	s_a_idle_streaming	= 3'b100;
localparam	s_a_full_sobel		= 3'b101;
localparam	s_a_half_sobel		= 3'b110;
localparam	s_a_half_posterize	= 3'b111;

reg		[TIMER_WIDTH-1:0]r_timer_osc_1P	= {TIMER_WIDTH{1'b0}};
reg		r_timer_en_osc_2P				= 1'b0;
reg		r_timer_en_osc_3P				= 1'b0;
reg		r_timer_msb_osc_2P				= 1'b0;
reg		r_pll_locked_osc_1P				= 1'b0;
reg		r_pll_locked_osc_2P				= 1'b0;
reg		r_pll_locked_osc_3P				= 1'b0;
reg		r_pll_locked_osc_4P				= 1'b0;
reg		r_pll_locked_osc_5P				= 1'b0;
reg		r_srst_osc_1P					= 1'b0;

reg		[2:0]r_display_state_1P;
reg		r_sw_n_pclk_1P;
reg		r_timer_msb_pclk_1P;
reg		[2:0]r_display_ctrl_pclk_1P;
reg		r_timer_en_pclk_1P;

reg		r_sw_n_pclk_2P;
reg		r_sw_n_fe_pclk_2P;
reg		r_timer_msb_pclk_2P;
reg		r_timer_msb_fe_pclk_2P;

//always@(posedge i_arst or posedge i_osc)
always@(posedge i_osc)
begin
//	if (i_arst)
//	begin
//		r_timer_osc_1P			<= {TIMER_WIDTH{1'b0}};
//		r_timer_en_osc_2P		<= 1'b0;
//		r_timer_en_osc_3P		<= 1'b0;
//		r_timer_msb_osc_2P		<= 1'b0;
//		r_pll_locked_osc_1P		<= 1'b0;
//		r_pll_locked_osc_2P		<= 1'b0;
//		r_srst_osc_1P			<= 1'b0;
//	end
//	else
	begin
		r_timer_osc_1P			<= r_timer_osc_1P+1'b1;
		if (r_timer_en_osc_2P & ~r_timer_en_osc_3P)
			r_timer_osc_1P		<= {TIMER_WIDTH{1'b0}};
		
		r_timer_en_osc_2P		<= r_timer_en_pclk_1P;
		r_timer_en_osc_3P		<= r_timer_en_osc_2P;
		
		r_timer_msb_osc_2P		<= r_timer_osc_1P[TIMER_WIDTH-1];
		
		if (~r_timer_osc_1P[TIMER_WIDTH-1] & r_timer_msb_osc_2P)
		begin
			r_pll_locked_osc_1P	<= i_pll_locked;
			r_pll_locked_osc_2P	<= r_pll_locked_osc_1P;
			r_pll_locked_osc_3P	<= r_pll_locked_osc_2P;
			r_pll_locked_osc_4P	<= r_pll_locked_osc_3P;
			r_pll_locked_osc_5P	<= r_pll_locked_osc_4P;
		end
		
		r_srst_osc_1P			<= 1'b0;
//		if (r_pll_locked_osc_4P & ~r_pll_locked_osc_5P)
		if (r_pll_locked_osc_1P & ~r_pll_locked_osc_2P)
			r_srst_osc_1P		<= 1'b1;
	end
end

always@(posedge i_arst or posedge i_pclk)
begin
	if (i_arst)
	begin
		r_display_state_1P		<= s_m_idle_streaming;
		r_sw_n_pclk_1P			<= 1'b1;
		r_timer_msb_pclk_1P		<= 1'b0;
		r_display_ctrl_pclk_1P	<= c_idle_streaming;
		r_timer_en_pclk_1P		<= 1'b0;
		
		r_sw_n_pclk_2P			<= 1'b1;
		r_sw_n_fe_pclk_2P		<= 1'b0;
		r_timer_msb_pclk_2P		<= 1'b0;
		r_timer_msb_fe_pclk_2P	<= 1'b0;
	end
	else
	begin
		r_sw_n_pclk_1P			<= i_sw_n;
		r_timer_msb_pclk_1P		<= r_timer_osc_1P[TIMER_WIDTH-1];
		
		r_sw_n_pclk_2P			<= r_sw_n_pclk_1P;
		r_timer_msb_pclk_2P		<= r_timer_msb_pclk_1P;
		
		r_sw_n_fe_pclk_2P		<= ~r_sw_n_pclk_1P & r_sw_n_pclk_2P;
		r_timer_msb_fe_pclk_2P	<= ~r_timer_msb_pclk_1P & r_timer_msb_pclk_2P;
		
		case (r_display_state_1P)
			s_m_idle_streaming:
			begin
				if (r_sw_n_fe_pclk_2P)
				begin
					r_display_state_1P		<= s_m_full_sobel;
					r_display_ctrl_pclk_1P	<= c_full_sobel;
				end
			end
			
			s_m_full_sobel:
			begin
				if (r_sw_n_fe_pclk_2P)
				begin
					r_display_state_1P		<= s_m_half_sobel;
					r_display_ctrl_pclk_1P	<= c_half_sobel;
				end
			end
			
			s_m_half_sobel:
			begin
				if (r_sw_n_fe_pclk_2P)
				begin
					r_display_state_1P		<= s_m_half_posterize;
					r_display_ctrl_pclk_1P	<= c_half_posterize;
				end
			end
			
			s_m_half_posterize:
			begin
				if (r_sw_n_fe_pclk_2P)
				begin
					r_display_state_1P		<= s_a_idle_streaming;
					r_display_ctrl_pclk_1P	<= c_idle_streaming;
					r_timer_en_pclk_1P		<= 1'b1;
				end
			end
			
			s_a_idle_streaming:
			begin
				if (r_sw_n_fe_pclk_2P)
				begin
					r_display_state_1P		<= s_m_idle_streaming;
					r_display_ctrl_pclk_1P	<= c_idle_streaming;
					r_timer_en_pclk_1P		<= 1'b0;
				end
				else if (r_timer_msb_fe_pclk_2P)
				begin
					r_display_state_1P		<= s_a_full_sobel;
					r_display_ctrl_pclk_1P	<= c_full_sobel;
				end
			end
			
			s_a_full_sobel:
			begin
				if (r_sw_n_fe_pclk_2P)
				begin
					r_display_state_1P		<= s_m_idle_streaming;
					r_display_ctrl_pclk_1P	<= c_idle_streaming;
					r_timer_en_pclk_1P		<= 1'b0;
				end
				else if (r_timer_msb_fe_pclk_2P)
				begin
					r_display_state_1P		<= s_a_half_sobel;
					r_display_ctrl_pclk_1P	<= c_half_sobel;
				end
			end
			
			s_a_half_sobel:
			begin
				if (r_sw_n_fe_pclk_2P)
				begin
					r_display_state_1P		<= s_m_idle_streaming;
					r_display_ctrl_pclk_1P	<= c_idle_streaming;
					r_timer_en_pclk_1P		<= 1'b0;
				end
				else if (r_timer_msb_fe_pclk_2P)
				begin
					r_display_state_1P		<= s_a_half_posterize;
					r_display_ctrl_pclk_1P	<= c_half_posterize;
				end
			end
			
			s_a_half_posterize:
			begin
				if (r_sw_n_fe_pclk_2P)
				begin
					r_display_state_1P		<= s_m_idle_streaming;
					r_display_ctrl_pclk_1P	<= c_idle_streaming;
					r_timer_en_pclk_1P		<= 1'b0;
				end
				else if (r_timer_msb_fe_pclk_2P)
				begin
					r_display_state_1P		<= s_a_idle_streaming;
					r_display_ctrl_pclk_1P	<= c_idle_streaming;
				end
			end
		endcase
	end
end

assign	o_srst			= r_srst_osc_1P;
assign	o_pll_locked	= r_pll_locked_osc_2P;
assign	o_posterize_en	= r_display_ctrl_pclk_1P[2];
assign	o_display_sel	= r_display_ctrl_pclk_1P[1:0];

endmodule

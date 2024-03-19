module runlength_shifter
#(
	parameter	AMPLITUDE_PRECISION	= 16,
	parameter	MCU_SIZE			= 64
)
(
	input	i_arst,
	input	i_sysclk,
	input	i_we,
	input	i_eob,
	input	[3:0]i_runlength,
	input	[AMPLITUDE_PRECISION-1:0]i_B,
	output	o_ready,
	output	[5:0]o_run_cnt,
	input	i_ready,
	output	o_de,
	output	[AMPLITUDE_PRECISION-1:0]o_B
);

localparam	s_idle		= 2'b00;
localparam	s_flush		= 2'b01;
localparam	s_run_zero	= 2'b10;
localparam	s_run_eob	= 2'b11;

wire	[6:0]w_mcu_size;

reg		[1:0]r_shift_state_1P;
reg		r_ready_1P;
reg		[4:0]r_len_cnt_1P;
reg		[6:0]r_run_cnt_1P;
reg		r_de_1P;
reg		[AMPLITUDE_PRECISION-1:0]r_B_1P;

reg		r_we_hold_1P;
reg		r_eob_hold_1P;
reg		[3:0]r_runlength_hold_1P;
reg		[AMPLITUDE_PRECISION-1:0]r_B_hold_1P;

assign	w_mcu_size	= MCU_SIZE;

always@(posedge i_arst or posedge i_sysclk)
begin
	if (i_arst)
	begin
		r_shift_state_1P	<= s_idle;
		r_ready_1P			<= 1'b1;
		r_len_cnt_1P		<= {5{1'b0}};
		r_run_cnt_1P		<= {7{1'b0}};
		r_de_1P				<= 1'b0;
		r_B_1P				<= {AMPLITUDE_PRECISION{1'b0}};
		r_runlength_hold_1P	<= {4{1'b0}};
		r_B_hold_1P			<= {AMPLITUDE_PRECISION{1'b0}};
	end
	else
	begin
		case (r_shift_state_1P)
			s_idle:
			begin
				if (i_ready)
				begin
					r_ready_1P	<= 1'b1;
					r_de_1P		<= 1'b0;
					if (i_eob)
					begin
						r_shift_state_1P	<= s_run_eob;
						r_ready_1P			<= 1'b0;
						r_de_1P				<= 1'b1;
						r_B_1P				<= {AMPLITUDE_PRECISION{1'b0}};
						r_run_cnt_1P		<= r_run_cnt_1P+1'b1;
//						if ((r_run_cnt_1P == {7{1'b0}}))
//						begin
//							r_shift_state_1P	<= s_idle;
//							r_ready_1P			<= 1'b1;
//							r_run_cnt_1P		<= {7{1'b0}};
//						end
//						else if (r_run_cnt_1P == {1'b1, {6{1'b0}}})
//						else if (r_run_cnt_1P == w_mcu_size)
						if (r_run_cnt_1P == w_mcu_size)
						begin
							r_shift_state_1P	<= s_idle;
							r_ready_1P			<= 1'b1;
//							r_run_cnt_1P		<= {7{1'b0}};
							r_run_cnt_1P		<= {7{1'b0}}+1'b1;
						end
					end
					else if (i_we)
					begin
						if (i_runlength	!= 4'd0)
						begin
							r_shift_state_1P	<= s_run_zero;
							r_ready_1P			<= 1'b0;
							r_len_cnt_1P		<= i_runlength;
							r_run_cnt_1P		<= r_run_cnt_1P+1'b1;
							r_de_1P				<= 1'b1;
							r_B_1P				<= {AMPLITUDE_PRECISION{1'b0}};
							r_B_hold_1P			<= i_B;
						end
						else
						begin
							r_run_cnt_1P	<= r_run_cnt_1P+1'b1;
							r_de_1P			<= 1'b1;
							if (r_run_cnt_1P == w_mcu_size)
//								r_run_cnt_1P	<= {7{1'b0}};
								r_run_cnt_1P	<= {7{1'b0}}+1'b1;
							r_B_1P			<= i_B;
						end
					end
				end
				else
				begin
					// TODO
					if (i_we | i_eob)
					begin
						r_shift_state_1P	<= s_flush;
						r_ready_1P			<= 1'b0;
						r_we_hold_1P		<= i_we;
						r_eob_hold_1P		<= i_eob;
						r_runlength_hold_1P	<= i_runlength;
						r_B_hold_1P			<= i_B;
					end
/*					else
					begin
						r_ready_1P	<= 1'b0;
					end*/
				end
			end
			
			s_flush:
			begin
				if (i_ready)
				begin
					if (r_eob_hold_1P)
					begin
						r_shift_state_1P	<= s_run_eob;
						r_ready_1P			<= 1'b0;
						r_de_1P				<= 1'b1;
						r_B_1P				<= {AMPLITUDE_PRECISION{1'b0}};
						r_run_cnt_1P		<= r_run_cnt_1P+1'b1;
//						if (r_run_cnt_1P == {7{1'b0}})
//						begin
//							r_shift_state_1P	<= s_idle;
//							r_ready_1P			<= 1'b1;
//							r_run_cnt_1P		<= {7{1'b0}};
//						end
//						else if (r_run_cnt_1P == {1'b1, {6{1'b0}}})
//						else if (r_run_cnt_1P == w_mcu_size)
						if (r_run_cnt_1P == w_mcu_size)
						begin
							r_shift_state_1P	<= s_idle;
							r_ready_1P			<= 1'b1;
//							r_run_cnt_1P		<= {7{1'b0}};
							r_run_cnt_1P		<= {7{1'b0}}+1'b1;
						end
					end
					else if (r_we_hold_1P)
					begin
						if (r_runlength_hold_1P	!= 5'd0)
						begin
							r_shift_state_1P	<= s_run_zero;
							r_ready_1P			<= 1'b0;
							r_len_cnt_1P		<= r_runlength_hold_1P;
							r_run_cnt_1P		<= r_run_cnt_1P+1'b1;
							r_de_1P				<= 1'b1;
							r_B_1P				<= {AMPLITUDE_PRECISION{1'b0}};
							r_B_hold_1P			<= r_B_hold_1P;
						end
						else
						begin
							r_shift_state_1P	<= s_idle;
							r_ready_1P			<= 1'b1;
							r_run_cnt_1P		<= r_run_cnt_1P+1'b1;
							r_de_1P				<= 1'b1;
							if (r_run_cnt_1P == w_mcu_size)
//								r_run_cnt_1P	<= {7{1'b0}};
								r_run_cnt_1P	<= {7{1'b0}}+1'b1;
							r_B_1P				<= r_B_hold_1P;
						end
					end
				end
			end
			
			s_run_zero:
			begin
				if (i_ready)
				begin
					r_de_1P			<= 1'b1;
					r_B_1P			<= {AMPLITUDE_PRECISION{1'b0}};
					
					r_len_cnt_1P	<= r_len_cnt_1P-1'b1;
					r_run_cnt_1P	<= r_run_cnt_1P+1'b1;
					if (r_len_cnt_1P == 5'd1)
					begin
						r_shift_state_1P	<= s_idle;
						r_ready_1P			<= 1'b1;
						r_B_1P				<= r_B_hold_1P;
					end
				end
			end
			
			s_run_eob:
			begin
				if (i_ready)
				begin
					r_de_1P			<= 1'b1;
					r_B_1P			<= {AMPLITUDE_PRECISION{1'b0}};
					
					r_run_cnt_1P	<= r_run_cnt_1P+1'b1;
//					if ((r_run_cnt_1P == {7{1'b0}}))
//					begin
//						r_shift_state_1P	<= s_idle;
//						r_ready_1P			<= 1'b1;
//						r_de_1P				<= 1'b0;
////						r_run_cnt_1P		<= {7{1'b0}};
//					end
//					else if ((r_run_cnt_1P == w_mcu_size)
					if (r_run_cnt_1P == w_mcu_size)
					begin
						r_shift_state_1P	<= s_idle;
						r_ready_1P			<= 1'b1;
						r_de_1P				<= 1'b0;
						r_run_cnt_1P		<= {7{1'b0}};
//						r_run_cnt_1P		<= {7{1'b0}}+1'b1;
					end
				end
			end
			
			default:
			begin
				r_shift_state_1P	<= s_idle;
				r_ready_1P			<= 1'b1;
				r_len_cnt_1P		<= {5{1'b0}};
				r_run_cnt_1P		<= {7{1'b0}};
				r_de_1P				<= 1'b0;
				r_B_1P				<= {AMPLITUDE_PRECISION{1'b0}};
				r_runlength_hold_1P	<= {4{1'b0}};
				r_B_hold_1P			<= {AMPLITUDE_PRECISION{1'b0}};
			end
		endcase
	end
end

assign	o_ready		= r_ready_1P;
assign	o_de		= r_de_1P;
assign	o_run_cnt	= r_run_cnt_1P[5:0];
assign	o_B			= r_B_1P;

endmodule

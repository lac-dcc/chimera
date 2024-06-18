// This program was cloned from: https://github.com/Efinix-Inc/xyloni
// License: MIT License

module ov5640_config
(
	input	i_arst,
	input	i_sysclk,
	input	i_pll_locked,
	output	o_confdone,
	
	input	i_sda,
	output	o_sda_oe,
	input	i_scl,
	output	o_scl_oe
);

localparam	DEVICE_ADDRESS	= 8'h00;
localparam	ADDRESSING		= 7;
localparam	SYSCLK_FREQ		= 25;
localparam	MODE			= "FAST";
localparam	SLAVE_ENABLE	= "FALSE";

localparam	s_IDLE		= 2'b01;
localparam	s_CONFIG	= 2'b10;
localparam	s_DONE		= 2'b00;

reg		r_m_en_1P;
reg		r_m_wr_1P;
wire	[7:0]w_ov5640_reg;
reg		r_last_1P;
wire	w_ack;
wire	w_last;
wire	[7:0]w_data;

reg		[1:0]r_i2c_config_state_1P;
reg		[9:0]r_addr_1P;
reg		[1:0]r_byte_cnt_1P;
reg		[8:0]r_reg_cnt_1P;
reg		r_confdone_1P;

i2c_wrapper
#(
	.DEVICE_ADDRESS	(DEVICE_ADDRESS),
	.ADDRESSING		(ADDRESSING),
	.SYSCLK_FREQ	(SYSCLK_FREQ),
	.MODE			(MODE),
	.SLAVE_ENABLE	(SLAVE_ENABLE)
)
inst_i2c
(
	.i_arst		(i_arst),
	.i_sysclk	(i_sysclk),
	.i_m_en		(r_m_en_1P),
	.i_m_wr		(r_m_wr_1P),
	.i_last		(r_last_1P),
	.i_addr		(7'h3C),
	.i_data		(w_ov5640_reg),
//	.o_s_en		(w_s_en),
//	.o_s_wr		(w_s_wr),
	.o_ack		(w_ack),
	.o_last		(w_last),
	.o_data		(w_data),
	.i_sda		(i_sda),
	.o_sda_oe	(o_sda_oe),
	.i_scl		(i_scl),
	.o_scl_oe	(o_scl_oe)
);


ov5640_reg
inst_ov5640_reg
(
	.i_addr(r_addr_1P),
	.o_data(w_ov5640_reg)
);

always@(posedge i_arst or posedge i_sysclk)
begin
	if (i_arst)
	begin
		r_i2c_config_state_1P	<= s_IDLE;
		r_addr_1P				<= {10{1'b0}};
		r_m_en_1P				<= 1'b0;
		r_m_wr_1P				<= 1'b0;
		r_last_1P				<= 1'b0;
		
		r_byte_cnt_1P			<= {2{1'b0}};
		r_reg_cnt_1P			<= {9{1'b0}};
		
		r_confdone_1P			<= 1'b0;
	end
	else
	begin
		case (r_i2c_config_state_1P)
			s_IDLE:
			begin
				if (i_pll_locked)
				begin
					r_i2c_config_state_1P	<= s_CONFIG;
					r_addr_1P				<= {10{1'b0}};
					r_m_en_1P				<= 1'b1;
					r_m_wr_1P				<= 1'b0;
					r_last_1P				<= 1'b0;
					
					r_byte_cnt_1P			<= {2{1'b0}};
					r_reg_cnt_1P			<= {9{1'b0}};
				end
			end
			
			s_CONFIG:
			begin
				r_m_en_1P		<= 1'b1;
				r_last_1P		<= 1'b0;
				if (w_ack)
				begin
					if (r_reg_cnt_1P != 9'd305)
//					if (r_reg_cnt_1P != 9'd001)
					begin
						r_addr_1P		<= r_addr_1P+1'b1;
						r_byte_cnt_1P	<= r_byte_cnt_1P+1'b1;
						if (r_byte_cnt_1P == 2'b10)
						begin
							r_m_en_1P		<= 1'b0;
							r_last_1P		<= 1'b1;
							r_byte_cnt_1P	<= {2{1'b0}};
							r_reg_cnt_1P	<= r_reg_cnt_1P+1'b1;
						end
					end
					else
					begin
						r_i2c_config_state_1P	<= s_DONE;
						r_m_en_1P				<= 1'b0;
						r_confdone_1P			<= 1'b1;
					end
				end
			end
			
			s_DONE:
			begin
			end
			
			default:
			begin
				r_i2c_config_state_1P	<= s_IDLE;
				r_addr_1P				<= {10{1'b0}};
				r_m_en_1P				<= 1'b0;
				r_m_wr_1P				<= 1'b0;
				
				r_byte_cnt_1P			<= {2{1'b0}};
				r_reg_cnt_1P			<= {9{1'b0}};
			end
		endcase
	end
end

assign	o_confdone	= r_confdone_1P;

endmodule

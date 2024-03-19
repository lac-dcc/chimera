`timescale			1ns/1ps
`default_nettype	none


module oled_control
		#(
			parameter	WB_ADR_WIDTH  = 16,
			parameter	WB_DAT_WIDTH  = 32,
			parameter	WB_SEL_WIDTH  = (WB_DAT_WIDTH / 8),
			parameter	TUSER_WIDTH   = 1,
			parameter	TDATA_WIDTH   = 8
		)
		(
			input	wire						reset,
			input	wire						clk,
			input	wire						clk_x7,
			
			// wishbone
			input	wire						s_wb_rst_i,
			input	wire						s_wb_clk_i,
			input	wire	[WB_ADR_WIDTH-1:0]	s_wb_adr_i,
			output	wire	[WB_DAT_WIDTH-1:0]	s_wb_dat_o,
			input	wire	[WB_DAT_WIDTH-1:0]	s_wb_dat_i,
			input	wire						s_wb_we_i,
			input	wire	[WB_SEL_WIDTH-1:0]	s_wb_sel_i,
			input	wire						s_wb_stb_i,
			output	wire						s_wb_ack_o,
			
			// video input
			input	wire	[TUSER_WIDTH-1:0]	s_axi4s_tuser,
			input	wire						s_axi4s_tlast,
			input	wire	[TDATA_WIDTH-1:0]	s_axi4s_tdata,
			input	wire						s_axi4s_tvalid,
			output	wire						s_axi4s_tready,
			
			input	wire	[4:0]				gpo,
			
			output	wire	[4:1]				pmod_p,
			output	wire	[4:1]				pmod_n
		);
	
	reg					reg_oled_res_n;
	reg		[2:1]		reg_oled_bs;
	reg					reg_oled_pwr_en;
	reg					reg_oled_vin_en;
	
	always @(posedge s_wb_clk_i) begin
		if ( s_wb_rst_i ) begin
			reg_oled_res_n  <= 1'b0;
			reg_oled_bs     <= 2'b11;
			reg_oled_pwr_en <= 1'b0;
			reg_oled_vin_en <= 1'b0;
		end
		else begin
			if ( s_wb_stb_i && s_wb_we_i ) begin
				case ( s_wb_adr_i )
				0:	reg_oled_res_n  <= s_wb_dat_i;
				1:	reg_oled_bs     <= s_wb_dat_i;
				2:	reg_oled_pwr_en <= s_wb_dat_i;
				3:	reg_oled_vin_en <= s_wb_dat_i;
				endcase
			end
		end
	end
	
	wire				async_wb_ready;
	assign s_wb_dat_o = 0;
	assign s_wb_ack_o = (s_wb_stb_i & async_wb_ready);
	
	
	// async
	wire				async_cmd;
	wire	[7:0]		async_data;
	wire				async_valid;
	wire				async_ready;
	
	jelly_data_async
			#(
				.ASYNC			(1),
				.DATA_WIDTH		(1+8)
			)
		i_data_async
			(
				.s_reset		(s_wb_rst_i),
				.s_clk			(s_wb_clk_i),
				.s_data			(s_wb_dat_i[8:0]),
				.s_valid		(s_wb_stb_i && s_wb_we_i && (s_wb_adr_i == 4)),
				.s_ready		(async_wb_ready),
				
				.m_reset		(reset),
				.m_clk			(clk),
				.m_data			({async_cmd, async_data}),
				.m_valid		(async_valid),
				.m_ready		(async_ready)
			);
	
	
	// video input
	(* ASYNC_REG = "true" *)	reg		reg_vin_en_ff, reg_vin_en;
	always @(posedge clk) begin
		if ( reset ) begin
			reg_vin_en_ff <= 1'b0;
			reg_vin_en    <= 0;
		end
		else begin
			reg_vin_en_ff <= reg_oled_vin_en;
			reg_vin_en    <= reg_vin_en_ff;
		end
	end
	
	
	wire	[TUSER_WIDTH-1:0]	axi4s_vin_tuser;
	wire						axi4s_vin_tlast;
	wire	[TDATA_WIDTH-1:0]	axi4s_vin_tdata;
	wire						axi4s_vin_tvalid;
	wire						axi4s_vin_tready;
	
	jelly_video_gate_core
			#(
				.TUSER_WIDTH		(TUSER_WIDTH),
				.TDATA_WIDTH		(TDATA_WIDTH)
			)
		i_video_gate_core
			(
				.aresetn			(~reset),
				.aclk				(clk),
				.aclken				(1'b1),
				
				.enable				(reg_vin_en),
				.busy				(),
				
				.param_skip			(1'b0),
				
				.s_axi4s_tuser		(s_axi4s_tuser),
				.s_axi4s_tlast		(s_axi4s_tlast),
				.s_axi4s_tdata		(s_axi4s_tdata),
				.s_axi4s_tvalid		(s_axi4s_tvalid),
				.s_axi4s_tready		(s_axi4s_tready),
				
				.m_axi4s_tuser		(axi4s_vin_tuser),
				.m_axi4s_tlast		(axi4s_vin_tlast),
				.m_axi4s_tdata		(axi4s_vin_tdata),
				.m_axi4s_tvalid		(axi4s_vin_tvalid),
				.m_axi4s_tready		(axi4s_vin_tready)
			);
	
	
	
	// write control
	reg				reg_busy;
	reg		[3:0]	reg_count;
	reg				reg_cs_n;
	reg				reg_dc_n;
	reg				reg_wr_n;
	reg		[7:0]	reg_data;
	
	always @(posedge clk) begin
		if ( reset ) begin
			reg_busy  <= 1'b0;
			reg_count <= 0;
			reg_cs_n  <= 1'b1;
			reg_wr_n  <= 1'b1;
			reg_dc_n  <= 1'b1;
			reg_data  <= 8'h00;
		end
		else begin
			if ( !reg_busy ) begin
				reg_count <= 0;
				reg_cs_n  <= 1'b1;
				reg_wr_n  <= 1'b1;
				reg_dc_n  <= 1'b1;
				reg_data  <= 8'h00;
				if ( async_valid ) begin
					reg_busy  <= 1;
					reg_cs_n  <= 1'b0;
					reg_wr_n  <= 1'b0;
					reg_dc_n  <= ~async_cmd;
					reg_data  <= async_data;
				end
				else if ( axi4s_vin_tvalid ) begin
					reg_busy  <= 1;
					reg_cs_n  <= 1'b0;
					reg_wr_n  <= 1'b0;
					reg_dc_n  <= 1'b1;
					reg_data  <= axi4s_vin_tdata;
				end
			end
			else begin
				reg_count <= reg_count + 1;
				if ( reg_count == 7 ) begin
					reg_busy <= 1'b0;
				end
				
				case ( reg_count )
				0:			begin	reg_cs_n  = 1'b0;	reg_wr_n  = 1'b0;	end
				1:			begin	reg_cs_n  = 1'b0;	reg_wr_n  = 1'b0;	end
				2:			begin	reg_cs_n  = 1'b0;	reg_wr_n  = 1'b0;	end
				3:			begin	reg_cs_n  = 1'b0;	reg_wr_n  = 1'b1;	end
				4:			begin	reg_cs_n  = 1'b0;	reg_wr_n  = 1'b1;	end
				5:			begin	reg_cs_n  = 1'b0;	reg_wr_n  = 1'b1;	end
				6:			begin	reg_cs_n  = 1'b1;	reg_wr_n  = 1'b1;	end
				7:			begin	reg_cs_n  = 1'b1;	reg_wr_n  = 1'b1;	end
				8:			begin	reg_cs_n  = 1'b1;	reg_wr_n  = 1'b1;	end
				9:			begin	reg_cs_n  = 1'b1;	reg_wr_n  = 1'b1;	end
				10:			begin	reg_cs_n  = 1'b1;	reg_wr_n  = 1'b1;	end
				11:			begin	reg_cs_n  = 1'b1;	reg_wr_n  = 1'b1;	end
				12:			begin	reg_cs_n  = 1'b1;	reg_wr_n  = 1'b1;	end
				13:			begin	reg_cs_n  = 1'b1;	reg_wr_n  = 1'b1;	end
				14:			begin	reg_cs_n  = 1'b1;	reg_wr_n  = 1'b1;	end
				15:			begin	reg_cs_n  = 1'b1;	reg_wr_n  = 1'b1;	end
				default:	begin	reg_cs_n  = 1'b1;	reg_wr_n  = 1'b1;	end
				endcase
			end
		end
	end
	
	assign async_ready      = !reg_busy;
	assign axi4s_vin_tready = (!reg_busy && !async_valid);
	
	
	oled_control_if
		i_oled_control_if
			(
				.reset			(reset),
				.clk			(clk),
				.clk_x7			(clk_x7),
				
				.olde_bs		(reg_oled_bs),
				.olde_cs_n		(reg_cs_n),
				.olde_res_n		(reg_oled_res_n),
				.olde_dc_n		(reg_dc_n),
				.olde_wr_n		(reg_wr_n),
				.olde_e			(1'b1),
				.olde_d			(reg_data),
				
				.pwr_en			(reg_oled_pwr_en),
				.gpo			(gpo),
				
				.pmod_p			(pmod_p),
				.pmod_n			(pmod_n)
			);
	
endmodule


module oled_control_if
		(
			input	wire				reset,
			input	wire				clk,
			input	wire				clk_x7,
			
			input	wire	[2:1]		olde_bs,
			input	wire				olde_cs_n,
			input	wire				olde_res_n,
			input	wire				olde_dc_n,
			input	wire				olde_wr_n,
			input	wire				olde_e,
			input	wire	[7:0]		olde_d,
			
			input	wire				pwr_en,
			input	wire	[4:0]		gpo,
			
			output	wire	[4:1]		pmod_p,
			output	wire	[4:1]		pmod_n
		);
	
	// assign PMOD
	wire				out_clk_p;
	wire				out_clk_n;
	wire	[2:0]		out_data_p;
	wire	[2:0]		out_data_n;
	
	assign pmod_p[3] = out_clk_p;
	assign pmod_n[3] = out_clk_n;
	assign pmod_p[4] = out_data_p[0];
	assign pmod_n[4] = out_data_n[0];
	assign pmod_p[2] = out_data_p[1];
	assign pmod_n[2] = out_data_n[1];
	assign pmod_p[1] = out_data_p[2];
	assign pmod_n[1] = out_data_n[2];
	
	
	// assign SERDES
	wire	[3*7-1:0]		serdes_data;
	assign serdes_data[4:0] = gpo;
	assign serdes_data[5]   = pwr_en;
	assign serdes_data[6]   = olde_d[7];
	assign serdes_data[7]   = olde_d[6];
	assign serdes_data[8]   = olde_d[5];
	assign serdes_data[9]   = olde_d[4];
	assign serdes_data[10]  = olde_d[3];
	assign serdes_data[11]  = olde_d[2];
	assign serdes_data[12]  = olde_d[1];
	assign serdes_data[13]  = olde_d[0];
	assign serdes_data[14]  = olde_e;
	assign serdes_data[15]  = olde_wr_n;
	assign serdes_data[16]  = olde_dc_n;
	assign serdes_data[17]  = olde_bs[1];
	assign serdes_data[18]  = olde_bs[2];
	assign serdes_data[19]  = olde_cs_n;
	assign serdes_data[20]  = olde_res_n;
	
	serdes_output_to_fin1216
		i_serdes_output_to_fin1216
			(
				.reset			(reset),
				.clk			(clk),
				.clk_x7			(clk_x7),
				
				.in_data		(~serdes_data),
				
				.out_clk_p		(out_clk_p),
				.out_clk_n		(out_clk_n),
				.out_data_p		(out_data_p),
				.out_data_n		(out_data_n)
			);
endmodule


/*
module serdes_output_to_fin1216
		#(
			parameter	N = 3
		)
		(
			input	wire				reset,
			input	wire				clk,
			input	wire				clk_x7,
			
			input	wire	[N*7-1:0]	in_data,
			
			output	wire				out_clk_p,
			output	wire				out_clk_n,
			output	wire	[N-1:0]		out_data_p,
			output	wire	[N-1:0]		out_data_n
		);
	
	genvar		i;
	
	wire	[N-1:0]		serdes_data;
	
	generate
	for ( i = 0; i < N; i = i+1 ) begin : loop_data
		OSERDESE2
				#(
					.DATA_RATE_OQ	("SDR"),
					.DATA_RATE_TQ	("SDR"),
					.DATA_WIDTH 	(7),
					.TRISTATE_WIDTH (1),
					.SERDES_MODE	("MASTER")
				)
			i_oserdese2_master
				(
					.D1 			(in_data[i*7+6]),
					.D2 			(in_data[i*7+5]),
					.D3 			(in_data[i*7+4]),
					.D4 			(in_data[i*7+3]),
					.D5 			(in_data[i*7+2]),
					.D6 			(in_data[i*7+1]),
					.D7 			(in_data[i*7+0]),
					.D8 			(1'b0),
					.T1 			(1'b0),
					.T2 			(1'b0),
					.T3 			(1'b0),
					.T4 			(1'b0),
					.SHIFTIN1		(1'b0),
					.SHIFTIN2		(1'b0),
					.SHIFTOUT1		(),
					.SHIFTOUT2		(),
					.OCE			(1'b1),
					.CLK			(clk_x7),
					.CLKDIV 		(clk),
					.OQ 			(serdes_data[i]),
					.TQ 			(),
					.OFB			(),
					.TFB			(),
					.TBYTEIN		(1'b0),
					.TBYTEOUT		(),
					.TCE			(1'b0),
					.RST			(reset)
				);
			
		OBUFDS
			i_obufds
				(
					.I			(serdes_data[i]),
					.O			(out_data_p[i]),
					.OB 		(out_data_n[i])
				);
	end
	endgenerate
	
	
	
	// clock
//	wire	[13:0]	clk_format = ~14'b1110000_0011111;
	wire	[13:0]	clk_format = ~14'b1111000_0001111;
	
	wire			serdes_clk;
	
	wire			ocascade_sm_d;
	wire			ocascade_sm_t;
	OSERDESE2
			#(
				.DATA_RATE_OQ	("DDR"),
				.DATA_RATE_TQ	("SDR"),
				.DATA_WIDTH 	(14),
				.TRISTATE_WIDTH (1),
				.SERDES_MODE	("MASTER")
			)
		i_oserdese2_clk_master
			(
				.D1 			(clk_format[13]),
				.D2 			(clk_format[12]),
				.D3 			(clk_format[11]),
				.D4 			(clk_format[10]),
				.D5 			(clk_format[9]),
				.D6 			(clk_format[8]),
				.D7 			(clk_format[7]),
				.D8 			(clk_format[6]),
				
				.T1 			(1'b0),
				.T2 			(1'b0),
				.T3 			(1'b0),
				.T4 			(1'b0),
				.SHIFTIN1		(ocascade_sm_d),
				.SHIFTIN2		(ocascade_sm_t),
				.SHIFTOUT1		(),
				.SHIFTOUT2		(),
				.OCE			(1'b1),
				.CLK			(clk_x7),
				.CLKDIV 		(clk),
				.OQ 			(serdes_clk),
				.TQ 			(),
				.OFB			(),
				.TFB			(),
				.TBYTEIN		(1'b0),
				.TBYTEOUT		(),
				.TCE			(1'b0),
				.RST			(reset)
			);
	
	OSERDESE2
			#(
				.DATA_RATE_OQ	("DDR"),
				.DATA_RATE_TQ	("SDR"),
				.DATA_WIDTH		(14),
				.TRISTATE_WIDTH	(1),
				.SERDES_MODE	("SLAVE")
			)
	   i_oserdese2_clk_slave
			(
				.D1				(1'b0),
				.D2				(1'b0),
				
				.D3				(clk_format[5]),
				.D4				(clk_format[4]),
				.D5				(clk_format[3]),
				.D6				(clk_format[2]),
				.D7				(clk_format[1]),
				.D8				(clk_format[0]),
				
				.T1				(1'b0),
				.T2				(1'b0),
				.T3				(1'b0),
				.T4				(1'b0),
				.SHIFTOUT1		(ocascade_sm_d),
				.SHIFTOUT2		(ocascade_sm_t),
				.SHIFTIN1		(1'b0),
				.SHIFTIN2		(1'b0),
				.OCE			(1'b1),
				.CLK			(clk_x7),
				.CLKDIV 		(clk),
				.OQ 			(),
				.TQ 			(),
				.OFB			(),
				.TFB			(),
				.TBYTEIN		(1'b0),
				.TBYTEOUT		(),
				.TCE			(1'b0),
				.RST			(reset)
			);
	
	OBUFDS
		i_obufds_clk
			(
				.I			(serdes_clk),
				.O			(out_clk_p),
				.OB 		(out_clk_n)
			);

endmodule
*/


`default_nettype	wire


// end of file

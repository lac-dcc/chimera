// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the soft-core processor system
//   math
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module video_oled_cnv
		#(
			parameter	TUSER_WIDTH = 1
		)
		(
			input	wire						aresetn,
			input	wire						aclk,
			input	wire						aclken,
			
			input	wire	[TUSER_WIDTH-1:0]	s_axi4s_tuser,
			input	wire						s_axi4s_tlast,
			input	wire	[23:0]				s_axi4s_tdata,
			input	wire						s_axi4s_tvalid,
			output	wire						s_axi4s_tready,
			
			output	wire	[TUSER_WIDTH-1:0]	m_axi4s_tuser,
			output	wire						m_axi4s_tlast,
			output	wire	[7:0]				m_axi4s_tdata,
			output	wire						m_axi4s_tvalid,
			input	wire						m_axi4s_tready
		);
	
	
	reg		[2:0]				reg_count;
	always @(posedge aclk) begin
		if ( ~aresetn ) begin
			reg_count <= 0;
		end
		else if ( aclken ) begin
			if ( s_axi4s_tuser[0] && s_axi4s_tvalid && s_axi4s_tready ) begin
				reg_count <= reg_count + 1;
			end
		end
	end
	
	reg		[6:0]				sig_add;
	always @* begin
		case (reg_count)
		3'h0:	sig_add = 7'h00;
		3'h1:	sig_add = 7'h77;
		3'h6:	sig_add = 7'h33;
		3'h7:	sig_add = 7'h44;
		3'h2:	sig_add = 7'h11;
		3'h3:	sig_add = 7'h66;
		3'h4:	sig_add = 7'h22;
		3'h5:	sig_add = 7'h55;
		endcase
	end
	
	reg		[TUSER_WIDTH-1:0]	st0_tuser;
	reg							st0_tlast;
	reg		[23:0]				st0_tdata;
	reg							st0_tvalid;
	
	reg		[TUSER_WIDTH-1:0]	st1_tuser;
	reg							st1_tlast;
	reg		[23:0]				st1_tdata;
	reg							st1_tvalid;
	
	always @(posedge aclk) begin
		if ( aclken && m_axi4s_tready ) begin
			st0_tuser        <= s_axi4s_tuser;
			st0_tlast        <= s_axi4s_tlast;
			st0_tdata        <= s_axi4s_tdata;
			
			st1_tuser        <= st0_tuser;
			st1_tlast        <= st0_tlast;
			st1_tdata[7:0]   <= (st0_tdata[7:0]   >> 1) + sig_add;
			st1_tdata[15:8]  <= (st0_tdata[15:8]  >> 1) + sig_add;
			st1_tdata[23:16] <= (st0_tdata[23:16] >> 1) + sig_add;
		end
	end
	
	always @(posedge aclk) begin
		if ( ~aresetn ) begin
			st0_tvalid <= 1'b0;
			st1_tvalid <= 1'b0;
		end
		else if ( aclken && m_axi4s_tready ) begin
			st0_tvalid <= s_axi4s_tvalid;
			st1_tvalid <= st0_tvalid;
		end
	end
	
	assign s_axi4s_tready   = m_axi4s_tready;
	
	assign m_axi4s_tuser    = st1_tuser;
	assign m_axi4s_tlast    = st1_tlast;
	assign m_axi4s_tdata[0] = st1_tdata[7];		// B3
	assign m_axi4s_tdata[1] = st1_tdata[7];		// B4
	assign m_axi4s_tdata[2] = st1_tdata[15];	// G3
	assign m_axi4s_tdata[3] = st1_tdata[15];	// G4
	assign m_axi4s_tdata[4] = st1_tdata[15];	// G5
	assign m_axi4s_tdata[5] = st1_tdata[23];	// R3
	assign m_axi4s_tdata[6] = st1_tdata[23];	// R4
	assign m_axi4s_tdata[7] = st1_tdata[23];	// R5
	assign m_axi4s_tvalid   = st1_tvalid;
	
	
endmodule


`default_nettype wire


// end of file

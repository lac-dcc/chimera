`timescale 1ns / 1ps

`define ETH_TYPE_IPV4	16'h0008
`define IPPROT_UDP		8'h11
`define CONTROL_PORT    16'hf2f1

module pkt_filter #(
	parameter C_S_AXIS_DATA_WIDTH = 256,
	parameter C_S_AXIS_TUSER_WIDTH = 128
)
(
	input				clk,
	input				aresetn,

	// input Slave AXI Stream
	input [C_S_AXIS_DATA_WIDTH-1:0]			s_axis_tdata,
	input [((C_S_AXIS_DATA_WIDTH/8))-1:0]	s_axis_tkeep,
	input [C_S_AXIS_TUSER_WIDTH-1:0]		s_axis_tuser,
	input									s_axis_tvalid,
	output									s_axis_tready,
	input									s_axis_tlast,

	// output Master AXI Stream
	output reg [C_S_AXIS_DATA_WIDTH-1:0]		m_axis_tdata,
	output reg [((C_S_AXIS_DATA_WIDTH/8))-1:0]	m_axis_tkeep,
	output reg [C_S_AXIS_TUSER_WIDTH-1:0]		m_axis_tuser,
	output reg									m_axis_tvalid,
	input										m_axis_tready,
	output reg									m_axis_tlast,

	//TODO a back-pressure is needed?
	output reg [C_S_AXIS_DATA_WIDTH-1:0]		ctrl_m_axis_tdata,
	output reg [((C_S_AXIS_DATA_WIDTH/8))-1:0]	ctrl_m_axis_tkeep,
	output reg [C_S_AXIS_TUSER_WIDTH-1:0]		ctrl_m_axis_tuser,
	output reg									ctrl_m_axis_tvalid,
	output reg									ctrl_m_axis_tlast

);

localparam WAIT_FIRST_PKT	= 0,
		   WAIT_SECOND_PKT	= 1,
		   FLUSH_DATA		= 2,
		   FLUSH_CTL		= 3,
		   DROP_PKT			= 4;


reg [C_S_AXIS_DATA_WIDTH-1:0]			s_axis_tdata_d1;
reg [((C_S_AXIS_DATA_WIDTH/8))-1:0]		s_axis_tkeep_d1;
reg [C_S_AXIS_TUSER_WIDTH-1:0]			s_axis_tuser_d1;
reg										s_axis_tvalid_d1;
reg 									s_axis_tlast_d1;

reg [C_S_AXIS_DATA_WIDTH-1:0]			r_tdata;
reg [((C_S_AXIS_DATA_WIDTH/8))-1:0]		r_tkeep;
reg [C_S_AXIS_TUSER_WIDTH-1:0]			r_tuser;
reg										r_tlast;
reg										r_tvalid;

reg [C_S_AXIS_DATA_WIDTH-1:0]			r_1st_tdata;
reg [((C_S_AXIS_DATA_WIDTH/8))-1:0]		r_1st_tkeep;
reg [C_S_AXIS_TUSER_WIDTH-1:0]			r_1st_tuser;
reg										r_1st_tlast;
reg										r_1st_tvalid;

reg [C_S_AXIS_DATA_WIDTH-1:0]			r_1st_tdata_next;
reg [((C_S_AXIS_DATA_WIDTH/8))-1:0]		r_1st_tkeep_next;
reg [C_S_AXIS_TUSER_WIDTH-1:0]			r_1st_tuser_next;
reg										r_1st_tlast_next;
reg										r_1st_tvalid_next;

reg [3:0] state, state_next;

// 1 for control, 0 for data;
reg								c_switch;
wire 							w_c_switch;

assign w_c_switch = c_switch;

//
assign s_axis_tready = m_axis_tready;

wire [15:0] udp_port;
assign udp_port = s_axis_tdata[64+:16];


always @(*) begin

	c_switch = 0;

	state_next = state;

	r_tdata = 0;
	r_tkeep = 0;
	r_tuser = 0;
	r_tlast = 0;
	r_tvalid = 0;

	r_1st_tdata_next = r_1st_tdata;
	r_1st_tkeep_next = r_1st_tkeep;
	r_1st_tuser_next = r_1st_tuser;
	r_1st_tlast_next = r_1st_tlast;
	r_1st_tvalid_next = r_1st_tvalid;

	case (state) 
		WAIT_FIRST_PKT: begin
			// 1st packet
			if (s_axis_tvalid && m_axis_tready) begin
				r_1st_tdata_next = s_axis_tdata;
				r_1st_tuser_next = s_axis_tuser;
				r_1st_tkeep_next = s_axis_tkeep;
				r_1st_tlast_next = s_axis_tlast;
				r_1st_tvalid_next = s_axis_tvalid;
				if ((s_axis_tdata[143:128]==`ETH_TYPE_IPV4) && 
					(s_axis_tdata[223:216]==`IPPROT_UDP)) begin
					state_next = WAIT_SECOND_PKT;
				end
				else begin
					state_next = DROP_PKT;
				end
			end
		end
		WAIT_SECOND_PKT: begin
			// 2nd packet
			if (s_axis_tvalid && m_axis_tready) begin
				r_tdata = r_1st_tdata;
				r_tkeep = r_1st_tkeep;
				r_tuser = r_1st_tuser;
				r_tlast = r_1st_tlast;
				r_tvalid = r_1st_tvalid;
				
				if (s_axis_tdata[64+:16]==`CONTROL_PORT) begin
					c_switch = 1;
					state_next = FLUSH_CTL;
				end
				else begin
					state_next = FLUSH_DATA;
				end
			end
		end
		FLUSH_DATA: begin
			if (s_axis_tvalid_d1 && m_axis_tready) begin
				r_tdata = s_axis_tdata_d1;
				r_tkeep = s_axis_tkeep_d1;
				r_tuser = s_axis_tuser_d1;
				r_tlast = s_axis_tlast_d1;
				r_tvalid = s_axis_tvalid_d1;
				if (s_axis_tvalid_d1 && s_axis_tlast_d1) begin
					state_next = WAIT_FIRST_PKT;
				end
			end
		end
		FLUSH_CTL: begin
			if (s_axis_tvalid_d1 && m_axis_tready) begin
				c_switch = 1;

				r_tdata = s_axis_tdata_d1;
				r_tkeep = s_axis_tkeep_d1;
				r_tuser = s_axis_tuser_d1;
				r_tlast = s_axis_tlast_d1;
				r_tvalid = s_axis_tvalid_d1;
				if (s_axis_tvalid_d1 && s_axis_tlast_d1) begin
					state_next = WAIT_FIRST_PKT;
				end
			end
		end
		DROP_PKT: begin
			//
			r_tvalid = 0;
			if (s_axis_tvalid_d1 && s_axis_tlast_d1) begin
				state_next = WAIT_FIRST_PKT;
			end
		end
	endcase
end

always @(posedge clk or negedge aresetn) begin
	if (~aresetn) begin
		state <= WAIT_FIRST_PKT;

		m_axis_tdata <= 0;
		m_axis_tkeep <= 0;
		m_axis_tuser <= 0;
		m_axis_tlast <= 0;
		m_axis_tvalid <= 0;

		// control
		ctrl_m_axis_tdata <= 0;
		ctrl_m_axis_tkeep <= 0;
		ctrl_m_axis_tuser <= 0;
		ctrl_m_axis_tlast <= 0;
		ctrl_m_axis_tvalid <= 0;

	end
	else begin
		state <= state_next;

		if (!w_c_switch) begin
			m_axis_tdata <= r_tdata;
			m_axis_tkeep <= r_tkeep;
			m_axis_tuser <= r_tuser;
			m_axis_tlast <= r_tlast;
			m_axis_tvalid <= r_tvalid;
			// reset control path output 
			ctrl_m_axis_tdata <= 0;
			ctrl_m_axis_tkeep <= 0;
			ctrl_m_axis_tuser <= 0;
			ctrl_m_axis_tlast <= 0;
			ctrl_m_axis_tvalid <= 0;
		end
		else begin
			m_axis_tdata <= 0;
			m_axis_tkeep <= 0;
			m_axis_tuser <= 0;
			m_axis_tlast <= 0;
			m_axis_tvalid <= 0;
			// 
			ctrl_m_axis_tdata <= r_tdata;
			ctrl_m_axis_tkeep <= r_tkeep;
			ctrl_m_axis_tuser <= r_tuser;
			ctrl_m_axis_tlast <= r_tlast;
			ctrl_m_axis_tvalid <= r_tvalid;
		end
	end
end

always @(posedge clk) begin
	if (~aresetn) begin
		s_axis_tdata_d1 <= 0;
		s_axis_tkeep_d1 <= 0;
		s_axis_tuser_d1 <= 0;
		s_axis_tlast_d1 <= 0;
		s_axis_tvalid_d1 <= 0;
		//
		r_1st_tdata <= 0;
		r_1st_tkeep <= 0;
		r_1st_tuser <= 0;
		r_1st_tlast <= 0;
		r_1st_tvalid <= 0;
	end
	else begin
		s_axis_tdata_d1 <= s_axis_tdata;
		s_axis_tkeep_d1 <= s_axis_tkeep;
		s_axis_tuser_d1 <= s_axis_tuser;
		s_axis_tlast_d1 <= s_axis_tlast;
		s_axis_tvalid_d1 <= s_axis_tvalid;
		// 
		r_1st_tdata <= r_1st_tdata_next;
		r_1st_tkeep <= r_1st_tkeep_next;
		r_1st_tuser <= r_1st_tuser_next;
		r_1st_tlast <= r_1st_tlast_next;
		r_1st_tvalid <= r_1st_tvalid_next;
	end
end

endmodule

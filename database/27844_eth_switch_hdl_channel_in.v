// This program was cloned from: https://github.com/mcjtag/eth_switch
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Dmitry Matyunin (https://github.com/mcjtag)
// 
// Create Date: 31.07.2020 22:15:03
// Design Name: 
// Module Name: channel_in
// Project Name: eth_switch
// Target Devices:
// Tool Versions:
// Description: Input channel
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// License: MIT
//  Copyright (c) 2020 Dmitry Matyunin
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
// 
//////////////////////////////////////////////////////////////////////////////////

(* KEEP_HIERARCHY = "YES" *)
module channel_in #(
	parameter PORT_ADDR = 0,
	parameter PORT_HIGH = 3,
	parameter ETHERNET_MTU = 1500,
	parameter FLOODING_ENABLE = 1,
	parameter CRC_CHECK = 0,
	parameter PORT_WIDTH = $clog2(PORT_HIGH+1)
)
(
	input wire aclk,
	input wire aresetn,
	// Income frames
	input wire [7:0]s_axis_tdata,
	input wire s_axis_tvalid,
	output wire s_axis_tready,
	input wire s_axis_tlast,
	// Outcome frames
	output wire [7:0]m_axis_tdata,
	output wire [PORT_WIDTH-1:0]m_axis_tdest,
	output wire m_axis_tvalid,
	input wire m_axis_tready,
	output wire m_axis_tlast,
	// Table read request
	output wire [95:0]m_axis_table_request_tdata,
	output wire [PORT_WIDTH-1:0]m_axis_table_request_tuser,
	output wire m_axis_table_request_tvalid,
	input wire m_axis_table_request_tready,
	// Table read response
	input wire [3:0]s_axis_table_response_tdata,
	input wire [PORT_WIDTH*2-1:0]s_axis_table_response_tuser,
	input wire s_axis_table_response_tvalid,
	// Status: {frames, dropped, error_crc, error_len}
	output wire [127:0]m_axis_status_tdata,
	output wire m_axis_status_tvalid
);

localparam FRAME_HDR_SIZE = 14;
localparam FRAME_FCS_SIZE = 4;
localparam FRAME_SIZE_MIN = 64;
localparam FRAME_SIZE_MAX = ETHERNET_MTU + (FRAME_HDR_SIZE + FRAME_FCS_SIZE); // usually 1518

localparam [47:0]MAC_BROADCAST = 48'hFFFFFFFFFFFF;

localparam MAC_DST_THRE = 6;
localparam MAC_SRC_THRE = 12;

localparam [3:0]
	STATE_STARTUP = 0,
	STATE_IDLE = 1,
	STATE_INCOME = 2,
	STATE_CHECK = 3,
	STATE_ADDR_REQUEST = 4,
	STATE_ADDR_RESPONSE = 5,
	STATE_DROP = 6,
	STATE_OUTCOME = 7,
	STATE_BROADCAST = 8, 	// +FLOODING
	STATE_FLUSHING = 9;

localparam [1:0]
	MUX_NONE = 2'b00,
	MUX_EXT = 2'b01,
	MUX_LOOP = 2'b10,
	MUX_FLUSH = 2'b11;

localparam [1:0]
	DEMUX_NONE = 2'b00,
	DEMUX_EXT = 2'b01,
	DEMUX_LOOP = 2'b10,
	DEMUX_BROAD = 2'b11;

localparam [3:0]
	FLOW_FORBIDDEN = {DEMUX_NONE,MUX_NONE},
	FLOW_FLUSH = {DEMUX_NONE,MUX_FLUSH},
	FLOW_INCOMING = {DEMUX_NONE,MUX_EXT},
	FLOW_LOOPBACK = {DEMUX_BROAD,MUX_LOOP},
	FLOW_OUTCOMING = {DEMUX_EXT,MUX_NONE},
	FLOW_THROUGH = {DEMUX_EXT,MUX_EXT};

localparam [3:0]
	TABLE_STATUS_OK = 0,
	TABLE_STATUS_NOTINTABLE = 1,
	TABLE_STATUS_ERROR = 2;

/* Validation */
wire income_valid;
wire income_last;
wire outcome_valid;
wire outcome_last;

/* State machine */
reg [3:0]state;
reg state_new;
reg [15:0]byte_counter;
reg [3:0]flow;
reg [15:0]frame_len;

/* State tasks */
task set_state;
	input [3:0]state_next;
	begin
		state <= state_next;
		state_new <= 1'b1;
		flow <= FLOW_FORBIDDEN;
	end 
endtask

task clr_state;
	begin
		state_new <= 1'b0;
	end 
endtask

task set_flow;
	input [3:0]flow_next;
	begin
		flow <= flow_next;
	end 
endtask

/* MAC addresses */
reg [47:0]mac_tmp;
reg [47:0]mac_dst;
reg [47:0]mac_src;

/* Port destination */
reg [PORT_WIDTH-1:0]port_dst;

/* Status counters */
reg status_valid;
reg [31:0]status_frames;
reg [31:0]status_dropped;
reg [31:0]status_error_crc;
reg [31:0]status_error_len;

/* Status tasks */
task frames_inc; begin
	status_frames <= status_frames + 1;
end endtask

task dropped_inc; begin
	status_dropped <= status_dropped + 1;
end endtask

task error_crc_inc; begin
	status_error_crc <= status_error_crc + 1;
end endtask

task error_len_inc; begin
	status_error_len <= status_error_len + 1;
end endtask

/* MUX */
wire [7:0]mux_m_data;
wire mux_m_valid;
wire mux_m_ready;
wire mux_m_last;
wire [1:0]mux_select;

/* FIFO */
wire [7:0]fifo_data;
wire fifo_valid;
wire fifo_ready;
wire fifo_last;
reg fifo_rst;
reg [2:0]fifo_rcnt;

/* DEMUX */
wire [7:0]demux_m1_data;
wire demux_m1_valid;
wire demux_m1_ready;
wire demux_m1_last;
wire [1:0]demux_select;

/* FCS */
reg fcs_rst;
wire fcs_magic;
reg crc_valid;

/* Address resolve */
reg request_valid;
wire request_done;
wire response_valid;
wire [3:0]response_status;
wire [PORT_WIDTH-1:0]response_port_dst;
wire [PORT_WIDTH-1:0]response_port_src;

wire [7:0]m_axis_out_tdata;
wire [PORT_WIDTH-1:0]m_axis_out_tdest;
wire m_axis_out_tvalid;
wire m_axis_out_tready;
wire m_axis_out_tlast;

assign mux_select = flow[1:0];
assign demux_select = flow[3:2];

assign income_valid = s_axis_tvalid & s_axis_tready;
assign income_last = s_axis_tvalid & s_axis_tready & s_axis_tlast;
assign outcome_valid = m_axis_out_tvalid & m_axis_out_tready;
assign outcome_last = m_axis_out_tvalid & m_axis_out_tready & m_axis_out_tlast;

assign m_axis_out_tdest = port_dst;

assign m_axis_table_request_tdata = {mac_src,mac_dst};
assign m_axis_table_request_tuser = PORT_ADDR;
assign m_axis_table_request_tvalid = request_valid;

assign request_done = m_axis_table_request_tvalid & m_axis_table_request_tready;
assign response_valid = s_axis_table_response_tvalid;
assign response_status = s_axis_table_response_tdata[3:0];
assign response_port_dst = s_axis_table_response_tuser[PORT_WIDTH*1-1-:PORT_WIDTH];
assign response_port_src = s_axis_table_response_tuser[PORT_WIDTH*2-1-:PORT_WIDTH];

assign m_axis_status_tdata = {status_frames,status_dropped,status_error_crc,status_error_len};
assign m_axis_status_tvalid = status_valid;

/* Byte counter */
always @(posedge aclk) begin
	if (aresetn == 1'b0) begin
		byte_counter <= 0;
		frame_len <= 0;
	end else begin
		if (income_last == 1'b1) begin
			byte_counter <= 0;
			frame_len <= byte_counter + 1;
		end else begin
			if (income_valid == 1'b1) begin
				byte_counter <= byte_counter + 1;
			end
		end
	end
end

/* MAC Receiver */
always @(posedge aclk) begin
	if (aresetn == 1'b0) begin
		mac_tmp <= 0;
		mac_dst <= 0;
		mac_src <= 0;
	end else begin
		if (income_valid == 1'b1) begin
		    mac_tmp <= {mac_tmp[39:0],s_axis_tdata};
			case (byte_counter)
			MAC_DST_THRE: mac_dst <= mac_tmp;
			MAC_SRC_THRE: mac_src <= mac_tmp;
			default: begin
				mac_dst <= mac_dst;
				mac_src <= mac_src;
			end
			endcase
		end
	end
end

/* FCS Control */
always @(posedge aclk) begin
	if (aresetn == 1'b0) begin
		fcs_rst <= 1'b0;
		crc_valid <= 1'b0;
	end else begin
		if (fcs_rst == 1'b0) begin
			if (income_last == 1'b1)
				fcs_rst <= 1'b1;
		end else begin
			fcs_rst <= 1'b0;
			crc_valid <= fcs_magic;
		end
	end
end

/* Flow Control State Machine (FCSM) */
always @(posedge aclk) begin
	if (aresetn == 1'b0) begin
		set_state(STATE_STARTUP);
		request_valid <= 1'b0;
		port_dst <= 0;
		status_valid <= 1'b0;
		status_frames <= 0;
		status_dropped <= 0;
		status_error_crc <= 0;
		status_error_len <= 0;
		fifo_rst <= 1'b0;
		fifo_rcnt <= 0;
	end else begin
		case (state)
		STATE_STARTUP: begin
			status_valid <= 1'b1;
			set_state(STATE_IDLE);
		end
		STATE_IDLE: begin
			set_state(STATE_INCOME);
		end
		STATE_INCOME: begin
			if (state_new) begin
				set_flow(FLOW_INCOMING);
				clr_state();
			end else begin
				if (income_last) begin
					set_state(STATE_CHECK);
				end else begin
					if (byte_counter > FRAME_SIZE_MAX) begin
						set_state(STATE_FLUSHING);
						error_len_inc();
					end
				end
			end
		end
		STATE_CHECK: begin
			if (state_new) begin
				clr_state();
			end else begin
				if (frame_len < FRAME_SIZE_MIN) begin
					set_state(STATE_DROP);
					error_len_inc();
				end else if (frame_len > FRAME_SIZE_MAX) begin
					set_state(STATE_DROP);
					error_len_inc();
				end else begin
					if (crc_valid == 1'b1) begin
						frames_inc();
						if (mac_dst == MAC_BROADCAST) begin
							set_state(STATE_BROADCAST);
						end else begin
							set_state(STATE_ADDR_REQUEST);
						end
					end else begin
						set_state(STATE_DROP);
						error_crc_inc();
					end
				end
			end
		end
		STATE_ADDR_REQUEST: begin
			if (state_new) begin
				clr_state();
			end else begin
				if (request_done == 1'b1) begin
					request_valid <= 1'b0;
					set_state(STATE_ADDR_RESPONSE);
				end else begin
					request_valid <= 1'b1;
				end
			end
		end
		STATE_ADDR_RESPONSE: begin
			if (state_new) begin
				clr_state();
			end else begin
				if (response_valid == 1'b1) begin
					if (response_port_src == PORT_ADDR) begin
						case (response_status)
						TABLE_STATUS_OK: begin
							if (response_port_dst == PORT_ADDR) begin
								set_state(STATE_DROP);
							end else begin
								port_dst <= response_port_dst;
								set_state(STATE_OUTCOME);
							end
						end
						TABLE_STATUS_NOTINTABLE: begin
							if (FLOODING_ENABLE) begin
								set_state(STATE_BROADCAST);
							end else begin
							 	set_state(STATE_DROP);
							end
						end
						TABLE_STATUS_ERROR: begin
							set_state(STATE_DROP);
						end
						endcase
					end
				end
			end
		end
		STATE_DROP: begin
			if (state_new) begin
				clr_state();
				dropped_inc();
			end else begin
				if (fifo_rcnt == 3'b111) begin
					fifo_rcnt <= 0;
					fifo_rst <= 1'b0;
					set_state(STATE_IDLE);
				end else begin
					fifo_rst <= 1'b1;
					fifo_rcnt <= fifo_rcnt + 1;
				end
			end
		end
		STATE_FLUSHING: begin
			if (state_new) begin
				clr_state();
				set_flow(FLOW_FLUSH);
				dropped_inc();
			end else begin
				if (income_last) begin
					set_state(STATE_IDLE);
				end
			end
		end
		STATE_BROADCAST: begin
			if (state_new) begin
				if (PORT_ADDR) begin
					port_dst <= 0;
				end else begin
					port_dst <= 1;
				end
				set_flow(FLOW_LOOPBACK);
				clr_state();
			end else begin
				if (outcome_last == 1'b1) begin
					if ((port_dst + 1) == PORT_ADDR) begin
						port_dst <= port_dst + 2;
					end else begin
						port_dst <= port_dst + 1;
					end
				
					if (PORT_ADDR == PORT_HIGH) begin
						if ((port_dst + 1) == (PORT_HIGH - 1)) begin
							set_state(STATE_OUTCOME);
						end
					end else begin
						if ((port_dst + 1) == PORT_ADDR) begin
							if ((port_dst + 2) == PORT_HIGH) begin
								set_state(STATE_OUTCOME);
							end
						end else begin
							if ((port_dst + 1) == PORT_HIGH) begin
								set_state(STATE_OUTCOME);
							end
						end
					end
				end
 			end
		end
		STATE_OUTCOME: begin
			if (state_new) begin
				clr_state();
				set_flow(FLOW_THROUGH);
			end else begin
				case ({income_last,outcome_last})
					2'b01: begin
						if (flow == FLOW_OUTCOMING) begin
							set_state(STATE_CHECK);
						end else begin
							set_state(STATE_INCOME);
						end
					end
					2'b10: begin
						set_flow(FLOW_OUTCOMING);
					end
					2'b11: begin
						set_state(STATE_CHECK);
					end
					default: ;
				endcase
			end
		end
		endcase
	end
end

generate if (CRC_CHECK) begin
	frame_fcs #(
		.DATA_WIDTH(8),
		.OUTPUT_REG(1),
		.REFIN(1),
		.REFOUT(1),
		.XOROUT(1)
	) frame_fcs_inst (
		.clk(aclk),
		.rst(~aresetn | fcs_rst),
		.enable(income_valid),
		.data(s_axis_tdata),
		.fcs(),
		.magic(fcs_magic)
	);
end else begin
	assign fcs_magic = 1'b1;
end endgenerate

axis_mux2 #(
	.DATA_WIDTH(8)
) axis_mux2_inst (
	.aresetn(aresetn),
	.s0_axis_tdata(s_axis_tdata),
	.s0_axis_tvalid(s_axis_tvalid),
	.s0_axis_tready(s_axis_tready),
	.s0_axis_tlast(s_axis_tlast),
	.s1_axis_tdata(demux_m1_data),
	.s1_axis_tvalid(demux_m1_valid),
	.s1_axis_tready(demux_m1_ready),
	.s1_axis_tlast(demux_m1_last),
	.m_axis_tdata(mux_m_data),
	.m_axis_tvalid(mux_m_valid),
	.m_axis_tready(mux_m_ready),
	.m_axis_tlast(mux_m_last),
	.select(mux_select)
);

frame_fifo #(
	.PACKET_MODE(1),
	.PACKET_MAXNUM(2),
	.DATA_WIDTH(8),
	.FIFO_DEPTH(2048),
	.RAM_STYLE("block")
) frame_fifo_in_inst (
	.aclk(aclk),
	.aresetn(aresetn & ~fifo_rst),
	.s_axis_tdata(mux_m_data),
	.s_axis_tvalid(mux_m_valid),
	.s_axis_tready(mux_m_ready),
	.s_axis_tlast(mux_m_last),
	.m_axis_tdata(fifo_data),
	.m_axis_tvalid(fifo_valid),
	.m_axis_tready(fifo_ready),
	.m_axis_tlast(fifo_last)
);

axis_demux2 #(
	.DATA_WIDTH(8)
) axis_demux2_inst (
	.aresetn(aresetn),
	.s_axis_tdata(fifo_data),
	.s_axis_tvalid(fifo_valid),
	.s_axis_tready(fifo_ready),
	.s_axis_tlast(fifo_last),
	.m0_axis_tdata(m_axis_out_tdata),
	.m0_axis_tvalid(m_axis_out_tvalid),
	.m0_axis_tready(m_axis_out_tready),
	.m0_axis_tlast(m_axis_out_tlast),
	.m1_axis_tdata(demux_m1_data),
	.m1_axis_tvalid(demux_m1_valid),
	.m1_axis_tready(demux_m1_ready),
	.m1_axis_tlast(demux_m1_last),
	.select(demux_select)
);

frame_fifo #(
	.PACKET_MODE(0),
	.PACKET_MAXNUM(1),
	.DATA_WIDTH(8+PORT_WIDTH),
	.FIFO_DEPTH(16),
	.RAM_STYLE("distributed")
) frame_fifo_out_inst (
	.aclk(aclk),
	.aresetn(aresetn),
	.s_axis_tdata({m_axis_out_tdata,m_axis_out_tdest}),
	.s_axis_tvalid(m_axis_out_tvalid),
	.s_axis_tready(m_axis_out_tready),
	.s_axis_tlast(m_axis_out_tlast),
	.m_axis_tdata({m_axis_tdata,m_axis_tdest}),
	.m_axis_tvalid(m_axis_tvalid),
	.m_axis_tready(m_axis_tready),
	.m_axis_tlast(m_axis_tlast)
);

endmodule

//////////////////////////////////////////////////////////////////////////////////
// Module Name: axis_mux2
// Project Name: eth_switch
// Description: AXI4-Stream Multiplexer 2-to-1
//////////////////////////////////////////////////////////////////////////////////
module axis_mux2 #(
	parameter DATA_WIDTH = 8
)
(
	input wire aresetn,
	input wire [DATA_WIDTH-1:0]s0_axis_tdata,
	input wire s0_axis_tvalid,
	output wire s0_axis_tready,
	input wire s0_axis_tlast,
	input wire [DATA_WIDTH-1:0]s1_axis_tdata,
	input wire s1_axis_tvalid,
	output wire s1_axis_tready,
	input wire s1_axis_tlast,
	output wire [DATA_WIDTH-1:0]m_axis_tdata,
	output wire m_axis_tvalid,
	input wire m_axis_tready,
	output wire m_axis_tlast,
	input wire [1:0]select
);

reg [DATA_WIDTH-1:0]tdata;
reg tvalid;
reg [1:0]tready;
reg tlast;

assign s0_axis_tready = tready[0];
assign s1_axis_tready = tready[1];
assign m_axis_tdata = tdata;
assign m_axis_tvalid = tvalid;
assign m_axis_tlast = tlast;

always @(*) begin
	if (aresetn == 1'b0) begin
		tdata <= 0;
		tvalid <= 1'b0;
		tready <= 2'b00;
		tlast <= 1'b0;
	end else begin
		case (select)
		2'b00: begin // none
			tdata <= 0;
			tvalid <= 1'b0;
			tready <= 2'b00;
			tlast <= 1'b0;
		end
		2'b01: begin // s0
			tdata <= s0_axis_tdata;
			tvalid <= s0_axis_tvalid;
			tready <= {1'b0,m_axis_tready};
			tlast <= s0_axis_tlast;
		end
		2'b10: begin //s1
			tdata <= s1_axis_tdata;
			tvalid <= s1_axis_tvalid;
			tready <= {m_axis_tready,1'b0};
			tlast <= s1_axis_tlast;
		end
		2'b11: begin // flush all
			tdata <= 0;
			tvalid <= 1'b0;
			tready <= 2'b11;
			tlast <= 1'b0;
		end
		endcase
	end
end

endmodule

//////////////////////////////////////////////////////////////////////////////////
// Module Name: axis_demux2
// Project Name: eth_switch
// Description: AXI4-Stream Demultiplexer 1-to-2
//////////////////////////////////////////////////////////////////////////////////
module axis_demux2 #(
	parameter DATA_WIDTH = 8
)
(
	input wire aresetn,
	input wire [DATA_WIDTH-1:0]s_axis_tdata,
	input wire s_axis_tvalid,
	output wire s_axis_tready,
	input wire s_axis_tlast,
	output wire [DATA_WIDTH-1:0]m0_axis_tdata,
	output wire m0_axis_tvalid,
	input wire m0_axis_tready,
	output wire m0_axis_tlast,
	output wire [DATA_WIDTH-1:0]m1_axis_tdata,
	output wire m1_axis_tvalid,
	input wire m1_axis_tready,
	output wire m1_axis_tlast,
	input wire [1:0]select
);

reg tready;
reg [DATA_WIDTH-1:0]tdata[1:0];
reg [1:0]tvalid;
reg [1:0]tlast;

assign s_axis_tready = tready;
assign m0_axis_tdata = tdata[0];
assign m0_axis_tvalid = tvalid[0];
assign m0_axis_tlast = tlast[0];
assign m1_axis_tdata = tdata[1];
assign m1_axis_tvalid = tvalid[1];
assign m1_axis_tlast = tlast[1];

always @(*) begin
	if (aresetn == 1'b0) begin
		tready <= 1'b0;
		tdata[0] <= 0;
		tdata[1] <= 0;
		tvalid <= 2'b00;
		tlast <= 2'b00;
	end else begin
		case (select)
			2'b00: begin // none
				tdata[0] <= 0;
				tdata[1] <= 0;
				tready <= 1'b0;
				tvalid <= 2'b00;
				tlast <= 2'b00;
			end
			2'b01: begin // m0
				tdata[0] <= s_axis_tdata;
				tdata[1] <= 0;
				tready <= m0_axis_tready;
				tvalid <= {1'b0,s_axis_tvalid};
				tlast <= {1'b0,s_axis_tlast};
			end
			2'b10: begin // m1
				tdata[0] <= 0;
				tdata[1] <= s_axis_tdata;
				tready <= m1_axis_tready;
				tvalid <= {s_axis_tvalid,1'b0};
				tlast <= {s_axis_tlast,1'b0};
			end
			2'b11: begin // m0 & m1 (broadcast)
				tdata[0] <= s_axis_tdata;
				tdata[1] <= s_axis_tdata;
				tready <= m0_axis_tready & m1_axis_tready;
				tvalid <= {s_axis_tvalid,s_axis_tvalid} & {tready,tready};
				tlast <= {2{s_axis_tlast}};
			end
		
		endcase
	end
end

endmodule

//////////////////////////////////////////////////////////////////////////////////
// Module Name: frame_fcs
// Project Name: eth_switch
// Description: CRC-32 Calculation
//  CRC Name: CRC-32
//  Polynomial: 0x04C11DB7 (1+x^1+x^2+x^4+x^5+x^7+x^8+x^10+x^11+x^12+x^16+x^22+x^23+x^26+x^32)
//  Magic number: 0xC704DD7B
//////////////////////////////////////////////////////////////////////////////////
module frame_fcs #(
	parameter OUTPUT_REG = 1,
	parameter REFIN = 1,
	parameter REFOUT = 1,
	parameter XOROUT = 1
)
(
	input wire clk,
	input wire rst,
	input wire enable,
	input wire [7:0]data,
	output wire [31:0]fcs,
	output wire magic
);

localparam MAGIC_NUMBER = 32'hC704DD7B;

reg [31:0]fcs_q;
reg [31:0]lfsr_q;
reg [31:0]lfsr_c;
reg magic_q;
wire [7:0]data_in;
wire [31:0]lfsr_r;
wire [31:0]lfsr_x;
wire [31:0]lfsr_s;

assign lfsr_r = (REFOUT) ? {
					lfsr_c[0],lfsr_c[1],lfsr_c[2],lfsr_c[3],lfsr_c[4],lfsr_c[5],lfsr_c[6],lfsr_c[7],
					lfsr_c[8],lfsr_c[9],lfsr_c[10],lfsr_c[11],lfsr_c[12],lfsr_c[13],lfsr_c[14],lfsr_c[15],
					lfsr_c[16],lfsr_c[17],lfsr_c[18],lfsr_c[19],lfsr_c[20],lfsr_c[21],lfsr_c[22],lfsr_c[23],
					lfsr_c[24],lfsr_c[25],lfsr_c[26],lfsr_c[27],lfsr_c[28],lfsr_c[29],lfsr_c[30],lfsr_c[31] } 
				: lfsr_c;

assign lfsr_x = (XOROUT) ?  lfsr_r ^ 32'hFFFFFFFF : lfsr_r;
assign lfsr_s = lfsr_x;

assign fcs = fcs_q;
assign magic = magic_q;
assign data_in = (REFIN) ? {data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7]} : data;

always @(*) begin
	lfsr_c[0] = lfsr_q[24] ^ lfsr_q[30] ^ data_in[0] ^ data_in[6];
	lfsr_c[1] = lfsr_q[24] ^ lfsr_q[25] ^ lfsr_q[30] ^ lfsr_q[31] ^ data_in[0] ^ data_in[1] ^ data_in[6] ^ data_in[7];
	lfsr_c[2] = lfsr_q[24] ^ lfsr_q[25] ^ lfsr_q[26] ^ lfsr_q[30] ^ lfsr_q[31] ^ data_in[0] ^ data_in[1] ^ data_in[2] ^ data_in[6] ^ data_in[7];
	lfsr_c[3] = lfsr_q[25] ^ lfsr_q[26] ^ lfsr_q[27] ^ lfsr_q[31] ^ data_in[1] ^ data_in[2] ^ data_in[3] ^ data_in[7];
	lfsr_c[4] = lfsr_q[24] ^ lfsr_q[26] ^ lfsr_q[27] ^ lfsr_q[28] ^ lfsr_q[30] ^ data_in[0] ^ data_in[2] ^ data_in[3] ^ data_in[4] ^ data_in[6];
	lfsr_c[5] = lfsr_q[24] ^ lfsr_q[25] ^ lfsr_q[27] ^ lfsr_q[28] ^ lfsr_q[29] ^ lfsr_q[30] ^ lfsr_q[31] ^ data_in[0] ^ data_in[1] ^ data_in[3] ^ data_in[4] ^ data_in[5] ^ data_in[6] ^ data_in[7];
	lfsr_c[6] = lfsr_q[25] ^ lfsr_q[26] ^ lfsr_q[28] ^ lfsr_q[29] ^ lfsr_q[30] ^ lfsr_q[31] ^ data_in[1] ^ data_in[2] ^ data_in[4] ^ data_in[5] ^ data_in[6] ^ data_in[7];
	lfsr_c[7] = lfsr_q[24] ^ lfsr_q[26] ^ lfsr_q[27] ^ lfsr_q[29] ^ lfsr_q[31] ^ data_in[0] ^ data_in[2] ^ data_in[3] ^ data_in[5] ^ data_in[7];
	lfsr_c[8] = lfsr_q[0] ^ lfsr_q[24] ^ lfsr_q[25] ^ lfsr_q[27] ^ lfsr_q[28] ^ data_in[0] ^ data_in[1] ^ data_in[3] ^ data_in[4];
	lfsr_c[9] = lfsr_q[1] ^ lfsr_q[25] ^ lfsr_q[26] ^ lfsr_q[28] ^ lfsr_q[29] ^ data_in[1] ^ data_in[2] ^ data_in[4] ^ data_in[5];
	lfsr_c[10] = lfsr_q[2] ^ lfsr_q[24] ^ lfsr_q[26] ^ lfsr_q[27] ^ lfsr_q[29] ^ data_in[0] ^ data_in[2] ^ data_in[3] ^ data_in[5];
	lfsr_c[11] = lfsr_q[3] ^ lfsr_q[24] ^ lfsr_q[25] ^ lfsr_q[27] ^ lfsr_q[28] ^ data_in[0] ^ data_in[1] ^ data_in[3] ^ data_in[4];
	lfsr_c[12] = lfsr_q[4] ^ lfsr_q[24] ^ lfsr_q[25] ^ lfsr_q[26] ^ lfsr_q[28] ^ lfsr_q[29] ^ lfsr_q[30] ^ data_in[0] ^ data_in[1] ^ data_in[2] ^ data_in[4] ^ data_in[5] ^ data_in[6];
	lfsr_c[13] = lfsr_q[5] ^ lfsr_q[25] ^ lfsr_q[26] ^ lfsr_q[27] ^ lfsr_q[29] ^ lfsr_q[30] ^ lfsr_q[31] ^ data_in[1] ^ data_in[2] ^ data_in[3] ^ data_in[5] ^ data_in[6] ^ data_in[7];
	lfsr_c[14] = lfsr_q[6] ^ lfsr_q[26] ^ lfsr_q[27] ^ lfsr_q[28] ^ lfsr_q[30] ^ lfsr_q[31] ^ data_in[2] ^ data_in[3] ^ data_in[4] ^ data_in[6] ^ data_in[7];
	lfsr_c[15] = lfsr_q[7] ^ lfsr_q[27] ^ lfsr_q[28] ^ lfsr_q[29] ^ lfsr_q[31] ^ data_in[3] ^ data_in[4] ^ data_in[5] ^ data_in[7];
	lfsr_c[16] = lfsr_q[8] ^ lfsr_q[24] ^ lfsr_q[28] ^ lfsr_q[29] ^ data_in[0] ^ data_in[4] ^ data_in[5];
	lfsr_c[17] = lfsr_q[9] ^ lfsr_q[25] ^ lfsr_q[29] ^ lfsr_q[30] ^ data_in[1] ^ data_in[5] ^ data_in[6];
	lfsr_c[18] = lfsr_q[10] ^ lfsr_q[26] ^ lfsr_q[30] ^ lfsr_q[31] ^ data_in[2] ^ data_in[6] ^ data_in[7];
	lfsr_c[19] = lfsr_q[11] ^ lfsr_q[27] ^ lfsr_q[31] ^ data_in[3] ^ data_in[7];
	lfsr_c[20] = lfsr_q[12] ^ lfsr_q[28] ^ data_in[4];
	lfsr_c[21] = lfsr_q[13] ^ lfsr_q[29] ^ data_in[5];
	lfsr_c[22] = lfsr_q[14] ^ lfsr_q[24] ^ data_in[0];
	lfsr_c[23] = lfsr_q[15] ^ lfsr_q[24] ^ lfsr_q[25] ^ lfsr_q[30] ^ data_in[0] ^ data_in[1] ^ data_in[6];
	lfsr_c[24] = lfsr_q[16] ^ lfsr_q[25] ^ lfsr_q[26] ^ lfsr_q[31] ^ data_in[1] ^ data_in[2] ^ data_in[7];
	lfsr_c[25] = lfsr_q[17] ^ lfsr_q[26] ^ lfsr_q[27] ^ data_in[2] ^ data_in[3];
	lfsr_c[26] = lfsr_q[18] ^ lfsr_q[24] ^ lfsr_q[27] ^ lfsr_q[28] ^ lfsr_q[30] ^ data_in[0] ^ data_in[3] ^ data_in[4] ^ data_in[6];
	lfsr_c[27] = lfsr_q[19] ^ lfsr_q[25] ^ lfsr_q[28] ^ lfsr_q[29] ^ lfsr_q[31] ^ data_in[1] ^ data_in[4] ^ data_in[5] ^ data_in[7];
	lfsr_c[28] = lfsr_q[20] ^ lfsr_q[26] ^ lfsr_q[29] ^ lfsr_q[30] ^ data_in[2] ^ data_in[5] ^ data_in[6];
	lfsr_c[29] = lfsr_q[21] ^ lfsr_q[27] ^ lfsr_q[30] ^ lfsr_q[31] ^ data_in[3] ^ data_in[6] ^ data_in[7];
	lfsr_c[30] = lfsr_q[22] ^ lfsr_q[28] ^ lfsr_q[31] ^ data_in[4] ^ data_in[7];
	lfsr_c[31] = lfsr_q[23] ^ lfsr_q[29] ^ data_in[5];
end

generate if (OUTPUT_REG) begin
	always @(posedge clk) begin
		if (rst == 1'b1) begin
			lfsr_q <= 32'hFFFFFFFF;
			fcs_q <= 0;
			magic_q <= 1'b0;
		end else begin
			lfsr_q <= enable ? lfsr_c : lfsr_q;
			fcs_q <= enable ? lfsr_s : fcs_q; // x
			magic_q <= (lfsr_c == MAGIC_NUMBER) ? 1'b1 : 1'b0;
		end
	end
end else begin
	always @(posedge clk) begin
		if (rst == 1'b1) begin
			lfsr_q <= 32'hFFFFFFFF;
		end else begin
			lfsr_q <= enable ? lfsr_c : lfsr_q;
		end
	end
	always @(*) begin
		fcs_q <= enable ? lfsr_s : fcs_q; // x
		magic_q <= (lfsr_c == MAGIC_NUMBER) ? 1'b1 : 1'b0;
	end	
end endgenerate
  
endmodule

//////////////////////////////////////////////////////////////////////////////////
// Module Name: frame_fifo
// Project Name: eth_switch
// Description: AXI4-Stream Packet FIFO
//////////////////////////////////////////////////////////////////////////////////
module frame_fifo #(
	parameter PACKET_MODE = 0,
	parameter PACKET_MAXNUM = 32, // MAX
	parameter DATA_WIDTH = 8,
	parameter FIFO_DEPTH = 2048,
	parameter RAM_STYLE = "block"
)
(
	input wire aclk,
	input wire aresetn,
	input wire [DATA_WIDTH-1:0]s_axis_tdata,
	input wire s_axis_tvalid,
	output wire s_axis_tready,
	input wire s_axis_tlast,
	output wire [DATA_WIDTH-1:0]m_axis_tdata,
	output wire m_axis_tvalid,
	input wire m_axis_tready,
	output wire m_axis_tlast
);

wire [DATA_WIDTH:0]fifo_di;
wire [DATA_WIDTH:0]fifo_do;
wire fifo_empty;
wire fifo_wren;
wire fifo_full;
wire fifo_rden;

reg [5:0]nrp;
wire ready;
wire valid;
wire pkt_in_last;
wire pkt_out_last;

assign fifo_di = {s_axis_tlast, s_axis_tdata};
assign m_axis_tdata = fifo_do[DATA_WIDTH-1:0];
assign m_axis_tlast = fifo_do[DATA_WIDTH];
assign s_axis_tready = ~fifo_full & ready;
assign m_axis_tvalid = ~fifo_empty & valid;
assign fifo_wren = s_axis_tvalid & s_axis_tready;
assign fifo_rden = m_axis_tvalid & m_axis_tready; 

generate if (PACKET_MODE) begin
	assign pkt_in_last = (s_axis_tvalid == 1'b1) && (s_axis_tready == 1'b1) && (s_axis_tlast == 1'b1);
	assign pkt_out_last = (m_axis_tvalid == 1'b1) && (m_axis_tready == 1'b1) && (m_axis_tlast == 1'b1);
	assign ready = (nrp < PACKET_MAXNUM) ? 1'b1 : 1'b0;
	assign valid = (nrp > 0) ? 1'b1 : 1'b0;
end else begin
	assign pkt_in_last = 1'b0;
	assign pkt_out_last = 1'b0;
	assign ready = 1'b1;
	assign valid = 1'b1;
end endgenerate

generate if (PACKET_MODE) begin
	always @(posedge aclk) begin
		if (aresetn == 1'b0) begin
			nrp <= 0;
		end else begin
			case ({pkt_in_last,pkt_out_last})
			2'b01: begin
				if (nrp > 0) begin
					nrp <= nrp - 1;
				end
			end
			2'b10: begin
				if (nrp < PACKET_MAXNUM) begin
					nrp <= nrp + 1;
				end
			end
			default: begin
				nrp <= nrp;
			end
			endcase
		end
	end
end endgenerate

localparam FIFO_WIDTH = DATA_WIDTH + 1;
localparam ADDR_WIDTH = $clog2(FIFO_DEPTH);

/* RAM */
(* ram_style = RAM_STYLE *)
reg [FIFO_WIDTH-1:0]ram[2**ADDR_WIDTH-1:0];
wire [FIFO_WIDTH-1:0]ram_dina;
wire [ADDR_WIDTH-1:0]ram_addra;
wire [ADDR_WIDTH-1:0]ram_addrb;
wire ram_wea;
wire ram_reb;
reg [FIFO_WIDTH-1:0]ram_doutb;
integer i;

/* FIFO */
reg [ADDR_WIDTH-1:0]wr_ptr;
reg [ADDR_WIDTH-1:0]rd_ptr;
reg [ADDR_WIDTH:0]count;
reg flag_full;
reg flag_empty;
reg dout_valid;
wire wr_valid;
wire rd_valid;
wire tmp_rd_en;

/* RAM */
assign ram_dina = fifo_di;
assign ram_addra = wr_ptr;
assign ram_addrb = rd_ptr;
assign ram_wea = wr_valid;
assign ram_reb = rd_valid;
assign fifo_do = ram_doutb;

/* FIFO */
assign wr_valid = fifo_wren & ~flag_full;
assign rd_valid = tmp_rd_en & ~flag_empty;
assign fifo_full = flag_full;
//assign valid = dout_valid;

assign fifo_empty = !dout_valid;
assign tmp_rd_en = !flag_empty && (!dout_valid || fifo_rden);

/* SDPRAM */
initial begin
	for (i = 0; i < 2**ADDR_WIDTH; i = i + 1) begin
		ram[i] = 0;
	end
end

always @(posedge aclk) begin
	if (ram_wea) begin
		ram[ram_addra] <= ram_dina;
	end
	if (ram_reb) begin
		ram_doutb <= ram[ram_addrb];
	end
end

/* FIFO */
always @(posedge aclk) begin
	if (aresetn == 1'b0) begin
		wr_ptr <= 0;
		rd_ptr <= 0;
		count <= 0;
	end else begin
		if (wr_valid == 1'b1) begin
			if (wr_ptr == (FIFO_DEPTH - 1)) begin
				wr_ptr <= 0;
			end else begin
				wr_ptr <= wr_ptr + 1;
			end
		end
		if (rd_valid == 1'b1) begin
			if (rd_ptr == (FIFO_DEPTH - 1)) begin
				rd_ptr <= 0;
			end else begin
				rd_ptr <= rd_ptr + 1;
			end
		end
		case ({wr_valid,rd_valid})
		2'b01: count <= count - 1;
		2'b10: count <= count + 1;
		endcase
	end
end

always @(*) begin
	if (aresetn == 1'b0) begin
		flag_full = 1'b1;
		flag_empty = 1'b1;
	end else begin
		flag_full = (count == FIFO_DEPTH) ? 1'b1 : 1'b0;
		flag_empty = (count == 0) ? 1'b1 : 1'b0;
	end
end

always @(posedge aclk) begin
	if (aresetn == 1'b0) begin
		dout_valid <= 1'b0;
	end else begin
		if (tmp_rd_en == 1'b1) begin
			dout_valid <= 1'b1;
		end else if (fifo_rden == 1'b1) begin
			dout_valid <= 1'b0;
		end
	end
end

endmodule 
  
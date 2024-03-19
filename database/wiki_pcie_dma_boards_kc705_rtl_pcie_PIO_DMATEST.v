`default_nettype none
`timescale 1ps/1ps

module PIO_DMATEST # (
	// RX/TX interface data width
	parameter C_DATA_WIDTH = 64,
	parameter TCQ = 1,
	// TSTRB width
	parameter KEEP_WIDTH = C_DATA_WIDTH / 8
)(
	input wire clk,
	input wire sys_rst,
	input wire soft_reset,

	//AXIS TX
	input wire s_axis_other_req,
	output reg s_axis_tx_req = 1'b0,
	input wire s_axis_tx_ack,
	input wire s_axis_tx_tready,
	output reg [C_DATA_WIDTH-1:0] s_axis_tx_tdata,
	output reg [KEEP_WIDTH-1:0] s_axis_tx_tkeep = 16'h00,
	output reg s_axis_tx_tlast = 1'b0,
	output reg s_axis_tx_tvalid = 1'b0,
	output wire tx_src_dsc,

	input wire [15:0] cfg_completer_id,

	//AXIS RX
	input wire [C_DATA_WIDTH-1:0] m_axis_rx_tdata,
	input wire [KEEP_WIDTH-1:0] m_axis_rx_tkeep,
	input wire m_axis_rx_tlast,
	input wire m_axis_rx_tvalid,
	input wire [21:0] m_axis_rx_tuser,

        input wire [15:0] cfg_command,
        input wire [15:0] cfg_dcommand,
        input wire [15:0] cfg_lcommand,
        input wire [15:0] cfg_dcommand2,

	// PCIe user registers
	input wire  [2:0] dma_testmode,
	input wire [31:2] dma_addrl,
	input wire [15:0] dma_addrh,
	input wire [31:2] dma_length,
	input wire [31:0] dma_para,
	output reg [31:0] dma_tx_pps = 32'h0,
	output reg [31:0] dma_tx_dw = 32'h0,
	output reg [31:0] dma_rx_pps = 32'h0,
	output reg [31:0] dma_rx_dw = 32'h0,

	output reg [31:0] debug1 = 32'h0,
	output reg [31:0] debug2 = 32'h0,
	output reg [31:0] debug3 = 32'h0,
	output reg [31:0] debug4 = 32'h0
);

//wire [4:0] rx_is_sof;
//wire [4:0] rx_is_eof;
//assign rx_is_sof = m_axis_rx_tuser[14:10];
//assign rx_is_eof = m_axis_rx_tuser[21:17];
wire sof_present = m_axis_rx_tuser[14];
wire sof_right = !m_axis_rx_tuser[13] & sof_present;
wire sof_mid = m_axis_rx_tuser[13] & sof_present;
wire eof_present = m_axis_rx_tuser[21];


// 1sec snapshot
reg oneshot_1sec = 1'b0;
reg [27:0] counter_1sec = 28'd250_000_000;
always @(posedge clk) begin
	if (sys_rst) begin
		counter_1sec <= 28'd250_000_000;
		oneshot_1sec <= 1'b0;
	end else begin
		oneshot_1sec <= 1'b0;
		if (counter_1sec != 28'd0) begin
			counter_1sec <= counter_1sec - 28'd1;
		end else begin
			oneshot_1sec <= 1'b1;
			counter_1sec <= 28'd250_000_000;
		end
	end
end


// Local wires
parameter TLP_TX_IDLE       = 3'b000;
parameter TLP_TX_WRITE      = 3'b001;
parameter TLP_TX_READ       = 3'b010;
parameter TLP_TX_READWAIT   = 3'b011;
parameter TLP_TX_READWRITE  = 3'b101;
parameter TLP_TX_LOOP       = 3'b100;
reg [2:0] tx_state = TLP_TX_IDLE;
reg [15:0] tlp_tx_count = 16'h0;
reg [7:0] tlp_rx_count = 8'h0;
reg [31:0] tlp_tx_pps = 32'h0;
reg [31:0] tlp_tx_dw = 32'h0;
reg [31:0] tlp_rx_pps = 32'h0;
reg [31:0] tlp_rx_dw = 32'h0;
reg [31:2] dma_addr = 30'h0;
reg [31:2] dma_len = 30'h0;
reg [7:0] tlp_tx_tag = 8'h0;
reg [7:0] tlp_rx_tag = 8'h0;
reg tx_done = 1'b0;
reg rx_done = 1'b0;
reg [15:0] tlp_remain = 16'd0;

// Transmit
always @(posedge clk) begin
	if (sys_rst) begin
		dma_addr <= 30'h0;
		dma_len <= 30'h0;
		tlp_tx_tag <= 8'h0;
		tlp_rx_tag <= 8'h0;
		tlp_tx_pps <= 32'h00;
		tlp_tx_dw <= 32'h00;
		dma_tx_pps <= 32'h00;
		dma_tx_dw <= 32'h00;
		tlp_tx_count <= 16'h0;
		s_axis_tx_req <= 1'b0;
		s_axis_tx_tvalid <= 1'b0;
		s_axis_tx_tlast <= 1'b0;
		s_axis_tx_tkeep <= 16'h0000;
		s_axis_tx_tdata <= 128'h00000000_00000000_00000000_00000000;
		tx_done <= 1'b0;
		tx_state <= TLP_TX_IDLE;
	end else begin
		tx_done <= 1'b0;
		if (oneshot_1sec) begin
			dma_tx_pps <= tlp_tx_pps;
			dma_tx_dw <= tlp_tx_dw;
			tlp_tx_pps <= 32'h00;
			tlp_tx_dw <= 32'h00;
		end
		case (tx_state)
		TLP_TX_IDLE: begin
			tlp_tx_count <= 16'h0;
			s_axis_tx_tvalid <= 1'b0;
			s_axis_tx_tlast <= 1'b0;
			s_axis_tx_tkeep <= 16'h0000;
			s_axis_tx_tdata <= 128'h00000000_00000000_00000000_00000000;
			if (dma_testmode != 3'h0 && s_axis_other_req == 1'b0) begin
				if (dma_addr == 30'h0) begin
					dma_addr <= dma_addrl;
					dma_len  <= dma_length;
				end
				s_axis_tx_req <= 1'b1;
				if (s_axis_tx_ack && s_axis_tx_tready)
					if (dma_testmode == 3'b001)
						tx_state <= TLP_TX_WRITE;
					else if (dma_testmode[1])
						tx_state <= TLP_TX_READ;
					else if (dma_testmode[2])
						tx_state <= TLP_TX_READWRITE;
			end else
				s_axis_tx_req <= 1'b0;
		end
		TLP_TX_WRITE: begin
			tlp_tx_count <= tlp_tx_count + 16'h1;
			case (tlp_tx_count)
			16'h0: begin
				s_axis_tx_tvalid <= 1'b1;
				s_axis_tx_tlast <= 1'b0;
				s_axis_tx_tkeep <= 16'hffff;
				s_axis_tx_tdata <= {{dma_addr, 2'b00}, {16'h00, dma_addrh}, cfg_completer_id, tlp_tx_tag[7:0], 8'hFF, 24'h600000, dma_para[7:0]};
			end
			16'h1: begin
				s_axis_tx_tvalid <= 1'b1;
				s_axis_tx_tlast <= 1'b0;
				s_axis_tx_tdata <= {tlp_tx_pps[31:0],96'hFFFF0000_FFFFFFFF_55D50040};
			end
			16'h2: begin
				s_axis_tx_tvalid <= 1'b1;
				s_axis_tx_tlast <= 1'b0;
				s_axis_tx_tdata <= 128'h0A5AC0A8_00004011_002E0000_08004500;
			end
			16'h3: begin
				s_axis_tx_tvalid <= 1'b1;
				s_axis_tx_tlast <= 1'b0;
				s_axis_tx_tdata <= 128'hCC00CC00_001A0000_02660D5E_0165C0A8;
			end
			16'h4: begin
				s_axis_tx_tvalid <= 1'b1;
				s_axis_tx_tlast <= 1'b1;
				s_axis_tx_tkeep <= 16'hffff;
				s_axis_tx_tdata <= 128'h40414243_3C3D3E3F_38393A3B_34353637;
				tx_done <= 1'b1;
				if (!oneshot_1sec) begin
					tlp_tx_pps <= tlp_tx_pps + 32'h1;
				end
				dma_addr <= dma_addr + {22'h00, dma_para[7:0]};
				dma_len <= dma_len - {22'h00, dma_para[7:0]};
				tlp_tx_tag <= tlp_tx_tag + 8'h1;
				if (dma_len == 30'h00) begin
					dma_addr <= dma_addrl;
					dma_len  <= dma_length;
				end
				if (s_axis_tx_tready && s_axis_other_req == 1'b0) begin
					tlp_tx_count <= 16'h0;
				end
			end
			default: begin
				s_axis_tx_tvalid <= 1'b0;
				s_axis_tx_tlast <= 1'b0;
				s_axis_tx_tkeep <= 16'h0000;
				s_axis_tx_tdata <= 128'h00000000_00000000_00000000_00000000;
				s_axis_tx_req <= 1'b0;
				tx_state <= TLP_TX_IDLE;
			end
			endcase
		end
		TLP_TX_READ: begin
			s_axis_tx_tvalid <= 1'b0;
			s_axis_tx_tlast <= 1'b0;
			s_axis_tx_tkeep <= 16'h0000;
			s_axis_tx_tdata <= 128'h00000000_00000000_00000000_00000000;
			tlp_tx_count <= tlp_tx_count + 16'h1;
			if (tlp_tx_count == dma_para[15:8]) begin
				tlp_tx_count <= 16'h0;
				if (tlp_remain <= dma_para[31:16]) begin
					tx_done <= 1'b1;
					s_axis_tx_tvalid <= 1'b1;
					s_axis_tx_tlast <= 1'b1;
					s_axis_tx_tkeep <= 16'hffff;
					s_axis_tx_tdata <= {{dma_addr, 2'b00}, {16'h0, dma_addrh}, cfg_completer_id, tlp_rx_tag[7:0], 8'hff, 24'h200000, dma_para[7:0]};
					if (!oneshot_1sec) begin
						tlp_tx_pps <= tlp_tx_pps + 32'h1;
						tlp_tx_dw <= tlp_tx_dw + {24'h0, dma_para[7:0]};
					end
					dma_addr <= dma_addr + {22'h00, dma_para[7:0]};
					dma_len <= dma_len - {22'h00, dma_para[7:0]};
					tlp_rx_tag <= tlp_rx_tag + 8'h1;
					if (dma_len == 30'h00) begin
						dma_addr <= dma_addrl;
						dma_len  <= dma_length;
					end
					if (s_axis_tx_tready && s_axis_other_req == 1'b0) begin
						if (dma_testmode[0] == 1'b0)
							tx_state <= TLP_TX_READ;
						else
							tx_state <= TLP_TX_READWAIT;
					end else begin
						s_axis_tx_req <= 1'b0;
						tx_state <= TLP_TX_IDLE;
					end
				end
				if (s_axis_tx_tready == 1'b0 || s_axis_other_req) begin
					s_axis_tx_req <= 1'b0;
					tx_state <= TLP_TX_IDLE;
				end
			end
		end
		TLP_TX_READWAIT: begin
			s_axis_tx_tvalid <= 1'b0;
			s_axis_tx_tlast <= 1'b0;
			s_axis_tx_tkeep <= 16'h0000;
			s_axis_tx_tdata <= 128'h00000000_00000000_00000000_00000000;
			if (s_axis_tx_tready == 1'b0 || s_axis_other_req) begin
				s_axis_tx_req <= 1'b0;
				tx_state <= TLP_TX_IDLE;
			end else if (rx_done)
				tx_state <= TLP_TX_READ;
		end
		TLP_TX_READWRITE: begin
			tx_state <= TLP_TX_IDLE;
		end
		TLP_TX_LOOP: begin
			s_axis_tx_tvalid <= 1'b0;
			s_axis_tx_tlast <= 1'b0;
			s_axis_tx_tkeep <= 16'h0000;
			s_axis_tx_tdata <= 128'h00000000_00000000_00000000_00000000;
			s_axis_tx_req <= 1'b0;
		end
		endcase
	end
end

assign tx_src_dsc = 1'b0;

// Receive
always @(posedge clk) begin
	if (sys_rst) begin
		tlp_rx_pps <= 32'h00;
		tlp_rx_dw <= 32'h00;
		dma_rx_pps <= 32'h00;
		dma_rx_dw <= 32'h00;
		tlp_rx_count <= 8'h0;
		rx_done <= 1'b0;
	end else begin
		if (oneshot_1sec) begin
			dma_rx_pps <= tlp_rx_pps;
			dma_rx_dw <= tlp_rx_dw;
			tlp_rx_pps <= 32'h00;
			tlp_rx_dw <= 32'h00;
		end
		if (m_axis_rx_tvalid) begin
			if (sof_present) begin
				tlp_rx_count <= 8'h0;
				if ((m_axis_rx_tuser[13] == 1'b0 && m_axis_rx_tdata[30:24]==7'b1001010) || (m_axis_rx_tuser[13] == 1'b1 && m_axis_rx_tdata[94:88]==7'b1001010)) begin  // ?completion with data
case (tlp_rx_pps)
32'h0: debug1 <= m_axis_rx_tdata[127:96];
32'h1: debug2 <= m_axis_rx_tdata[127:96];
32'h2: debug3 <= m_axis_rx_tdata[127:96];
//32'h3: debug4 <= m_axis_rx_tdata[127:96];
endcase
					if (!oneshot_1sec) begin
//						tlp_rx_pps <= m_axis_rx_tdata[31:00];
						tlp_rx_pps <= tlp_rx_pps + 32'h1;
						tlp_rx_dw <= tlp_rx_dw + {22'h0, m_axis_rx_tuser[13] ? m_axis_rx_tdata[73:64] : m_axis_rx_tdata[9:0]};
					end
					rx_done <= 1'b1;
				end else
					rx_done <= 1'b0;
			end else begin
				tlp_rx_count <= tlp_rx_count + 8'h1;
				rx_done <= 1'b0;
			end
		end else
			rx_done <= 1'b0;
	end
end

// remain pps management
always @(posedge clk) begin
	if (sys_rst || soft_reset) begin
		tlp_remain <= 16'd0;
	end else begin
debug4 <= {16'h0, tlp_remain};
		if (tx_done == 1'b1 && rx_done == 1'b0)
			tlp_remain <= tlp_remain + 16'd1;
		else if (tx_done == 1'b0 && rx_done == 1'b1)
			tlp_remain <= tlp_remain - 16'd1;
	end
end

endmodule // PIO_TX_DMATEST
`default_nettype wire

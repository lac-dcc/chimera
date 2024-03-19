`default_nettype none

// ----------------------
// -- User Application --
// ----------------------
module  app (
	input wire sys_rst,
	// XGMII interface
	input wire xgmii_clk,
	output wire [63:0] xgmii_txd,
	output wire [7:0] xgmii_txc,
	input wire [63:0] xgmii_rxd,
	input wire [7:0] xgmii_rxc,
	input wire [7:0] xphy_status,
	// BUTTON
	input wire button_n,
	input wire button_s,
	input wire button_w,
	input wire button_e,
	input wire button_c,
	// DIP SW
	input wire [3:0] dipsw,
	// Diagnostic LEDs
	output wire [7:0] led	   
);



//===================================
// Transmitter logic
//===================================

//-----------------------------------
// Packet parameter
//-----------------------------------
reg [47:0] tx_mac_dst   = 48'hff_ff_ff_ff_ff_ff;
reg [47:0] tx_mac_src   = 48'h00_11_22_33_44_66;
reg [31:0] tx_ipv4_dst  = {8'd192, 8'd168, 8'd2, 8'd102};
reg [31:0] tx_ipv4_src  = {8'd192, 8'd168, 8'd1, 8'd101};
reg [15:0] tx_uport_dst = 16'd9;
reg [15:0] tx_uport_src = 16'd9;
reg [16:0] tx_ipv4id    = 16'h0;
reg [7:0]  tx_ipv4ttl   = 8'h40;	// IPv4: default TTL value (default: 64)


reg [9:0] tx_counter = 10'h0;
reg [63:0] txd;
reg [7:0] txc;

//-----------------------------------
// CRC logic
//-----------------------------------
reg crc_init = 1'b0;
wire crc_data_en;
assign crc_data_en = ~crc_init;
wire [31:0] crc64_out, crc64_outrev;
assign crc64_outrev = ~{crc64_out[24],crc64_out[25],crc64_out[26],crc64_out[27],crc64_out[28],crc64_out[29],crc64_out[30],crc64_out[31], crc64_out[16],crc64_out[17],crc64_out[18],crc64_out[19],crc64_out[20],crc64_out[21],crc64_out[22],crc64_out[23], crc64_out[ 8],crc64_out[ 9],crc64_out[10],crc64_out[11],crc64_out[12],crc64_out[13],crc64_out[14],crc64_out[15], crc64_out[ 0],crc64_out[ 1],crc64_out[ 2],crc64_out[ 3],crc64_out[ 4],crc64_out[ 5],crc64_out[ 6],crc64_out[ 7]};

crc32_d64 crc32_d64_inst (
	.rst(crc_init),
	.clk(~xgmii_clk),
	.crc_en(crc_data_en),
	.data_in({
txd[00],txd[01],txd[02],txd[03],txd[04],txd[05],txd[06],txd[07],txd[08],txd[09],
txd[10],txd[11],txd[12],txd[13],txd[14],txd[15],txd[16],txd[17],txd[18],txd[19],
txd[20],txd[21],txd[22],txd[23],txd[24],txd[25],txd[26],txd[27],txd[28],txd[29],
txd[30],txd[31],txd[32],txd[33],txd[34],txd[35],txd[36],txd[37],txd[38],txd[39],
txd[40],txd[41],txd[42],txd[43],txd[44],txd[45],txd[46],txd[47],txd[48],txd[49],
txd[50],txd[51],txd[52],txd[53],txd[54],txd[55],txd[56],txd[57],txd[58],txd[59],
txd[60],txd[61],txd[62],txd[63]
}),	// 64bit
	.crc_out(crc64_out)	// 32bit
);

parameter [1:0] TX_DATA	= 2'b00,	// DATA
		TX_FCS  = 2'b01,	// Frame Check Sequence
		TX_GAP  = 2'b10;	// Inter Frame Gap
reg [1:0] tx_state = TX_DATA;

reg [23:0] ip_sum = 24'h0;		// IP header SUM
reg [31:0] gap_count = 32'h0;
wire [15:0] frame_len;
wire [31:0] inter_frame_gap;

assign frame_len = 16'd68;		// Packet length
wire [15:0] udp_len = frame_len - 16'h26;  // UDP Length
wire [15:0] ip_len  = frame_len - 16'd18;  // IP Length (Frame Len - FCS Len - EtherFrame Len
assign inter_frame_gap = 32'd15625000;	// 10Hz

always @(posedge xgmii_clk) begin
	if (sys_rst) begin
		tx_mac_dst   <= 48'hff_ff_ff_ff_ff_ff;
		tx_mac_src   <= 48'h00_11_22_33_44_66;
		tx_ipv4_dst  <= {8'd192, 8'd168, 8'd2, 8'd102};
		tx_ipv4_src  <= {8'd192, 8'd168, 8'd1, 8'd101};
		tx_uport_dst <= 16'd9;
		tx_uport_src <= 16'd9;
		tx_ipv4id    <= 16'h0;
		tx_ipv4ttl   <= 8'h40;
		crc_init <= 1'b0;
		tx_counter <= 10'h0;
		txd <= 64'h0707070707070707;
		txc <= 8'hff;
		tx_state <= TX_DATA;
	end else begin
		case (tx_state)
		TX_DATA: begin
			tx_counter <= tx_counter + 10'h1;
			case (tx_counter)
			10'h00: begin
				{txc, txd} <= {8'h01, 64'hd5_55_55_55_55_55_55_fb};
				ip_sum <= 16'h4500 + {4'h0,ip_len[11:0]} + tx_ipv4id[15:0] + {tx_ipv4ttl[7:0],8'h11} + tx_ipv4_src[31:16] + tx_ipv4_src[15:0] + tx_ipv4_dst[31:16] + tx_ipv4_dst[15:0];
				crc_init <= 1'b1;
			end
			10'h01: begin
				{txc, txd} <= {8'h00, tx_mac_src[39:32], tx_mac_src[47:40], tx_mac_dst[7:0], tx_mac_dst[15:8], tx_mac_dst[23:16], tx_mac_dst[31:24], tx_mac_dst[39:32], tx_mac_dst[47:40]};
				ip_sum <= ~(ip_sum[15:0] + ip_sum[23:16]);
				crc_init <= 1'b0;
			end
			10'h02: {txc, txd} <= {8'h00, 32'h00_45_00_08, tx_mac_src[7:0], tx_mac_src[15:8], tx_mac_src[23:16], tx_mac_src[31:24]};
			10'h03: {txc, txd} <= {8'h00, 8'h11, tx_ipv4ttl[7:0], 16'h00, tx_ipv4id[7:0], tx_ipv4id[15:8], ip_len[7:0], 4'h0, ip_len[11:8]};
			10'h04: {txc, txd} <= {8'h00, tx_ipv4_dst[23:16], tx_ipv4_dst[31:24], tx_ipv4_src[7:0], tx_ipv4_src[15:8], tx_ipv4_src[23:16], tx_ipv4_src[31:24], ip_sum[7:0], ip_sum[15:8]};
			10'h05: {txc, txd} <= {8'h00, udp_len[7:0], 4'h0, udp_len[11:8], tx_uport_dst[7:0], tx_uport_dst[15:8], tx_uport_src[7:0], tx_uport_src[15:8], tx_ipv4_dst[7:0], tx_ipv4_dst[15:8]};
			10'h06: {txc, txd} <= {8'h00, 64'h00_00_55_e9_9b_be_00_00};
			10'h07: {txc, txd} <= {8'h00, 64'h00_00_03_4c_ce_53_cc_00};
			10'h08: begin
				{txc, txd} <= {8'h00, 64'h00_00_00_00_00_00_cc_00};
				tx_state <= TX_FCS;
			end
			default: begin
				{txc, txd} <= {8'hff, 64'h07_07_07_07_07_07_07_07};
			end
			endcase
		end
		TX_FCS: begin
			{txc, txd} <= {8'hf0, 32'h07_07_07_fd, crc64_outrev[7:0], crc64_outrev[15:8], crc64_outrev[23:16], crc64_outrev[31:24]};
			gap_count <= inter_frame_gap - 32'd1;
			tx_state <= TX_GAP;
		end
		TX_GAP: begin
			{txc, txd} <= {8'hff, 64'h07_07_07_07_07_07_07_07};
			gap_count <= gap_count - 32'd1;
			if (gap_count == 32'd0) begin
				tx_counter <= 10'h0;
				tx_state <= TX_DATA;
			end
		end
		endcase
	end
end

assign xgmii_txd = txd;
assign xgmii_txc = txc;




//===================================
// Receiver logic
//===================================

reg [31:0] rx_ipv4_dst;
reg [47:0] rx_mac_dst;
reg [47:0] rx_mac_src;
reg [15:0] rx_ftype;
reg [ 7:0] rx_protocol;
reg [15:0] rx_uport_dst;

reg [ 9:0] rx_counter = 10'h0;
reg [ 7:0] led_r;

parameter       RX_IDLE = 1'b0,
                RX_DATA = 1'b1;

reg  rx_state = RX_IDLE;

//-----------------------------------
// xgmii start sync
//-----------------------------------
wire [63:0] xgmii_rxd2;
wire [ 7:0] xgmii_rxc2;
xgmiisync xgmiisync_0 (
	.sys_rst(sys_rst),
	.xgmii_rx_clk(xgmii_clk),
	.xgmii_rxd_i(xgmii_rxd),
	.xgmii_rxc_i(xgmii_rxc),
	.xgmii_rxd_o(xgmii_rxd2),
	.xgmii_rxc_o(xgmii_rxc2)
);

always @(posedge xgmii_clk) begin
	if (sys_rst) begin
		rx_counter <= 10'h0;
		rx_state <= RX_IDLE;
	end else begin
		case (rx_state)
		RX_IDLE: begin
			rx_counter <= 10'h0;
			if (xgmii_rxc2[0] && xgmii_rxd2[7:0] == 8'hfb)
				rx_state <= RX_DATA;
		end
		RX_DATA: begin
			rx_counter <= rx_counter + 10'h1;
			if (xgmii_rxc2 == 8'hff) begin
				rx_state <= RX_IDLE;
			end else begin
				case (rx_counter)
				10'h00: begin
					rx_mac_dst[47:40] <= xgmii_rxd2[ 7: 0];// Ethernet hdr: Dest MAC
					rx_mac_dst[39:32] <= xgmii_rxd2[15: 8];
					rx_mac_dst[31:24] <= xgmii_rxd2[23:16];
					rx_mac_dst[23:16] <= xgmii_rxd2[31:24];
					rx_mac_dst[15: 8] <= xgmii_rxd2[39:32];
					rx_mac_dst[ 7: 0] <= xgmii_rxd2[47:40];
					rx_mac_src[47:40] <= xgmii_rxd2[55:48];// Ethernet hdr: Src  MAC
					rx_mac_src[39:32] <= xgmii_rxd2[63:56];
				end
				10'h01: begin
					rx_mac_src[31:24] <= xgmii_rxd2[ 7: 0];
					rx_mac_src[23:16] <= xgmii_rxd2[15: 8];
					rx_mac_src[15: 8] <= xgmii_rxd2[23:16];
					rx_mac_src[ 7: 0] <= xgmii_rxd2[31:24];
					rx_ftype[15:8]    <= xgmii_rxd2[39:32];// Ethrenet hdr: Frame Type
					rx_ftype[ 7:0]    <= xgmii_rxd2[47:40];
				end
				10'h02: begin
					rx_protocol[7:0]  <= xgmii_rxd2[63:56];// IP Protocol
				end
				10'h04: begin
					rx_uport_dst[15:8]<= xgmii_rxd2[39:32];// UDP Port Dest
					rx_uport_dst[ 7:0]<= xgmii_rxd2[47:40];
				end
				10'h05: begin
					if (rx_ftype == 16'h0800 && rx_protocol == 8'h11 && rx_uport_dst == 16'd9) begin
//						led_r <= led_r + 8'd1;
					end
				end
				endcase
			end
		end
		endcase
	end
end

always @(posedge xgmii_clk) begin
	if (sys_rst) begin
		led_r <= 8'h00;
	end else begin
		case (dipsw[3:0])
		4'h0: led_r <= rx_mac_dst[47:40];
		4'h1: led_r <= rx_mac_dst[39:32];
		4'h2: led_r <= rx_mac_dst[31:24];
		4'h3: led_r <= rx_mac_dst[23:16];
		4'h4: led_r <= rx_mac_dst[15: 8];
		4'h5: led_r <= rx_mac_dst[ 7: 0];
		4'h6: led_r <= rx_mac_src[47:40];
		4'h7: led_r <= rx_mac_src[39:32];
		4'h8: led_r <= rx_mac_src[31:24];
		4'h9: led_r <= rx_mac_src[23:16];
		4'ha: led_r <= rx_mac_src[15: 8];
		4'hb: led_r <= rx_mac_src[ 7: 0];
		4'hc: led_r <= rx_ftype[15: 8];
		4'hd: led_r <= rx_ftype[ 7: 0];
		default: led_r <= 8'h00;
		endcase
	end
end

assign led[7:0] = led_r;

endmodule
`default_nettype wire

/**
	*	@Function: Ethernet Send UDP
	*	@Date		:	2019/05/26
	*	@Vision		:	v1.0
	*	@Note		:
	*	@Author		:	WoodFan
	*	@param	clk		: fpga main clock
	*	@param	rst_n	: active low reset signal
	*	@param	rx_data_len: rx udp data length parameter
	*	@param	rx_total_len: rx ip data length parameter
	*	@param	update	: rx data update
	*	@param	ip_header: ip packet header
	*	@param	udp_header:udp packet header
	*	@param	mac		: dst mac, src mac, ip type
	*	@param	data_o	: data output 
	*	@param	src_mac	: source mac addr
	*	@param	src_addr: source ip addr
	*	@param	src_port: source port addr
	*	@param	DF		: ip packet parameter
	*	@param	MF		: ip packet parameter
	*	@param	e_rxdv	: rx already signal
	*	@param	rxd		: rxd data
	
	*/
module udp_receive
#
(
/* 192.168.0.2*/
parameter	CAN_RECEIVE_BROADCAST = 1,
parameter	DST_ADDR = 32'hc0a80002,
parameter	DST_PORT = 16'd8000,
parameter	DST_MAC	= 48'h000a3501fec0
)
(
	/* system signal*/
	input				clk		,
	input				rst_n	,
	/* user control*/
	output		[15:0]	rx_data_len,
	output		[15:0]	rx_total_len,
	output	reg			update	,
	output	reg	[159:0]	ip_header,
	output	reg	[63:0]	udp_header,
	output	reg	[111:0]	mac		,
	output	reg	[7:0]	data_o	,
	output		[48:0]	src_mac	,
	output		[31:0]	src_addr,
	output		[16:0]	src_port,
	output				DF		,
	output				MF		,
	/* PHY interface*/
	input				e_rxdv	,	
	input		[7:0]	rxd
);

localparam	PRESEMBLE	=	8'h55			;
localparam  PRESTART	=	8'hd5			;
localparam	IP_TYPE		=	16'h0800		;
localparam	UDP_TYPE 	=	8'h11			;
localparam	BROAD_MAC	=	CAN_RECEIVE_BROADCAST ? 48'hffffffffffff : DST_MAC;

localparam	PRE_CNT		=	7		,
			MAC_CNT		=	14		,
			HRD_CNT		=	28		,
			CRC_CNT		=	4		,
			CODE_CNT 	= 	12		;

localparam	IDLE = 4'b0000			, 
			R_PRE = 4'b0010			,
			R_MAC = 4'b0110			,
			R_HEADER = 4'b0111		,
			R_DATA=	4'b0101			,
			R_FIHISH = 4'b0100		;
			
reg	[3:0]	state				/*synthesis preserve*/;
reg	[3:0]	nxt_state			/*synthesis preserve*/;
reg [15:0]	cnt					;
reg [15:0]	rdata_len			;
reg			rxer					;

wire [47:0]	dst_mac_w			;
wire [31:0]	dst_addr_w			;
wire [15:0] dst_port_w			;
wire [7:0]	ip_type				;
wire [15:0] ethernet_type		;

assign	src_mac = mac[63:16]		;
assign	dst_mac_w = mac[111:64]		;
assign	src_addr= ip_header[63:32]	;
assign	dst_addr_w = ip_header[31:0];
assign	src_port= udp_header[63:48]	;
assign	dst_port_w= udp_header[47:32];
assign	ip_type	= ip_header[87:80]	;
assign  ethernet_type = mac[15:0]	;

assign	rx_total_len = ip_header[31:16]	;
assign	rx_data_len	= udp_header[47:32]	;
assign	DF	=	ip_header[33]			;
assign	MF	=	ip_header[34]			;

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
		state	<=	'd0;
	else
		state	<=	nxt_state;
end

always @ (*)
begin
	nxt_state	=	state;
	
	if (rxer)
		nxt_state	=	IDLE;
	else
	begin
		case (state)
		IDLE:
			if (e_rxdv && rxd == PRESEMBLE)
				nxt_state = R_PRE;
		
		R_PRE:
			if (cnt >= PRE_CNT - 16'd1)
				nxt_state = R_MAC;
		
		R_MAC:
			if (cnt >= MAC_CNT - 16'd1)
				nxt_state = R_HEADER;
		
		R_HEADER:
			if (dst_mac_w != DST_MAC && dst_mac_w != BROAD_MAC)
				nxt_state = IDLE;
			else if (cnt >= HRD_CNT - 16'd1)
				nxt_state = R_DATA;
		
		R_DATA:
			if (dst_port_w != DST_PORT || dst_addr_w != DST_ADDR || ip_type != UDP_TYPE)
				nxt_state = IDLE;
			else if (rdata_len <= 16'd9)
				nxt_state = R_FIHISH;
		
		R_FIHISH: nxt_state = IDLE;
		
		default: nxt_state = IDLE;
		endcase
	end
end

//cnt
always @ (posedge clk)
begin
	case (state)
	R_PRE:
	begin
		if (nxt_state != state)
			cnt	<=	16'd0;
		else if ((rxd == PRESEMBLE) && e_rxdv && cnt < PRE_CNT - 16'd1)
			cnt	<=	cnt + 16'd1;
		else if ((rxd == PRESTART) && e_rxdv)
			cnt	<=	cnt + 16'd1;
	end
	
	R_MAC, R_HEADER:
	begin
		if (nxt_state != state)
			cnt <=	'd0;
		else if (e_rxdv)
			cnt	<=	cnt + 16'd1;
	end
	
	default:	cnt	<=	16'd0;
	endcase
end

//ip_header, udp_header, mac
always @ (posedge clk)
begin
	case (state)
	IDLE:
	begin
		ip_header	<=	160'd0;
		udp_header	<=	64'd0;
		mac			<=	112'd0;
	end
	
	R_MAC:
		if (e_rxdv)
			case (cnt)
			16'd0:	mac[111:104] <= rxd;
			16'd1:	mac[103:96] <= rxd;
			16'd2:	mac[95:88] 	<= rxd;
			16'd3:	mac[87:80] 	<= rxd;
			16'd4:	mac[79:72] 	<= rxd;
			16'd5:	mac[71:64] 	<= rxd;
			16'd6:	mac[63:56] 	<= rxd;
			16'd7:	mac[55:48] 	<= rxd;
			16'd8:	mac[47:40] 	<= rxd;
			16'd9:	mac[39:32] 	<= rxd;
			16'd10: 	mac[31:24] 	<= rxd;
			16'd11: 	mac[23:16] 	<= rxd;
			16'd12: 	mac[15:8] 	<= rxd;
			16'd13: 	mac[7:0] 	<= rxd;
			default:;
			endcase
	
	R_HEADER:
		if (e_rxdv)
		begin		
			case (cnt)
			16'd0: ip_header[159:152] <= rxd;
			16'd1: ip_header[151:144] <= rxd;
			16'd2: ip_header[143:136] <= rxd;
			16'd3: ip_header[135:128] <= rxd;
			16'd4: ip_header[127:120] <= rxd;
			16'd5: ip_header[119:112] <= rxd;
			16'd6: ip_header[111:104] <= rxd;
			16'd7: ip_header[103:96] <= rxd;
			16'd8: ip_header[95:88] <= rxd;
			16'd9: ip_header[87:80] <= rxd;
			16'd10: ip_header[79:72] <= rxd;
			16'd11: ip_header[71:64] <= rxd;
			16'd12: ip_header[63:56] <= rxd;
			16'd13: ip_header[55:48] <= rxd;
			16'd14: ip_header[47:40] <= rxd;
			16'd15: ip_header[39:32] <= rxd;
			16'd16: ip_header[31:24] <= rxd;
			16'd17: ip_header[23:16] <= rxd;
			16'd18: ip_header[15:8] <= rxd;
			16'd19: ip_header[7:0] <= rxd;
			16'd20: udp_header[63:56] <= rxd;
			16'd21: udp_header[55:48] <= rxd;
			16'd22: udp_header[47:40] <= rxd;
			16'd23: udp_header[39:32] <= rxd;
			16'd24: udp_header[31:24] <= rxd;
			16'd25: udp_header[23:16] <= rxd;
			16'd26: udp_header[15:8] <= rxd;
			16'd27: udp_header[7:0] <= rxd;
			default: ;
			endcase
		end
	default: ;
	endcase
end

//rdata_len, update, data_o
always @ (posedge clk)
begin
	if (state == R_HEADER)
	begin
		rdata_len <= udp_header[31:16];	
	end
	if (state == R_DATA)
	begin
		if (e_rxdv)
		begin
			rdata_len <=	rdata_len - 16'd1;
			update	<=	1'b1;
			data_o	<=	rxd;
		end
		else
			update	<=	1'b0;
	end
	else
		update	<=	1'b0;
end		
endmodule 		
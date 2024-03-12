/**
	*	@Function: Ethernet Send UDP
	*	@Date		:	2019/05/25
	*	@Vision		:	v1.0
	*	@Note		:
	*	@Author		:	WoodFan
	*	@param	clk		: fpga main clock
	*	@param	rst_n	: active low reset signal
	*	@param	data_i	: data need to be transformed
	*	@param	tx_data_len: amount of data need to be transformed
	*	@param	crc		: crc code
	*	@param	crcen	: crc enable signal
	*	@param	crcrst	: crc reset signal
	*	@param	start	: active high transform
	*	@param	busy	: indicate the module has worked
	*	@param	tx_dv	: High level means data will be sent 
	*	@param	dst_mac : mac address of destination
	*	@param	dst_addr: ip address of destination
	*	@param	dst_port: port of destination
	*	@param	DF		: ip packet parameter
	*	@param	MF		: ip packet parameter
	*	@param	tx_en	: active high when transform
	*	@param	txer	: transform error 
	*	@param	txd		: transform data busy
	*/
module udp_send
#
(
parameter	IP_HEADER_LEN = 4'd5,
parameter	TTL = 8'd128,
/* 192.168.0.3*/
parameter	SRC_ADDR = 32'hc0a80002,
parameter	SRC_PORT = 16'd8000,
parameter	SRC_MAC = 48'h000a3501fec0
)
(
	/* system signal*/
	input				clk		,
	input				rst_n	,
	/* user control*/
	input		[7:0]	data_i	,
	input		[15:0]	tx_data_len,
	input		[31:0]	crc		,
	output	reg			crcen	,
	output	reg			crcrst	,
	
	input				start	,
	output	reg			busy	,
	output	reg			tx_dv	,
	input		[47:0]	dst_mac	,
	input		[31:0]	dst_addr,
	input		[15:0]	dst_port,
	
	input				DF		,
	input				MF		,
	/* PHY interface*/
	output	reg			tx_en	,
	output	reg			txer	,
	output	reg	[7:0]	txd		
);

localparam	PRESEMBLE	=	8'h55	;
localparam  PRESTART	=	8'hd5	;
localparam	IP_TYPE		=	16'h0800;

//counter
localparam	SUM_CNT		=	5,
			PRE_CNT		=	8,
			MAC_CNT		=	14,
			HRD_CNT		=	28,
			CRC_CNT		=	4,
			CODE_CNT 	= 	12;

//FSM state			
localparam	IDLE = 4'b0000, 
			MAKE_IP = 4'b0001,
			MAKE_SUM = 4'b0011,
			SEND_PRE = 4'b0010,
			SEND_MAC = 4'b0110,
			SEND_HEADER = 4'b0111,
			SEND_DATA=	4'b0101,
			SEND_CRC = 4'b0100,
			IDLE_CODE = 4'b1100,
			T_AGAIN	= 4'b1000
			;
			
reg	[159:0]		ip_header			;		
reg	[63:0]		udp_header			;
reg	[3:0]		state					/*synthesis preserve*/;
reg	[3:0]		nxt_state			/*synthesis preserve*/;
reg [15:0]		cnt					;
reg [15:0]		tdata_len			;
reg [31:0]		checksum_r			;
reg [31:0]		checksum_r1			;
reg [31:0]		checksum_r2			;
reg [31:0]		checksum_r3			;
reg [31:0]		checksum_r4			;
reg [31:0]		checksum_r5			;
reg [111:0]		mac					;
reg [15:0]		ip_cnt				;
reg [12:0]		fragment_cnt		;

wire	[15:0]	total_len;
assign	total_len = (IP_HEADER_LEN << 2) + tdata_len;

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
		state	<=	'd0;
	else
		state	<=	nxt_state;
end

always @ (*)
begin
	nxt_state = state;
	case (state)
	IDLE:
		if (start)
			nxt_state = MAKE_IP;
			
	MAKE_IP: nxt_state = MAKE_SUM;
	
	MAKE_SUM: 
		if (cnt >= SUM_CNT - 16'd1)
			nxt_state = SEND_PRE;
	
	SEND_PRE:
		if (cnt >= PRE_CNT - 16'd1)
			nxt_state = SEND_MAC;
			
	SEND_MAC:
		if (cnt >= MAC_CNT - 16'd1)
			nxt_state = SEND_HEADER;
	
	SEND_HEADER:
		if (cnt >= HRD_CNT - 16'd1)
			nxt_state = SEND_DATA;
			
	SEND_DATA:
		if (tdata_len <= 16'd9)	
			nxt_state = SEND_CRC;
			
	SEND_CRC:
		if (cnt >= CRC_CNT - 16'd1)
			nxt_state = IDLE_CODE;
		
	IDLE_CODE:
		if (cnt >= CODE_CNT && start)
			nxt_state = T_AGAIN ;
		else if (cnt >= CODE_CNT)
			nxt_state = IDLE ;

	T_AGAIN: nxt_state = MAKE_IP;
	
	default: nxt_state = IDLE;
	endcase
end

//counter
//cnt
//ip_cnt
//fragment_cnt
//tdata_len
always @ (posedge clk)
begin
	case (state)
	IDLE:
	begin
		cnt	<=	16'd0;
		ip_cnt<=16'd0;
		fragment_cnt<=13'd0;
		tdata_len	<=	tx_data_len + 16'd8;
	end
	
	MAKE_IP:
	begin
		ip_cnt<=	ip_cnt + 16'd1;
		if ({DF, MF} == 2'b01)
			fragment_cnt	<=	fragment_cnt + 13'd1;
		else
			fragment_cnt	<=	13'd0;
	end
	
	MAKE_SUM, SEND_PRE, SEND_MAC, SEND_HEADER, SEND_CRC, IDLE_CODE:
	begin
		if (nxt_state == state)
			cnt	<=	cnt + 16'd1;
		else
			cnt	<=	16'd0;
	end
	
	SEND_DATA: tdata_len <= tdata_len - 16'd1;
			
	T_AGAIN: 
	begin
		cnt <=	16'd0;
		tdata_len	<=	tx_data_len + 16'd8;
	end
	default: ;
	endcase
end

//crc
always @ (posedge clk)
begin
	case (state)
	IDLE:
	begin
		crcen	<=	1'b0;
		crcrst	<=	1'b1;
	end
	
	SEND_MAC:
	begin
		crcen	<=	1'b1;
		crcrst	<=	1'b0;
	end
	
	SEND_DATA:
	begin
		if (state != nxt_state)
		begin
			crcen	<=	1'b0;
		end
	end
	
	IDLE_CODE: crcrst<=1'b1;
	
	default: ;
	endcase
end

//txd
always @ (posedge clk)
begin
	case (state)
	IDLE:
	begin
		ip_header	<=	160'd0;
		udp_header	<=	64'd0;
		
		tx_en		<=	1'b0 ;
		txer		<=	1'b0 ;
		txd			<=	8'd0 ;
		mac			<=	96'd0;
	end
	
	MAKE_IP:
	begin
		/*ipv4 5  total_len*/
		ip_header[159:128]	<=	{4'h4, IP_HEADER_LEN,8'b00,total_len };
		/* counter */
		ip_header[127:112]<=	ip_cnt;
		/* fragment offset*/
		ip_header[111:96]<=	{1'b0, DF, MF, fragment_cnt};
		/* TTL protype checksum*/
		ip_header[95:64]<=	{TTL, 8'h11, 16'd0};
		ip_header[63:32]<=	SRC_ADDR;
		ip_header[31:0]<=dst_addr;
		
		udp_header[63:32] <=	{SRC_PORT, dst_port};
		udp_header[31:0]<= {tdata_len, 16'h0000};
		
		mac	<=	{dst_mac, SRC_MAC, IP_TYPE};
	end
	
	MAKE_SUM:
	begin
		case (cnt)
		16'd0: 
		begin
			checksum_r1	<=	ip_header[15:0] + ip_header[31:16];
			checksum_r2	<=	ip_header[47:32] + ip_header[63:48];
			checksum_r3	<=	ip_header[79:64] + ip_header[95:80];
			checksum_r4	<=	ip_header[111:96] + ip_header[127:112];
			checksum_r5	<=	ip_header[143:128] + ip_header[159:144];
		end
		
		16'd1:
		begin
			checksum_r1 <= checksum_r1 + checksum_r2 + checksum_r3;
			checksum_r4	<=	checksum_r4 + checksum_r5;
		end
		
		16'd2: checksum_r	<=	checksum_r1 + checksum_r4;
		
		16'd3: checksum_r[15:0] <= checksum_r[31:16] + checksum_r[15:0];
		
		16'd4: ip_header[79:64] <= ~checksum_r[15:0];
		default: ;
		endcase
	end
	
	SEND_PRE:
	begin
		if (cnt >= PRE_CNT - 16'd1)
			txd	<=	PRESTART;
		else
			txd	<=	PRESEMBLE;
		tx_en		<=	1'b1;
	end
	
	SEND_MAC:
	begin
		case (cnt)
		16'd0: txd	<=	mac[111:104];
		16'd1: txd	<=	mac[103:96] ;
		16'd2: txd	<=	mac[95:88] 	;
		16'd3: txd	<=	mac[87:80] 	;
		16'd4: txd	<=	mac[79:72] 	;
		16'd5: txd	<=	mac[71:64] 	;
		16'd6: txd	<=	mac[63:56] 	;
		16'd7: txd	<=	mac[55:48] 	;
		16'd8: txd	<=	mac[47:40] 	;
		16'd9: txd	<=	mac[39:32] 	;
		16'd10: txd	<=	mac[31:24] 	;
		16'd11: txd	<=	mac[23:16] 	;
		16'd12: txd	<=	mac[15:8] 	;
		16'd13: txd	<=	mac[7:0] 	;
		default:;
		endcase
	end
	
	SEND_HEADER:
	begin
		case (cnt)
		16'd0: txd <=	ip_header[159:152];
		16'd1: txd <=	ip_header[151:144];
		16'd2: txd <=	ip_header[143:136];
		16'd3: txd <=	ip_header[135:128];
		16'd4: txd <=	ip_header[127:120];
		16'd5: txd <=	ip_header[119:112];
		16'd6: txd <=	ip_header[111:104];
		16'd7: txd <=	ip_header[103:96];
		16'd8: txd <=	ip_header[95:88];
		16'd9: txd <=	ip_header[87:80];
		16'd10: txd <=	ip_header[79:72];
		16'd11: txd <=	ip_header[71:64];
		16'd12: txd <=	ip_header[63:56];
		16'd13: txd <=	ip_header[55:48];
		16'd14: txd <=	ip_header[47:40];
		16'd15: txd <=	ip_header[39:32];
		16'd16: txd <=	ip_header[31:24];
		16'd17: txd <=	ip_header[23:16];
		16'd18: txd <=	ip_header[15:8];
		16'd19: txd <=	ip_header[7:0];
		16'd20: txd <=	udp_header[63:56];
		16'd21: txd <=	udp_header[55:48];
		16'd22: txd <=	udp_header[47:40];
		16'd23: txd <=	udp_header[39:32];
		16'd24: txd <=	udp_header[31:24];
		16'd25: txd <=	udp_header[23:16];
		16'd26: txd <=	udp_header[15:8];
		16'd27: txd <=	udp_header[7:0];
		default: ;
		endcase
	end
	
	SEND_DATA: txd	<=	data_i;
	
	SEND_CRC:
	begin
		case (cnt)
		16'd0: txd <= ~{crc[24], crc[25], crc[26], crc[27], crc[28], crc[29], crc[30], crc[31]};
		16'd1: txd <= ~{crc[16], crc[17], crc[18], crc[19], crc[20], crc[21], crc[22], crc[23]};
		16'd2: txd <= ~{crc[8], crc[9], crc[10], crc[11], crc[12], crc[13], crc[14], crc[15]};
		16'd3: txd <= ~{crc[0], crc[1], crc[1], crc[3], crc[4], crc[5], crc[6], crc[7]};
		default: ;
		endcase
	end
	
	IDLE_CODE: 
	begin
		tx_en<=	1'b0;
		txd <=	8'd0;
	end
	default:;
	endcase
end

//interface signal
always @ (posedge clk)
begin
	case (state)
	IDLE:
		busy	<=	1'b0;
	
	MAKE_IP:
		busy	<=	1'b1;
		
	T_AGAIN:
		busy	<=	1'b0;
	default: ;
	endcase
end

always @ (posedge clk)
begin
	if ((state == SEND_HEADER && (state != nxt_state)) || state == SEND_DATA)
		tx_dv	<=	1'b1;
	else
		tx_dv	<=	1'b0;
end

endmodule 
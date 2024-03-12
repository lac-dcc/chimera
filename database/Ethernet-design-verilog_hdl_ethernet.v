/**
	*	@Function: Ethernet Driver Wrapper 
	*	@Date		:	2019/05/28
	*	@Vision		:	v1.0
	*	@Note		:
	*	@Author		:	WoodFan
	*	@param	clk		: fpga main clock
	*	@param	rst_n	: active low reset signal
	*	@param	e_rxc: receiver clock
	*	@param	e_rxdv: receiver already signal
	*	@param	e_rxer: receiver error signal
	*	@param	e_rxd: receiver data signal 
	*	@param	e_txc: transfer clock (100M ethernet)
	*	@param	e_gtxc: transfer clock (1000M ethernet)
	*	@param	e_txen : transfer data enable signal
	*	@param	e_txer : transfer error signal
	*	@param	e_txd: transfer data siganl
	*	@param	e_reset: phy reset signal 
	*	@param	e_mdc : phy register clock
	*	@param	e_mdio : phy register IO
	*	@param	data_tx	: data need to be sent
	*	@param	data_len_tx: amount of data need to be sent
	*	@param	cvt_tx	: active high start transfer work
	*	@param	busy_tx	: active high transfer working
	*	@param	dv_tx : active high enter data to be sent in turn
	*	@param	dst_mac : mac address of destination
	*	@param	dst_addr: ip address of destination
	*	@param	dst_port: port of destination
	*	@param	DF_rx		: ip packet parameter
	*	@param	MF_tx		: ip packet parameter
	*	@param	rx_data_len: amount of receive data
	*	@param	rx_total_len: amount of IP packet
	*	@param	update_rx: active high data update
	*	@param	data_rx: receive data
	*	@param	src_mac	: source mac addr
	*	@param	src_addr: source ip addr
	*	@param	src_port: source port addr
	*	@param	DF_rx		: ip packet parameter
	*	@param	MF_tx		: ip packet parameter
	*	@param	r_ip : total receive IP packet header
	*	@param	r_udp : total receive UDP packet header
	*	@param	r_mac : total receive mac packet
	*/

module ethernet
#
(
parameter	TTL = 8'd128,
/* 192.168.0.3*/
parameter	TX_SRC_ADDR = 32'hc0a80002,
parameter	TX_SRC_PORT = 16'd8000,
parameter	TX_SRC_MAC = 48'h000a3501fec0,

/* 192.168.0.2*/
parameter	RX_CAN_RECEIVE_BROADCAST = 1,
parameter	RX_DST_ADDR = 32'hc0a80002,
parameter	RX_DST_PORT = 16'd8000,
parameter	RX_DST_MAC	= 48'h000a3501fec0
)
(
	/* system signal*/
	input				clk		,
	input				rst_n	,
	/* rx interface */
	input				e_rxc	,			//125Mhz
	input				e_rxdv	,
	input				e_rxer	,
	input	[7:0]		e_rxd	,
	/* tx interface */
	input				e_txc	,
	output				e_gtxc	,
	output				e_txen	,
	output				e_txer	,
	output	[7:0]		e_txd	,
	/* PHY setting interface */
	output				e_reset	,
	output				e_mdc	,
	inout				e_mdio  ,
	/* Control signal*/
		/* tx */
	input	[7:0]		data_tx	,
	input	[15:0]		data_len_tx,
	input				cvt_tx	,
	output				busy_tx	,
	output				dv_tx	,
	input	[47:0]		dst_mac	,
	input	[31:0]		dst_addr,
	input	[15:0]		dst_port,
	input				DF_tx	,
	input				MF_tx	,
		/* rx */
	output	[15:0]		rx_data_len,
	output	[15:0]		rx_total_len,
	output				update_rx,
	output	[7:0]		data_rx	 ,
	output	[47:0]		src_mac	,
	output	[31:0]		src_addr,
	output	[15:0]		src_port,
	output				DF_rx	,
	output				MF_rx	,
	output	[159:0]		r_ip	,
	output	[63:0]		r_udp	,
	output	[111:0]		r_mac	
);

global g_inst(
	.in(e_rxc),
	.out(e_gtxc)
);

//assign	e_gtxc = e_rxc;	//125Mhz
assign	e_reset = 1'b1;
assign  e_mdio = 1'bz;

wire	[31:0]		crc;
wire				crcen;
wire 				crcrst;

wire	[7:0]		txd_r;

//genvar j;
//generate for (j = 0; j <= 7; j = j + 1)
//begin: buf_inst
io_buf_iobuf_out_b0t io_inst
	( 
	.datain(txd_r),
	.dataout(e_txd)
	) ;
//end
//endgenerate
	
	
udp_send
#
(
.TTL 		(TTL)			,
.SRC_ADDR (TX_SRC_ADDR)	,
.SRC_PORT (TX_SRC_PORT)	,
.SRC_MAC  (TX_SRC_MAC)
)
udp_s_inst(
	/* system signal*/
	.clk		(e_gtxc),
	.rst_n		(rst_n),
	/* user control*/
	.data_i		(data_tx),
	.tx_data_len(data_len_tx),
	.crc		(crc),
	.crcen		(crcen),
	.crcrst		(crcrst),
	
	.start		(cvt_tx),
	.busy		(busy_tx),
	.tx_dv		(dv_tx),
	.dst_mac	(dst_mac),
	.dst_addr	(dst_addr),
	.dst_port	(dst_port),
	.DF			(DF_tx),
	.MF			(MF_tx),
	/* PHY interface*/
	.tx_en		(e_txen),
	.txer		(e_txer),
	//.txd		(e_txd)
	.txd		(txd_r)
);

crc crc_inst
(
.Clk	(e_gtxc), 
.Reset	(crcrst), 
.Data_in(e_txd), 
.Enable	(crcen), 
.Crc	(crc),
.CrcNext()
);


udp_receive
#
(
.CAN_RECEIVE_BROADCAST (RX_CAN_RECEIVE_BROADCAST),
.DST_ADDR 			   (RX_DST_ADDR)			,
.DST_PORT 			   (RX_DST_PORT)			,
.DST_MAC			   (RX_DST_MAC)
)
udp_r_inst(
	/* system signal*/
	.clk		(e_rxc),
	.rst_n		(rst_n),
	/* user control*/
	.rx_data_len(rx_data_len),
	.rx_total_len(rx_total_len),
	.update		(update_rx),
	.ip_header	(r_ip),
	.udp_header	(r_udp),
	.mac		(r_mac),
	.data_o		(data_rx),
	.src_mac	(src_mac),
	.src_addr	(src_addr),
	.src_port	(src_port),
	.DF			(DF_rx),
	.MF			(MF_rx),
	/* PHY interface*/
	.e_rxdv		(e_rxdv),	
	.rxd		(e_rxd)
);

endmodule 
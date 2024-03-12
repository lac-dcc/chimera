module ethernet_top
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
	inout					e_mdio  
);

ethernet
e_inst
(
	/* system signal*/
	.clk		(e_rxc),
	.rst_n		(rst_n),
	/* rx interface */
	.e_rxc	(e_rxc	),			//125Mhz
	.e_rxdv	(e_rxdv	),
	.e_rxer	(e_rxer	),
	.e_rxd	(e_rxd	),
	/* tx interface */
	.e_txc	(e_txc	),
	.e_gtxc	(e_gtxc	),
	.e_txen	(e_txen	),
	.e_txer	(e_txer	),
	.e_txd	(e_txd	),
	/* PHY setting interface */
	.e_reset(e_reset),
	.e_mdc	(e_mdc	),
	.e_mdio (e_mdio ),
	/* Control signal*/
		/* tx */
	.data_tx	(8'h66),
	.data_len_tx(16'd1000),
	.cvt_tx		(1'b1),
	.busy_tx	(),
	.dv_tx		(),
	.dst_mac	(48'h305a3aea6538),
	.dst_addr	(32'hc0a80003),
	.dst_port	(16'd8080),
	.DF_tx		(1'b1),
	.MF_tx		(1'b0),
		/* rx */
	.rx_data_len(),
	.rx_total_len(),
	.update_rx	(),
	.data_rx	(),
	.src_mac	(),
	.src_addr	(),
	.src_port	(),
	.DF_rx		(),
	.MF_rx		(),
	.r_ip		(),
	.r_udp		(),
	.r_mac		()
);

endmodule 
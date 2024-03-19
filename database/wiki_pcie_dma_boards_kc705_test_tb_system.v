`timescale 1ps / 1ps
`define SIMULATION
`define ENABLE_XGMII01
`define ENABLE_PCIE
`define	ENABLE_REQUESTER
`define	ENABLE_SERVER
//`include "../rtl/setup.v"
module tb_system();

/* 125, 156.25 and 250MHz clock */
reg clk156, clk125, clk250;
initial begin
	clk125 = 0;
	clk156 = 0;
	clk250 = 0;
end
always #10 clk125 = ~clk125;
always #8  clk156 = ~clk156;
always #5  clk250 = ~clk250;
reg sys_rst;

// regs
reg user_clk;
reg user_reset;
reg user_lnk_up;

reg s_axis_tx_tready = 1'b1;
wire [63:0] s_axis_tx_tdata;
wire [7:0] s_axis_tx_tkeep;
wire s_axis_tx_tlast;
wire s_axis_tx_tvalid;
wire tx_src_dsc;

reg [63:0] m_axis_rx_tdata;
reg [7:0] m_axis_rx_tkeep;
reg m_axis_rx_tlast;
reg m_axis_rx_tvalid;
wire m_axis_rx_tready;
reg [21:0]  m_axis_rx_tuser;

reg cfg_to_turnoff = 1'b0;
wire cfg_turnoff_ok;

reg [7:0] cfg_bus_number = 8'h2;
reg [4:0] cfg_device_number = 5'h2;
reg [2:0] cfg_function_number = 3'h0;
wire [15:0] cfg_completer_id;
assign cfg_completer_id = {cfg_bus_number, cfg_device_number, cfg_function_number};

// PCIe user registers
wire [31:0] if_v4addr;
wire [47:0] if_macaddr;
wire [31:0] dest_v4addr;
wire [47:0] dest_macaddr;

// XGMII
reg xgmii_clk;
wire [63:0] xgmii_0_txd;
wire [ 7:0] xgmii_0_txc;
reg [63:0] xgmii_0_rxd;
reg [ 7:0] xgmii_0_rxc;

// LED and Switches
reg [7:0] dipsw;
wire [7:0] led;
wire [13:0] segled;
reg btn;

PIO PIO_insta (
	.sys_rst(sys_rst),

	.user_clk(clk250),
	.user_reset(sys_rst),
	.user_lnk_up(1'b1),

	// AXIS
	.s_axis_tx_tready(s_axis_tx_tready),
	.s_axis_tx_tdata(s_axis_tx_tdata),
	.s_axis_tx_tkeep(s_axis_tx_tkeep),
	.s_axis_tx_tlast(s_axis_tx_tlast),
	.s_axis_tx_tvalid(s_axis_tx_tvalid),
	.tx_src_dsc(tx_src_dsc),

	.m_axis_rx_tdata(m_axis_rx_tdata),
	.m_axis_rx_tkeep(m_axis_rx_tkeep),
	.m_axis_rx_tlast(m_axis_rx_tlast),
	.m_axis_rx_tvalid(m_axis_rx_tvalid),
	.m_axis_rx_tready(m_axis_rx_tready),
	.m_axis_rx_tuser(m_axis_rx_tuser),

	.cfg_to_turnoff(cfg_to_turnoff),
	.cfg_turnoff_ok(cfg_turnoff_ok),

	.cfg_completer_id(cfg_completer_id),

	// PCIe user registers
	.if_v4addr(if_v4addr),
	.if_macaddr(if_macaddr),
	.dest_v4addr(dest_v4addr),
	.dest_macaddr(dest_macaddr),

	// XGMII
	.xgmii_clk(clk156),
	.xgmii_0_txd(xgmii_0_txd),
	.xgmii_0_txc(xgmii_0_txc),
	.xgmii_0_rxd(xgmii_rxd),
	.xgmii_0_rxc(xgmii_rxc)
);

task waitclock;
begin
	@(posedge clk250);
//	#1;
end
endtask

reg [103:0] tlp_rom [0:4095];
reg [71:0] xgmii_rom [0:4095];
reg [11:0] tlp_counter = 0, xgmii_counter = 0;
wire [103:0] tlp_cur;
wire [71:0] xgmii_cur;
reg [7:0] xgmii_rxc;
reg [63:0] xgmii_rxd;
assign tlp_cur = tlp_rom[ tlp_counter ];
assign xgmii_cur = xgmii_rom[ xgmii_counter ];

always @(posedge clk156) begin
//	if (xgmii_0_txc != 8'hff)
		$display("%02x %016x", xgmii_0_txc, xgmii_0_txd);
end

always @(posedge clk250) begin
	m_axis_rx_tdata <= tlp_cur[63:0];
	m_axis_rx_tkeep <= tlp_cur[71:64];
	m_axis_rx_tuser <= {6'b000000, tlp_cur[87:72]};
	m_axis_rx_tlast <= tlp_cur[88];
	m_axis_rx_tvalid <= tlp_cur[92];
	tlp_counter <= tlp_counter + 1;
end

always @(posedge clk156) begin
	xgmii_rxc <= xgmii_cur[71:64];
	xgmii_rxd <= xgmii_cur[63:0];
	xgmii_counter <= xgmii_counter + 1;
end

initial begin
        $dumpfile("./test.vcd");
	$dumpvars(0, tb_system); 
	$readmemh("./tlp_data.hex", tlp_rom);
	$readmemh("./xgmii_data.hex", xgmii_rom);
	/* Reset / Initialize our logic */
	sys_rst = 1'b1;

	waitclock;
	waitclock;

	sys_rst = 1'b0;
	waitclock;
	waitclock;

//	force tb_system.PIO_insta.PIO_EP_inst.afifo72_w250_r156_0.din = 72'h0000;
//	force tb_system.PIO_insta.PIO_EP_inst.afifo72_w250_r156_0.wr_en = 1'h1;
//	waitclock;
//	waitclock;
//	release tb_system.PIO_insta.PIO_EP_inst.afifo72_w250_r156_0.din;
//	release tb_system.PIO_insta.PIO_EP_inst.afifo72_w250_r156_0.wr_en;

//	#(500*16) mst_req_o = 1'b1;

//	#(8*2) mst_req_o = 1'b0;

	#4000;

	$finish;
end

endmodule

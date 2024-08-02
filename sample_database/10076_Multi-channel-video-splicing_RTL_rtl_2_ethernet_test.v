// This program was cloned from: https://github.com/MongooseOrion/Multi-channel-video-splicing
// License: GNU General Public License v3.0

`timescale 1ns / 1ps  
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    ethernet_test 
//////////////////////////////////////////////////////////////////////////////////
module ethernet_test(
    input         sys_clk,
    input         video_clk, 
    input         rst_n,
	output[3:0]   rgmii_txd,
	output        rgmii_txctl,
	output        rgmii_txc,
	input[3:0]    rgmii_rxd,
	input         rgmii_rxctl,
	input         rgmii_rxc,
    output        led,
    output [7:0]           udp_rec_ram_rdata ,//ram读数据,用来读取以太网发送过来的存储到ram的数据
    input [10:0]          udp_rec_ram_read_addr, //ram读地址
    
    output               udp_rec_data_valid  //接受到pc机用以太网发送的数据有效的标志位，高有效
    );

wire            reset_n;
wire   [ 7:0]   gmii_txd;
wire            gmii_tx_en;
wire            gmii_tx_er;
wire            gmii_tx_clk;
wire            gmii_crs;
wire            gmii_col;
wire   [ 7:0]   gmii_rxd;
wire            gmii_rx_dv;
wire            gmii_rx_er;
wire            gmii_rx_clk;
wire  [ 1:0]    speed_selection; // 1x gigabit, 01 100Mbps, 00 10mbps
wire            duplex_mode;     // 1 full, 0 half
wire            rgmii_rxcpll;
assign speed_selection = 2'b10;
assign duplex_mode = 1'b1;


util_gmii_to_rgmii util_gmii_to_rgmii_m0(
	.reset(1'b0),
	
	.rgmii_td(rgmii_txd),
	.rgmii_tx_ctl(rgmii_txctl),
	.rgmii_txc(rgmii_txc),
	.rgmii_rd(rgmii_rxd),
	.rgmii_rx_ctl(rgmii_rxctl),
	.gmii_rx_clk(gmii_rx_clk),
	.gmii_txd(gmii_txd),
	.gmii_tx_en(gmii_tx_en),
	.gmii_tx_er(1'b0),
	.gmii_tx_clk(gmii_tx_clk),
	.gmii_crs(gmii_crs),
	.gmii_col(gmii_col),
	.gmii_rxd(gmii_rxd),
    .rgmii_rxc(rgmii_rxc),//add
	.gmii_rx_dv(gmii_rx_dv),
	.gmii_rx_er(gmii_rx_er),
	.speed_selection(speed_selection),
	.duplex_mode(duplex_mode),
    .led(led),
    .pll_phase_shft_lock(pll_phase_shft_lock),
    .clk(clk),
    .sys_clk(sys_clk)
	);

assign gmii_tx_clk_test=~gmii_tx_clk;


mac_test mac_test0
(

    .gmii_tx_clk            (gmii_tx_clk),
    .gmii_rx_clk            (gmii_rx_clk) ,
    .rst_n                  (rst_n),
    .gmii_rx_dv             (gmii_rx_dv),
    .gmii_rxd               (gmii_rxd ),
    .gmii_tx_en             (gmii_tx_en),
    .gmii_txd               (gmii_txd ),
    .udp_rec_ram_rdata      (udp_rec_ram_rdata) ,
    .udp_rec_ram_read_addr  (udp_rec_ram_read_addr) , 
    .video_clk              (video_clk) ,
    .udp_rec_data_valid     (udp_rec_data_valid)
); 

endmodule

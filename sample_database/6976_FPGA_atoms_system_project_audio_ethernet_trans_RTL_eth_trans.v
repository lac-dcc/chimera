// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

// 数据以太网传输
module eth_trans (

    input                       sys_clk,                    // 50MHz
    input                       rst_n,
    output                      led,
    // 输入数据
    input           vin_clk/*synthesis PAP_MARK_DEBUG="1"*/,
    input           vin_sck/*synthesis PAP_MARK_DEBUG="1"*/,
    input [16:0]    vin_ldata,
    input [16:0]    vin_rdata,

    // RJ45 网口时序
    output                      e_mdc,                      //MDIO的时钟信号，用于读写PHY的寄存器
    inout                       e_mdio,                     //MDIO的数据信号，用于读写PHY的寄存器                         
    output [3:0]                rgmii_txd,                  //RGMII 发送数据
    output                      rgmii_txctl,                //RGMII 发送有效信号
    output                      rgmii_txc,                  //125Mhz ethernet rgmii tx clock
    input    [3:0]              rgmii_rxd,                  //RGMII 接收数据
    input                       rgmii_rxctl,                //RGMII 接收数据有效信号
    input                       rgmii_rxc                   //125Mhz ethernet gmii rx clock    
);

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

wire            voice_vsync;
wire            voice_href;
wire [7:0]      voice_ldata;
wire            voice_vsync_delay;
wire            voice_href_delay;
wire [7:0]      voice_ldata_delay;



//MDIO config
assign speed_selection = 2'b10;
assign duplex_mode = 1'b1;


voice_trans_cache u_voice_trans_cache(
    .sck                    (vin_sck),
    .dlrc                   (vin_clk),
    .rst                    (rst_n),
    .ldata_in               (vin_ldata),
    .rdata_in               (),
    .voice_href             (voice_href),
    .voice_vsync            (voice_vsync),
    .ldata_out              (voice_ldata),
    .rdata_out              ()
);


util_gmii_to_rgmii util_gmii_to_rgmii_m0(
	.reset          (1'b0),
	
	.rgmii_td                   (rgmii_txd),
	.rgmii_tx_ctl               (rgmii_txctl),
	.rgmii_txc                  (rgmii_txc),
	.rgmii_rd                   (rgmii_rxd),
	.rgmii_rx_ctl               (rgmii_rxctl),
	.gmii_rx_clk                (gmii_rx_clk),
	.gmii_txd                   (gmii_txd),
	.gmii_tx_en                 (gmii_tx_en),
	.gmii_tx_er                 (1'b0),
	.gmii_tx_clk                (gmii_tx_clk),
	.gmii_crs                   (gmii_crs),
	.gmii_col                   (gmii_col),
	.gmii_rxd                   (gmii_rxd),
    .rgmii_rxc                  (rgmii_rxc),//add
	.gmii_rx_dv                 (gmii_rx_dv),
	.gmii_rx_er                 (gmii_rx_er),
	.speed_selection            (speed_selection),
	.duplex_mode                (duplex_mode),
    .led                        (led),
    .pll_phase_shft_lock        (),
    .clk                        (),
    .sys_clk                    (sys_clk)
	);


camera_delay signal_delay_inst(
   .cmos_pclk          (vin_sck),              //cmos pxiel clock
   .cmos_href          (voice_href),              //cmos hsync refrence
   .cmos_vsync         (voice_vsync),             //cmos vsync
   .cmos_data          (voice_ldata),              //cmos data

   .cmos_href_delay    (voice_href_delay),              //cmos hsync refrence
   .cmos_vsync_delay   (voice_vsync_delay),             //cmos vsync
   .cmos_data_delay    (voice_ldata_delay)             //cmos data
) ;

//////////////////// CMOS FIFO/////////////////// 
wire [10:0] fifo_data_count/*synthesis PAP_MARK_DEBUG="1"*/;
wire [7:0]  fifo_data;
wire        fifo_rd_en/*synthesis PAP_MARK_DEBUG="1"*/;

pre_trans_fifo u_pre_trans_fifo(
    .wr_clk             (vin_sck),
    .wr_rst             (voice_vsync),
    .wr_en              (voice_href_delay),
    .wr_data            (voice_ldata_delay), // addr: [11:0], data: [7:0]
    .wr_full            (),
    .wr_water_level     (),
    .almost_full        (),
    .rd_clk             (gmii_rx_clk),
    .rd_rst             (voice_vsync),
    .rd_en              (fifo_rd_en),
    .rd_data            (fifo_data),
    .rd_empty           (),
    .rd_water_level     (fifo_data_count),
    .almost_empty       ()
);

mac_test mac_top (
 .gmii_tx_clk            (gmii_tx_clk        ),
 .gmii_rx_clk            (gmii_rx_clk        ) ,
 .rst_n                  (rst_n              ),
 
 .cmos_vsync              (voice_vsync       ),
 .cmos_href               (voice_href        ),
 .reg_conf_done           (reg_conf_done     ),
 .fifo_data               (fifo_data         ),         
 .fifo_data_count         (fifo_data_count   ),            
 .fifo_rd_en              (fifo_rd_en        ),    
 
 
 .udp_send_data_length   (16'd1024           ), 
 .gmii_rx_dv             (gmii_rx_dv         ),
 .gmii_rxd               (gmii_rxd           ),
 .gmii_tx_en             (gmii_tx_en         ),
 .gmii_txd               (gmii_txd           )
 
);	

endmodule
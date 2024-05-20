// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

// 数据以太网传输
module eth_trans (

    input                       sys_clk,                    // 50MHz
    //input                       key,
    input                       rst_n,
    input                       rst_n_test,
    output                      led,
    // 输入图像数据
    input           vin_clk,
    input [7:0]     vin_data,
    //input           vin_pclk,
    input           vin_vsync,
    input           vin_hsync,

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

wire [7:0]      cmos_db;
wire            cmos_pclk;
wire            cmos_vsync;
wire            cmos_href;
wire            cmos_vsync_delay;
wire            cmos_href_delay;
wire [7:0]      cmos_data_delay;


assign cmos_pclk = vin_clk;
assign cmos_href = vin_hsync;
assign cmos_vsync = vin_vsync;
assign cmos_db = vin_data;

//MDIO config
assign speed_selection = 2'b10;
assign duplex_mode = 1'b1;


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


camera_delay camera_delay_inst(
   .cmos_pclk          (cmos_pclk),              //cmos pxiel clock
   .cmos_href          (cmos_href),              //cmos hsync refrence
   .cmos_vsync         (cmos_vsync),             //cmos vsync
   .cmos_data          (cmos_db),              //cmos data

   .cmos_href_delay    (cmos_href_delay),              //cmos hsync refrence
   .cmos_vsync_delay   (cmos_vsync_delay),             //cmos vsync
   .cmos_data_delay    (cmos_data_delay)             //cmos data
) ;

//////////////////// CMOS FIFO/////////////////// 
wire [10:0] fifo_data_count;
wire [7:0]  fifo_data;
wire        fifo_rd_en;

camera_fifo camera_fifo_inst(
    .wr_clk             (cmos_pclk),
    .wr_rst             (cmos_vsync),
    .wr_en              (cmos_href_delay),
    .wr_data            (cmos_data_delay),
    .wr_full            (),
    .wr_water_level     (),
    .almost_full        (),                 // 1020
    .rd_clk             (gmii_rx_clk),
    .rd_rst             (cmos_vsync),
    .rd_en              (fifo_rd_en),
    .rd_data            (fifo_data),
    .rd_empty           (),
    .rd_water_level     (fifo_data_count),
    .almost_empty       ()                  // 4
);

mac_test mac_top (
 .gmii_tx_clk            (gmii_tx_clk        ),
 .gmii_rx_clk            (gmii_rx_clk        ) ,
 .rst_n                  (rst_n              ),
 
 .cmos_vsync              (cmos_vsync        ),
 .cmos_href               (cmos_href         ),
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
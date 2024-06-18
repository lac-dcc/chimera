// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

/* =======================================================================
* Copyright (c) 2023, MongooseOrion.
* All rights reserved.
*
* The following code snippet may contain portions that are derived from
* OPEN-SOURCE communities, and these portions will be licensed with: 
*
* <NULL>
*
* If there is no OPEN-SOURCE licenses are listed, it indicates none of
* content in this Code document is sourced from OPEN-SOURCE communities. 
*
* In this case, the document is protected by copyright, and any use of
* all or part of its content by individuals, organizations, or companies
* without authorization is prohibited, unless the project repository
* associated with this document has added relevant OPEN-SOURCE licenses
* by github.com/MongooseOrion. 
*
* Please make sure using the content of this document in accordance with 
* the respective OPEN-SOURCE licenses. 
* 
* THIS CODE IS PROVIDED BY https://github.com/MongooseOrion. 
* FILE ENCODER TYPE: GBK
* ========================================================================
*/
// 顶层文件
//
`define CMOS_1          // 选择要修改的相机源
module fpga_top#(
    parameter MEM_ROW_ADDR_WIDTH   = 15         ,
	parameter MEM_COL_ADDR_WIDTH   = 10         ,
	parameter MEM_BADDR_WIDTH      = 3          ,
	parameter MEM_DQ_WIDTH         =  32        ,
	parameter MEM_DQS_WIDTH        =  32/8      
)
(
    input                               sys_clk                 ,
    input                               sys_rst                 ,

    //cmos1	
    output                              cmos_init_led           ,
    inout                               cmos1_scl               ,//cmos1 i2c 
    inout                               cmos1_sda               ,//cmos1 i2c 
    input                               cmos1_vsync             ,//cmos1 vsync
    input                               cmos1_href              ,//cmos1 hsync refrence,data valid
    input                               cmos1_pclk              ,//cmos1 pixel clock
    input   [7:0]                       cmos1_data              ,//cmos1 data
    output                              cmos1_reset             ,//cmos1 reset
    //cmos2
    inout                               cmos2_scl               ,//cmos2 i2c 
    inout                               cmos2_sda               ,//cmos2 i2c 
    input                               cmos2_vsync             ,//cmos2 vsync
    input                               cmos2_href              ,//cmos2 hsync refrence,data valid
    input                               cmos2_pclk              ,//cmos2 pxiel clock
    input   [7:0]                       cmos2_data              ,//cmos2 data
    output                              cmos2_reset             ,//cmos2 reset
    
    // RJ45 网口时序
    output                      e_mdc                               ,//MDIO的时钟信号，用于读写PHY的寄存器
    inout                       e_mdio                              ,//MDIO的数据信号，用于读写PHY的寄存器                         
    output [3:0]                rgmii_txd                           ,//RGMII 发送数据
    output                      rgmii_txctl                         ,//RGMII 发送有效信号
    output                      rgmii_txc                           ,//125Mhz ethernet rgmii tx clock
    input    [3:0]              rgmii_rxd                           ,//RGMII 接收数据
    input                       rgmii_rxctl                         ,//RGMII 接收数据有效信号
    input                       rgmii_rxc                           ,//125Mhz ethernet rgmii RX clock
    output                      eth_init                             // LED_6
);


// cmos
wire                        cmos_scl            ;//cmos i2c clock
wire                        cmos_sda            ;//cmos i2c data
wire                        cmos_vsync          ;//cmos vsync
wire                        cmos_href           ;//cmos hsync refrence,data valid
wire                        cmos_pclk           ;//cmos pxiel clock
wire   [7:0]                cmos_data           ;//cmos data
wire                        cmos_reset          ;//cmos reset
wire                        initial_en          ;
wire [1:0]                  cmos_init_done      ;

wire                        clk_50M             ;
wire                        clk_25M             ;
wire                        eth_clk             ;

wire                        vin_clk             ;
wire [7:0]                  vin_data            ;
wire                        vin_vsync           ;
wire                        vin_hsync           ;

reg [7:0]                   cmos1_d_d0          ;
reg                         cmos1_href_d0       ;
reg                         cmos1_vsync_d0      ;
reg [7:0]                   cmos2_d_d0          ;
reg                         cmos2_href_d0       ;
reg                         cmos2_vsync_d0      ;
reg                         reg_cmos_init       ;

assign cmos_init_led = reg_cmos_init;


//
// clk
//
sys_pll u_sys_pll(
    .pll_rst    (!sys_rst   ),      // input
    .clkin1     (sys_clk    ),        // input
    .pll_lock   (pll_lock   ),    // output
    .clkout0    (clk_50M    ),      // output
    .clkout1    (clk_25M    )       // output
);


//
// 配置 CMOS
// OV5640 register configure enable    
power_on_delay	power_on_delay_inst(
    .clk_50M                 (clk_50M       ),//input
    .reset_n                 (1'b1           ),//input	
    .camera1_rstn            (cmos1_reset    ),//output
    .camera2_rstn            (cmos2_reset    ),//output	
    .camera_pwnd             (               ),//output
    .initial_en              (initial_en     ) //output		
);

// CMOS1 Camera 
reg_config_1	coms1_reg_config(
    .clk_25M                 (clk_25M            ),//input
    .camera_rstn             (cmos1_reset        ),//input
    .initial_en              (initial_en         ),//input		
    .i2c_sclk                (cmos1_scl          ),//output
    .i2c_sdat                (cmos1_sda          ),//inout
    .reg_conf_done           (cmos_init_done[0]     ),//output config_finished
    .reg_index               (                   ),//output reg [8:0]
    .clock_20k               (                   ) //output reg
);

// CMOS2 Camera 
reg_config_1	coms2_reg_config(
    .clk_25M                 (clk_25M            ),//input
    .camera_rstn             (cmos2_reset        ),//input
    .initial_en              (initial_en         ),//input		
    .i2c_sclk                (cmos2_scl          ),//output
    .i2c_sdat                (cmos2_sda          ),//inout
    .reg_conf_done           (cmos_init_done[1]  ),//output config_finished
    .reg_index               (                   ),//output reg [8:0]
    .clock_20k               (                   ) //output reg
);


// 
// 使信号稳定
// CMOS1
always@(posedge cmos1_pclk)begin
    cmos1_d_d0        <= cmos1_data    ;
    cmos1_href_d0     <= cmos1_href    ;
    cmos1_vsync_d0    <= cmos1_vsync   ;
end

// CMOS2
always@(posedge cmos2_pclk)begin
    cmos2_d_d0        <= cmos2_data    ;
    cmos2_href_d0     <= cmos2_href    ;
    cmos2_vsync_d0    <= cmos2_vsync   ;
end


//
// 选择的相机源
//
`ifdef CMOS_1
assign     vin_clk      =    cmos1_pclk         ;
assign     vin_vsync    =    cmos1_vsync_d0     ;
assign     vin_hsync    =    cmos1_href_d0      ;
assign     vin_data     =    cmos1_d_d0         ;
`elsif CMOS_2
assign     vin_clk      =    cmos2_pclk         ;
assign     vin_vsync    =    cmos2_vsync_d0     ;
assign     vin_hsync    =    cmos2_href_d0      ;
assign     vin_data     =    cmos2_d_d0         ;
`endif


//
// cmos 初始化信号
//
always @(posedge clk_50M or negedge sys_rst) begin
    if(!sys_rst) begin
        reg_cmos_init <= 'b0;
    end
    else if(cmos_init_done == 2'b11) begin
        reg_cmos_init <= 1'b1;
    end
    else begin
        reg_cmos_init <= reg_cmos_init;
    end
end


//
// 以太网传输模块
//
eth_trans  trans_sys  (
    .sys_clk        (clk_50M    ),
    .rst_n          (sys_rst    ),
    .led            (eth_init   ),

    .vin_clk        (vin_clk    ),
    .vin_data       (vin_data   ),
    .vin_vsync      (vin_vsync  ),
    .vin_hsync      (vin_hsync  ),

    .e_mdc          (e_mdc),
    .e_mdio         (e_mdio),
    .rgmii_txd      (rgmii_txd),
    .rgmii_txctl    (rgmii_txctl),
    .rgmii_txc      (rgmii_txc),
    .rgmii_rxd      (rgmii_rxd),
    .rgmii_rxctl    (rgmii_rxctl),
    .rgmii_rxc      (rgmii_rxc)
);

endmodule
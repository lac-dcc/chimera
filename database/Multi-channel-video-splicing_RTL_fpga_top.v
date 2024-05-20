// This program was cloned from: https://github.com/MongooseOrion/Multi-channel-video-splicing
// License: GNU General Public License v3.0

/* =======================================================================
* Copyright (c) 2023, MongooseOrion.
* All rights reserved.
*
* The following code snippet may contain portions that are derived from
* OPEN-SOURCE communities, and these portions will be licensed with: 
*
* <GNU General Public License v3.0>
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
* FILE ENCODER TYPE: GB2312
* ========================================================================
*/
//
// 项目顶层文件（主要）

`timescale 1ns / 1ps

module fpga_top#(
    parameter MEM_ROW_ADDR_WIDTH   = 15,
	parameter MEM_COL_ADDR_WIDTH   = 10,
	parameter MEM_BADDR_WIDTH      = 3,
	parameter MEM_DQ_WIDTH         = 32,
	parameter MEM_DQS_WIDTH        = 32/8
)(
    input                                   sys_clk         ,   // 50MHz
    input                                   sys_rst         ,   // 低电平复位
    
    // Cam1	
    inout                                   cmos1_scl       ,   // cmos1 i2c 
    inout                                   cmos1_sda       ,   // cmos1 i2c 
    input                                   cmos1_vsync     ,   // cmos1 vsync
    input                                   cmos1_href      ,   // cmos1 hsync refrence,data valid
    input                                   cmos1_pclk      ,   // cmos1 pixel clock
    input       [7:0]                       cmos1_data      ,   // cmos1 data
    output                                  cmos1_reset     ,   // cmos1 reset
    // Cam2
    inout                                   cmos2_scl       ,   // cmos2 i2c 
    inout                                   cmos2_sda       ,   // cmos2 i2c 
    input                                   cmos2_vsync     ,   // cmos2 vsync
    input                                   cmos2_href      ,   // cmos2 hsync refrence,data valid
    input                                   cmos2_pclk      ,   // cmos2 pxiel clock
    input       [7:0]                       cmos2_data      ,   // cmos2 data
    output                                  cmos2_reset     ,   // cmos2 reset
    // DDR
    output                                  mem_rst_n       ,
    output                                  mem_ck          ,
    output                                  mem_ck_n        ,
    output                                  mem_cke         ,
    output                                  mem_cs_n        ,
    output                                  mem_ras_n       ,
    output                                  mem_cas_n       ,
    output                                  mem_we_n        ,
    output                                  mem_odt         ,
    output      [MEM_ROW_ADDR_WIDTH-1:0]    mem_a           ,
    output      [MEM_BADDR_WIDTH-1:0]       mem_ba          ,
    inout       [MEM_DQ_WIDTH/8-1:0]        mem_dqs         ,
    inout       [MEM_DQ_WIDTH/8-1:0]        mem_dqs_n       ,
    inout       [MEM_DQ_WIDTH-1:0]          mem_dq          ,
    output      [MEM_DQ_WIDTH/8-1:0]        mem_dm          ,
    // MS72xx
    output                                  rstn_out        ,
    output                                  iic_tx_scl      ,   // HDMI_OUT
    inout                                   iic_tx_sda      ,
    output                                  iic_scl         ,   // HDMI_IN
    inout                                   iic_sda         , 
    // HDMI_IN
    input                                   pix_clk_in      ,                  
    input                                   vs_in           , 
    input                                   hs_in           , 
    input                                   de_in           ,
    input       [7:0]                       r_in            , 
    input       [7:0]                       g_in            , 
    input       [7:0]                       b_in            ,
    // HDMI_OUT
    output                                  pix_clk_out     ,                           
    output reg                              vs_out          , 
    output reg                              hs_out          , 
    output reg                              de_out          /*synthesis PAP_MARK_DEBUG="1"*/,
    output reg  [7:0]                       r_out           , 
    output reg  [7:0]                       g_out           , 
    output reg  [7:0]                       b_out           ,
    // RJ45                       
    output      [3:0]                       rgmii_txd       ,//RGMII 发送数据
    output                                  rgmii_txctl     ,//RGMII 发送有效信号
    output                                  rgmii_txc       ,//125Mhz ethernet rgmii tx clock
    input       [3:0]                       rgmii_rxd       ,//RGMII 接收数据
    input                                   rgmii_rxctl     ,//RGMII 接收数据有效信号
    input                                   rgmii_rxc       ,//125Mhz ethernet rgmii RX clock
    // UART
    input                                   uart_rx         ,
    output                                  uart_tx         ,
    // 初始化成功
    output reg                              hardware_init_done,
    output reg                              process_init_done
);

// 初始化 DDR
parameter CTRL_ADDR_WIDTH = MEM_ROW_ADDR_WIDTH + MEM_BADDR_WIDTH + MEM_COL_ADDR_WIDTH;//28

wire                        cfg_clk             ;
wire                        clk_25M             ;
wire                        clk_50M             ;
wire [3:0]                  ctrl_command        ;
wire [3:0]                  value_command       ;
wire [7:0]                  command_in          ;
wire                        command_in_flag     ;
wire                        cmos_scl            ;   //cmos i2c clock
wire                        cmos_sda            ;   //cmos i2c data
wire                        cmos_vsync          ;   //cmos vsync
wire                        cmos_href           ;   //cmos hsync refrence,data valid
wire                        cmos_pclk           ;   //cmos pxiel clock
wire [7:0]                  cmos_data           ;   //cmos data
wire                        cmos_reset          ;   //cmos reset
wire                        initial_en          ;   
wire [15:0]                 cmos1_d_16bit       ;   
wire                        cmos1_href_16bit    ;   
wire                        cmos1_pclk_16bit    ;   
wire                        cmos2_pclk_16bit    ;   
wire [15:0]                 cmos2_d_16bit       ;   
wire                        cmos2_href_16bit    ;   
wire                        cmos_fusion_href    ;
wire                        cmos_fusion_vsync   ;
wire [15:0]                 cmos_fusion_data    ;
wire                        hdmi_vs_out         ;
wire                        hdmi_de_out         ;
wire [15:0]                 rgb565_hdmi         ;
wire [15:0]                 i_rgb565            ;
wire                        pclk_in_buf         ;    
wire                        vs_in_buf           ;
wire                        de_in_buf           ;
wire [15:0]                 rgb565_1            ;
wire [15:0]                 rgb565_2            ;
wire                        de_re               /*synthesis PAP_MARK_DEBUG="1"*/;
wire                        init_done           ;
wire                        vsync_post_1        ;
wire                        hsync_post_1        ;
wire                        href_post_1         ;
wire [15:0]                 rgb565_post_1       ;
wire                        vsync_post_2        ;
wire                        hsync_post_2        ;
wire                        href_post_2         ;
wire [23:0]                 rgb888_post_2       ;
wire                        vsync_final         ;
wire                        hsync_final         ;
wire                        href_final          ;
wire [23:0]                 rgb888_final        ;
wire [2:0]                  channel_index       ;
wire [8:0]                  angle_num           ;           
wire [10:0]                 scale_value         ; 
wire [1:0]                  cmos_init_done      ;
wire                        hdmi_init_done      ;
wire                        ddr_init_done       ;     

reg  [15:0]                 rstn_1ms            ;
reg                         cmos1_href_d0       ;
reg                         cmos1_vsync_d0      ;
reg  [7:0]                  cmos1_d_d0          ;
reg  [7:0]                  cmos2_d_d0          ;
reg                         cmos2_href_d0       ;
reg                         cmos2_vsync_d0      ;

//axi bus   
wire [CTRL_ADDR_WIDTH-1:0]  axi_awaddr          ;
wire                        axi_awuser_ap       ;
wire [3:0]                  axi_awuser_id       ;
wire [3:0]                  axi_awlen           ;
wire                        axi_awready         ;
wire                        axi_awvalid         ;
wire [MEM_DQ_WIDTH*8-1:0]   axi_wdata           ;
wire [MEM_DQ_WIDTH*8/8-1:0] axi_wstrb           ;
wire                        axi_wready          ;
wire [3:0]                  axi_wusero_id       ;
wire                        axi_wusero_last     ;
wire [CTRL_ADDR_WIDTH-1:0]  axi_araddr          ;
wire                        axi_aruser_ap       ;
wire [3:0]                  axi_aruser_id       ;
wire [3:0]                  axi_arlen           ;
wire                        axi_arready         ;
wire                        axi_arvalid         ;
wire [MEM_DQ_WIDTH*8-1:0]   axi_rdata           ;
wire                        axi_rvalid          ;
wire [3:0]                  axi_rid             ;
wire                        axi_rlast           ;

//
// PLL
pll_top clock_manager (
    .clkin1     (sys_clk),          // 50MHz
    // pixel_clk: 37.125M 30fps; 74.25MHz 720p60fps; 148.5MHz 1080p60fps
    .clkout0    (pix_clk_out),    
    .clkout1    (cfg_clk),          // 10MHz
    .clkout2    (clk_25M),          // 25M
    .clkout3    (clk_50M),          // 50MHz
    .pll_lock   (locked),
    .pll_rst    (!sys_rst)
);


//
// UART 指令控制，[7:4] 指令通道，[3:0] 值通道
uart_trans command_ctrl(
    .clk                    (clk_50M),
    .rst                    (sys_rst),
    .uart_rx                (uart_rx),
    .uart_tx                (uart_tx),
    .command_in             (command_in     ),  // 用于传回电脑校验信号
    .command_in_flag        (command_in_flag),
    .ctrl_command_out       (ctrl_command ),
    .value_command_out      (value_command),
    .command_out_flag       (command_in_flag)
);


//
// 配置 7200 和 7210
ms72xx_ctl ms72xx_ctl(
    .clk             (cfg_clk),
    .rst_n           (rstn_out),
    .init_over_tx    (init_over_tx),                                
    .init_over_rx    (init_over_rx),
    .iic_tx_scl      (iic_tx_scl),
    .iic_tx_sda      (iic_tx_sda), 
    .iic_scl         (iic_scl), 
    .iic_sda         (iic_sda) 
);
assign    hdmi_init_done    =    init_over_tx; 

always @(posedge cfg_clk) begin
    if(!locked) begin
        rstn_1ms <= 16'd0;
    end
    else begin
        if(rstn_1ms == 16'h2710) begin
            rstn_1ms <= rstn_1ms;
        end
        else
            rstn_1ms <= rstn_1ms + 1'b1;
    end
end
assign rstn_out = (rstn_1ms == 16'h2710);


//
// 配置 CMOS
// OV5640 寄存器功能配置   
power_on_delay	power_on_delay_inst(
    .clk_50M                 (sys_clk),
    .reset_n                 (1'b1),	
    .camera1_rstn            (cmos1_reset),
    .camera2_rstn            (cmos2_reset),	
    .camera_pwnd             (),
    .initial_en              (initial_en) 		
);
// Camera_1
reg_config	cmos1_reg_config(
    .clk_25M                 (clk_25M),             //input
    .camera_rstn             (cmos1_reset),         //input
    .initial_en              (initial_en),          //input		
    .i2c_sclk                (cmos1_scl),           //output
    .i2c_sdat                (cmos1_sda),           //inout
    .reg_conf_done           (cmos_init_done[0]),   //output config_finished
    .reg_index               (),                    //output reg [8:0]
    .clock_20k               ()                     //output reg
);

// Camera_2
reg_config	cmos2_reg_config(
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
// 8bit 拼 RGB565 数据
// CMOS1
always@(posedge cmos1_pclk) begin
    cmos1_d_d0        <= cmos1_data    ;
    cmos1_href_d0     <= cmos1_href    ;
    cmos1_vsync_d0    <= cmos1_vsync   ;
end
cmos_8_16bit cmos1_8_16bit(
    .pclk           (cmos1_pclk),//input
    .rst_n          (cmos_init_done[0]),//input
    .pdata_i        (cmos1_d_d0),//input[7:0]
    .de_i           (cmos1_href_d0),//input
    .vs_i           (cmos1_vsync_d0),//input
    
    .pixel_clk      (cmos1_pclk_16bit),//output
    .pdata_o        (cmos1_d_16bit),//output[15:0]
    .de_o           (cmos1_href_16bit) //output
);

// CMOS2
always@(posedge cmos2_pclk) begin
    cmos2_d_d0        <= cmos2_data    ;
    cmos2_href_d0     <= cmos2_href    ;
    cmos2_vsync_d0    <= cmos2_vsync   ;
end

cmos_8_16bit cmos2_8_16bit(
    .pclk           (cmos2_pclk),//input
    .rst_n          (cmos_init_done[1]),//input
    .pdata_i        (cmos2_d_d0),//input[7:0]
    .de_i           (cmos2_href_d0),//input
    .vs_i           (cmos2_vsync_d0),//input
    
    .pixel_clk      (cmos2_pclk_16bit),//output
    .pdata_o        (cmos2_d_16bit),//output[15:0]
    .de_o           (cmos2_href_16bit) //output
);

// 分别拼合 cmos1 和 cmos2 的 rgb565 每像素数据
assign rgb565_1 = {cmos1_d_16bit[4:0],cmos1_d_16bit[10:5],cmos1_d_16bit[15:11]}; //{r,g,b}
assign rgb565_2 = {cmos2_d_16bit[4:0],cmos2_d_16bit[10:5],cmos2_d_16bit[15:11]}; //{r,g,b}


//
// 双目摄像头数据融合
video_fusion u_video_fusion(
    .rst                (sys_rst),
    .cmos1_pclk         (cmos1_pclk_16bit),
    .cmos1_href         (cmos1_href_16bit),
    .cmos1_vsync        (cmos1_vsync_d0),
    .cmos1_data         (rgb565_1),
    .cmos2_pclk         (cmos2_pclk_16bit),
    .cmos2_href         (cmos2_href_16bit),
    .cmos2_vsync        (cmos2_vsync_d0),
    .cmos2_data         (rgb565_2),
    
    .cmos_fusion_href   (cmos_fusion_href),
    .cmos_fusion_vsync  (cmos_fusion_vsync),
    .cmos_fusion_data   (cmos_fusion_data)
);


//
// HDMI_IN 数据处理
hdmi_data_in u_hdmi_data_in(
    .hdmi_pix_clk_in    (pix_clk_in),
    .rst                (sys_rst),
    .red_in             (r_in),
    .green_in           (g_in),
    .blue_in            (b_in),
    .vs_in              (vs_in),
    .de_in              (de_in),

    .vs_out             (hdmi_vs_out),
    .de_out             (hdmi_de_out),
    .rgb565_out         (rgb565_hdmi)
);


//
// 图像数据多路载入
image_global multi_image_load(
    .sys_clk                (clk_50M),
    .ddr_clk                (core_clk),
    .sys_rst                (sys_rst),
    .ddr_init               (ddr_init_done  ),
    .ctrl_command_in        (ctrl_command   ),
    .value_command_in       (value_command  ),
    .command_flag           (command_in_flag  ),

    .channel_index          (channel_index  ),
    .scale_value            (scale_value    ),
    .angle_num              (angle_num      ),

    .cmos1_pclk             (cmos1_pclk_16bit   ),
    .cmos1_href             (cmos1_href_16bit   ),
    .cmos1_vsync            (cmos1_vsync_d0     ),
    .cmos1_pix_data         (rgb565_1           ),
    .cmos2_pclk             (cmos2_pclk_16bit   ),
    .cmos2_href             (cmos2_href_16bit   ),
    .cmos2_vsync            (cmos2_vsync_d0     ),
    .cmos2_pix_data         (rgb565_2           ),
    .cmos_fusion_pclk       (cmos1_pclk_16bit   ),
    .cmos_fusion_href       (cmos_fusion_href   ),
    .cmos_fusion_vsync      (cmos_fusion_vsync  ),
    .cmos_fusion_data       (cmos_fusion_data   ),
    .hdmi_pclk              (pix_clk_in         ),
    .hdmi_href              (hdmi_de_out),
    .hdmi_vsync             (hdmi_vs_out),
    .hdmi_pix_data          (rgb565_hdmi),

    .vesa_out_clk           (pix_clk_out),
    .vesa_out_vsync         (vsync_post_1),
    .vesa_out_de            (de_re),
    .de_out                 (href_post_1),
    .vesa_out_data          (rgb565_post_1),

    .axi_awaddr             (axi_awaddr     ),
    .axi_awid               (axi_awuser_id  ),
    .axi_awlen              (axi_awlen      ),
    .axi_awsize             (     ),
    .axi_awburst            (    ),
    .axi_awready            (axi_awready    ),
    .axi_awvalid            (axi_awvalid    ),
    .axi_wdata              (axi_wdata      ),
    .axi_wstrb              (axi_wstrb      ),
    .axi_wlast              (axi_wusero_last),
    .axi_wvalid             (     ),
    .axi_wready             (axi_wready     ),
    .axi_bid                (axi_bid        ),
    .axi_araddr             (axi_araddr     ),
    .axi_arid               (axi_aruser_id  ),
    .axi_arlen              (axi_arlen      ),
    .axi_arsize             (     ),
    .axi_arburst            (    ),
    .axi_arvalid            (axi_arvalid    ),
    .axi_arready            (axi_arready    ),
    .axi_rready             (     ),
    .axi_rdata              (axi_rdata      ),
    .axi_rvalid             (axi_rvalid     ),
    .axi_rlast              (axi_rlast      ),
    .axi_rid                (axi_rid        ),

    .init_done              (init_done)
);


//
// 用于 HDMI_out 的像素数据、行场同步信号数据
always@(posedge pix_clk_out) begin
    r_out <= {rgb888_final[23:16]};
    g_out <= {rgb888_final[15:8]};
    b_out <= {rgb888_final[7:0]}; 
    vs_out <= vsync_final;
    hs_out <= hsync_final;
    de_out <= href_final;
end


//
// 产生 HDMI_VESA 协议时序 
sync_vg sync_vg(                            
    .clk            (pix_clk_out    ),      //input                   clk,                                 
    .rstn           (init_done      ),        //input                   rstn,                            
    .vs_out         (vsync_post_1   ),             //output reg              vs_out,                                                                                                                                      
    .hs_out         (hsync_post_1   ),             //output reg              hs_out,            
    .de_out         (href_1         ),                     //output reg              de_out, 
    .de_re          (de_re          )    
);


//
// 网口字符数据传入，接在最后输出的视频信息上
ethernet_character u_ethernet_character(
    .sys_clk                (clk_50M),         		 
    .rst_n		            (sys_rst),

    .channel_index          (channel_index),
    .scale_value            (scale_value  ),            // 输入的比例数字，高7位是整数部分，低4位是小数部分
    .angle_num              (angle_num    ),            // 输入的角度数字，3位十进制

    .video_clk	            (pix_clk_out),
    .video_vsync            (vsync_post_1  ),   
    .video_hsync            (hsync_post_1  ),      
    .video_href             (href_post_1   ),
    .video_data_in          (rgb565_post_1),
    .hdmi_vsync             (vsync_post_2),
    .hdmi_hsync             (hsync_post_2),
    .hdmi_href              (href_post_2),
    .hdmi_data              (rgb888_post_2),
   
    .rgmii_txd              (rgmii_txd   ),
    .rgmii_txctl            (rgmii_txctl ),
    .rgmii_txc              (rgmii_txc   ),
    .rgmii_rxd              (rgmii_rxd   ),
    .rgmii_rxctl            (rgmii_rxctl ),
    .rgmii_rxc              (rgmii_rxc   )
);


//
// 亮度、色相和灰阶调整
image_adjust u_image_adjust(
    .sys_clk            (clk_50M),
    .rst_n              (sys_rst),       
    .pclk               (pix_clk_out),          
    .i_hs               (hsync_post_2),        
    .i_vs               (vsync_post_2),        
    .i_de               (href_post_2),	     
    .i_data             (rgb888_post_2),  
    .command_flag       (command_in_flag),    // 作为亮度加减的标志信号
    .ctrl_command_in    (ctrl_command), 
    .value_command_in   (value_command),    
    .o_hs               (hsync_final),        
    .o_vs               (vsync_final),        
    .o_de               (href_final),        
    .o_data             (rgb888_final)       
);


//
// DDR
ddr u_ddr (
    .ref_clk                   (clk_50M            ),
    .resetn                    (rstn_out           ),// input
    .ddr_init_done             (ddr_init_done      ),// output
    .ddrphy_clkin              (core_clk           ),// output
    .pll_lock                  (pll_lock           ),// output

    .axi_awaddr                (axi_awaddr         ),// input [27:0]
    .axi_awuser_ap             (1'b0               ),// input
    .axi_awuser_id             (axi_awuser_id      ),// input [3:0]
    .axi_awlen                 (axi_awlen          ),// input [3:0]
    .axi_awready               (axi_awready        ),// output
    .axi_awvalid               (axi_awvalid        ),// input
    .axi_wdata                 (axi_wdata          ),
    .axi_wstrb                 (axi_wstrb          ),// input [31:0]
    .axi_wready                (axi_wready         ),// output
    .axi_wusero_id             (                   ),// output [3:0]
    .axi_wusero_last           (axi_wusero_last    ),// output
    .axi_araddr                (axi_araddr         ),// input [27:0]
    .axi_aruser_ap             (1'b0               ),// input
    .axi_aruser_id             (axi_aruser_id      ),// input [3:0]
    .axi_arlen                 (axi_arlen          ),// input [3:0]
    .axi_arready               (axi_arready        ),// output
    .axi_arvalid               (axi_arvalid        ),// input
    .axi_rdata                 (axi_rdata          ),// output [255:0]
    .axi_rid                   (axi_rid            ),// output [3:0]
    .axi_rlast                 (axi_rlast          ),// output
    .axi_rvalid                (axi_rvalid         ),// output

    .apb_clk                   (1'b0               ),// input
    .apb_rst_n                 (1'b1               ),// input
    .apb_sel                   (1'b0               ),// input
    .apb_enable                (1'b0               ),// input
    .apb_addr                  (8'b0               ),// input [7:0]
    .apb_write                 (1'b0               ),// input
    .apb_ready                 (                   ), // output
    .apb_wdata                 (16'b0              ),// input [15:0]
    .apb_rdata                 (                   ),// output [15:0]
    .apb_int                   (                   ),// output

    .mem_rst_n                 (mem_rst_n          ),// output
    .mem_ck                    (mem_ck             ),// output
    .mem_ck_n                  (mem_ck_n           ),// output
    .mem_cke                   (mem_cke            ),// output
    .mem_cs_n                  (mem_cs_n           ),// output
    .mem_ras_n                 (mem_ras_n          ),// output
    .mem_cas_n                 (mem_cas_n          ),// output
    .mem_we_n                  (mem_we_n           ),// output
    .mem_odt                   (mem_odt            ),// output
    .mem_a                     (mem_a              ),// output [14:0]
    .mem_ba                    (mem_ba             ),// output [2:0]
    .mem_dqs                   (mem_dqs            ),// inout [3:0]
    .mem_dqs_n                 (mem_dqs_n          ),// inout [3:0]
    .mem_dq                    (mem_dq             ),// inout [31:0]
    .mem_dm                    (mem_dm             ),// output [3:0]
    //debug
    .debug_data                (                   ),// output [135:0]
    .debug_slice_state         (                   ),// output [51:0]
    .debug_calib_ctrl          (                   ),// output [21:0]
    .ck_dly_set_bin            (                   ),// output [7:0]
    .force_ck_dly_en           (1'b0               ),// input
    .force_ck_dly_set_bin      (8'h05              ),// input [7:0]
    .dll_step                  (                   ),// output [7:0]
    .dll_lock                  (                   ),// output
    .init_read_clk_ctrl        (2'b0               ),// input [1:0]
    .init_slip_step            (4'b0               ),// input [3:0]
    .force_read_clk_ctrl       (1'b0               ),// input
    .ddrphy_gate_update_en     (1'b0               ),// input
    .update_com_val_err_flag   (                   ),// output [3:0]
    .rd_fake_stop              (1'b0               ) // input
);


// 初始化的信号使 LED 亮起
always @(posedge clk_50M or negedge sys_rst) begin
    if(!sys_rst) begin
        hardware_init_done <= 'b0;
    end
    else if((ddr_init_done == 1'b1) && (hdmi_init_done == 1'b1) && (cmos_init_done == 2'b11)) begin
        hardware_init_done <= 1'b1;
    end
    else begin
        hardware_init_done <= hardware_init_done;
    end
end

always @(posedge clk_50M or negedge sys_rst) begin
    if(!sys_rst) begin
        process_init_done <= 'b0;
    end
    else if(init_done) begin
        process_init_done <= 1'b1;
    end
    else begin
        process_init_done <= process_init_done;
    end
end
                 

endmodule

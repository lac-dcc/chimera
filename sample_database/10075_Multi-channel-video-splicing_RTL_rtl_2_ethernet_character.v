// This program was cloned from: https://github.com/MongooseOrion/Multi-channel-video-splicing
// License: GNU General Public License v3.0

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
// 通过网口传输字符数据，并通过 HDMI 显示
//
module ethernet_character(
    input                       sys_clk		    ,
    input                       rst_n		    ,
    // VESA 图像信号输入
    input  						video_clk	    ,
    input  						video_vsync	    ,
    input						video_hsync	    ,
    input   					video_href      ,
    input [15:0]			    video_data_in   ,
    input [3:0]                 ctrl_command_in ,
    input [3:0]                 value_command_in,
    input                       command_flag    ,

    // 输入的信息
    input [2:0]                 channel_index,
    input [8:0]                 angle_num,              // 输入的角度数字，3位十进制
    input [10:0]                scale_value,            // 输入的比例数字，高7位是整数部分，低4位是小数部分

    // HDMI 图像信号
    output  					hdmi_vsync      ,
    output  					hdmi_hsync      ,
    output  					hdmi_href       ,
    output  	[23:0]			hdmi_data       ,
    // 以太网
    output		[3:0]           rgmii_txd       ,
    output                      rgmii_txctl     ,
    output                      rgmii_txc       ,
    input		[3:0]           rgmii_rxd       ,
    input                       rgmii_rxctl     ,
    input                       rgmii_rxc       
);

wire [23:0]                     i_data;
wire                            osd_hs;
wire                            osd_vs;
wire                            osd_de;
wire [23:0]						osd_data;

wire [7:0]                      udp_rec_ram_rdata;
wire [10:0]                     udp_rec_ram_read_addr;
wire                            udp_rec_data_valid;

assign hdmi_hsync = osd_hs;
assign hdmi_vsync = osd_vs;
assign hdmi_href = osd_de;
assign hdmi_data = osd_data;

assign i_data = {video_data_in[15:11],3'b0,
                video_data_in[10:5],2'b0,
                video_data_in[4:0],3'b0};


// 显示字符的模块
osd_display #(
    .x_start1   (12'd1000   ),      //更改显示区域起始位置，要注意剩余的区域不能比显示区域小
    .y_start1   (12'd270    ),
    .interval   (8'd90      ),             //修改此处改变行间隔
    .color_char (24'hffffff )      //更改字符颜色
) osd_display_m0(
    .rst_n                 (rst_n                       ), 
    .pclk                  (video_clk                   ),
    .i_hs                  (video_hsync                 ),
    .i_vs                  (video_vsync                 ),
    .i_de                  (video_href                  ),
    .i_data                (i_data  	    			),
    .o_hs                  (osd_hs                      ),
    .o_vs                  (osd_vs                      ),
    .o_de                  (osd_de                      ),
    .o_data                (osd_data                    ),
    .ram_addr              (udp_rec_ram_read_addr       ), //output，输出读取ram的地址
    .udp_rec_data_valid    (udp_rec_data_valid          ),
    .channel_index         (channel_index                          ), //当前使用的通道
    .i_data_char           (udp_rec_ram_rdata           ),                            
    .angle_num             (angle_num                       ),     //总共9位，输入的角度值，3位十进制              
    .scale_value           (scale_value             )      //总共11位，输入的比例值，高7位是整数部分，低4位是小数部分 
);


//以太网接收数据的模块
ethernet_test rec_data(
    .sys_clk                   (sys_clk                 ),
    .video_clk                 (video_clk               ), 
    .rst_n                     (rst_n                   ),
    .rgmii_txd                 (rgmii_txd               ),
    .rgmii_txctl               (rgmii_txctl             ),
    .rgmii_txc                 (rgmii_txc               ),
    .rgmii_rxd                 (rgmii_rxd               ),
    .rgmii_rxctl               (rgmii_rxctl             ),
    .rgmii_rxc                 (rgmii_rxc               ),
    .led                       (),
    .udp_rec_ram_rdata         (udp_rec_ram_rdata       ) ,//ram读数据
    .udp_rec_ram_read_addr     (udp_rec_ram_read_addr   ), //ram读地址
    .udp_rec_data_valid        (udp_rec_data_valid      )  
);



endmodule
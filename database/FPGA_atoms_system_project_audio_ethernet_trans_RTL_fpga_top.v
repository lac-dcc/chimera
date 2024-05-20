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
// 顶层
//
module fpga_top(

    input               sys_clk                 ,//50MHz
    input               sys_rst                 ,
    
    //ES7243E  ADC  in
    output              es7243_scl              ,//CCLK
    inout               es7243_sda              ,//CDATA
    output              es0_mclk                ,//MCLK  clk_12M
    input               es0_sdin                ,//SDOUT i2s数据输入             i2s_sdin
    input               es0_dsclk               ,//SCLK  i2s数据时钟             i2s_sck   
    input               es0_alrck               ,//LRCK  i2s数据左右信道帧时钟     i2s_ws
    
    //ES8156  DAC   out
    output              es8156_scl              ,//CCLK
    inout               es8156_sda              ,//CDATA 
    output              es1_mclk                ,//MCLK  clk_12M
    input               es1_sdin                ,//SDOUT 回放信号反馈？
    output              es1_sdout               ,//SDIN  DAC i2s数据输出          i2s_sdout
    input               es1_dsclk               ,//SCLK  i2s数据位时钟            i2s_sck
    input               es1_dlrc                ,//LRCK  i2s数据左右信道帧时钟      i2s_ws
    
    //  
    input               lin_detect              ,//麦克风插入检测
    input               lout_detect             ,//扬声器检测
    output              insert_detect_led       ,
    output              codec_init              ,

    // RJ45
    output              e_mdc                   ,//MDIO的时钟信号，用于读写PHY的寄存器
    inout               e_mdio                  ,//MDIO的数据信号，用于读写PHY的寄存器  
    output  [3:0]       rgmii_txd               ,//RGMII 发送数据
    output              rgmii_txctl             ,//RGMII 发送有效信号
    output              rgmii_txc               ,//125Mhz ethernet rgmii tx clock
    input   [3:0]       rgmii_rxd               ,//RGMII 接收数据
    input               rgmii_rxctl             ,//RGMII 接收数据有效信号
    input               rgmii_rxc               ,//125Mhz ethernet rgmii RX clock
    output              eth_init
);


wire            locked          ;
wire            rstn_out        ;
wire            es7243_init     ;
wire            es8156_init     ;
wire            clk_12M         ;
wire            clk_50M         ;
wire [15:0]     rx_data         ;
wire            rx_l_vld        ;
wire            rx_r_vld        ;
wire [15:0]     ldata_out       ;
wire [15:0]     rdata_out       ;
wire [15:0]     ldata_out1      ;
wire [15:0]     rdata_out1      ;
wire [15:0]     ldata           ;
wire [15:0]     rdata           ;

reg  [19:0]     rstn_1ms        ;
reg             insert_detect   ;

assign es0_mclk = clk_12M;
assign es1_mclk = clk_12M;
assign codec_init = es7243_init && es8156_init;
assign insert_detect_led = insert_detect;


// 检测是否插入麦克风和扬声器，然后亮灯
always @(posedge clk_50M or negedge sys_rst) begin
    if(!sys_rst) begin
        insert_detect <= 'b0;
    end
    else if((lin_detect == 1'b0) && (lout_detect == 1'b0)) begin
        insert_detect <= 1'b1;
    end
    else begin
        insert_detect <= 1'b0;
    end
end


//
// 时钟
sys_pll u_sys_pll (
    .clkin1       (sys_clk   ),   // input//50MHz
    .pll_lock     (locked    ),   // output
    .clkout0      (clk_12M   ),    // output//12.288MHz
    .clkout1      (clk_50M   )
);


//
// 生成上电延迟复位信号
always @(posedge clk_12M)
begin
    if(!locked|!sys_rst)
        rstn_1ms <= 20'h0;
    else
    begin
        if(rstn_1ms == 20'h50000)
            rstn_1ms <= rstn_1ms;
        else
            rstn_1ms <= rstn_1ms + 1'b1;
    end
end
assign rstn_out = (rstn_1ms == 20'h50000);


//
// 音频输入输出芯片 i2s 寄存器配置
ES7243E_reg_config	ES7243E_reg_config(
    .clk_12M                 (clk_12M           ),//input
    .rstn                    (rstn_out          ),//input	
    .i2c_sclk                (es7243_scl        ),//output，配置的引脚
    .i2c_sdat                (es7243_sda        ),//inout，配置的引脚
    .reg_conf_done           (es7243_init       ),//output config_finished
    .clock_i2c               (clock_i2c)
);
ES8156_reg_config	ES8156_reg_config(
    .clk_12M                 (clk_12M           ),//input
    .rstn                    (rstn_out            ),//input	
    .i2c_sclk                (es8156_scl        ),//output
    .i2c_sdat                (es8156_sda        ),//inout
    .reg_conf_done           (es8156_init       )//output config_finished
);


// 
// ES7243E
pgr_i2s_rx#(
    .DATA_WIDTH(16)
)ES7243_i2s_rx(
    .rst_n          (es7243_init      ),// input

    .sck            (es0_dsclk        ),// input
    .ws             (es0_alrck        ),// input
    .sda            (es0_sdin         ),// input

    .data           (rx_data          ),// output[15:0]  //接收到的左右声道的数据，是混在一起的
    .l_vld          (rx_l_vld         ),// output
    .r_vld          (rx_r_vld         ) // output
);


//
// ES8156
pgr_i2s_tx#(
    .DATA_WIDTH(16)
)ES8156_i2s_tx(
    .rst_n          (es8156_init    ),// input

    .sck            (es1_dsclk      ),// input  //SCLK  i2s数据位时钟  
    .ws             (es1_dlrc       ),// input  //LRCK  i2s数据左右信道帧时钟 
    .sda            (es1_sdout      ),// output //SDIN  DAC i2s数据输出

    .ldata          (ldata          ),// input[15:0]
    .l_req          (          ),// output
    .rdata          (rdata          ),// input[15:0]
    .r_req          (          ) // output
);


//
// 将从 ADC 接收的数据按 i2s 时序分离为左右声道数据
i2s_loop#(
    .DATA_WIDTH(16)
)i2s_loop(
    .rst_n          (codec_init),// input
    .sck            (es0_dsclk  ),// input
    .ldata          (ldata      ),// output[15:0]
    .rdata          (rdata      ),// output[15:0]
    .data           (rx_data    ),// input[15:0]   //根据左右声道的时序将左右声道的数据分离成ldata，rdata
    .r_vld          (rx_r_vld   ),// input
    .l_vld          (rx_l_vld   ) // input
);


//
// 音频元数据 UDP 发送
eth_trans u_eth_trans(
    .sys_clk        (clk_50M    ),
    .rst_n          (rstn_out   ),
    .led            (eth_init   ),

    .vin_clk        (es1_dlrc   ),
    .vin_sck        (es1_dsclk  ),
    .vin_ldata      (ldata      ),

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

/************************************************************************************************
*  Name         :top.v
*  Description  :AZURE SHORT WAVE SDR USB(CY7C68013A),USE HDSDR.这是一个直采样短波SDR项目，用一片
*                AD9235直接采样天线的电压变化，经过简单处理上传到PC的HDSDR进行解调。接收效果由你的天线决定。
*                默认采样率变化：40MSPS->40/20=2MSPS->2/2=1MSPS->USB
*  Origin       :200319
*               :200404
*  Author       :helrori2011@gmail.com
************************************************************************************************/
module   top
(
   input             clk_50M     ,
   input             rst_n       ,
   //USB2.0 CY7C68013A
   inout    [15:0]   USB_FD      ,
   output            USB_PKTADR0 ,
   output            USB_PKTADR1 ,
   output            USB_SLRD    ,
   output            USB_SLWR    ,
   output            USB_PKTEND  ,
   output            USB_SLOE    ,
   input             USB_FLAGA   ,
   input             USB_FLAGB   ,
   output            USB_IFCLK   ,
   output            USB_SLCS    ,//config as gpio
   //ADC AD9235 40MSPS 12bits signed
   input             EXT_1       ,
   input             EXT_2       ,
   input             EXT_3       ,
   input             EXT_4       ,
   input             EXT_5       ,
   input             EXT_6       ,
   input             EXT_7       ,
   input             EXT_8       ,
   input             EXT_9       ,
   input             EXT_10      ,
   input             EXT_11      ,
   input             EXT_12      ,
   input             EXT_13      ,
   input             EXT_14      ,
   output            EXT_15      ,
   input             EXT_16      ,

   output   [7:0]    LED
);
wire              ADC_CLK;
assign            EXT_15      = ADC_CLK;
wire     [11:0]   ADC_DAT     = {EXT_1,EXT_4,EXT_3,EXT_8,EXT_7,EXT_10,EXT_9,EXT_12,EXT_11,EXT_14,EXT_13,EXT_16};
wire              ADC_OTR     = EXT_2;

wire rst_n_;
wire [31:0]freq;
wire [11:0]fsin_o,fcos_o;
wire [15:0]mul_sin,mul_cos;
wire [15:0]cic_sin,cic_cos;
wire       val_sin,val_cos;
wire [31:0]fir_sin,fir_cos;
wire       firval_sin,firval_cos;
assign     LED = freq[7:0];
wire       clk_24m,clk_24m_180;
pll pll(
   .inclk0     (clk_50M    ),
   .areset     (~rst_n     ),
   .c0         (ADC_CLK    ),// 40MHz
   .c1         (clk_24m    ),// 24MHz 
   .c2         (clk_24m_180),// 24MHz-200
   .locked     (rst_n_     )
);

nco nco_0 ( // ALTERA IP DDS
   .clk        ( ADC_CLK      ),       // clk.clk
   .reset_n    ( rst_n_       ),       // rst.reset_n
   .clken      ( 1'd1         ),       //  in.clken
   .phi_inc_i  ( freq  [31:0] ),       //    .phi_inc_i
   .fsin_o     ( fsin_o[11:0] ),       // out.fsin_o
   .fcos_o     ( fcos_o[11:0] ),       //    .fcos_o
   .out_valid  (              )        //    .out_valid
);


mul2 mul2_0 // 乘法器
(
   .clk         ( ADC_CLK        ),        
   .rst_n       ( rst_n_         ),
   .din         ( ADC_DAT[11:0]  ),
   .ain         ( fsin_o [11:0]  ),
   .bin         ( fcos_o [11:0]  ),
   .aout        ( mul_sin[15:0]  ),
   .bout        ( mul_cos[15:0]  )
);

cic_dec //抽取滤波器
#(
    .R          ( 20       ),   // Decimation factor
    .M          ( 2        ),   // Differential delay 1 or 2
    .N          ( 5        ),   // Number of stages
    .BIN        ( 16       ),   // Input data width
    .COUT       ( 16       ),   // Output dout_cut width
    .CUT_METHOD ("ROUND"   ),   // 
    .fs         (40_000_000),   // Sampling rate
    .BOUT       ( 43       )    // 为防止溢出错误，请手动计算 BOUT=(BIN + $clog2((R*M)**N)), 其中$clog2是log2运算后向上取整，'**'表示次方运算 20 43 200 60
)cic_dec_sin
(
    .clk        ( ADC_CLK  ),   // fs
    .rst_n      ( rst_n_   ),
    .din        ( mul_sin  ),
    .dout       (          ),   //origin data
    .dout_cut   ( cic_sin  ),   //data cut 
    .dval       ( val_sin  )    //dout valid
);
cic_dec 
#(
    .R          ( 20       ),   // Decimation factor
    .M          ( 2        ),   // Differential delay 1 or 2
    .N          ( 5        ),   // Number of stages
    .BIN        ( 16       ),   // Input data width
    .COUT       ( 16       ),   // Output dout_cut width
    .CUT_METHOD ("ROUND"   ),   // 
    .fs         (40_000_000),   // Sampling rate
    .BOUT       ( 43       )    // 为防止溢出错误，请手动计算 BOUT=(BIN + $clog2((R*M)**N)), 其中$clog2是log2运算后向上取整，'**'表示次方运算 
)cic_dec_cos
(
    .clk        ( ADC_CLK  ),   // fs
    .rst_n      ( rst_n_   ),
    .din        ( mul_cos  ),
    .dout       (          ),   //origin data
    .dout_cut   ( cic_cos  ),   //data cut 
    .dval       ( val_cos  )    //dout valid
);

fir_dec #( // 匹配滤波器
    .R                ( 2   ),
    .COE_FILE         ("fir_comp_coe.txt"),// 31级 匹配滤波器系数
    .CLOCK_PER_SAMPLE ( 20 ))   				 // 该值一般等于cic_dec模块中的 R
fir_dec_0 (
    .clk                     ( ADC_CLK                ),
    .rst_n                   ( rst_n_                 ),
    .din                     ( cic_sin      [15:0]    ),
    .din_val                 ( val_sin                ),
    .dout                    ( fir_sin      [31:0]    ),
    .dout_val                ( firval_sin             )
);
fir_dec #(
    .R                ( 2   ),
    .COE_FILE         ("fir_comp_coe.txt"),
    .CLOCK_PER_SAMPLE ( 20 ))
fir_dec_1 (
    .clk                     ( ADC_CLK                ),
    .rst_n                   ( rst_n_                 ),
    .din                     ( cic_cos      [15:0]    ),
    .din_val                 ( val_cos                ),
    .dout                    ( fir_cos      [31:0]    ),
    .dout_val                ( firval_cos             )
);

usb2 usb2_0 //CY7C68013A
(
   .clk_24m       (clk_24m    ),
   .clk_24m_180   (clk_24m_180),
   .rst_n         (rst_n_     ),

   .clk_wr        (ADC_CLK    ),
   .dval          (firval_sin ),
   .idata         (fir_sin    ),
   .qdata         (fir_cos    ),

   .reg_freq      (freq       ),
   
   .USB_FD        (USB_FD     ),
   .USB_PKTADR0   (USB_PKTADR0),
   .USB_PKTADR1   (USB_PKTADR1),
   .USB_SLRD      (USB_SLRD   ),
   .USB_SLWR      (USB_SLWR   ),
   .USB_PKTEND    (USB_PKTEND ),
   .USB_SLOE      (USB_SLOE   ),
   .USB_FLAGA     (USB_FLAGA  ),
   .USB_FLAGB     (USB_FLAGB  ),
   .USB_IFCLK     (USB_IFCLK  ),
   .USB_SLCS      (USB_SLCS   )

);


endmodule

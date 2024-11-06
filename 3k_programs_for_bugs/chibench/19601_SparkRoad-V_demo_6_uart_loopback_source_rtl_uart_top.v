// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// 
// Author: Anlogic
// 
// Description:
//
//   实现功能：
//   接收PC端发送的UART数据，原数据返回给PC端，即loopback功能
// 
// Web: www.anlogic.com
// --------------------------------------------------------------------

module uart_top
#(
    parameter BPS_SET      =   96,  //波特率9600
    parameter CLK_PERIORD  =   40   //时钟周期40ns(25MHz)
)
(
	input 	wire	ext_clk_25m,	//外部输入25MHz时钟信号
	input 	wire	ext_rst_n,		//外部输入复位信号，低电平有效
	input 	wire	uart_rx,		//UART接收数据信号
	output 	wire	uart_tx			//UART发送数据信号
);													

//-------------------------------------
wire clk_25m;	//PLL输出25MHz时钟
wire clk_50m;	//PLL输出50MHz时钟
wire clk_100m;	//PLL输出100MHz时钟
wire sys_rst_n;	//PLL输出的locked信号，作为FPGA内部的复位信号，低电平复位，高电平正常工作

//-------------------------------------
wire bps_start1,bps_start2;	//接收到数据后，波特率时钟启动信号置位
wire clk_bps1,clk_bps2;     //clk_bps_r高电平为接收数据位的中间采样点,同时也作为发送数据的数据改变点 
wire [7:0] rx_data;         //接收数据寄存器，保存直至下一个数据来到
wire rx_int;                //接收数据中断信号,接收到数据期间始终为高电平

//-------------------------------------
//PLL例化
pll_test u_pll_test
(
	.refclk		    (ext_clk_25m	),
	.reset		    (~ext_rst_n		),
	.extlock	    (sys_rst_n		),
	.clk0_out	    (clk_25m		),
	.clk1_out	    (clk_50m		),
	.clk2_out	    (clk_100m		)
);

    //UART接收信号波特率设置
speed_setting
#(
	.BPS_SET	    (BPS_SET	    ),
	.CLK_PERIORD	(CLK_PERIORD    )
)
speed_rx

(	
    .clk            (clk_25m        ),	//波特率选择模块
    .rst_n          (sys_rst_n      ),
    .bps_start      (bps_start1     ),
    .clk_bps        (clk_bps1       )
);

	//UART接收数据处理
my_uart_rx	my_uart_rx
(		
	.clk            (clk_25m        ),	//接收数据模块
	.rst_n          (sys_rst_n      ),
	.uart_rx        (uart_rx        ),
	.rx_data        (rx_data        ),
	.rx_int         (rx_int         ),
	.clk_bps        (clk_bps1       ),
	.bps_start      (bps_start1     )
);
		
//-------------------------------------

	//UART发送信号波特率设置													
speed_setting
#(
	.BPS_SET	    (BPS_SET	    ),
	.CLK_PERIORD	(CLK_PERIORD	)
)
speed_tx
(	
	.clk            (clk_25m        ),	//波特率选择模块
	.rst_n          (sys_rst_n      ),
	.bps_start      (bps_start2     ),
	.clk_bps        (clk_bps2       )
);
						
	//UART发送数据处理
my_uart_tx	my_uart_tx
(		
	.clk            (clk_25m        ),	//发送数据模块
	.rst_n          (sys_rst_n      ),
	.rx_data        (rx_data        ),
	.rx_int         (rx_int         ),
	.uart_tx        (uart_tx        ),
	.clk_bps        (clk_bps2       ),
	.bps_start      (bps_start2     )
);


endmodule


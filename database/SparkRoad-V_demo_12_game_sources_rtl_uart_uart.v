// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: uart
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 串口接收,起始位1bit,数据位8bit,停止位2bit.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
// `define UART_LOOPBACK

module uart
#(
	parameter BAUDRATE = 115200,
	parameter CLK_RATE = 50000000
)
(
    input	wire		clk,

    // uart
    input	wire		rx,
    output  wire		tx,
	
	// uart recv
	output	wire		recv_en,
	output	wire [7:0]	recv_cmd,
	output	wire [7:0]	recv_data,
	
    // uart send
    input   wire		send_en,
    input   wire [7:0]	send_cmd,
    input   wire [7:0]	send_data,
    output  wire		send_ready
);

wire rx_en;
wire [7:0] rx_data;
wire tx_en;
wire [7:0] tx_data;
wire tx_ready;

//串口接收模块
uart_rx
#(
	.BAUDRATE	(BAUDRATE	    ),
	.CLK_RATE	(CLK_RATE	    )
)
u_uart_rx
(
    .clk        (clk            ),
    .rx         (rx             ),
    .rx_en    	(rx_en          ),
    .rx_data	(rx_data        )
);

//串口发送模块
uart_tx
#(
	.BAUDRATE	(BAUDRATE	    ),
	.CLK_RATE	(CLK_RATE	    )
)
u_uart_tx
(
    .clk        (clk            ),
    .tx         (tx             ),
    
`ifdef UART_LOOPBACK // 串口回环测试
    .tx_en		(rx_en          ),
    .tx_data	(rx_data        ),
`else
    .tx_en		(tx_en          ),
    .tx_data	(tx_data        ),
`endif

	.tx_ready	(tx_ready	    )
);

// 串口通信协议
ubus u_ubus
(
    .clk        (clk            ),
    
    // uart-rx
    .rx_en      (rx_en          ),
    .rx_data    (rx_data        ),
    
    // uart-tx
    .tx_en      (tx_en          ),
    .tx_data    (tx_data        ),
    .tx_ready   (tx_ready       ),
    
	// uart bus recv
    .recv_en    (recv_en        ),
    .recv_cmd	(recv_cmd		),
    .recv_data  (recv_data      ),
	
    // uart bus send
    .send_en    (send_en        ),
    .send_cmd	(send_cmd		),
    .send_data  (send_data      ),
    .send_ready (send_ready     )
);

endmodule

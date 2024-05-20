// This program was cloned from: https://github.com/huangxc6/Software_Hardware_Co-Design_24Spring
// License: MIT License

module uart_top(
    input         	sys_clk,            //系统时钟
    input         	sys_rst_n,          //系统复位

    input         	uart_rxd,           //接收端口
    output        	uart_txd            //发送端口
);

    parameter    UART_BPS=115200;       //波特率
    parameter    CLK_FREQ=50_000_000;   //系统频率50M

    wire        uart_en_w;
    wire [7:0]  uart_data_w;
    wire        uart_en_w2;
    wire [7:0]  uart_data_w2;

    //例化接收模块
    uart_rx #(
        .BPS                (UART_BPS),
        .SYS_CLK_FRE        (CLK_FREQ)
    ) u_uart_rx (
        .sys_clk            (sys_clk),
        .sys_rst_n          (sys_rst_n),
        
        .uart_rxd           (uart_rxd),
        .uart_rx_done       (uart_en_w),
        .uart_rx_data       (uart_data_w)
    );

    //例化发送模块
    uart_tx#(
        .BPS                (UART_BPS),
        .SYS_CLK_FRE        (CLK_FREQ)
    ) u_uart_tx (
        .sys_clk            (sys_clk),
        .sys_rst_n          (sys_rst_n),
        .uart_tx_en         (uart_en_w),
        .uart_data          (uart_data_w),
        .uart_txd           (uart_txd)
    );

    //例化接收模块
    uart_rx #(
        .BPS                (UART_BPS),
        .SYS_CLK_FRE        (CLK_FREQ)
    ) u_uart_rx2 (
        .sys_clk            (sys_clk),
        .sys_rst_n          (sys_rst_n),
        
        .uart_rxd           (uart_txd),
        .uart_rx_done       (uart_en_w2),
        .uart_rx_data       (uart_data_w2)
    );

endmodule

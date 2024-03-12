////////////////////////////////////////
//file name: UART_top.v
//author: fengzhaomao
//data: 2015-11-27
////////////////////////////////////////
`timescale 1ns/1ps
//`define tc01_00
//`define tc02_00
`define tc03_00

module    top();


reg            clk;                 // ARM clk
reg            clk26m;              // 26M function clk
reg            rst_;                // ARM clk's rst_
reg            rst26m_;             // function clk's rst_
reg            tx_data;             // send data line
wire           rx_data;             // receive data line
wire           uart_int;            // uart interrupt


// APB signals
reg  [3:0]     paddr;
reg  [31:0]    pwdata;
reg            psel;
reg            penable;
reg            pwrite;
wire [31:0]    prdata;

reg            baud_tclk;           // send data baud clk
reg            baud_rclk;           // receive data baud clk
reg            start;               // receive data baud enable signal
reg            rx_done;             // receive one data done
reg            w_state;             // write reg using signal
reg            r_state;             // read reg using signal
reg  [7:0]     tx_data_mem[0:999];  // send data memory
reg  [7:0]     rx_data_mem[0:999];  // receive data memory

reg  [31:0]    uart_tx;
reg  [31:0]    uart_rx;
reg  [31:0]    uart_baud;
reg  [31:0]    uart_conf;
reg  [31:0]    uart_rxtrig;
reg  [31:0]    uart_txtrig;
reg  [31:0]    uart_delay;
reg  [31:0]    uart_status;
reg  [31:0]    uart_rxfifo_stat;
reg  [31:0]    uart_txfifo_stat;

// when tx_model is runing a second time ,we don't want tx_cnt clean,
// so defind tx_cnt in top
integer        tx_cnt;

parameter      clk_period            = 10;
parameter      clk26m_period         = 38;
parameter      uart_tx_addr          = 4'h0;
parameter      uart_rx_addr          = 4'h1;
parameter      uart_baud_addr        = 4'h2;
parameter      uart_conf_addr        = 4'h3;
parameter      uart_rxtrig_addr      = 4'h4;
parameter      uart_txtrig_addr      = 4'h5;
parameter      uart_delay_addr       = 4'h6;
parameter      uart_status_addr      = 4'h7;
parameter      uart_rxfifo_stat_addr = 4'h8;
parameter      uart_txfifo_stat_addr = 4'h9;

`include
"D:/ultra_edit/Verilog/simulation/uart/uart_testing environment/UART_baud.v"
`include
"D:/ultra_edit/Verilog/simulation/uart/uart_testing environment/reg_op.v"
`include
"D:/ultra_edit/Verilog/simulation/uart/uart_testing environment/check_int.v"
`include
"D:/ultra_edit/Verilog/simulation/uart/uart_testing environment/uart_tx_model.v"
`include
"D:/ultra_edit/Verilog/simulation/uart/uart_testing environment/uart_rx_model.v"
`include
"D:/ultra_edit/Verilog/simulation/uart/uart_testing environment/tc01_00.v"
`include
"D:/ultra_edit/Verilog/simulation/uart/uart_testing environment/tc02_00.v"
`include
"D:/ultra_edit/Verilog/simulation/uart/uart_testing environment/tc03_00.v"

// cases of uart
UART_TOP    DUT(
        .clk(clk),
        .clk26m(clk26m),
        .rst_(rst_),
        .rst26m_(rst26m_),
        .paddr_i(paddr),
        .pwdata_i(pwdata),
        .psel_i(psel),
        .penable_i(penable),
        .pwrite_i(pwrite),
        .urxd_i(tx_data),
        .utxd_o(rx_data),
        .uart_int_o(uart_int),
        .prdata_o(prdata)
);

// always produce clk
always    #(clk_period/2)    clk = ~clk;
always    #(clk26m_period/2) clk26m = ~clk26m;


// signals initialize
initial begin
    clk         = 1'b0;
    clk26m      = 1'b0;
    rst_        = 1'b1;
    rst26m_     = 1'b1;
    baud_tclk   = 1'b0;
    baud_rclk   = 1'b0;
    tx_data     = 1'b1;
    start       = 1'b0;
    rx_done     = 1'b0;
    w_state     = 1'b0;
    r_state     = 1'b0;
    uart_tx     = 32'h0;
    uart_baud   = 32'hf152;
    uart_conf   = 32'h34;
    uart_rxtrig = 32'h1;
    uart_txtrig = 32'h0;
    uart_delay  = 32'h2;
    uart_status = 32'h0;
    tx_cnt      = 0;
    #50;
    rst_      = 1'b0;
    rst26m_   = 1'b0;
    #100;
    rst_      = 1'b1;
    rst26m_   = 1'b1;
    
end


initial begin
    @(posedge rst_) begin end
    fork
        UART_baud();
        check_int();
        uart_rx_model();
    join
end


initial begin
    @(posedge rst_) begin end
    `ifdef tc01_00  tc01_00(10); `endif
    `ifdef tc02_00  tc02_00(); `endif
    `ifdef tc03_00  tc03_00(); `endif
end

endmodule
